﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmRegisterDSCProd : System.Web.UI.Page
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
                //lblRemaining.Visible = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){RemainingTime(" + dt.Rows[0]["Remaining"].ToString() + ")});", true);
                // lblRemaining.Text = "  Remaining Time : " + dt.Rows[0]["Remaining"].ToString();
                divOTP.Enabled = false;
                divRegisterDSC.Visible = true;
                divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");
               // divSaveTOGSTN.Visible = true;
               // pnlFile.Visible = true;
                //divSubmit.Visible = true;
                //divSummary.Visible = true;
                divOTP.Visible = true;
                divOTPSuccess.Style.Add("display", "block");
               // divSaveTOGSTN.Visible = true;
                btnConnectTOGSTIN.Attributes.Add("disabled", "disabled");// = false;
            }
            else
            {
                divOTPSuccess.Style.Add("display", "none");
                lblSuccess.InnerText = "";
                divOTP.Enabled = true;
                divRegisterDSC.Visible = false;
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
       // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_APILog();
        objpl.Ind = 1;
        objpl.ActivityId = 1;
        objpl.ActivityDesc = "Register DSC";
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

            DataTable dt = CLSCommon.CallApiPost("api/OTPRequest/VerifyOTP", objpl);
            if (dt != null)
            {

                if (dt.Rows[0]["res"].ToString() == "1")
                {
                    lblSuccess.InnerText = "Verified Successfully.";
                    divOTP.Enabled = false;
                    divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");
                    divRegisterDSC.Visible = true;
                    CheckSession();

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
    PL_DSCRegByTrueCopy objdscpl;
    protected void btnUploadHasg_Click(object sender, EventArgs e)
    {
      
          if (hfLogId.Value.ToString() == "")
         {
             return;
         }
         else
         {
             objdscpl = new PL_DSCRegByTrueCopy();
             objdscpl.Ind = 1;
             objdscpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
             objdscpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
             objdscpl.CaCode = int.Parse(Session["CaCode"].ToString());
             objdscpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
             objdscpl.GSTNNO = Session["ClientGSTNNo"].ToString();
             objdscpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
             DataTable dt = CLSCommon.CallApiPost("api/DSCRegByTrueCopy/UploadHash", objdscpl);
             if (dt != null)
             {

                 if (dt.Rows[0]["res"].ToString() == "1")
                 {
                     lblUploadStatus.Text= "Hash Uploaded Successfully.";
                     lblUploadStatus.CssClass = "text-success";
                     divOTP.Enabled = false;
                     divRegisterDSC.Visible = true;

                 }
                 else
                 {
                     lblUploadStatus.Text = dt.Rows[0]["Error"].ToString();
                     lblUploadStatus.CssClass = "text-danger";
                 }
             }
             else
             {
                 lblUploadStatus.Text = "Error Occured In Hash Uploading.";
                 lblUploadStatus.CssClass = "text-danger";
             }
         }
    }
    protected void btnRegisterDSC_Click(object sender, EventArgs e)
    {
       
         if (hfLogId.Value.ToString() == "")
        {
            return;
        }
        else
        {
            objdscpl = new PL_DSCRegByTrueCopy();
            objdscpl.Ind = 3;
            objdscpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objdscpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objdscpl.CaCode = int.Parse(Session["CaCode"].ToString());
            objdscpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objdscpl.GSTNNO = Session["ClientGSTNNo"].ToString();
            objdscpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
            //objpl.OTP = txtOtp.Text;
            DataTable dt = CLSCommon.CallApiPost("api/DSCRegByTrueCopy/RegisterDSC", objdscpl);
            if (dt != null)
            {

                if (dt.Rows[0]["res"].ToString() == "1")
                {
                    lblUploadStatus.Text = "DSC Regitration Successfully With GSTN.";
                    lblUploadStatus.CssClass = "text-success";
                    divOTP.Enabled = false;
                   // divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");
                    divRegisterDSC.Visible = true;

                }
                else
                {
                    lblUploadStatus.CssClass = "text-danger";

                    if (dt.Rows[0]["Error"].ToString() == "PENDING")
                    {
                        lblUploadStatus.Text = "Uploaded Hash is pending for Approval, Please Approve Uploaded Hash.";
                    }else
                    {
                        lblUploadStatus.Text = dt.Rows[0]["Error"].ToString();

                    }
                    //divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-danger denger");
                }
            }
            else
            {
                lblUploadStatus.Text = "Error Occured In Registering DSC.";
                lblUploadStatus.CssClass = "text-danger";
                //divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-danger denger");
            }
        }
    }
}