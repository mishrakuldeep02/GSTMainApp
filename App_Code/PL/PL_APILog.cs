using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;

    public class PL_APILog
    {
        public string Cert { get; set; }
        public int Ind { get; set; }
        public int ClientCode { get; set; }
        public int ClientCodeOdp { get; set; }
        public int CaCode { get; set; }
        public int CaCodeOdp { get; set; }
        public string GSTNNO { get; set; }
        public int ActivityId { get; set; }
        public string ActivityDesc { get; set; }
        public int ResponseStatus { get; set; }
        public string GetKeyEncKey { get; set; }
        public string GetKeySessionId { get; set; }
        public string GetKeyMessageId { get; set; }
        public string GetKeyMessage { get; set; }
        public Int64 LogId { get; set; }
        public string ASPSecretKey { get; set; }
        public string AppKey { get; set; }
        public string EncodedAppKey { get; set; }
        public int OTPRequest { get; set; }
        public string OTP { get; set; }
        public int OTPVerify { get; set; }
        public string auth_token { get; set; }
        public string Expiry { get; set; }
        public string Sek { get; set; }
        public string OTPVerifyErrorMSG { get; set; }
        public int RecordNo { get; set; }
        public int MonthCD { get; set; }
        public string ReferenceId { get; set; }
        public string SummaryData { get; set; }
        public string SignedData { get; set; }
    }
