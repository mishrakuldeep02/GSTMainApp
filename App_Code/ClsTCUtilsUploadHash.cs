using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;

/// <summary>
/// Summary description for ClsTCUtilsUploadHash
/// </summary>
public class ClsTCUtilsUploadHash
{
    HttpClient client;
    HttpClient HttpClient;
    StringBuilder sb;
    /// <summary>
    /// Uploads hash to be signed identified by the unique uuid
    /// </summary>
    /// <param name="uuid">UniqueID given by the partner</param>
    /// <param name="email">Email address</param>
    /// <param name="filename">filepath which contains the data that will be passed as buffer</param>
  
    public string uploadHash(string uuid, string email, string hash256)
    {
        // Compute the checksum
        ClsCommon.cheksum = GetCS(ClsCommon.eSignAPIKEY, uuid);
        try
        {
            client = new HttpClient();
            MultipartFormDataContent content = new MultipartFormDataContent();
            content.Add(new StringContent(uuid), "uuid");
            content.Add(new StringContent(ClsCommon.cheksum), "cs");
            content.Add(new StringContent(email), "emailid");
            content.Add(new StringContent(hash256), "uploadhash");
            var result = client.PostAsync(ClsCommon.eSignDomain + ClsCommon.UPLOAD_HASH_URL, content).Result;
            string data = result.Content.ReadAsStringAsync().Result;
            return data;

        }
        catch (Exception e)
        {
            return e.Message.ToString();
        }
    }

    public string GetCS(string apiKey, string uuid)
    {
        return GetChecksum(apiKey + uuid);
    }

    public string GetDownloadCS(string apiKey, string uuid)
    {
        return GetChecksum(apiKey + GetChecksum(apiKey + uuid));
    }

    public string GetChecksum(String input)
    {
        MD5 md5 = System.Security.Cryptography.MD5.Create();

        byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
        byte[] hash = md5.ComputeHash(inputBytes);

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));
        }
        return sb.ToString().ToUpper().Substring(0, 16);
    }

    public string GetSign(string uuid, string cs)
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            client = new HttpClient();
            sb.Append("uuid=" + uuid + "");
            sb.Append("&cs=" + cs + "");
            var uri = ClsCommon.eSignDomain + "/corp/v2/aadhaarsigndoc.tc";//?uuid=<uuid>&cs=<cs>
            var result = client.GetAsync(uri + "?" + sb.ToString()).Result;
            string data = result.Content.ReadAsStringAsync().Result;
            return data;

        }
        catch (Exception e)
        {
            return e.Message.ToString();
        }
    }

    public string sha256_hash(string value)
    {
        sb = new StringBuilder();

        using (SHA256 hash = SHA256Managed.Create())
        {
            Encoding enc = Encoding.UTF8;
            Byte[] result = hash.ComputeHash(enc.GetBytes(value));

            foreach (Byte b in result)
                sb.Append(b.ToString("x2"));
        }

        return sb.ToString();
    }

    public string GetDownloadSignedData(string BaseUri, string DownCs)
    {
       //https://qasandbox.truecopy.in/services/corpservice/v2/fetchsignbuffer/OSWA18071733GSPT4578732669433730/DBD43B8E7C227CF8
        //string uuid = "OSWA18071733GSPT4578732669433730";
        //string DCS = "DBD43B8E7C227CF8";
        client = new System.Net.Http.HttpClient();
        sb = new StringBuilder();
        sb.Append("" + ClsCommon.uuid + "");
        sb.Append("/" + DownCs + "");
        var uri = ClsCommon.eSignDomain + ClsCommon.DownloadeSignData;//?uuid=<uuid>&cs=<cs>
        var result = client.GetAsync(uri + "/" + sb.ToString()).Result;
        string data = result.Content.ReadAsStringAsync().Result;
        return data;
    }

    public string GetSignedStatus(string BaseUri, string doc_category, string DownCs)
    {
        string uuid = ClsCommon.uuid;
        string dCS = DownCs.Trim();
        string dc = doc_category;
        client = new System.Net.Http.HttpClient();
        sb = new StringBuilder();
        sb.Append("" + uuid + "");
        sb.Append("/" + dCS + "");
        sb.Append("/" + dc + "");
        var uri = ClsCommon.eSignDomain + ClsCommon.GeteSignStatus;//?uuid=<uuid>&cs=<cs>
        var result = client.GetAsync(uri + "/" + sb.ToString()).Result;
        string data = result.Content.ReadAsStringAsync().Result;
        return data;

        //https://qasandbox.truecopy.in/services/corpservice/v2/getstatus/OSWA18071733GSPT4648587406859490/EAAC3A9243A142E8/OTHER
    }

    public string MarkForSignCorpfileDSC(string uuid, string cs, string doc_category, string Email, string SendMail)
    {
        try
        {
            client = new HttpClient();
            MultipartFormDataContent content = new MultipartFormDataContent();
            content.Add(new StringContent(uuid), "uuid");
            content.Add(new StringContent(cs), "cs");
            content.Add(new StringContent(doc_category), "doc_category");
            content.Add(new StringContent(Email), "emailid");
            content.Add(new StringContent(SendMail), "sendemail");
            var result = client.PostAsync(ClsCommon.eSignDomain + ClsCommon.MarkForSignCorpfileDSC, content).Result;
            string data = result.Content.ReadAsStringAsync().Result;
            return data;

        }
        catch (Exception e)
        {
            return e.Message.ToString();
        }
    }
}