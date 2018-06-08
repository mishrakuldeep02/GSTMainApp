using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Client_FrmAddGSTIN : System.Web.UI.Page
{
    PL_ADDGSTIN plobj;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        CLSCommon.CommonCheckSession();
        //CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
            FillDDlState();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }
    public void Clear()
    {
        txtGSTINNO.Text = "";
        //txtpanno.Text = "";
        txtcontactPersonName.Text = "";
        txtaddress.Text = "";
        ddlState.SelectedIndex = 0;
        ddlCity.SelectedIndex = 0;
        txtpincode.Text = "";
        txtmobileno.Text = "";
        txtEmailid.Text = "";
    }

    public void FillDDlState()
    {
        try
        {
            DataSet ds = CLSCommon.CallApiGet("api/CARegis/FillDdlState?Ind=2");
            if (ds.Tables.Count > 0)
            {
                ddlState.DataSource = ds.Tables[0];
                ddlState.DataTextField = "StateDesc";
                ddlState.DataValueField = "StateCode";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("Select", "0"));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }
    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmHometaxPayer.aspx");
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = CLSCommon.CallApiGet("api/ClientProfile/FillDdl?Ind=3&StateCode=" + ddlState.SelectedValue.ToString());
        if (ds.Tables.Count > 0)
        {
            ddlCity.DataSource = ds.Tables[0];
            ddlCity.DataTextField = "CityDesc";
            ddlCity.DataValueField = "CityCode";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("Select", "0"));
            ddlCity.Focus();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtGSTINNO.Text.Trim()))
        {
            txtGSTINNO.Focus();
            pnlError.Visible = true;
            lblMsg.Text = "Please Enter GSTIN NO";
            return;
        }
        //if (string.IsNullOrEmpty(txtpanno.Text.Trim()))
        //{
        //    txtpanno.Focus();
        //    pnlError.Visible = true;
        //    lblMsg.Text = "Please Enter Pan No";
        //    return;
        //}
        if (string.IsNullOrEmpty(txtcontactPersonName.Text.Trim()))
        {
            txtcontactPersonName.Focus();
            pnlError.Visible = true;
            lblMsg.Text = "Please Enter Contact Person";
            return;
        }

        if (string.IsNullOrEmpty(txtaddress.Text.Trim()))
        {
            txtaddress.Focus();
            pnlError.Visible = true;
            lblMsg.Text = "Please Enter Address";
            return;
        }
        if (string.IsNullOrEmpty(txtaddress.Text.Trim()))
        {
            txtaddress.Focus();
            pnlError.Visible = true;
            lblMsg.Text = "Please Enter Address";
            return;
        }
        else
        {
            plobj = new PL_ADDGSTIN();
            plobj.Ind = 1;
            plobj.ClientCode = Session["ClientCode"].ToString();
            plobj.ClientCodeOdp = Session["ClientCodeOdp"].ToString();
            plobj.GSTNNO = txtGSTINNO.Text;
            //plobj.PANNO = txtpanno.Text;
            //plobj.StateCode = txtpanno.Text;
            plobj.ContactPersonName = txtcontactPersonName.Text;
            plobj.ContactAddress = txtaddress.Text;
            plobj.ContactStateCode = int.Parse(ddlState.SelectedValue.ToString());
            plobj.ContactCityCode = int.Parse(ddlCity.SelectedIndex < 0 ? "0" : ddlCity.SelectedValue.ToString());
            plobj.ContactMobileNo = txtmobileno.Text;
            plobj.ContactEmailid = txtEmailid.Text;
            DataTable dt = CLSCommon.CallApiPost("api/ADDGSTIN/SaveData/", plobj);
            if (dt.Rows.Count > 0)
            {
                pnlError.Visible = true;
                Session["ErrorMsg"] = dt.Rows[0]["ErrorMsg"].ToString();
                Response.Redirect("frmSubmitted.aspx");
                lblMsg.Text = "Record Saved Successfully. Client Code : " + dt.Rows[0]["ClientCode"].ToString();
            }
            Clear();
        }
    }

}