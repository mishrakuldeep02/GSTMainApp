using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

    public class PL_GSTR2AAction
    {
        public int Ind { get; set; }
        public int ClientCode { get; set; }
        public int ClientCodeOdp { get; set; }
        public string GSTIN { get; set; }
        public int UserCode { get; set; }
        public int MonthCD { get; set; }
        public int ActionCode { get; set; }
        public string ActionDesc { get; set; }
        public DataTable dt = new DataTable();
    }
