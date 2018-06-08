using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for PL_MenuAllotment
/// </summary>
public class PL_MenuAllotmentSave
{
    public PL_MenuAllotmentSave()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Ind { set; get; }
    public DataTable dt_Menu = new DataTable();

    public int UserLevelId { set; get; }
    public string UserLevelDesc { set; get; }
    public int ClientId { set; get; }
    public int ClientIdOdp { set; get; }
    public int LoginId { set; get; }
    public int CAAdminCode { set; get; }

}