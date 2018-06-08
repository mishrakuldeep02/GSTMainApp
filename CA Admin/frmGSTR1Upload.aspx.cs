using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGSTR1Upload : System.Web.UI.Page
{
    PL_UploadGSTR1 objplInsert;
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.ClientCheckSession();
        if(!IsPostBack)
        {
           // fillddl();
        }
        
    }
    protected void btnGenerateOtp_Click(object sender, EventArgs e)
    {
        try
        {
           // DropDownList ddlReturnPeriod = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            objplInsert = new PL_UploadGSTR1();
            objplInsert.TaxPayerCode = int.Parse(Session["ClientCode"].ToString());
            objplInsert.TaxPayerCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objplInsert.GSTIN = Session["ClientGSTNNO"].ToString();
            objplInsert.ReturnPeriod = Session["MonthYrCode"].ToString();
            objplInsert.ClientUserId = Session["ClientUserId"].ToString();
            JObject ObjRes = CLSCommon.CallApiPostJson("api/UploadGSTR1/GetOTP", objplInsert);
            if (ObjRes != null)
            {

                if (ObjRes.GetValue("status_cd").ToString() == "1")
                {
                    ViewState["ActivityId"] = ObjRes.GetValue("ActivityId").ToString();
                    lblmsg.CssClass = "text text-success";
                    lblmsg.Text = "Otp Sent Successfully.";
                    txtOtp.Attributes.Remove("disabled");
                    btnVerify.Attributes.Remove("disabled");
                    btnGenerateOtp.Attributes.Add("disabled", "disabled");
                }
                else
                {
                    lblmsg.CssClass = "text text-danger";
                    lblmsg.Text = ObjRes.GetValue("error").ToString();
                    txtOtp.Attributes.Add("disabled", "disabled");
                    btnVerify.Attributes.Add("disabled", "disabled");
                }

            }
            else
            {
                lblmsg.CssClass = "text text-danger";
                lblmsg.Text = "Error Occured in send OTP.";
                txtOtp.Attributes.Add("disabled", "disabled");
                btnVerify.Attributes.Add("disabled", "disabled");
            }
        }
        catch(Exception ex) 
        {
            lblVerifyMsg.CssClass = "text text-danger";
            lblVerifyMsg.Text = ex.Message;
        }
    }
    
    protected void btnVerify_Click(object sender, EventArgs e)
    {
        try
        {
            txtOtp.Attributes.Remove("disabled");
            btnVerify.Attributes.Remove("disabled");
            txtOtp.Focus();
            if (txtOtp.Text.Trim() == "")
            {
                lblVerifyMsg.CssClass = "text-danger";
                lblVerifyMsg.Text = "Enter OTP.";
                return;
            }
            else
            {
                //DropDownList ddlReturnPeriod = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
                objplInsert = new PL_UploadGSTR1();
                objplInsert.TaxPayerCode = int.Parse(Session["ClientCode"].ToString());
                objplInsert.TaxPayerCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
                objplInsert.GSTIN = Session["ClientGSTNNO"].ToString();
                objplInsert.ReturnPeriod = Session["MonthYrCode"].ToString();
                objplInsert.ClientUserId = Session["ClientUserId"].ToString();
                objplInsert.OTP = txtOtp.Text;
                objplInsert.ActivityId = ViewState["ActivityId"].ToString();
                JObject ObjRes = CLSCommon.CallApiPostJson("api/UploadGSTR1/AuthOtp", objplInsert);
                if (ObjRes != null)
                {
                    if (ObjRes.GetValue("status_cd").ToString() == "1")
                    {
                        lblVerifyMsg.CssClass = "text-success";
                        lblVerifyMsg.Text = "Otp Verified Successfully.";
                        txtOtp.Attributes.Add("disabled", "disabled");
                        btnVerify.Attributes.Add("disabled", "disabled");
                    }
                    else
                    {
                        lblVerifyMsg.CssClass = "text text-danger";
                        lblVerifyMsg.Text = ObjRes.GetValue("error").ToString();
                        txtOtp.Attributes.Remove("disabled");
                        btnVerify.Attributes.Remove("disabled");
                    }

                }
                else
                {
                    lblVerifyMsg.CssClass = "text text-danger";
                    lblVerifyMsg.Text = "Error Occured In Verifying OTP";//ObjRes.GetValue("error").ToString();
                    txtOtp.Attributes.Remove("disabled");
                    btnVerify.Attributes.Remove("disabled");
                }
            }
        }
        catch(Exception ex)
        {
            lblVerifyMsg.CssClass = "text text-danger";
            lblVerifyMsg.Text = ex.Message;
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtOtp.Attributes.Add("disabled", "disabled");
        btnVerify.Attributes.Add("disabled", "disabled");
        lblVerifyMsg.Text = "";
        lblmsg.Text = "";
        txtOtp.Text = "";
        btnGenerateOtp.Attributes.Remove("disabled");
    }
}