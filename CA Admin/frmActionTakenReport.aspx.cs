using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmActionTakenReport : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
         //   fillddl();
        }
    }
   

    protected void btnView_Click(object sender, EventArgs e)
    {
       // DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        Hashtable HT = new Hashtable();
        HT.Add("Ind", 1);
        HT.Add("ClientCode", Convert.ToInt32(Session["ClientCode"].ToString()));
        HT.Add("ClientCodeOdp", Convert.ToInt32(Session["ClientCodeOdp"].ToString()));
        HT.Add("GSTIN", Session["ClientGSTNNO"].ToString());
     //   HT.Add("YrCode", "2017");
        HT.Add("MonthCD", Convert.ToInt32(Session["MonthYrCode"].ToString()));
        Session["HT"] = HT;
        Session["format"] = "Pdf";
        Session["FileName"] = "GSTR1Report";
        Session["Report"] = "ActionTakenrpt";
        Response.Redirect("FrmReportViewerForCaAdmin.aspx");
    }
}