using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frm_Rpt_GSTR2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //fillddl();
        }
    }

   
    protected void btnView_Click(object sender, EventArgs e)
    {
       // DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        Hashtable HT = new Hashtable();
        //HT.Add("ClientCode", Convert.ToInt32(Session["ClientCode"].ToString()));
        //HT.Add("ClientCodeOdp", Convert.ToInt32(Session["ClientCodeOdp"].ToString()));
        //HT.Add("GSTNNO", Session["ClientGSTNNO"].ToString());
        //HT.Add("YrCode", "2017");
        //HT.Add("MonthCD", Convert.ToInt32(ddlMonthYear.SelectedValue.ToString()));

        HT.Add("ClientCode", 0);
        HT.Add("ClientCodeOdp", 0);
        HT.Add("GSTNNO", "0");
        HT.Add("YrCode", "0");
        HT.Add("MonthCD", Convert.ToInt32(Session["MonthYrCode"].ToString()));


        Session["HT"] = HT;
        Session["format"] = "Pdf";
        Session["FileName"] = "GSTR2Report";
        Session["Report"] = "GSTR2Report";
        Response.Redirect("FrmReportViewerForCaAdmin.aspx");
    }
}