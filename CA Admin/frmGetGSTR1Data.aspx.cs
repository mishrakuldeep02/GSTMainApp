using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGetGSTR1Data : System.Web.UI.Page
{
    PL_APILog objpl;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
          
        } CheckSession();
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
     //   DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
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
    PL_GetGSTR1Data objplGSTR1;
    protected void btnGSTR1Data_Click(object sender, EventArgs e)
    {
        divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");

        //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objplGSTR1 = new PL_GetGSTR1Data();

        objplGSTR1.Ind = 1;
        objplGSTR1.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objplGSTR1.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        // objPLLedger.CaCode = int.Parse(Session["CaCode"].ToString());
        // objPLLedger.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objplGSTR1.GSTNNO = Session["ClientGSTNNo"].ToString();
        objplGSTR1.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        // objPLLedger.OTP = txtOtp.Text;
        objplGSTR1.MonthCD = Convert.ToInt32(Session["MonthYrCode"].ToString());
       // objplGSTR1.FromDate = "01-07-2017";
        //objplGSTR1.ToDate = "30-07-2017";
        // divOTPSuccess.Attributes.Remove("class");
        divOTPSuccess.Style.Add("display", "block");
        DataTable dt = CLSCommon.CallApiPost("api/GetGSTR1Data/" + ddlGstr1Type.SelectedValue.ToString(), objplGSTR1);
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                lblLedgerStatus.CssClass = "text-success";
                lblLedgerStatus.Text = dt.Rows[0]["data"].ToString();
            }
            else
            {
                lblLedgerStatus.CssClass = "text-danger";
                lblLedgerStatus.Text = dt.Rows[0]["Error"].ToString();
            }
        }
    }
}