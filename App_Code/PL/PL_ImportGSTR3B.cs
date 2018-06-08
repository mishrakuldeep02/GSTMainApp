using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PL_ImportGSTR3B
/// </summary>
public class PL_ImportGSTR3B
{
	public PL_ImportGSTR3B()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet ds = new DataSet();
    //public DataTable dt = new DataTable();
    public int ind { get; set; }
    public int ClientCode { get; set; }
    public int ClientCodeOdp { get; set; }
    public int CACode { get; set; }
    public int CaCodeOdp { get; set; }
    public int YrCode { get; set; }
    public int MonthCD { get; set; }
    public string MonthYearDesc { get; set; }
    public int MMYY { get; set; }
    public int DocType { get; set; }
    public string ClientGSTNNO { get; set; }
    public int ExcelNo { get; set; }
    public string ImportDate { get; set; }
    public int ExcelType { get; set; }
    public int UserCode { get; set; }
}