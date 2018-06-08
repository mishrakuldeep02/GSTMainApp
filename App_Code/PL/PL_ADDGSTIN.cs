using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PL_ADDGSTIN
/// </summary>
public class PL_ADDGSTIN
{
	public PL_ADDGSTIN()
	{
	}
    public int Ind { get; set; }
    public string ClientCode { set; get; }
    public string ClientCodeOdp { set; get; }
    public string OdpGSTNo { set; get; }
    public string GSTNNO { set; get; }
    public string PANNO { set; get; }
    public string StateCode { set; get; }
    public string Priority { set; get; }
    public string ContactPersonName { set; get; }
    public string ContactAddress { set; get; }
    public int ContactCityCode { set; get; }
    public int ContactStateCode { get; set; }
    public string ContactMobileNo { get; set; }
    public string ContactEmailid { get; set; }
    public int ActiveInd { get; set; }
    public string ActiveDate { get; set; }
    public string EntryDate { get; set; }
}