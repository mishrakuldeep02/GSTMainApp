using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmViewClient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        if (!IsPostBack)
        {
            FillGrid();
        }
    }
    void FillGrid()
    {
        DataSet ds = CLSCommon.CallApiGet("api/ViewAllClients/GetAllClients?Ind=1&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString());
        grdAllClients.DataSource = ds.Tables[0];
        grdAllClients.DataBind();
    }
    protected void grdAllClients_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int RowIndex = int.Parse(e.CommandArgument.ToString());
        lblClientName.Text = grdAllClients.Rows[RowIndex].Cells[1].Text;
        DataSet ds = CLSCommon.CallApiGet("api/ViewAllClients/GetAllClients?Ind=2&ClientCode=" + grdAllClients.DataKeys[RowIndex][0].ToString() + "&ClientCodeOdp=" + grdAllClients.DataKeys[RowIndex][1].ToString());
        grdClientDetails.DataSource = ds.Tables[0];
        grdClientDetails.DataBind();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){ $('#myModal').modal('show'); });", true);
        grdAllClients.Rows[RowIndex].Focus();

    }
}