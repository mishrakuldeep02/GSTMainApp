using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GSTR2Summ
/// </summary>
public class GSTR2Summ
{
	public GSTR2Summ()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public class CptySum
    {
        public double ttl_txpd_sgst { get; set; }
        public int rc { get; set; }
        public double ttl_itcavld_cgst { get; set; }
        public int ttl_txpd_igst { get; set; }
        public int ttl_txpd_cess { get; set; }
        public double ttl_txpd_cgst { get; set; }
        public int ttl_itcavld_igst { get; set; }
        public string ctin { get; set; }
        public double ttl_itcavld_sgst { get; set; }
        public double ttl_val { get; set; }
        public int ttl_itcavld_cess { get; set; }
        public string chksum { get; set; }
    }

    public class SectionSummary
    {
        public double ttl_txpd_sgst { get; set; }
        public int rc { get; set; }
        public double ttl_itcavld_cgst { get; set; }
        public string sec_nm { get; set; }
        public double ttl_txpd_igst { get; set; }
        public double ttl_txpd_cess { get; set; }
        public double ttl_txpd_cgst { get; set; }
        public double ttl_itcavld_igst { get; set; }
        public double ttl_itcavld_sgst { get; set; }
        public double ttl_val { get; set; }
        public double ttl_itcavld_cess { get; set; }
        public string chksum { get; set; }
        public double? ti_val { get; set; }
        public double? ttl_nilsply { get; set; }
        public double? ttl_cppdr { get; set; }
        public double? ttl_ngsply { get; set; }
        public double? ttl_expdsply { get; set; }
        public List<CptySum> cpty_sum { get; set; }
        public double? ttl_isd_sgst { get; set; }
        public double? ttl_isd_cgst { get; set; }
        public double? ttl_isd_cess { get; set; }
        public double? ttl_isd_igst { get; set; }
    }

        public string ret_period { get; set; }
        public List<SectionSummary> section_summary { get; set; }
        public string gstin { get; set; }
        public string chksum { get; set; }
    
}