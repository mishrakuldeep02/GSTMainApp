using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
/// <summary>
/// Summary description for ClsEncryption
/// </summary>
public class ClsEncryption
{
    public static readonly string PublicCertPathOfGSTN = System.Web.HttpContext.Current.Server.MapPath("~/Certi/GSTN_G2A_SANDBOX_UAT_public.cer");

    //public static readonly string PublicCertPathOfGSTN = System.Web.HttpContext.Current.Server.MapPath("~/Certi/GSTN_G2B_Prod_Public.cer");

    public static X509Certificate2 GetPublicKey()
    {
        RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();
        X509Certificate2 cert2 = new X509Certificate2(PublicCertPathOfGSTN);
        return cert2;
    }

    public string sign(string data)
    {
        Encryptor encryptor = new Encryptor();
        Encryptor.createJavaKeyStoreFile(System.Web.HttpContext.Current.Server.MapPath("~/Certi/keystore.pfx"), "123456");
        string signature = encryptor.generateSignature(data);
        return signature;
    }

    public string generateASPEncryptedKey(string encKey, string asp_secret)
    {
        byte[] enc_key = AESEncryption.decrypt(encKey, System.Text.Encoding.UTF8.GetBytes(asp_secret));
        string enc_asp_secret = AESEncryption.encryptEK(System.Text.Encoding.UTF8.GetBytes(asp_secret),
            AESEncryption.decodeBase64StringTOByte(AESEncryption.encodeBase64String(enc_key)));
        return enc_asp_secret;
    }

    public string GetKey()
    {
        AesManaged Aes = new AesManaged();
        Aes.GenerateKey();
        Aes.KeySize = 256;
        Aes.Mode = CipherMode.ECB;
        Aes.Padding = PaddingMode.PKCS7;
        return ASCIIEncoding.ASCII.GetString(Aes.Key);
    }

    public string Encoded_AppKeyWithPublicKey(string key)
    {
        X509Certificate2 x509 = GetPublicKey();
        RSACryptoServiceProvider rsa = (RSACryptoServiceProvider)x509.PublicKey.Key;
        byte[] bytesToBeEncrypted = Encoding.UTF8.GetBytes(key);
        byte[] encryptedBytes = rsa.Encrypt(bytesToBeEncrypted, false);
        return Convert.ToBase64String(encryptedBytes);
    }

    public string OTP_EncryptWithPublicKey(string otp, string app_key)
    {
        byte[] dataToEncrypt = UTF8Encoding.UTF8.GetBytes(otp);
        AesManaged tdes = new AesManaged();
        tdes.KeySize = 256;
        tdes.BlockSize = 128;
        tdes.Key = Encoding.ASCII.GetBytes(app_key);
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;
        ICryptoTransform crypt = tdes.CreateEncryptor();
        byte[] cipher = crypt.TransformFinalBlock(dataToEncrypt, 0, dataToEncrypt.Length);
        tdes.Clear();
        return Convert.ToBase64String(cipher, 0, cipher.Length);
    }

    public string HMAC_Encrypt(string message, string secret)
    {
        secret = secret ?? "";
        var encoding = new System.Text.ASCIIEncoding();
        byte[] keyByte = encoding.GetBytes(secret);
        byte[] messageBytes = encoding.GetBytes(message);
        using (var hmacsha256 = new HMACSHA256(keyByte))
        {
            byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
            return Convert.ToBase64String(hashmessage);
        }
    }

    public string HMAC_Encrypt(byte[] EK)
    {
        using (var hmacsha256 = new HMACSHA256())
        {
            byte[] hashmessage = hmacsha256.ComputeHash(EK);
            return Convert.ToBase64String(hashmessage);
        }
    }

    public string hmac(byte[] deCipher, string message)
    {
        string EK_result = Convert.ToBase64String(deCipher);
        var EK = Convert.FromBase64String(EK_result);
        string gen_hmac = "";
        using (var HMACSHA256 = new HMACSHA256(EK))
        {
            byte[] data = Encoding.UTF8.GetBytes(message);
            byte[] hashmessage = HMACSHA256.ComputeHash(data);
            gen_hmac = Convert.ToBase64String(hashmessage);
        }
        return gen_hmac;
    }

