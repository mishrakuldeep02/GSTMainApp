using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class PL_GetGSTR1Data
    {
        public int Ind { get; set; }
        public int ClientCode { get; set; }
        public int ClientCodeOdp { get; set; }
        public int CaCode { get; set; }
        public int CaCodeOdp { get; set; }
        public string GSTNNO { get; set; }
        public int MonthCD { get; set; }
        public string UUID { get; set; }
        public Int64 LogId { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public int GSTR1TypeId { get; set; }
    }
