using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PL_TaxPayerNew
/// </summary>
public class PL_TaxPayerNew
{
	public PL_TaxPayerNew()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int Ind { get; set; }
    public string ClientGSTNNO { get; set; }
    public int ClientCode { get; set; }
    public int ClientCodeOdp { get; set; }
    public string MonthCD { get; set; }
    public string MonthYearDesc { get; set; }
    public string RecordNo { get; set; }
}