    public byte[] AES_Encrypt(byte[] bytesToBeEncrypted, byte[] passwordBytes)
    {
        byte[] encryptedBytes = null;
        // Set your salt here, change it to meet your flavor:
        // The salt bytes must be at least 8 bytes.
        byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };
        using (MemoryStream ms = new MemoryStream())
        {
            using (AesCryptoServiceProvider AES = new AesCryptoServiceProvider())
            {
                AES.Key = passwordBytes;
                AES.BlockSize = 128;
                AES.Mode = CipherMode.ECB;
                AES.Padding = PaddingMode.PKCS7;
                using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
                    cs.Close();
                }
                encryptedBytes = ms.ToArray();
            }
        }
        return encryptedBytes;
    }

    public byte[] AES_Decrypt(byte[] bytesToBeDecrypted, byte[] passwordBytes)
    {
        byte[] decryptedBytes = null;
        // Set your salt here, change it to meet your flavor:
        // The salt bytes must be at least 8 bytes.
        byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };
        using (MemoryStream ms = new MemoryStream())
        {
            using (RijndaelManaged AES = new RijndaelManaged())
            {
                AES.Key = passwordBytes;
                AES.BlockSize = 128;
                AES.Mode = CipherMode.ECB;
                AES.Padding = PaddingMode.PKCS7;
                using (var cs = new CryptoStream(ms, AES.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(bytesToBeDecrypted, 0, bytesToBeDecrypted.Length);
                    cs.Close();
                }
                decryptedBytes = ms.ToArray();
            }
        }
        return decryptedBytes;
    }

    public byte[] Response_Decrypt(byte[] bytesToBeDecrypted, byte[] passwordBytes)
    {
        byte[] decryptedBytes = null;
        // Set your salt here, change it to meet your flavor:
        // The salt bytes must be at least 8 bytes.
        byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };
        using (MemoryStream ms = new MemoryStream())
        {
            using (RijndaelManaged AES = new RijndaelManaged())
            {
                AES.Key = passwordBytes;
                AES.BlockSize = 128;
                AES.Mode = CipherMode.ECB;
                AES.Padding = PaddingMode.None;
                using (var cs = new CryptoStream(ms, AES.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(bytesToBeDecrypted, 0, bytesToBeDecrypted.Length);
                    cs.Close();
                }
                decryptedBytes = ms.ToArray();
            }
        }
        return decryptedBytes;
    }

    public string EncryptText(string input, byte[] passwordBytes)
    {
        byte[] bytesToBeEncrypted = Encoding.UTF8.GetBytes(input);
        byte[] bytesEncrypted = AES_Encrypt(bytesToBeEncrypted, passwordBytes);
        string result = Convert.ToBase64String(bytesEncrypted);
        return result;
    }

    public string DecryptText(string input, string password)
    {
        // Get the bytes of the string
        byte[] bytesToBeDecrypted = Convert.FromBase64String(input);
        byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
        passwordBytes = SHA256.Create().ComputeHash(passwordBytes);
        byte[] bytesDecrypted = Response_Decrypt(bytesToBeDecrypted, passwordBytes);
        string result = Encoding.UTF8.GetString(bytesDecrypted);
        return result;
    }

    public string EncryptTextWithPublicKey(string input)
    {
        X509Certificate2 certificate = GetPublicKey();
        RSACryptoServiceProvider RSA = (RSACryptoServiceProvider)certificate.PublicKey.Key;
        byte[] bytesToBeEncrypted = Encoding.UTF8.GetBytes(input);
        byte[] bytesEncrypted = RSA.Encrypt(bytesToBeEncrypted, false);
        string result = Convert.ToBase64String(bytesEncrypted);
        return result;
    }

    public string Encrypt(string plainText, byte[] keyBytes)
    {
        byte[] dataToEncrypt = UTF8Encoding.UTF8.GetBytes(plainText);

        AesManaged tdes = new AesManaged();

        tdes.KeySize = 256;
        tdes.BlockSize = 128;
        tdes.Key = keyBytes;// Encoding.ASCII.GetBytes(key);
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform crypt = tdes.CreateEncryptor();
        byte[] cipher = crypt.TransformFinalBlock(dataToEncrypt, 0, dataToEncrypt.Length);
        tdes.Clear();
        return Convert.ToBase64String(cipher, 0, cipher.Length);
    }

    public string Encrypt(string plainText, string key)
    {
        byte[] dataToEncrypt = UTF8Encoding.UTF8.GetBytes(plainText);

        AesManaged tdes = new AesManaged();

        tdes.KeySize = 256;
        tdes.BlockSize = 128;
        tdes.Key = Encoding.UTF8.GetBytes(key);
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform crypt = tdes.CreateEncryptor();
        byte[] cipher = crypt.TransformFinalBlock(dataToEncrypt, 0, dataToEncrypt.Length);
        tdes.Clear();
        return Convert.ToBase64String(cipher, 0, cipher.Length);

    }

    public byte[] Encrypt(byte[] dataToEncrypt)
    {
        AesManaged tdes = new AesManaged();
        tdes.KeySize = 256;
        tdes.BlockSize = 128;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;
        tdes.Key = new byte[256];
        ICryptoTransform crypt = tdes.CreateEncryptor();
        byte[] cipher = crypt.TransformFinalBlock(dataToEncrypt, 0, dataToEncrypt.Length);

        return cipher;
    }

    public byte[] Decrypt(string encryptedText, string key)
    {

        byte[] dataToDecrypt = Convert.FromBase64String(encryptedText);
        byte[] keyBytes = Encoding.UTF8.GetBytes(key);

        return Decrypt(dataToDecrypt, keyBytes);

    }

    public byte[] Decrypt(string encryptedText, byte[] keys)
    {
        byte[] dataToDecrypt = Convert.FromBase64String(encryptedText);
        return Decrypt(dataToDecrypt, keys);
    }

    public byte[] Decrypt(byte[] dataToDecrypt, byte[] keys)
    {

        AesManaged tdes = new AesManaged();
        tdes.KeySize = 256;
        tdes.BlockSize = 128;
        tdes.Key = keys;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform decrypt = tdes.CreateDecryptor();
        byte[] deCipher = decrypt.TransformFinalBlock(dataToDecrypt, 0, dataToDecrypt.Length);
        tdes.Clear();

        return deCipher;
    }

    public string EncryptTextWithPublicKey(byte[] bytesToBeEncrypted)
    {
        X509Certificate2 certificate = GetPublicKey();
        RSACryptoServiceProvider RSA = (RSACryptoServiceProvider)certificate.PublicKey.Key;

        byte[] bytesEncrypted = RSA.Encrypt(bytesToBeEncrypted, false);

        string result = Convert.ToBase64String(bytesEncrypted);
        return result;
    }

    //public string GetDecryptedRespData(string rek_Key, string data_Key)
    //{
    //    GSPClientConstants.AppkeyByte = Encoding.UTF8.GetBytes(GSPClientConstants.Appkey);
    //    byte[] decryptedKey = Decrypt(GSPClientConstants.sek, GSPClientConstants.AppkeyByte);
    //    //byte[] hidecipher = Convert.FromBase64String(GSPClientConstants.Appkey);
    //    string tryDecipher = System.Text.Encoding.UTF8.GetString(decryptedKey);
    //    //GSPClientConstants.Decipher = tryDecipher;
    //    GSPClientConstants.DecipherBytes = decryptedKey;

    //    byte[] decryptedRek = Decrypt(rek_Key, GSPClientConstants.DecipherBytes);
    //    byte[] jsonData = Decrypt(data_Key, decryptedRek);
    //    string json = Encoding.UTF8.GetString(jsonData);
    //    byte[] decodeJson = Convert.FromBase64String(json);
    //    string finalJson = Encoding.UTF8.GetString(decodeJson);
    //    return finalJson;
    //}

    string rek_Key = string.Empty;
    string data_Key = string.Empty;
    string finalJson = string.Empty;
    //public string GetDecryptedRespData(string resp)
    //{
    //    if (resp != "" && resp.ToString() != string.Empty)
    //    {
    //        JObject gstrResponseData = JObject.Parse(resp);
    //        if (gstrResponseData.GetValue("data") != null && gstrResponseData.GetValue("data").ToString() != string.Empty)
    //        {
    //            if (gstrResponseData.GetValue("data") != null && gstrResponseData.GetValue("data").ToString() != string.Empty)
    //            {
    //                data_Key = gstrResponseData.GetValue("data").ToString();
    //            }
    //            if (gstrResponseData.GetValue("rek") != null && gstrResponseData.GetValue("rek").ToString() != string.Empty)
    //            {
    //                rek_Key = gstrResponseData.GetValue("rek").ToString();
    //            }
    //            GSPClientConstants.AppkeyByte = Encoding.UTF8.GetBytes(GSPClientConstants.Appkey);
    //            byte[] decryptedKey = Decrypt(GSPClientConstants.sek, GSPClientConstants.AppkeyByte);
    //            string tryDecipher = System.Text.Encoding.UTF8.GetString(decryptedKey);
    //            GSPClientConstants.DecipherBytes = decryptedKey;

    //            byte[] decryptedRek = Decrypt(rek_Key, GSPClientConstants.DecipherBytes);
    //            byte[] jsonData = Decrypt(data_Key, decryptedRek);
    //            string json = Encoding.UTF8.GetString(jsonData);
    //            byte[] decodeJson = Convert.FromBase64String(json);
    //            finalJson = Encoding.UTF8.GetString(decodeJson);
    //        }
    //        else
    //        {
    //            finalJson = gstrResponseData.ToString();
    //        }
    //    }
    //    return finalJson;
    //}

    public string GenerateHMAC(byte[] data, byte[] EK)
    {
        using (var HMACSHA256 = new HMACSHA256(EK))
        {
            byte[] hashmessage = HMACSHA256.ComputeHash(data);
            return Convert.ToBase64String(hashmessage);
        }
    }

    public string AesEncrypt(byte[] dataToEncrypt, byte[] keyBytes)
    {
        AesManaged tdes = new AesManaged();

        tdes.KeySize = 256;
        tdes.BlockSize = 128;
        tdes.Key = keyBytes;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform crypt = tdes.CreateEncryptor();
        byte[] cipher = crypt.TransformFinalBlock(dataToEncrypt, 0, dataToEncrypt.Length);
        tdes.Clear();
        return Convert.ToBase64String(cipher, 0, cipher.Length);
    }

    public byte[] sha256_hash(string value)
    {
        using (SHA256 hash = SHA256Managed.Create())
        {
            Byte[] result = hash.ComputeHash(Encoding.UTF8.GetBytes(value));
            return result;
        }
    }
}