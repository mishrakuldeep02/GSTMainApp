using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_frmHometaxPayer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.ClientCheckSessionClient();
        if (!IsPostBack)
        {
            GetGSTIN();
            DataSet ds1 = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");
            foreach (GridViewRow grw in grdRegisteredGSTIN.Rows)
            {
                DropDownList ddlMonth = (DropDownList)grw.FindControl("ddlMonth");
                FillDdl(ddlMonth, ds1);
            }
        }
    }
    void FillDdl(DropDownList ddl, DataSet ds1)
    {
        ddl.DataSource = ds1.Tables[0];
        ddl.DataTextField = "MonthYearDesc";
        ddl.DataValueField = "MonthYrCode";
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("Select", "0"));
    }
    void GetGSTIN()
    {
        DataSet ds = CLSCommon.CallApiGet("api/ClientHome/GetClientGSTIN?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString());
        if (ds != null)
        {
            grdRegisteredGSTIN.DataSource = ds.Tables[0];
            grdRegisteredGSTIN.DataBind();
        }
    }
    protected void grdRegisteredGSTIN_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int Index = int.Parse(e.CommandArgument.ToString());
        DropDownList ddl = (DropDownList)grdRegisteredGSTIN.Rows[Index].FindControl("ddlMonth");
        if (ddl.SelectedValue.ToString() == "0")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$.jAlert({  'title': 'Error','content': 'Please Select Return Period','theme': 'red','size': 'xsm'});});", true);
            //Response.Write("<script> $.jAlert({  'title': 'Error','content': 'Please Select Return Period','theme': 'blue','size': 'xsm'});</script>");
            ddl.Focus();
            ddl.BorderColor = System.Drawing.Color.Red;
            return;
        }

        Session["ClientGSTNNO"] = grdRegisteredGSTIN.Rows[Index].Cells[1].Text;
        Session["MonthYrCode"] = ddl.SelectedValue.ToString();
        Session["MonthYearDesc"] = ddl.SelectedItem.Text;
        Response.Redirect("~/CA Admin/frmTaxpayerNew.aspx");
        //Session["ClientGSTNNO"] = grdRegisteredGSTIN.Rows[int.Parse(e.CommandArgument.ToString())].Cells[1].Text;
        //Response.Redirect("~/Client/FrmTaxPayerDashboard.aspx");
        //  Response.Redirect("~/CA Admin/frmTaxPayer.aspx");
    }
}