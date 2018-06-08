using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGSTRform3B : System.Web.UI.Page
{
    PL_APILog objpl;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
           
        }
    }
    protected void btnConnectTOGSTIN_Click(object sender, EventArgs e)
    {

        objpl = new PL_APILog();
        objpl.Ind = 1;
        objpl.ActivityId = 6;
        objpl.ActivityDesc = "GSTR3B SAVE";
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        DataTable dt = CLSCommon.CallApiPost("api/OTPRequest/GenerateOTP", objpl);
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                divOTP.Visible = true;
                lblOTPMessage.Text = "OTP Has Been Sent To your Mobile Number And EmailId Registered With GSTN..";
                hfLogId.Value = dt.Rows[0]["LogId"].ToString();

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
                    divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success");
                    divSaveTOGSTN.Visible = true;

                }
                else
                {
                    lblSuccess.InnerText = dt.Rows[0]["Message"].ToString();
                    divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-danger");
                }
            }
            else
            {
                lblSuccess.InnerText = "Error Occured In verifying OTP Try Again.";
                divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-danger");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_APILog();
        objpl.Ind = 5;
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        objpl.RecordNo = 3;
        objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
        DataTable dt = CLSCommon.CallApiPost("api/ctrlGSTR3B/SaveGSTR3B", objpl);
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                lblGSTR3B.Text = "Data Saved To GSTIN Refrence ID " + dt.Rows[0]["referenceID"].ToString();
            }
            else
            {
                lblGSTR3B.Text = dt.Rows[0]["Error"].ToString();
            }
        }
    }
}