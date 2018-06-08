using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmCaAllotmentToClient : System.Web.UI.Page
{
    PL_CAAllotment objpl;
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();

        if(!IsPostBack)
        {
            GetAllClient();
        }
    }
    void GetAllClient()
    {
        DataSet ds = CLSCommon.CallApiGet("api/CAAllotment/GetClientAllotment?ind=1&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString());
        ViewState["CaTable"] = ds.Tables[1];
        grdAllClients.DataSource = ds.Tables[0];
        grdAllClients.DataBind();
       
    }
    protected void grdAllClients_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        int RowIndex = 0;
        RowIndex = int.Parse(e.CommandArgument.ToString());
        if (e.CommandName == "Allot")
        {
            DropDownList ddlCa = (DropDownList)grdAllClients.Rows[RowIndex].FindControl("ddlCa");
            if(ddlCa.SelectedIndex==-1|| ddlCa.SelectedValue=="0")
            {
                pnlError.CssClass = "alert alert-danger";
                lblMsg.Text = "Please Select CA To Allot To the Client.";
                pnlError.Visible = true;
                ddlCa.Focus();
                return;
            }else
            {
                int AllotCaCode = int.Parse(ddlCa.SelectedValue.ToString());
                int ClientCode = int.Parse(grdAllClients.DataKeys[RowIndex][0].ToString());
                int ClientCodeodp = int.Parse(grdAllClients.DataKeys[RowIndex][1].ToString());
                string GSTNNo =((Label) grdAllClients.Rows[RowIndex].FindControl("lblGSTIN")).Text;
                int OdpGSTNNO = int.Parse(grdAllClients.DataKeys[RowIndex][4].ToString());
                string ClientName = ((Label)grdAllClients.Rows[RowIndex].FindControl("lblClientName")).Text;
                UpdateData(AllotCaCode,ClientCode,ClientCodeodp,GSTNNo,OdpGSTNNO,ClientName);
            }
        }
    }
    void UpdateData( int AllotCaCode,int ClientCode,int ClientCodeOdp,string GSTNNO,int OdpGSTNNO,string ClientName)
    {
        objpl = new PL_CAAllotment();
        objpl.Ind = 2;
        objpl.CaCode = int.Parse( Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.AllotmentCaCode = AllotCaCode;
        objpl.ClientCode = ClientCode;
        objpl.ClientCodeOdp = ClientCodeOdp;
        objpl.GSTNNO = GSTNNO;
        objpl.OdpGSTNNO = OdpGSTNNO;
        DataTable dt = CLSCommon.CallApiPost("api/CAAllotment/UpdateClientAllotment", objpl);
        if(dt.Rows.Count>0)
        {
            pnlError.CssClass = "alert alert-success";
            lblMsg.Text = "Ca Alloted Successfully Client Name : "+ClientName;
            pnlError.Visible = true;
            GetAllClient();
        }
    }
    protected void grdAllClients_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            DropDownList ddlCa = (DropDownList)e.Row.FindControl("ddlCa");
            ddlCa.DataSource =(DataTable) ViewState["CaTable"];
            ddlCa.DataTextField = "CaNameE";
            ddlCa.DataValueField = "CaCode";
            ddlCa.DataBind();
            ddlCa.Items.Insert(0, new ListItem("Select", "0"));
            
            if(grdAllClients.DataKeys[e.Row.RowIndex][2].ToString()!="0")
            {
                e.Row.BackColor = System.Drawing.Color.LightGray;
                ddlCa.SelectedValue = grdAllClients.DataKeys[e.Row.RowIndex][3].ToString();
                ddlCa.Items.Insert(1, new ListItem("Self", "-1"));
            }
        }
    }
}