using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClsCommon
/// </summary>
public class ClsCommon
{
    /// <summary>
    /// Base URL
    /// </summary>
    public static readonly string BASE_URL = "http://test.nsdlgsp.co.in";//"http://www.nsdlgsp.co.in";
    
    public static readonly string NSDL = "/NGCSGSP/callApi";
    public static readonly string SBBASE_URL = "http://devapi.gstsystem.co.in";

    /// <summary>
    /// OTP URL
    /// </summary>
    public static readonly string OTPRequest_URL = "/taxpayerapi/v0.2/authenticate";

    /// <summary>
    /// GSTR-1 URL's
    /// </summary>
    public static readonly string API_gstr1Return = "/taxpayerapi/v0.3/returns/gstr1";
    public static readonly string GSTR1_Get_CommonUrl = "/taxpayerapi/v0.3/returns/gstr1";
    public static readonly string Track_Status = "/taxpayerapi/v0.3/returns";
    public static readonly string GetFileDetail = "/taxpayerapi/v0.3/returns/";

    /// <summary>
    /// Ledger URL's
    /// </summary>
    public static readonly string Get_Ledger_Det = "/taxpayerapi/v0.3/returns/ledgers";

    /// <summary>
    /// DSC Registration URL
    /// </summary>
    public static readonly string RegDscUrl = "/taxpayerapi/v0.2/registerdsc";

    /// <summary>
    /// DSC De-Registration URL
    /// </summary>
    public static readonly string DeRegDscUrl = "/taxpayerapi/v0.2/deregisterdsc";

    /// <summary>
    /// NSDL GET Key URL
    /// </summary>
    public static readonly string API_GET_KEY = "/GSPUtility/getKey";

    public static readonly string API_gstrRetStatus = "/taxpayerapi/v0.3/returns/gstr";

    // New APIs
    public static readonly string GSTR1_Get_B2B_Invoices = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?action=B2B&gstin=xxxxxxxxxx&ret_period=012017&ctin=xxxxxxxxxx

    public static readonly string Get_B2CL_Invoices = "";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?action=B2CL&gstin=xxxxxxxxxxZJ&ret_period=012017&state_cd=05

    public static readonly string Get_B2CS_Invoices = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?action=B2CS&gstin=xxxxxxxxxxZJ&ret_period=012017&state_cd=05

    public static readonly string Get_NIL_Invoices = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?action=NIL&gstin=xxxxxxxxxxZJ&ret_period=012017

    public static readonly string Get_TXP_Invoices = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?action=TXP&gstin=xxxxxxxxxxZJ&ret_period=012017

    public static readonly string Get_AT_Invoices = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?action=AT&gstin=xxxxxxxxxxZJ&ret_period=012017

    public static readonly string Get_EXP_Invoices = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?action=EXP&gstin=xxxxxxxxxxZJ&ret_period=012017

    // http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns?action=RETSTATUS&gstin=?&ret_period=?&ref_id=
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr?gstin=xxxx&ret_period=xxxx&action=RETSTATUS&trans_id=xxxxx

    public static readonly string Get_HSN_Summary = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?gstin=xxxx&ret_period=xxxx&action=HSNSUM

    public static readonly string Get_CDNR = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?gstin=xxxx&ret_period=xxxx&action=CDNR

    public static readonly string Get_CDNUR = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?gstin=xxxx&ret_period=xxxx&action=CDNUR

    public static readonly string Get_Doc_Issued = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?gstin=xxxx&ret_period=xxxx&action=DOCISS

    public static readonly string Get_GSTR1_Summary = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?gstin=xxxx&ret_period=xxxx&action=RETSUM

    public static readonly string Get_File_Details = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?gstin=xxxx&ret_period=xxxx&action=FILEDET&token=xxxxxxxxx

    public static readonly string Submit_GSTR1 = "/taxpayerapi/v0.3/returns/gstr1";
    //http://devapi.gstsystem.co.in/taxpayerapi/v0.3/returns/gstr1?gstin=xxxx&ret_period=xxxx




    /// <summary>
    /// GSTR - 2 API URL 
    /// </summary>
    public static readonly string APIUrlGstr2Return = "/taxpayerapi/v0.3/returns/gstr2";

    /// <summary>
    /// GSTR - 2A API URL's
    /// </summary>
    public static readonly string Get_API_gstr2A = "/taxpayerapi/v0.3/returns/gstr2a";

    /// <summary>
    /// GSTR - 3 API URL
    /// </summary>
    public static readonly string APIUrlGstr3Return = "/taxpayerapi/v0.3/returns/gstr3";

    /// <summary>
    /// GSTR - 3B API URL's
    /// </summary>
    public static readonly string Gstr3B_Data = "/taxpayerapi/v0.3/returns/gstr3b";

    /// <summary>
    /// GSTR - 8 API URL's
    /// </summary>
    public static readonly string APIUrlGstr8Return = "/taxpayerapi/v0.2/returns/gstr8";

    /// <summary>
    /// For Payment
    /// </summary>
    public static readonly string payment = "/taxpayerapi/v0.2/payment";
    public static readonly string cpin = "17042400000291";
    public static readonly string ChalanList_fm_dt = "";
    public static readonly string ChalanList_to_dt = "";


