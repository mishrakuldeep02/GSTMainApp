using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGetGSTR2A : System.Web.UI.Page
{
    PL_APILog objpl;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {

          //  GetGridData();
            
         } CheckSession();
    }
    void clear()
    {
        GridUniqeGstin.DataSource = null;
        GridUniqeGstin.DataBind();
        GridGroupFilter.DataSource = null;
        GridGroupFilter.DataBind();
        grdGSTR2AData.DataSource = null;
        grdGSTR2AData.DataBind();
        ViewState["AllData"] = null;
        PnlAlldata.Visible = false;
    }
    void CheckSession()
    {
        DataTable dt = CLSCommon.CallApiGetdt("api/UserSession/CheckUserSession?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNo"].ToString());
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                hfLogId.Value = dt.Rows[0]["LogId"].ToString();
                lblSuccess.InnerText = "Status : Connected.  ";// +System.Environment.NewLine + "  Remaining Time : " + dt.Rows[0]["Remaining"].ToString();
                //  lblRemaining.Visible = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){RemainingTime(" + dt.Rows[0]["Remaining"].ToString() + ")});", true);
                // lblRemaining.Text = "  Remaining Time : " + dt.Rows[0]["Remaining"].ToString();
                divOTP.Enabled = false;
                divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");
                // divSaveTOGSTN.Visible = true;
                // pnlFile.Visible = true;
                //divSubmit.Visible = true;
                //divSummary.Visible = true;
                divOTP.Visible = true;
                divOTPSuccess.Style.Add("display", "block");
                divGetLedger.Visible = true;
                //  divSaveTOGSTN.Visible = true;
                btnConnectTOGSTIN.Attributes.Add("disabled", "disabled");// = false;
            }
            else
            {
                divOTPSuccess.Style.Add("display", "none");
                lblSuccess.InnerText = "";
                divOTP.Enabled = true;
                divGetLedger.Visible = false;
                divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");
                //divSaveTOGSTN.Visible = false;
                // pnlFile.Visible = false;
                // divSubmit.Visible = false;
                //  divSummary.Visible = false;
                //  divSaveTOGSTN.Visible = false;
                divOTP.Visible = false;
                btnConnectTOGSTIN.Attributes.Remove("disabled");// btnConnectTOGSTIN.Enabled = true;
            }
        }
    }
    protected void btnConnectTOGSTIN_Click(object sender, EventArgs e)
    {
      //  DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_APILog();
        objpl.Ind = 1;
        objpl.ActivityId = 1;
        objpl.ActivityDesc = "GSTR1 SAVE";
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
        DataTable dt = CLSCommon.CallApiPost("api/OTPRequest/GenerateOTP", objpl);
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                divOTP.Visible = true;
                lblOTPMessage.Text = "OTP Has Been Sent To your Mobile Number And EmailId Registered With GSTN..";
                hfLogId.Value = dt.Rows[0]["LogId"].ToString();

            }
            else if (dt.Rows[0]["res"].ToString() == "0")
            {
                lblOTPMessage.Text = dt.Rows[0]["response"].ToString();
            }
            else
            {
                lblOTPMessage.Text = "Some Error Occured In Process Please Try Again..";
            }
        }
        else
        {
            lblOTPMessage.Text = "Some Error Occured In Process Please Try Again..";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#OTPModal').modal('show');});", true);
    }
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        if (txtOtp.Text.Trim() == "")
        {
            return;
        }
        else if (hfLogId.Value.ToString() == "")
        {
            return;
        }
        else
        {
            objpl = new PL_APILog();
            objpl.Ind = 3;
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.CaCode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
            objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
            objpl.OTP = txtOtp.Text;

            divOTPSuccess.Attributes.Remove("class");
            divOTPSuccess.Style.Add("display", "block");
            DataTable dt = CLSCommon.CallApiPost("api/OTPRequest/VerifyOTP", objpl);
            if (dt != null)
            {

                if (dt.Rows[0]["res"].ToString() == "1")
                {
                    lblSuccess.InnerText = "Verified Successfully.";
                    divOTP.Enabled = false;
                    divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");
                    divGetLedger.Visible = true;

                }
                else
                {
                    lblSuccess.InnerText = dt.Rows[0]["Message"].ToString();
                    divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-danger denger");
                }
            }
            else
            {
                lblSuccess.InnerText = "Error Occured In verifying OTP Try Again.";
                divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-danger denger");
            }
        }
    }
    PL_GSTR2A objGSTR2A;
    protected void btnGetB2B_Click(object sender, EventArgs e)
    {
        divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");

        objGSTR2A = new PL_GSTR2A();

        objGSTR2A.Ind = 1;
        objGSTR2A.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objGSTR2A.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objGSTR2A.CaCode = int.Parse(Session["CaCode"].ToString());
        objGSTR2A.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objGSTR2A.GSTNNO = Session["ClientGSTNNo"].ToString();
        objGSTR2A.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        objGSTR2A.MonthCD = Convert.ToInt32(Session["MonthYrCode"].ToString());
       
        divOTPSuccess.Style.Add("display", "block");
        DataTable dt = CLSCommon.CallApiPost("api/GSTR2A/GetGSTR2AData", objGSTR2A);
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                lblGSTR2AStatus.CssClass = "text-success";
                DataTable dtGroupFilte = new DataTable();
                ViewState["AllData"] = dt;
                if(rbtn_All.Checked==true)
                {
                    pnlGroupFilter.Visible = false;
                    pnlUniqe.Visible = false;
                    PnlAlldata.Visible = true;
                    grdGSTR2AData.DataSource = dt;
                    grdGSTR2AData.DataBind();
               
                }else
                {
                    PnlAlldata.Visible = false;
                    pnlGroupFilter.Visible = true;
                    pnlUniqe.Visible = false;

                }
              
                if(dt.Rows.Count>0)
                {
                    dtGroupFilte = dt.DefaultView.ToTable(true, "PurchGSTIN");

                    GridGroupFilter.DataSource = dtGroupFilte;
                    GridGroupFilter.DataBind();
                }
              //  ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowSummModal();", true);
               // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#GSTR2AModal').modal('show');", true);
               // lblGSTR2AStatus.Text = dt.Rows[0]["data"].ToString();
            }
            else
            {
                lblGSTR2AStatus.CssClass = "text-danger";
                lblGSTR2AStatus.Text = dt.Rows[0]["Error"].ToString();
            }
        }
    }
    private void GetGridData()
    {
        DataTable dtGroupFilte = new DataTable();
        if (ViewState["AllData"] != null)
        {
            dtGroupFilte = (DataTable)ViewState["AllData"];

            if (rbtn_All.Checked == true)
            {
                pnlGroupFilter.Visible = false;
                pnlUniqe.Visible = false;
                PnlAlldata.Visible = true;
                grdGSTR2AData.DataSource = dtGroupFilte;
                grdGSTR2AData.DataBind();

            }
            else
            {
                PnlAlldata.Visible = false;
                pnlGroupFilter.Visible = true;
                pnlUniqe.Visible = false;

            }

            if (dtGroupFilte.Rows.Count > 0)
            {
                dtGroupFilte = dtGroupFilte.DefaultView.ToTable(true, "PurchGSTIN");

                GridGroupFilter.DataSource = dtGroupFilte;
                GridGroupFilter.DataBind();
            }
        }
    }
    protected void rbtn_SupplierWise_CheckedChanged(object sender, EventArgs e)
    {
        clear();
        
    }
    protected void rbtn_All_CheckedChanged(object sender, EventArgs e)
    {
        clear();
    }
    protected void GridGroupFilter_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="GSTINDetail")
        {
            pnlUniqe.Visible = true;
            string gstin = e.CommandArgument.ToString();
            DataTable tblFiltered = new DataTable();
            DataTable dtall = new DataTable();
            dtall = (DataTable)ViewState["AllData"];
            tblFiltered = dtall.AsEnumerable().Where(r => r.Field<string>("PurchGSTIN") == gstin)
                                   .CopyToDataTable();   // Filter(unique) group  Zone wise 
            GridUniqeGstin.DataSource = tblFiltered;
            GridUniqeGstin.DataBind();
        }
    }
 
    protected void GridGroupFilter_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridGroupFilter.PageIndex = e.NewPageIndex;
        GridGroupFilter.DataBind();
        GetGridData();
    }
}