using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PL_EwayBill
/// </summary>
public class PL_EwayBill
{
	public PL_EwayBill()
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
    public int MonthCD { get; set; }
    public string ClientGSTNNO { get; set; }
    public int ExcelNo { get; set; }
    public int UserCode { get; set; }
}