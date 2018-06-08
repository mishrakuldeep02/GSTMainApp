using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Security.Cryptography.Pkcs;
using System.Security.Cryptography.X509Certificates;
using System.Text;

/// <summary>
/// Summary description for ClsSignUtil
/// </summary>
public class ClsSignUtil
{
    public static string Sign(string signData)
    {
        X509Certificate2 mycert = null;

        X509Store store = new X509Store(StoreLocation.CurrentUser);
        store.Open(OpenFlags.ReadOnly);
        X509CertificateCollection certificates = X509Certificate2UI.SelectFromCollection(store.Certificates,
                                                                                        "Select Certificate",
                                                                                        "Select Certificate for encrypting return",
                                                                                        X509SelectionFlag.SingleSelection
                                                                                        );

        //foreach (X509Certificate2 c in certificates)
        //{
        //    mycert = c;
        //    break;
        //}

        foreach (X509Certificate2 cert in store.Certificates)
        {
            if (cert.Subject.Contains("CN=BHAGWAT SINGH NAGORI"))
            {
                mycert = cert;
                break;
            }
        }

        store.Close();
        
        string Base64Payload = Convert.ToBase64String(Encoding.UTF8.GetBytes(signData));
        string sha256 = SHA256Checksum(signData);
        byte[] data = Encoding.UTF8.GetBytes(sha256);
        // setup the data to sign
        ContentInfo content = new ContentInfo(data);
        SignedCms signedCms = new SignedCms(content);
        CmsSigner signer = new CmsSigner(mycert);
        signer.DigestAlgorithm = new Oid("SHA256");
        signer.IncludeOption = X509IncludeOption.WholeChain;
        // create the signature
        signedCms.ComputeSignature(signer, false);
        bool isValid = Verify(signedCms.Encode(), mycert);
        return Convert.ToBase64String(signedCms.Encode());
    }

    public static string SHA256Checksum(string plainText)
    {
        using (var sha1 = SHA256.Create())
        {
            byte[] outputBytes = sha1.ComputeHash(Encoding.ASCII.GetBytes(plainText));
            return BitConverter.ToString(outputBytes).Replace("-", "").ToLower().Trim();
        }
    }

    public static bool Verify(byte[] signature, X509Certificate2 certificate)
    {
        if (signature == null)
            throw new ArgumentNullException("signature");
        if (certificate == null)
            throw new ArgumentNullException("certificate");
        // decode the signature
        SignedCms verifyCms = new SignedCms();
        verifyCms.Decode(signature);
        // verify it
        try
        {
            verifyCms.CheckSignature(new X509Certificate2Collection(certificate), false);
            return true;
        }
        catch (CryptographicException)
        {
            return false;
        }
    }

}