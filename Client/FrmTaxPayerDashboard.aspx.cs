using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_FrmTaxPayerDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.ClientCheckSession();
        if(!IsPostBack)
        {
            //DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");
            //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            //ddl.DataSource = ds.Tables[0];
            //ddl.DataTextField = "MonthYearDesc";
            //ddl.DataValueField = "MonthYrCode";
            //ddl.DataBind();

        } GetClientGstStatus();
       
    }
    PL_TaxPayerDashboard objpl ;
    DataSet ds ;
    public void GetClientGstStatus()
    {
       DropDownList ddl=(DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_TaxPayerDashboard();
        objpl.ClientCode=Convert.ToInt32(Session["ClientCode"]);
        objpl.ClientCodeOdp = Convert.ToInt32(Session["ClientCodeOdp"]);
        objpl.Ind = 1;
        objpl.GSTIN = Session["ClientGSTNNO"].ToString().Trim();
        ds = new DataSet();
        ds = CLSCommon.CallApiGet("api/TaxPayerDashboard/GetClientGstStatus?Ind=1&ClientCode=" + objpl.ClientCode + "&ClientCodeOdp=" + objpl.ClientCodeOdp + "&GSTIN=" + objpl.GSTIN + "&MonthYrCode=" + ddl.SelectedValue.ToString());
         if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
         {
             GridDashboard.DataSource = null;
             GridDashboard.DataBind();
             
            // lblErrorMsg.Text = "Invalid login Id And Password.";
         }
         else
         {
             ViewState["DashboardStatus"] = ds.Tables[0];
             GridDashboard.DataSource = ds.Tables[0];
             GridDashboard.DataBind();
         }
    }
    protected void GridDashboard_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataTable dtnew = new DataTable();
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblImport = (Label)e.Row.FindControl("lblImport");
            Label lblFinilize = (Label)e.Row.FindControl("lblFinilize");
            LinkButton lnk = (LinkButton)e.Row.FindControl("lnkbtn");
            Label lblUpload = (Label)e.Row.FindControl("lblUpload");

            if(GridDashboard.DataKeys[e.Row.RowIndex][0].ToString()=="1")
            {
                lblImport.Text = "True";
                lblImport.CssClass = "text-success";
               // lblImport.ForeColor = System.Drawing.Color.Green;
            }
            else if (GridDashboard.DataKeys[e.Row.RowIndex][0].ToString() == "2")
            {
                lblImport.Text = "False";
                lblImport.CssClass = "text-danger";
               // lblImport.ForeColor = System.Drawing.Color.Red;
            }
            else if (GridDashboard.DataKeys[e.Row.RowIndex ][0].ToString() == "3")
            {
                lblImport.Text = "Validity /Error";
                lblImport.CssClass = "text-warning";
                //lblImport.ForeColor = System.Drawing.Color.YellowGreen;
                lnk.Visible = true;
            }

            if (GridDashboard.DataKeys[e.Row.RowIndex ][1].ToString() == "1")
            {
                lblFinilize.Text = "True";
                lblFinilize.CssClass = "text-success";
               // lblFinilize.ForeColor = System.Drawing.Color.Green;
            }else
            {
                lblFinilize.Text = "False";
                lblFinilize.CssClass = "text-danger";
               // lblFinilize.ForeColor = System.Drawing.Color.Red;
            }

            if (GridDashboard.DataKeys[e.Row.RowIndex ][2].ToString() == "1")
            {
                lblUpload.Text = "True";
                lblUpload.CssClass = "text-success";
                //lblUpload.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblUpload.Text = "False";
                lblUpload.CssClass = "text-danger";
             //   lblUpload.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}