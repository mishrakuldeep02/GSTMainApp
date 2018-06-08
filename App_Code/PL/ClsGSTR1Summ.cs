using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClsGSTR1Summ
/// </summary>
public class ClsGSTR1Summ
{
	public ClsGSTR1Summ()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
        public string ret_period { get; set; }
        public List<SecSum> sec_sum { get; set; }
        public string gstin { get; set; }
        public string chksum { get; set; }
   
}

public class CptySum
{
    public decimal ttl_igst { get; set; }
    public decimal ttl_cgst { get; set; }
    public string ctin { get; set; }
    public decimal ttl_cess { get; set; }
    public decimal ttl_tax { get; set; }
    public decimal ttl_val { get; set; }
    public decimal ttl_rec { get; set; }
    public string chksum { get; set; }
    public decimal ttl_sgst { get; set; }
}

public class SecSum
{
    public decimal ttl_igst { get; set; }
    public string sec_nm    { get; set; }
    public decimal ttl_cess{ get; set; }
    public decimal ttl_tax { get; set; }
    public decimal ttl_val { get; set; }
    public decimal ttl_rec { get; set; }
    public string chksum   { get; set; }
    public decimal? ttl_cgst { get; set; }
    public decimal? ttl_sgst { get; set; }
    public decimal? ttl_doc_issued { get; set; }
    public decimal? net_doc_issued { get; set; }
    public decimal? ttl_doc_cancelled { get; set; }
    public decimal? ttl_nilsup_amt { get; set; }
    public decimal? ttl_expt_amt { get; set; }
    public decimal? ttl_ngsup_amt { get; set; }
    public List<CptySum> cpty_sum { get; set; }
}
