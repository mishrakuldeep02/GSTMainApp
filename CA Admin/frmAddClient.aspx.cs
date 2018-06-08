using Modal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmAddClient : System.Web.UI.Page
{
    PL_ClientProfile objpl;
    protected void Page_Load(object sender, EventArgs e)
    {

        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();

        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        //if (Session["RegNo"] != null)
        //{
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
            //        txtCategory.Text = dS.Tables[0].Rows[0]["EnqCatDesc"].ToString();
            //        txtMobileNo.Text = dS.Tables[0].Rows[0]["MobileNo"].ToString();
            //        txtEmailId.Text = dS.Tables[0].Rows[0]["EmailId"].ToString();
            //        txtPanNo.Text = dS.Tables[0].Rows[0]["PanNo"].ToString();
            //    }
            //}
            FillDDl();
        }
        //}
        //else
        //{
        //    Response.Redirect("frmSearchReg.aspx");
        //}
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

            ddlstate1.DataSource = ds.Tables[0];
            ddlstate1.DataTextField = "StateDesc";
            ddlstate1.DataValueField = "StateCode";
            ddlstate1.DataBind();
            ddlstate1.Items.Insert(0, new ListItem("Select", "0"));

            //ddlBussinessType.DataSource = ds.Tables[1];
            //ddlBussinessType.DataTextField = "BussinesTypeDesc";
            //ddlBussinessType.DataValueField = "BussinessTypeId";
            //ddlBussinessType.DataBind();
            //ddlBussinessType.Items.Insert(0, new ListItem("Select", "0"));

            //ddlBussinessNature.DataSource = ds.Tables[2];
            //ddlBussinessNature.DataTextField = "BussinessNatureDesc";
            //ddlBussinessNature.DataValueField = "BussinessNatureId";
            //ddlBussinessNature.DataBind();
            //ddlBussinessNature.Items.Insert(0, new ListItem("Select", "0"));
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
    void ClearGStin()
    {
        txtGSTINNO.Text = "";
        txtGSTUSerName.Text = "";
        txtmobileno1.Text = "";
        ddlstate1.SelectedValue = "0";
        ddlcity1.SelectedValue = "0";
        txtDesignation1.Text = "";
        txtEmailId1.Text = "";
        rdbTDSNo.Checked = true;
        rdbISDNo.Checked = true;
        rdbTCSNo.Checked = true;
        txtaddress.Text = "";
        txtPinCode1.Text = "";
        txtAadhaarNo1.Text = "";
        txtAuthorisedSign.Text = "";
        txtTradeName.Text = "";
        txtDateOfReg.Text = "";
    }
    public void clear()
    {
        ddlState.SelectedIndex = 0;
        // ddlBussinessType.SelectedIndex = 0;
        // ddlBussinessNature.SelectedIndex = 0;
        txtOrganisationName.Text = "";
        txtName.Text = "";
        txtName.Text = "";
        txtMobileNo.Text = "";
        txtAlternateMobile.Text = "";
        // txtLandLineNo.Text = "";
        txtEmailId.Text = "";
        txtPanNo.Text = "";
        txtAadhaarNo.Text = "";
        txtAlternatePerson.Text = "";
        txtAlternateMobile.Text = "";
        txtEmailId.Text = "";
        // txtBankName.Text = "";
        //  txtBranchName.Text = "";
        // IFSCCode.Text = "";
        // txtAccountNo.Text = "";
        txtName.Text = "";
        txtOrganisationName.Text = "";
        /// txtCategory.Text = "";
        txtPanNo.Text = "";
        txtMobileNo.Text = "";
        txtEmailId.Text = "";
        TextBox1.Text = "";
        txtPinCode.Text = "";
        txtDesignation.Text = "";
        txtFullAddress.Text = "";
        txtCoDate.Text = "";
        txtResDateTo.Text = "";
        txtResDateFrom.Text = "";
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        clear();
        ClearGStin();
    }
    void FillCity(string StateCode, DropDownList ddlCity)
    {
        DataSet ds = CLSCommon.CallApiGet("api/ClientProfile/FillDdl?Ind=3&StateCode=" + StateCode);
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
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillCity(ddlState.SelectedValue.ToString(), ddlCity);
        // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "GetPopup()", true);
        ScriptManager.RegisterStartupScript(updatepanel1, this.GetType(), "MyAction", "GetPopup();", true);
        //WebControl myControlControl = (WebControl)Page.FindControl("ContentPlaceHolder1_ddlCity_chzn");
        //myControlControl.Focus();
    }
    protected void ddlstate1_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillCity(ddlstate1.SelectedValue.ToString(), ddlcity1);
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        if (ViewState["GSTINTable"] == null)
        {
            dt.Columns.Add("GSTNNO");
            dt.Columns.Add("TradeName");
            dt.Columns.Add("DateOfReg");
            dt.Columns.Add("ContactAddress");
            dt.Columns.Add("GSTUserName");
            dt.Columns.Add("AuthorisedSignetory");
            dt.Columns.Add("StateCode");
            dt.Columns.Add("CityCode");
            dt.Columns.Add("PinCode");
            dt.Columns.Add("Designation");
            dt.Columns.Add("ContactMobileNo");
            dt.Columns.Add("ContactEmailid");
            dt.Columns.Add("AadhaarNo");
            dt.Columns.Add("ISD");
            dt.Columns.Add("TCS");
            dt.Columns.Add("TDS");
        }
        else
        {
            dt = (DataTable)ViewState["GSTINTable"];
        }

        foreach(DataRow row in dt.Rows)
        {
            if(row["GSTNNO"].ToString()==txtGSTINNO.Text)
            {
                lbl.Text = "GSTIN Already Added Try Another.";
                txtGSTINNO.Focus();
                return;
            }
        }
        DataRow dr = dt.NewRow();
        dr["GSTNNO"] = txtGSTINNO.Text;
        dr["TradeName"] = txtTradeName.Text;
        dr["DateOfReg"] = txtDateOfReg.Text;
        dr["ContactAddress"] = txtaddress.Text;
        dr["GSTUserName"] = txtGSTUSerName.Text;
        dr["AuthorisedSignetory"] = txtAuthorisedSign.Text;
        dr["StateCode"] = ddlstate1.SelectedValue.ToString();
        dr["CityCode"] = ddlcity1.SelectedIndex < 0 ? "0" : ddlcity1.SelectedValue.ToString();
        dr["PinCode"] = txtPinCode1.Text;
        dr["Designation"] = txtDesignation1.Text;
        dr["ContactMobileNo"] = txtmobileno1.Text;
        dr["ContactEmailid"] = txtEmailId1.Text;
        dr["AadhaarNo"] = txtAadhaarNo1.Text;
        dr["ISD"] = rdbISDYes.Checked ? 1 : 2;
        dr["TCS"] = rdbTCSYes.Checked ? 1 : 2;
        dr["TDS"] = rdbTDSYes.Checked ? 1 : 2;
        dt.Rows.Add(dr);
        ViewState["GSTINTable"] = dt;
        grdGSTIN.DataSource = dt;
        grdGSTIN.DataBind();
        ClearGStin();
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        if (ViewState["GSTINTable"] == null)
        {
            lbl.Text = "Add Atleast One GSTIN";
            txtGSTINNO.Focus();
            return;
        }
        else
        {
            DataTable dtGSTN = (DataTable)ViewState["GSTINTable"];
            if (dtGSTN.Rows.Count == 0)
            {
                lbl.Text = "Add Atleast One GSTIN";
                txtGSTINNO.Focus();
                return;
            }
            else
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
                objpl.EmailId = txtEmailId.Text;
                objpl.ClientPANNo = txtPanNo.Text.ToUpper();
                objpl.AadhaarNo = txtAadhaarNo.Text;
                objpl.AlternateContactName = txtAlternatePerson.Text;
                objpl.AlternateMobileNo = txtAlternateMobile.Text;
                objpl.AlternateEmailid = txtEmailId.Text;
                objpl.DependentInd = 1;
                objpl.CACode = int.Parse(Session["CACode"].ToString());
                objpl.CACodeOdp = 0;
                objpl.ActiveInd = 1;
                objpl.LoginUserCode = 0;
                objpl.RefnoOtherSys = 0;
                objpl.FullAddress = txtFullAddress.Text;
                objpl.PinCode = txtPinCode.Text;
                objpl.RegNo = 0;
                objpl.AggrTurnOver = txtAggrTurnOver.Text.Trim() == "" ? "0" : txtAggrTurnOver.Text.Trim();
                objpl.AggrTurnOverAprJun = txtAggrTurnOverAprJun.Text.Trim() == "" ? "0" : txtAggrTurnOverAprJun.Text.Trim();
                objpl.CompAppInd = coyes.Checked ? 1 : 2;
                objpl.CompAppDate = coyes.Checked ? CLSCommon.DateFormat(txtCoDate.Text) : "";
                objpl.NonResiTaxInd = rpyes.Checked ? 1 : 2;
                objpl.NonResFromDate = rpyes.Checked ? CLSCommon.DateFormat(txtResDateFrom.Text) : "";
                objpl.NonResToDate = rpyes.Checked ? CLSCommon.DateFormat(txtResDateTo.Text) : "";

                DataTable dt = CLSCommon.CallApiPost("api/ClientProfile/SaveClientData/", objpl);
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["res"].ToString() == "1")
                        {
                            Session["ErrorMsg"] = dt.Rows[0]["ErrorMsg"].ToString();
                            int ClientCode = int.Parse(dt.Rows[0]["ClientCode"].ToString());
                            int ClientCodeOdp = int.Parse(dt.Rows[0]["ClientCodeOdp"].ToString());

                            foreach (DataRow dr in dtGSTN.Rows)
                            {
                                PL_InsertClientGSTIN objplInsertGSTIN = new PL_InsertClientGSTIN();
                                objplInsertGSTIN.Ind = 1;
                                objplInsertGSTIN.ClientCode = ClientCode;
                                objplInsertGSTIN.ClientCodeOdp = ClientCodeOdp;
                                objplInsertGSTIN.OdpGSTNo = 0;
                                objplInsertGSTIN.GSTNNO = dr["GSTNNO"].ToString();
                                objplInsertGSTIN.PANNO = txtPanNo.Text;
                                objplInsertGSTIN.TradeName = dr["TradeName"].ToString();
                                objplInsertGSTIN.DateOfReg = dr["DateOfReg"].ToString() == "" ? "" : CLSCommon.DateFormat(dr["DateOfReg"].ToString());
                                objplInsertGSTIN.ContactAddress = dr["ContactAddress"].ToString();
                                objplInsertGSTIN.StateCode = dr["StateCode"].ToString();
                                objplInsertGSTIN.ContactStateCode = int.Parse(dr["StateCode"].ToString());
                                objplInsertGSTIN.ContactCityCode = int.Parse(dr["CityCode"].ToString());
                                objplInsertGSTIN.AuthorisedSignetory = dr["AuthorisedSignetory"].ToString();
                                objplInsertGSTIN.ClientUserID = dr["GSTUserName"].ToString();
                                objplInsertGSTIN.Designation = dr["Designation"].ToString();
                                objplInsertGSTIN.ContactMobileNo = dr["ContactMobileNo"].ToString();
                                objplInsertGSTIN.ContactEmailid = dr["ContactEmailid"].ToString();
                                objplInsertGSTIN.AadhaarNo = dr["AadhaarNo"].ToString();
                                objplInsertGSTIN.RegisteredAsISD = int.Parse(dr["ISD"].ToString());
                                objplInsertGSTIN.RegisteredAsTDS = int.Parse(dr["TDS"].ToString());
                                objplInsertGSTIN.WhetherEcommerceOperator = int.Parse(dr["TCS"].ToString());
                                objplInsertGSTIN.Priority = 1;
                                objplInsertGSTIN.ContactPersonName = txtName.Text; // dr["TradeName"].ToString();
                                objplInsertGSTIN.ActiveInd = 1;
                                objplInsertGSTIN.Allotmentind = 0;
                                objplInsertGSTIN.AllotmentCACode = int.Parse(Session["CaCode"].ToString());
                                objplInsertGSTIN.AllotmentCACodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
                                objplInsertGSTIN.CompositeInd = coyes.Checked ? 1 : 2;
                                objplInsertGSTIN.NRIInd = rpyes.Checked ? 1 : 2;
                                DataTable dtRes = CLSCommon.CallApiPost("api/ClientProfile/SaveClientGSTIN/", objplInsertGSTIN);
                            }
                            clear();
                            Response.Redirect("frmSubmitted.aspx");
                        }else
                        {
                            lblErrorMsg.Text = dt.Rows[0]["Message"].ToString();
                        }
                    }
                }

            }
        }
    }
    protected void grdGSTIN_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable GSTINTable = (DataTable)ViewState["GSTINTable"];
            GSTINTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["GSTINTable"] = GSTINTable;
            grdGSTIN.DataSource = GSTINTable;
            grdGSTIN.DataBind();
        }
    }
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        clear();
    }
    protected void btnExit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CA Admin/frmHomeAdminCA.aspx");
    }
}