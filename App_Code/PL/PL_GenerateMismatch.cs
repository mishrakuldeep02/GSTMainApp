using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

    public class PL_GenerateMismatch
    {
       public int Ind { get; set; }
       public int ClientCode { get; set; }
       public int ClientCodeOdp { get; set; } 
       public string GSTIN { get; set; }
       public string PurchGSTIN { get; set; }
       public string G2APurchGSTIN { get; set; }
       public int MonthCd { get; set; }
       public int ActionId { get; set; }
       public Int64 RecordNo { get; set; }
       public string ActionDesc { get; set; }
       public int UserCode { get; set; }
       public string InvoiceNo { get; set; }
       public string G2AInvoiceNo { get; set; }
       public Int64 RecordNo2A { get; set; }
       public DataTable dtInvoice = new DataTable();
    }
