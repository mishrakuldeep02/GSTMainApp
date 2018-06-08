using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Security.Cryptography.Pkcs;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Timers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmRegisterDSC : System.Web.UI.Page
{
    PL_APILog objpl;
    DataTable dt;
    string pan = "AFIPN8853K";//"ABRPN0979M"; 
    public static readonly string ASPID = "23AAACO2349B007378";
    public static readonly string Secret_Key = "646YUCh1wMo49ur9HR5kPFz90570jX2n";
    public static readonly string DATE_FORMAT_YYYYMMDD = "yyyyMMdd";
    public static readonly string DATE_FORMAT_DDMMYYYYHHMMSS = "ddMMyyyyHHmmss";
    public static readonly string BLANK_STRING = "";

    public static readonly string SBClientID = "l7xx8a2393d3080b4887a9158aa42a6fc11e";//"l7xxc707c641659f4a0fb05a460ad8fe0c19";
    public static readonly string SBClientSecret_Key = "63418f56b86a41638f62cbb520133be1";//"0ff32b5d5fa84f45854c520ecefe8d7e";//


    public static readonly string SBUserID = "oswal.tn.tp.1";//"bsnagori_1983";// //
    public static readonly string SBGSTINNO = "33GSPTN3741G1Z9";//"23AAACO2349B1Z2";
    public static readonly string statecd = "33";//"27"//"33";

  //  public static readonly string BASE_URL = "https://test.nsdlgsp.co.in";
    public static readonly string BASE_URL = "https://www.nsdlgsp.co.in";
    public static readonly string SBBASE_URL = "http://devapi.gstsystem.co.in";
    public static readonly string NSDL = "/NGCSGSP/callApi";
    public static readonly string API_GET_KEY = "/GSPUtility/getKey";
    //public static readonly string OTPRequest_URL = "/taxpayerapi/v1.0/authenticate";
    public static readonly string OTPRequest_URL = "/taxpayerapi/v0.2/authenticate";

    public static readonly string RegDscUrl = "/taxpayerapi/v0.2/registerdsc";
    public static readonly string DeRegDscUrl = "/taxpayerapi/v0.2/deregisterdsc";

    public static string RecEnc_Key;
    public static string Session_Key;
    public static string RespMsgID;
    public static string msg;
    public static string asp_secret;
    public static string Appkey;
    public static string EncodedAppkey;

    public static string auth_token;
    public static string sek;

    HttpClient HttpClient;
    ClsEncryption encrypt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            RecEnc_Key = string.Empty;
            Session_Key = string.Empty;
            RespMsgID = string.Empty;
            msg = string.Empty;
            asp_secret = string.Empty;
            Appkey = string.Empty;
            EncodedAppkey = string.Empty;
            auth_token = string.Empty;
            sek = string.Empty;
        }
    }

    protected void btnRegDsc_Click(object sender, EventArgs e)
    {
        try
        {
            GSTR1Desc.Text = string.Empty;
            
            //var cert = getCertificate();
            //byte[] data = Encoding.UTF8.GetBytes(pan);
            //var sign = Convert.ToBase64String(SignCms(data, cert));
            string sign = ClsSignUtil.Sign(pan);

            var result = RegisterDSC(pan, sign);
            JObject jObj = JObject.Parse(result.ToString());
            if (jObj.GetValue("status") != null && jObj.GetValue("status").ToString() == "SUCCESS")
            {
                GSTR1Desc.ForeColor = System.Drawing.Color.Green;
                GSTR1Desc.Text = jObj.GetValue("message").ToString();
            }
            else
            {
                GSTR1Desc.ForeColor = System.Drawing.Color.Red;
                GSTR1Desc.Text = jObj.GetValue("message").ToString();
            }
        }
        catch
        {

        }
    }

    protected void btnDeRegister_Click(object sender, EventArgs e)
    {
        try
        {
            GSTR1Desc.Text = string.Empty;
           // string pan = "AFIPN8853K";//GSPTN3741G 

            //var cert = getCertificate();
            //byte[] data = Encoding.UTF8.GetBytes(pan);

            //var sign = Convert.ToBase64String(SignCms(data, cert));

            string sign = ClsSignUtil.Sign(pan);

            var result = DeRegisterDSC(pan, sign);
            JObject jObj = JObject.Parse(result.ToString());
            if (jObj.GetValue("status") != null && jObj.GetValue("status").ToString() == "SUCCESS")
            {
                GSTR1Desc.ForeColor = System.Drawing.Color.Green;
                GSTR1Desc.Text = jObj.GetValue("message").ToString();
            }
            else
            {
                GSTR1Desc.ForeColor = System.Drawing.Color.Red;
                GSTR1Desc.Text = jObj.GetValue("message").ToString();
            }
        }
        catch
        {

        }
    }

    public static X509Certificate2 getCertificate()
    {
        //try
        //{
            //Prompt the user with the list of certificates on the local store.
            //The user have to select the certificate he wants to use for signing.
            //Note: All certificates form the USB device are automatically copied to the local store as soon the device is plugged in.
            X509Store store = new X509Store(StoreLocation.CurrentUser);
            store.Open(OpenFlags.ReadOnly);
            X509CertificateCollection certificates = X509Certificate2UI.SelectFromCollection(store.Certificates,
                                                                                            "Select Certificate",
                                                                                            "Select Certificate for encrypting return",
                                                                                            X509SelectionFlag.SingleSelection
                                                                                            );
            store.Close();
            X509Certificate2 certificate = null;
            if (certificates.Count != 0)
            {
                //The selected certificate
                certificate = (X509Certificate2)certificates[0];
            }
            return certificate;
        //}
        //catch
        //{

        //}
    }

    public static byte[] SignCms(byte[] data, X509Certificate2 cert)
    {
        try
        {
            ContentInfo contentInfo = new ContentInfo(data);
            SignedCms signedCms = new SignedCms(contentInfo);
            CmsSigner cmsSigner = new CmsSigner(cert);
            cmsSigner.DigestAlgorithm = new Oid("SHA256");
            cmsSigner.IncludeOption = X509IncludeOption.EndCertOnly;
            signedCms.ComputeSignature(cmsSigner);
            return signedCms.Encode();
        }
        catch
        {
            return null;
        }
    }

    // Get Register for Digital Sign Certificat
   
    public string RegisterDSC(string pan, string sign)
    {
        //  ClsDSC_ApiCalling clsDSC = new ClsDSC_ApiCalling();
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("data", pan);
        parameters.Add("sign", sign);
        var Response = GoToRegister(RegDscUrl, parameters);
        return Response.ToString();
    }
    // Get DeRegister for Digital Sign Certificat
    
    public string DeRegisterDSC(string pan, string sign)
    {
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("data", pan);
        parameters.Add("sign", sign);
        var Response = GoToRegister(DeRegDscUrl, parameters);
        return Response.ToString();
    }
   
    public string GoToRegister(string uri, Dictionary<string, string> parameters)
    {
        HttpClient = new HttpClient();
        HttpClient.BaseAddress = new Uri(SBBASE_URL);
        HttpClient.DefaultRequestHeaders.Accept.Clear();
        HttpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        HttpClient.DefaultRequestHeaders.TryAddWithoutValidation("Content-Type", "application/json; charset=utf-8");
        if (uri != null && uri.ToString() != string.Empty)
        {
            //HttpClient.DefaultRequestHeaders.Add("aspid", ASPID);
            //HttpClient.DefaultRequestHeaders.Add("asp-secret", asp_secret);
            HttpClient.DefaultRequestHeaders.Add("clientid", SBClientID);
            HttpClient.DefaultRequestHeaders.Add("client-secret", SBClientSecret_Key);

            HttpClient.DefaultRequestHeaders.Add("ip-usr", "192.168.100.172");
            HttpClient.DefaultRequestHeaders.Add("state-cd", statecd);
            HttpClient.DefaultRequestHeaders.Add("txn", SBGSTINNO + generateRandomNumber(4));
            HttpClient.DefaultRequestHeaders.Add("username", SBUserID.ToLower());
            HttpClient.DefaultRequestHeaders.Add("auth-token", auth_token);

            //HttpClient.DefaultRequestHeaders.Add("session-id", Session_Key);
            //HttpClient.DefaultRequestHeaders.Add("filler1", "Filler1");
            //HttpClient.DefaultRequestHeaders.Add("filler2", "Filler2");
            //HttpClient.DefaultRequestHeaders.Add("message-id", RespMsgID.ToString());
        }
        System.Net.ServicePointManager.ServerCertificateValidationCallback = ((sender, certificate, chain, sslPolicyErrors) => true);
        var json = JObject.FromObject(parameters).ToString();
        var content = new StringContent(json, Encoding.UTF8, "application/json");
        var response = HttpClient.PutAsync(uri, content).Result;
        var responseString = response.Content.ReadAsStringAsync().Result;
        return responseString.ToString();
    }

    public static string generateRandomNumber(int length)
    {
        var random = new Random();
        string s = string.Empty;
        for (int i = 0; i < length; i++)
            s = String.Concat(s, random.Next(10).ToString());
        return s;
    }

    protected void btnSendOtp_Click(object sender, EventArgs e)
    {
        DivOTP.Style.Add("display", "none");
        GSTR1Desc.Text = string.Empty;
        encrypt = new ClsEncryption();

        var Resp = GetKeyOfNSDL();
        if (Resp != null)
        {
            JObject jObj = JObject.Parse(Resp.ToString());
            if (jObj.GetValue("status_cd") != null && jObj.GetValue("status_cd").ToString() == "1" && jObj.GetValue("enc_key") != null)
            {
                RecEnc_Key = jObj.GetValue("enc_key").ToString();
                Session_Key = jObj.GetValue("session_id").ToString();
                RespMsgID = jObj.GetValue("message_id").ToString();
                msg = jObj.GetValue("message").ToString();

                asp_secret = encrypt.generateASPEncryptedKey(RecEnc_Key, Secret_Key);

                string resp = GetParamsForOtprequest();
                //OTPDivNew.Style.Add("display", "block");
                //return true;
                if (resp != null && resp != string.Empty)
                {
                    JObject OptReq = JObject.Parse(resp);

                    if (OptReq.GetValue("status_cd").ToString() == "1")
                    {
                        GSTR1Desc.ForeColor = System.Drawing.Color.Green;
                        GSTR1Desc.Text = "OTP Send Successfully In Your Mobile And Email-ID.";
                        DivOTP.Style.Add("display", "block");
                    }
                    else
                    {
                        GSTR1Desc.ForeColor = System.Drawing.Color.Red;
                        DivOTP.Style.Add("display", "none");
                        GSTR1Desc.Text = "OTP Not Send.";
                    }
                }

            }
            else if (jObj.GetValue("message") != null && jObj.GetValue("message").ToString() != string.Empty)
            {
                GSTR1Desc.Text = jObj.GetValue("message").ToString();
            }

        }
    }

    protected void btnVarify_Click(object sender, EventArgs e)
    {
        GSTR1Desc.Text = string.Empty;
       
        string otp = txtOtp.Text.Trim();
        JObject OtpAuth = JObject.Parse(GetParamsForOtpAuth(otp));

        if (OtpAuth.GetValue("auth_token") != null && OtpAuth.GetValue("auth_token").ToString() != string.Empty)
        {

            auth_token = string.Empty;
            auth_token = OtpAuth.GetValue("auth_token").ToString();

            sek = string.Empty;
            sek = OtpAuth.GetValue("sek").ToString();

            GSTR1Desc.ForeColor = System.Drawing.Color.Green;
            GSTR1Desc.Text = "OTP Verify successfully..";
            DivVerify.Style.Add("display", "block");
        }
        else
        {
            DivVerify.Style.Add("display", "none");
            GSTR1Desc.Text = string.Empty;
            string error = OtpAuth.GetValue("error").ToString();
            GSTR1Desc.ForeColor = System.Drawing.Color.Red;
            GSTR1Desc.Text = error;
        }
    }

    public string GetKeyOfNSDL()
    {
        encrypt = new ClsEncryption();

        Dictionary<string, string> parameters = new Dictionary<string, string>();
        string timestamp = DateTime.Now.ToString(DATE_FORMAT_DDMMYYYYHHMMSS) + generateRandomNumber(6);
        parameters.Add("timestamp", timestamp);
        string SignedContent = encrypt.sign(ASPID + timestamp);
        parameters.Add("signed_content", SignedContent);
        parameters.Add("filler1", "");
        parameters.Add("filler2", "");
        string resp = CallApi(API_GET_KEY, parameters);
        return resp;
    }

    public string CallApi(string uri, Dictionary<string, string> parameters)
    {
        var msgID = DateTime.Now.ToString(DATE_FORMAT_YYYYMMDD) + generateRandomNumber(8);

        HttpClient = new HttpClient();

        HttpClient.BaseAddress = new Uri(BASE_URL);
        HttpClient.DefaultRequestHeaders.Accept.Clear();
        HttpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

        HttpClient.DefaultRequestHeaders.TryAddWithoutValidation("Content-Type", "application/json; charset=utf-8");
        HttpClient.DefaultRequestHeaders.Add("aspid", ASPID);
        HttpClient.DefaultRequestHeaders.Add("filler1", "ERTRT");
        HttpClient.DefaultRequestHeaders.Add("filler2", "RETRT");
        HttpClient.DefaultRequestHeaders.Add("message-id", msgID.ToString());

        System.Net.ServicePointManager.ServerCertificateValidationCallback = ((sender, certificate, chain, sslPolicyErrors) => true);
        var json = JObject.FromObject(parameters).ToString();
        var content = new StringContent(json, Encoding.UTF8, "application/json");
        var response = HttpClient.PostAsync(uri, content).Result;
        var responseString = response.Content.ReadAsStringAsync().Result;
        return responseString.ToString();

    }

    public string GetParamsForOtprequest()
    {

        encrypt = new ClsEncryption();
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        string timestamp = DateTime.Now.ToString(DATE_FORMAT_DDMMYYYYHHMMSS) + generateRandomNumber(6);

        parameters.Add("action", "OTPREQUEST");
        parameters.Add("username", SBUserID.ToLower());//ClsCommon.SBUserID.ToLower()
        Appkey = encrypt.GetKey();
        EncodedAppkey = encrypt.Encoded_AppKeyWithPublicKey(Appkey);
        parameters.Add("app_key", EncodedAppkey);
        var Response = CallOTPApi(OTPRequest_URL, parameters);
        return Response;
    }

    public string CallOTPApi(string uri, Dictionary<string, string> parameters)
    {
        HttpClient = new HttpClient();
        HttpClient.BaseAddress = new Uri(BASE_URL);
        HttpClient.DefaultRequestHeaders.Accept.Clear();
        HttpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        HttpClient.DefaultRequestHeaders.TryAddWithoutValidation("Content-Type", "application/json;");
        if (uri != null && uri.ToString() != string.Empty)
        {
            // This is for NSDL
            HttpClient.DefaultRequestHeaders.Add("aspid",ASPID);
            HttpClient.DefaultRequestHeaders.Add("asp-secret", asp_secret);
            HttpClient.DefaultRequestHeaders.Add("ip-usr", "192.168.100.172");
            HttpClient.DefaultRequestHeaders.Add("state-cd", statecd);
            HttpClient.DefaultRequestHeaders.Add("txn", Guid.NewGuid().ToString());

            HttpClient.DefaultRequestHeaders.Add("session-id", Session_Key);
            HttpClient.DefaultRequestHeaders.Add("filler1", "Filler1");
            HttpClient.DefaultRequestHeaders.Add("filler2", "Filler2");
            HttpClient.DefaultRequestHeaders.Add("message-id", RespMsgID.ToString());

        }
        System.Net.ServicePointManager.ServerCertificateValidationCallback = ((sender, certificate, chain, sslPolicyErrors) => true);
        var json = JObject.FromObject(parameters).ToString();
        var content = new StringContent(json, Encoding.UTF8, "application/json");
        var response = HttpClient.PostAsync(NSDL + uri, content).Result;
        var responseString = response.Content.ReadAsStringAsync().Result;
        return responseString.ToString();
    }

    public string GetParamsForOtpAuth(string otp)
    {
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("action", "AUTHTOKEN");
        parameters.Add("username", SBUserID.ToLower());
        parameters.Add("app_key", EncodedAppkey);
        string encriptedOtp = EncriptedOtp(otp);
        parameters.Add("otp", encriptedOtp);
        var Response = CallOTPApi(OTPRequest_URL, parameters);
        return Response;
    }

    public string EncriptedOtp(string otp)
    {
        encrypt = new ClsEncryption();
        //string otp = "575757";
        string enc_Otp_key = encrypt.OTP_EncryptWithPublicKey(otp, Appkey);
        return enc_Otp_key;
    }

}