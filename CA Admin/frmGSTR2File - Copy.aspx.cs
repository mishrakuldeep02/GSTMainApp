using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGSTR2File : System.Web.UI.Page
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
      //  DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_APILog();
        objpl.Ind = 1;
        objpl.ActivityId = 11;
        objpl.ActivityDesc = "GSTR2 Save";
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
                    divSaveTOGSTN.Visible = true;

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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        divOTPSuccess.Style.Add("display", "none");
       // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_APILog();
        objpl.Ind = 7;
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        objpl.RecordNo = 3;
        objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
        tblInvoice.Visible = false;
        divSummary.Visible = false;
        divSubmit.Visible = false;
        lblUploadStatus.Text = "";
        DataTable dt = CLSCommon.CallApiPost("api/GSTR2File/SaveGSTR2", objpl);
        if (dt != null)
        {
            lblTotalInvoices.Text = dt.Rows[0]["TotalInvoice"].ToString();
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                divSubmit.Visible = true;
                divSummary.Visible = true;
               // tblInvoice.Visible = true;
                btnView.Enabled = false;
                lblUploadStatus.Text = "Prcoess";// +dt.Rows[0]["referenceID"].ToString();
                lblUploadStatus.CssClass = "text-success";
                lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
                lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString())).ToString();
                lblErrorInvoice.Text = "0";
            }
            else if (dt.Rows[0]["res"].ToString() == "2")
            {
                divSubmit.Visible = true;
                divSummary.Visible = true;
                btnView.Enabled = true;
                //lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString()) - int.Parse(dt.Rows[0]["ErrorInvoice"].ToString())).ToString();
                //lblErrorInvoice.Text = dt.Rows[0]["ErrorInvoice"].ToString();
                lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
               // tblInvoice.Visible = true;
                lblUploadStatus.Text = "Error";// +dt.Rows[0]["referenceID"].ToString();
                lblUploadStatus.CssClass = "text-danger";
                //grd.DataSource = dt;
                //grd.DataBind();
            }
            else if (dt.Rows[0]["res"].ToString() == "3")
            {
                lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
                lblUploadStatus.Text = "In Process";
                lblUploadStatus.CssClass = "text-danger";
                btnRefresh.Visible = true;
            }
            else
            {
                lblUploadStatus.Text = dt.Rows[0]["Error"].ToString();
            }
        }
    }
    protected void btnGetSummary_Click(object sender, EventArgs e)
    {
        divOTPSuccess.Style.Add("display", "none");

       // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_APILog();
        objpl.Ind = 6;
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        objpl.RecordNo = 3;
        objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
        DataTable dt = CLSCommon.CallApiPost("api/GSTR2File/GetSummary", objpl);
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                txtSummary.Text = dt.Rows[0]["Summary"].ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#viewsubmit').modal('show');});", true);
            }
            else
            {
                lblSummMessage.Text = dt.Rows[0]["Error"].ToString();
            }
        }
        else
        {
            lblSummMessage.Text = "Some Error Occured try Again.";
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#file').modal('show');});", true);
    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        divOTPSuccess.Style.Add("display", "none");
       // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_APILog();
        objpl.Ind = 6;
        objpl.ReferenceId = lblreferenceId.Text;
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        objpl.RecordNo = 3;
        objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
        tblInvoice.Visible = false;
        lblUploadStatus.Text = "";
        btnRefresh.Visible = false;
        DataTable dt = CLSCommon.CallApiPost("api/GSTR2File/TrackStatus", objpl);
        if (dt != null)
        {
            lblTotalInvoices.Text = dt.Rows[0]["TotalInvoice"].ToString();
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                divSubmit.Visible = true;
                divSummary.Visible = true;
                // tblInvoice.Visible = true;
                btnView.Enabled = false;
                lblUploadStatus.Text = "Prcoess";// +dt.Rows[0]["referenceID"].ToString();
                lblUploadStatus.CssClass = "text-success";
                lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
                lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString())).ToString();
                lblErrorInvoice.Text = "0";
            }
            else if (dt.Rows[0]["res"].ToString() == "2")
            {
                divSubmit.Visible = true;
                divSummary.Visible = true;
                btnView.Enabled = true;
                //lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString()) - int.Parse(dt.Rows[0]["ErrorInvoice"].ToString())).ToString();
                //lblErrorInvoice.Text = dt.Rows[0]["ErrorInvoice"].ToString();
                lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
                // tblInvoice.Visible = true;
                lblUploadStatus.Text = "Error";// +dt.Rows[0]["referenceID"].ToString();
                lblUploadStatus.CssClass = "text-danger";
                //grd.DataSource = dt;
                //grd.DataBind();
            }
            else if (dt.Rows[0]["res"].ToString() == "3")
            {
                lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
                lblUploadStatus.Text = "In Process";
                lblUploadStatus.CssClass = "text-danger";
                btnRefresh.Visible = true;
            }
            else
            {
                lblUploadStatus.Text = dt.Rows[0]["Error"].ToString();
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        divOTPSuccess.Style.Add("display", "none");
       // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        objpl = new PL_APILog();
        objpl.Ind = 1;
        objpl.ReferenceId = lblreferenceId.Text;
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        objpl.RecordNo = 3;
        objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
        tblInvoice.Visible = false;
        lblUploadStatus.Text = "";
        btnRefresh.Visible = false;
        DataTable dt = CLSCommon.CallApiPost("api/GSTR2File/SubmitGSTR1", objpl);
        if (dt != null)
        {
            lblSubmitMsg.Text = "Data Submitted Successfully.";
        }
    }
}