    /// <summary>
    /// NSDL Credential
    /// </summary>
    public static readonly string ASPID = "23AAACO2349B007378";
    public static readonly string Secret_Key = "646YUCh1wMo49ur9HR5kPFz90570jX2n";

    public static readonly string DATE_FORMAT_YYYYMMDD = "yyyyMMdd";
    public static readonly string DATE_FORMAT_DDMMYYYYHHMMSS = "ddMMyyyyHHmmss";
    public static readonly string BLANK_STRING = "";

    public static readonly string PublicCertPathOfGSTN = System.Web.HttpContext.Current.Server.MapPath("~/Cert/GSTN_G2A_SANDBOX_UAT_public.cer");

    /// <summary>
    /// GSTIN Credential
    /// </summary>
    //public static readonly string SBClientID = "l7xx8a2393d3080b4887a9158aa42a6fc11e";
    //public static readonly string SBClientSecret_Key = "63418f56b86a41638f62cbb520133be1";
    //public static readonly string SBUserID = "oswal.tn.tp.1"; //
    //public static readonly string SBGSTINNO = "33GSPTN3741G1Z9";
    //public static readonly string statecd = "33";//"27"//"33";

    // New Credential
    public static readonly string SBClientID = "l7xxc707c641659f4a0fb05a460ad8fe0c19";//"l7xx8a2393d3080b4887a9158aa42a6fc11e";
    public static readonly string SBClientSecret_Key = "0ff32b5d5fa84f45854c520ecefe8d7e";//"63418f56b86a41638f62cbb520133be1";
    public static readonly string SBUserID = "oswal.tn.tp.1"; //
    public static readonly string SBGSTINNO = "33GSPTN3741G1Z9";
    public static readonly string statecd = "33";//"27"//"33";


    public static readonly string fpGSTR1 = "082017";
    public static readonly string fpGSTR2 = "072017";
    public static readonly string fpGSTR2A = "072017";
    //"072017";//"022017";//"012017";//"072017";//"062017";//"072017";
    public static readonly string fpGSTR3 = "072017";
    public static readonly string fpGSTR3B = "072017";
    public static readonly string fpGSTR_8 = "032017";

    public static readonly string fpLedger = "072017";
    public static readonly string fpPayment = "072017";
    public static readonly string Ret_Type = "";

    /// <summary>
    /// GSTIN Testing Credential
    /// </summary>
    //public static readonly string Testingclientid = "l7xx0b778cbfd4b747da94f0004f7ea0da94";
    //public static readonly string Testingclientsecret = "b6a5e0ce99da4dccaf4df73bf2a6d0e9";
    //public static readonly string Testinggstin = "27GSPMH1261G1ZR";
    //public static readonly string Testingusername = "gamut.mh.1";
    //public static readonly string TestingClientStateCd = "27";

    //New Credential
    public static readonly string Testingclientid = "l7xx0b778cbfd4b747da94f0004f7ea0da94";
    public static readonly string Testingclientsecret = "b6a5e0ce99da4dccaf4df73bf2a6d0e9";
    public static readonly string Testinggstin = "33GSPTN3742G1Z8";//"27GSPMH1261G1ZR";
    public static readonly string Testingusername = "gamut.mh.1";
    public static readonly string TestingClientStateCd = "27";

    /// <summary>
    /// truecopy.in Credential For Sign Data 
    /// </summary>
    public static readonly string eSignAPIKEY = "7YGHXJQPU6JD9468";
    public static readonly string eSignDomain = "https://oswaldata.truecopy.in";
    public static readonly string DownloadeSignData = "/services/corpservice/v2/fetchsignbuffer";
    public static readonly string GeteSignStatus = "/services/corpservice/v2/getstatus";
    public static readonly string UPLOAD_HASH_URL = "/services/corpservice/v2/uploadHash";
    public static readonly string UPLOAD_WidgetSigner = "/corp/v2/widgetsignerv2.tc";
    public static readonly string DirectSigner = "/corp/v2/aadhaarsigndocv2.tc";
    public static readonly string MarkForSignCorpfileDSC = "/services/corpservice/v2/markforsigncorpfiledsc";
    public static readonly string URLForDownProduction = "http://files.truecopy.in";
    public static readonly string DownDSCUpdater = "/esign/deploy/DSCUpdaterCorp.zip";

    /// <summary>
    /// Important Params
    /// </summary>
    private static string _InvoiceNo;
    public static string InvoiceNo
    {
        get { return _InvoiceNo; }
        set { _InvoiceNo = value; }
    }

    public static string uuid;
    public static string did;
    public static string cheksum;
    public static string SignedData;
    public static string AadhaarNo;

    public static string fr_dt="01-07-2017";
    public static string to_dt = "31-07-2017";

    public static string asp_secret;
    public static string RecEnc_Key;
    public static string Session_Key;
    public static string msgID;
    public static string RespMsgID;
    public static string msg;

    public static string generateRandomNumber(int length)
    {
        var random = new Random();
        string s = string.Empty;
        for (int i = 0; i < length; i++)
            s = String.Concat(s, random.Next(10).ToString());
        return s;
    }


    
}