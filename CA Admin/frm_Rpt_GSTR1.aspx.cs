using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frm_Rpt_GSTR1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // fillddl();
        }
    }

    //void fillddl()
    //{
    //    DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");
    //    DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
    //    ddl.DataSource = ds.Tables[0];
    //    ddl.DataTextField = "MonthYearDesc";
    //    ddl.DataValueField = "MonthYrCode";
    //    ddl.DataBind();
    //}

    protected void btnView_Click(object sender, EventArgs e)
    {
        DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        Hashtable HT = new Hashtable();
        HT.Add("ClientCode", Convert.ToInt32(Session["ClientCode"].ToString()));
        HT.Add("ClientCodeOdp", Convert.ToInt32(Session["ClientCodeOdp"].ToString()));
        HT.Add("GSTNNO", Session["ClientGSTNNO"].ToString());
        HT.Add("YrCode", "2017");
        HT.Add("MonthCD", Convert.ToInt32(Session["MonthYrCode"].ToString()));
        Session["HT"] = HT;
        Session["format"] = "Pdf";
        Session["FileName"] = "GSTR1Report";
        Session["Report"] = "GSTR1Report";
        Response.Redirect("FrmReportViewerForCaAdmin.aspx");
    }
}