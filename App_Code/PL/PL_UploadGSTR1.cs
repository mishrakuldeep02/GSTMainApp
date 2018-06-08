using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class PL_UploadGSTR1
    {
        public int Ind { get; set; }
        public int TaxPayerCode { get; set; }
        public int TaxPayerCodeOdp { get; set; }
        public string GSTIN { get; set; }
        public int OTPVerify { get; set; }
        public string OTPAuthKey { get; set; }
        public string OTPSecKey { get; set; }
        public string AppKey { get; set; }
        public string EncodedAppKey { get; set; }
        public string ReturnPeriod { get; set; }
        public string ActivityId { get; set; }
        public string ClientUserId { get; set; }
        public string OTP { get; set; }
    }
