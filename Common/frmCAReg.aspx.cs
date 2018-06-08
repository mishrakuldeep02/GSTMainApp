using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modal;
using System.Data;
using System.Text.RegularExpressions;

public partial class Common_frmCAReg : System.Web.UI.Page
{
    PL_CARegis plobj;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
       // CLSCommon.CheckSession();
        if (Session["RegNo"] != null)
        {
            if (!IsPostBack)
            {
                DataSet dS = new DataSet();
                dS = CLSCommon.CallApiGet("api/SearchReg/GetRecordByRegNo?Ind=1&RegNo=" + Session["RegNo"].ToString());
                if (dS.Tables.Count > 0)
                {
                    if(dS.Tables[0].Rows.Count>0)
                    {
                        lblRegNo.Text = Session["RegNo"].ToString();
                        txtName.Text = dS.Tables[0].Rows[0]["EnqName"].ToString();
                        txtOrganisationName.Text = dS.Tables[0].Rows[0]["OrgName"].ToString();
                        txtPanNo.Text = dS.Tables[0].Rows[0]["PanNo"].ToString();
                        txtMobileNo.Text = dS.Tables[0].Rows[0]["MobileNo"].ToString();
                        txtEmailId.Text = dS.Tables[0].Rows[0]["EmailId"].ToString();
                        txtCategory.Text = dS.Tables[0].Rows[0]["EnqCatDesc"].ToString();
                    }
                }
               
                FillDDlState();
            }
        }
        else
        {
            Response.Redirect("frmSearchReg.aspx");
        }
    }

    void FillDDlState()
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


                ddlConsultantType.DataSource = ds.Tables[1];
                ddlConsultantType.DataValueField = "ConsultantId";
                ddlConsultantType.DataTextField = "ConsultantDesc";
                ddlConsultantType.DataBind();
                ddlConsultantType.Items.Insert(0, new ListItem("Select", "0"));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);
        }

    }

    //public static bool IsValidEmail(this string email)
    //{
    //    var r = new Regex(@"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[com]{2,9})$");

    //    return !string.IsNullOrEmpty(email) && r.IsMatch(email);
    //}

    public void ClearAllControls()
    {
        txtName.Text = "";
        txtOrganisationName.Text = "";
        txtCategory.Text = "";
        txtPanNo.Text = "";
        txtMobileNo.Text = "";
        txtEmailId.Text = "";
        ddlConsultantType.SelectedIndex = 0;
        txtDesignation.Text = "";
        txtLandLineNo.Text = "";
        txtAadhaarNo.Text = "";
        txtFullAddress.Text = "";
        ddlState.SelectedIndex = 0;
        ddlCity.SelectedIndex = 0;
        txtPinCode.Text = "";
        txtAlternatePerson.Text = "";
        txtAlternateMobile.Text = "";
        txtAlternateEmailId.Text = "";
        txtBankName.Text = "";
        txtBranchName.Text = "";
        IFSCCode.Text = "";
        txtAccountNo.Text = "";
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearAllControls();
    }
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = CLSCommon.CallApiGet("api/CARegis/FillDdlState?Ind=3&StateCode=" + ddlState.SelectedValue.ToString());
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
    protected void btnSave_Click1(object sender, EventArgs e)
    {
        plobj = new PL_CARegis();
        plobj.Ind = 1;
        plobj.CA_Name = txtName.Text;
        plobj.CA_OrganizationName = txtOrganisationName.Text;
        plobj.CA_Category = txtCategory.Text;
        plobj.CA_PANNo = txtPanNo.Text;
        plobj.CA_MobileNo = txtMobileNo.Text;
        plobj.CA_EmailId = txtEmailId.Text;
        plobj.CA_ConsultantType = ddlConsultantType.SelectedValue.ToString();
        plobj.CA_Designation = txtDesignation.Text;
        plobj.CA_LandlineNo = txtLandLineNo.Text;
        plobj.CA_AadharNo = txtAadhaarNo.Text;
        plobj.CA_FullAddress = txtFullAddress.Text;
        plobj.CA_State = ddlState.SelectedValue.ToString();
        plobj.CA_City = ddlCity.SelectedIndex < 0 ? "0" : ddlCity.SelectedValue.ToString();
        plobj.CA_PinCode = txtPinCode.Text;
        plobj.CA_AlternateContPerson = txtAlternatePerson.Text;
        plobj.CA_AlternateMobileNo = txtAlternateMobile.Text;
        plobj.CA_AlternateEmailId = txtAlternateEmailId.Text;
        plobj.CA_BankName = txtBankName.Text;
        plobj.CA_BranchName = txtBranchName.Text;
        plobj.CA_IFSCCode = IFSCCode.Text;
        plobj.CA_AC_No = txtAccountNo.Text;

        DataTable dt = CLSCommon.CallApiPost("api/CARegis/SaveData/", plobj);
        if (dt.Rows.Count > 0)
        {
            pnlError.Visible = true;
            Session["ErrorMsg"] = dt.Rows[0]["ErrorMsg"].ToString();
            Response.Redirect("frmSubmitted.aspx");
            lblMsg.Text = "Record Saved Successfully. Client Code : " + dt.Rows[0]["ClientCode"].ToString();
        }
        ClearAllControls();
    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/frmLogin.aspx");
    }
}