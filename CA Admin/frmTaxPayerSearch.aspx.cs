using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmTaxPayerSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        if(!IsPostBack)
        {
            DataSet ds = CLSCommon.CallApiGet("api/SearchTaxPayer/SearchTaxPayer?Ind=4&TaxPayerName=" + txtSearch.Text + "&PanNo=" + txtSearch.Text + "&GSTINNo=" + txtSearch.Text + "&CACode=" + Session["CaCode"].ToString() + "&CACodeOdp=" + Session["CaCodeOdp"].ToString());
            ddlName.DataSource = ds.Tables[0];
            ddlName.DataTextField = "ClientNameE";
            ddlName.DataValueField = "ClientCode";
            ddlName.DataBind();
        }
    }
    void FillDdl(DropDownList ddl,DataSet ds1)
    {
        ddl.DataSource = ds1.Tables[0];
        ddl.DataTextField = "MonthYearDesc";
        ddl.DataValueField = "MonthYrCode";
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("Select", "0"));
    }
    protected void btnGo_Click(object sender, EventArgs e)
    {
        if(ddlName.SelectedIndex==-1)
        {
            return;
        }
        DataSet ds = CLSCommon.CallApiGet("api/SearchTaxPayer/SearchTaxPayer?Ind=" + ddlSearchType.SelectedValue.ToString() + "&ClientCode=" + ddlName.SelectedValue.ToString() + "&PanNo=" + txtSearch.Text + "&GSTINNo=" + txtSearch.Text + "&CACode=" + Session["CaCode"].ToString() + "&CACodeOdp=" + Session["CaCodeOdp"].ToString());
        if(ds.Tables.Count>0)
        {
            grdSearchResult.DataSource = ds.Tables[0];
            grdSearchResult.DataBind();
            DataSet ds1 = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");
            foreach(GridViewRow grw in grdSearchResult.Rows)
            {
                DropDownList ddlMonth = (DropDownList)grw.FindControl("ddlMonth");
                FillDdl(ddlMonth,ds1);
            }
        }else
        {

        }
    }
    protected void grdSearchResult_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int Index = int.Parse(e.CommandArgument.ToString());
        DropDownList ddl=(DropDownList)grdSearchResult.Rows[Index].FindControl("ddlMonth");
        if (ddl.SelectedValue.ToString() == "0")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$.jAlert({  'title': 'Error','content': 'Please Select Return Period','theme': 'red','size': 'xsm'});});", true);
            //Response.Write("<script> $.jAlert({  'title': 'Error','content': 'Please Select Return Period','theme': 'blue','size': 'xsm'});</script>");
            ddl.Focus();
            ddl.BorderColor = System.Drawing.Color.Red;
            return;
        }
      Session["ClientCode"]= grdSearchResult.DataKeys[Index][0].ToString();
      Session["ClientCodeOdp"] = grdSearchResult.DataKeys[Index][1].ToString();
      Session["ClientGSTNNO"] = grdSearchResult.Rows[Index].Cells[5].Text;
      Session["MonthYrCode"] = ddl.SelectedValue.ToString();
      Session["MonthYearDesc"] = ddl.SelectedItem.Text;
      Response.Redirect("frmTaxpayerNew.aspx");
    }
}