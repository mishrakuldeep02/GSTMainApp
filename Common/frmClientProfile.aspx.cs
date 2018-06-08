using Modal;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Common_frmClientProfile : System.Web.UI.Page
{
    PL_ClientProfile objpl;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Session["RegNo"]!=null)
        {
            if (!IsPostBack)
            {
                DataSet dS = new DataSet();
                dS = CLSCommon.CallApiGet("api/SearchReg/GetRecordByRegNo?Ind=1&RegNo=" + Session["RegNo"].ToString());
                if (dS.Tables.Count > 0)
                {
                    if (dS.Tables[0].Rows.Count > 0)
                    {
                        lblRegNo.Text = Session["RegNo"].ToString();
                        txtName.Text = dS.Tables[0].Rows[0]["EnqName"].ToString();
                        txtOrganisationName.Text = dS.Tables[0].Rows[0]["OrgName"].ToString();
                        txtCategory.Text = dS.Tables[0].Rows[0]["EnqCatDesc"].ToString();
                        txtMobileNo.Text = dS.Tables[0].Rows[0]["MobileNo"].ToString();
                        txtEmailId.Text = dS.Tables[0].Rows[0]["EmailId"].ToString();
                        txtPanNo.Text = dS.Tables[0].Rows[0]["PanNo"].ToString();
                    }
                }
                FillDDl();
            }
        }
        else
        {
           Response.Redirect("frmSearchReg.aspx");
        }
    }
    void FillDDl()
    {
        DataSet ds = CLSCommon.CallApiGet("api/ClientProfile/FillDdl?Ind=2");
        if (ds.Tables.Count > 0)
        {
            ddlState.DataSource = ds.Tables[0];
            ddlState.DataTextField = "StateDesc";
            ddlState.DataValueField = "StateCode";
            ddlState.DataBind();
            ddlState.Items.Insert(0, new ListItem("Select", "0"));

            ddlBussinessType.DataSource = ds.Tables[1];
            ddlBussinessType.DataTextField = "BussinesTypeDesc";
            ddlBussinessType.DataValueField = "BussinessTypeId";
            ddlBussinessType.DataBind();
            ddlBussinessType.Items.Insert(0, new ListItem("Select", "0"));

            ddlBussinessNature.DataSource = ds.Tables[2];
            ddlBussinessNature.DataTextField = "BussinessNatureDesc";
            ddlBussinessNature.DataValueField = "BussinessNatureId";
            ddlBussinessNature.DataBind();
            ddlBussinessNature.Items.Insert(0, new ListItem("Select", "0"));
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objpl = new PL_ClientProfile();
        objpl.Ind = 1;
        objpl.StateCode = int.Parse(ddlState.SelectedValue.ToString());
        objpl.DistrictCode = 0;
        objpl.CityCode = int.Parse(ddlCity.SelectedIndex < 0 ? "0" : ddlCity.SelectedValue.ToString());
        objpl.ClientType = 0;
        objpl.FirmName = txtOrganisationName.Text;
        objpl.ClientNameE = txtName.Text;
        objpl.ClientNameH = txtName.Text;
        objpl.ClientDesg = txtDesignation.Text;
        objpl.ClientMobileNo1 = txtMobileNo.Text;
        objpl.ClientMobileNo2 = txtAlternateMobile.Text;
        objpl.LandLineNo = txtLandLineNo.Text;
        objpl.EmailId = txtEmailId.Text;
        objpl.ClientPANNo = txtPanNo.Text;
        objpl.AadhaarNo = txtAadhaarNo.Text;
        objpl.AlternateContactName = txtAlternatePerson.Text;
        objpl.AlternateMobileNo = txtAlternateMobile.Text;
        objpl.AlternateEmailid = txtEmailId.Text;
        objpl.BankName = txtBankName.Text;
        objpl.BranchName = txtBranchName.Text;
        objpl.IFSCCode = IFSCCode.Text;
        objpl.AccountNo = txtAccountNo.Text;
        objpl.DependentInd = rdbDirectly.Checked ? 0 : 1;
        objpl.CACode = rdbUnderCA.Checked ? int.Parse(txtCANo.Text) : 0;
        objpl.CACodeOdp = 0;
        objpl.ActiveInd = 1;
        objpl.LoginUserCode = 0;
        objpl.RefnoOtherSys = 0;
        objpl.BussinessTypeId = int.Parse(ddlBussinessType.SelectedValue.ToString());
        objpl.BussinessNatureId = int.Parse(ddlBussinessNature.SelectedValue.ToString());
        objpl.FullAddress = txtFullAddress.Text;
        objpl.PinCode = txtPinCode.Text;
        objpl.RegNo = int.Parse(Session["RegNo"].ToString());
        objpl.GSTINNo = txtGSTINNo.Text;
        DataTable dt = CLSCommon.CallApiPost("api/ClientProfile/SaveClientData/", objpl);
        if (dt.Rows.Count > 0)
        {
            pnlError.Visible = true;
            Session["ErrorMsg"] = dt.Rows[0]["ErrorMsg"].ToString();
            Response.Redirect("frmSubmitted.aspx");
            lblMsg.Text = "Record Saved Successfully. Client Code : " + dt.Rows[0]["ClientCode"].ToString();
            clear();
        }
    }
    public void clear()
    {
        ddlState.SelectedIndex = 0;
        ddlBussinessType.SelectedIndex = 0;
        ddlBussinessNature.SelectedIndex = 0;
       // txtOrganisationName.Text = "";
        //txtName.Text = "";
        //txtName.Text = "";
        //txtMobileNo.Text = "";
        txtAlternateMobile.Text = "";
        txtLandLineNo.Text = "";
        //txtEmailId.Text = "";
        //txtPanNo.Text = "";
        txtAadhaarNo.Text = "";
        txtAlternatePerson.Text = "";
        txtAlternateMobile.Text = "";
      //  txtEmailId.Text = "";
        txtBankName.Text = "";
        txtBranchName.Text = "";
        IFSCCode.Text = "";
        txtAccountNo.Text = "";
       // txtName.Text = "";
      //  txtOrganisationName.Text = "";
     //   txtCategory.Text = "";
       // txtPanNo.Text = "";
       // txtMobileNo.Text = "";
       // txtEmailId.Text = "";
        TextBox1.Text = "";
        txtPinCode.Text = "";
        txtDesignation.Text = "";
        txtFullAddress.Text = "";
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        clear();
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
}