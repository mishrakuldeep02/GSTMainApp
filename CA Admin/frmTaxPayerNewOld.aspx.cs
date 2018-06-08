using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmTaxPayerNew : System.Web.UI.Page
{
    //string RecordNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");

            DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            ddl.DataSource = ds.Tables[0];
            ddl.DataTextField = "MonthYearDesc";
            ddl.DataValueField = "MonthYrCode";
            ddl.DataBind();
         
            var clientcode = Session["ClientCode"];
            var clientcodeodp = Session["ClientCodeOdp"];
            var GSTIN = Session["ClientGSTNNO"];          
            DataSet ds1 = CLSCommon.CallApiGet("api/TaxPayeNew/GetALlGSTRName?Ind=0&ClientCode=" + Session["ClientCode"] + "&ClientCodeOdp=" + Session["ClientCodeOdp"] + "&ClientGSTNNO=" + Session["ClientGSTNNO"]);
            if (ds1.Tables.Count > 0)
            {
                grdAllGstrName.DataSource = ds1.Tables[0];
                grdAllGstrName.DataBind();             
            }
        }
    }
  
    protected void grdAllGstrName_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        int RowIndex = 0;
        RowIndex = int.Parse(e.CommandArgument.ToString());
        int data = int.Parse(grdAllGstrName.DataKeys[RowIndex][0].ToString());
        
        foreach (GridViewRow grow in grdAllGstrName.Rows)
        {
            LinkButton lnkbtn1 = (LinkButton)grow.FindControl("lblGSTRName");
            lnkbtn1.CssClass = "list-group-item";
        }

        LinkButton lnkbtn = (LinkButton)grdAllGstrName.Rows[RowIndex].FindControl("lblGSTRName");
        lnkbtn.CssClass = "list-group-item active";

        DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        PL_TaxPayerNew objpl = new PL_TaxPayerNew();
        objpl.Ind = 1;
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();
        objpl.RecordNo = data.ToString();
        objpl.MonthCD = ddlMonthYear.SelectedValue.ToString();
        DataTable dt = CLSCommon.CallApiPost("api/TaxPayeNew/GetAllData", objpl);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}