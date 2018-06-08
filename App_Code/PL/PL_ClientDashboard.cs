using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PL_ClientDashboard
/// </summary>
public class PL_ClientDashboard
{
    public PL_ClientDashboard()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int ind { get; set; }
    public int TrnNo { get; set; }
    public int ClientCode { get; set; }
    public int ClientCodeOdp { get; set; }
    public string GSTIN { get; set; }
    public int MonthInd { get; set; }
    public int YearInd { get; set; }
    public int GSTRCode { get; set; }
    public string GSTRDesc { get; set; }
    public DataTable dt { get; set; }
}