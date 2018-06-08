using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmAddCA : System.Web.UI.Page
{
    PL_CARegis plobj;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        if (!IsPostBack)
        {
            //DataSet dS = new DataSet();
            //dS = CLSCommon.CallApiGet("api/SearchReg/GetRecordByRegNo?Ind=1&RegNo=" + Session["RegNo"].ToString());
            //if (dS.Tables.Count > 0)
            //{
            //    if (dS.Tables[0].Rows.Count > 0)
            //    {
            //        lblRegNo.Text = Session["RegNo"].ToString();
            //        txtName.Text = dS.Tables[0].Rows[0]["EnqName"].ToString();
            //        txtOrganisationName.Text = dS.Tables[0].Rows[0]["OrgName"].ToString();
            //        txtPanNo.Text = dS.Tables[0].Rows[0]["PanNo"].ToString();
            //        txtMobileNo.Text = dS.Tables[0].Rows[0]["MobileNo"].ToString();
            //        txtEmailId.Text = dS.Tables[0].Rows[0]["EmailId"].ToString();
            //        txtCategory.Text = dS.Tables[0].Rows[0]["EnqCatDesc"].ToString();
            //    }
            //}

         //   FillDDlState();
        }



    }
    //void FillDDlState()
    //{
    //    try
    //    {
    //        DataSet ds = CLSCommon.CallApiGet("api/AddCAAdmin/FillDdlState?Ind=2");
    //        if (ds.Tables.Count > 0)
    //        {

    //            ddlState.DataSource = ds.Tables[0];
    //            ddlState.DataTextField = "StateDesc";
    //            ddlState.DataValueField = "StateCode";
    //            ddlState.DataBind();
    //            ddlState.Items.Insert(0, new ListItem("Select", "0"));


    //            ddlConsultantType.DataSource = ds.Tables[1];
    //            ddlConsultantType.DataValueField = "ConsultantId";
    //            ddlConsultantType.DataTextField = "ConsultantDesc";
    //            ddlConsultantType.DataBind();
    //            ddlConsultantType.Items.Insert(0, new ListItem("Select", "0"));
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Console.WriteLine(ex);
    //    }

    //}

    //public static bool IsValidEmail(this string email)
    //{
    //    var r = new Regex(@"^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[com]{2,9})$");

    //    return !string.IsNullOrEmpty(email) && r.IsMatch(email);
    //}

    public void ClearAllControls()
    {
        txtName.Text = "";
       // txtOrganisationName.Text = "";
      //  txtCategory.Text = "";
      //  txtPanNo.Text = "";
        txtMobileNo.Text = "";
        txtEmailId.Text = "";
       // ddlConsultantType.SelectedIndex = 0;
       // txtDesignation.Text = "";
       // txtLandLineNo.Text = "";
       // txtAadhaarNo.Text = "";
        //txtFullAddress.Text = "";
        //ddlState.SelectedIndex = 0;
        //ddlCity.SelectedIndex = 0;
        //txtPinCode.Text = "";
        //txtAlternatePerson.Text = "";
        //txtAlternateMobile.Text = "";
        //txtAlternateEmailId.Text = "";
       // txtBankName.Text = "";
       // txtBranchName.Text = "";
       // IFSCCode.Text = "";
       // txtAccountNo.Text = "";
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearAllControls();
    }
    //protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataSet ds = CLSCommon.CallApiGet("api/AddCAAdmin/FillDdlState?Ind=3&StateCode=" + ddlState.SelectedValue.ToString());
    //    if (ds.Tables.Count > 0)
    //    {
    //        ddlCity.DataSource = ds.Tables[0];
    //        ddlCity.DataTextField = "CityDesc";
    //        ddlCity.DataValueField = "CityCode";
    //        ddlCity.DataBind();
    //        ddlCity.Items.Insert(0, new ListItem("Select", "0"));
    //        ddlCity.Focus();
    //        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){ $('#ContentPlaceHolder1_ddlCity_chzn').focus();});", true);
    //    }
    //}
    protected void btnSave_Click1(object sender, EventArgs e)
    {
        PL_AddCaAdmin objpl = new PL_AddCaAdmin();
        objpl.Ind = 1;
       // objpl.StateCode = int.Parse(ddlState.SelectedValue.ToString());
        objpl.DistrictCode = 0;
       // objpl.CityCode = ddlCity.SelectedIndex == -1 ? 0 : int.Parse(ddlCity.SelectedValue.ToString());
        objpl.CACode = 0;
        objpl.CaCodeOdp = 0;
     //   objpl.CaFirmType = int.Parse(ddlConsultantType.SelectedValue.ToString());
        objpl.CaNameE = txtName.Text.Trim();
        objpl.CaNameH = txtName.Text.Trim();
      //  objpl.CaFirmNm = txtOrganisationName.Text.Trim();
      //  objpl.CaFirmAddress = txtFullAddress.Text.Trim();
      //  objpl.CaFirmCityCode = ddlCity.SelectedIndex == -1 ? 0 : int.Parse(ddlCity.SelectedValue.ToString());
       // objpl.CaFirmPinCode = txtPinCode.Text.Trim();
      //  objpl.CaFirmStateCode = int.Parse(ddlState.SelectedValue.ToString());
        objpl.CaMobileNo1 = txtMobileNo.Text.Trim();
      //  objpl.CaMobileNo2 = txtAlternateMobile.Text.Trim();
      //  objpl.CaLandlineNo = txtLandLineNo.Text.Trim();
        //objpl.CaadhaarNo = txtAadhaarNo.Text.Trim();
        objpl.CaEmailid = txtEmailId.Text.Trim();
       // objpl.AlternativeContactname = txtAlternatePerson.Text.Trim();
     //   objpl.AlternateMobileNo = txtAlternateMobile.Text.Trim();
     //   objpl.AlternateEmailid = txtAlternateEmailId.Text.Trim();
        objpl.AdminCAInd = 2;
        objpl.AdminCaCode = int.Parse(Session["CaCode"].ToString());
        objpl.MainAdminCaOdpCode = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.LoginUserCode = 0;//int.Parse(Session["UserCode"].ToString());
        DataTable dt = CLSCommon.CallApiPost("api/AddCAAdmin/SaveData/", objpl);
        if (dt.Rows.Count > 0)
        {
            pnlError.Visible = true;
            Session["ErrorMsg"] = dt.Rows[0]["ErrorMsg"].ToString();
            Response.Redirect("frmSubmitted.aspx");
          //  lblMsg.Text = "Record Saved Successfully. Client Code : " + dt.Rows[0]["ClientCode"].ToString();
        }
        ClearAllControls();
    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/frmLogin.aspx");
    }
}