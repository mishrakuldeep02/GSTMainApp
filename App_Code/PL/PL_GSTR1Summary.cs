using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PL_GSTR1Summary
/// </summary>
public class PL_GSTR1Summary
{
	
    public int Ind { get; set; }
    public int ClientCode { get; set; }
    public int ClientCodeOdp { get; set; }
    public string ClientGSTIN { get; set; }
    public int CaCode { get; set; }
    public int CaCodeOdp { get; set; }
    public int MonthCD { get; set; }
    public int Payload { get; set; }
    public int UserCode { get; set; }
    public int ExcelNo { get; set; }
   // public DataTable dt { get; set; }
    //public DataSet ds { get; set; }

    public DataTable dt
    {
        get { return _dt; }
        set { _dt = value; }
    }

    private DataTable _dt = new DataTable();
    public DataSet ds
    {
        get { return _ds; }
        set { _ds = value; }
    }
    private DataSet _ds = new DataSet();
}