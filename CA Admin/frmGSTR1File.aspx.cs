using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGSTR1File : System.Web.UI.Page
{
    PL_APILog objpl;
    PL_GetSignedData objplSigned;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
          
            
        }
        CheckSession();
    }
    void CheckSession()
    {
        DataTable dt = CLSCommon.CallApiGetdt("api/UserSession/CheckUserSession?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNo"].ToString());
        if(dt!=null)
        {
            if(dt.Rows[0]["res"].ToString()=="1")
            {
                hfLogId.Value = dt.Rows[0]["LogId"].ToString();
                lblSuccess.InnerText = "Status : Connected.  ";// +System.Environment.NewLine + "  Remaining Time : " + dt.Rows[0]["Remaining"].ToString();
                //lblRemaining.Visible = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){RemainingTime(" + dt.Rows[0]["Remaining"].ToString() + ")});", true);
               // lblRemaining.Text = "  Remaining Time : " + dt.Rows[0]["Remaining"].ToString();
                divOTP.Enabled = false;
                divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");
                divSaveTOGSTN.Visible = true;
                pnlFile.Visible = true;
                divSubmit.Visible = true;
                divSummary.Visible = true;
                divOTP.Visible = true;
                divOTPSuccess.Style.Add("display", "block");
                divSaveTOGSTN.Visible = true;
                btnConnectTOGSTIN.Attributes.Add("disabled", "disabled");// = false;
            }
            else
            {
                divOTPSuccess.Style.Add("display", "none");
                lblSuccess.InnerText = "";
                divOTP.Enabled = true;
                divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-success success");
                divSaveTOGSTN.Visible = false;
                pnlFile.Visible = false;
                divSubmit.Visible = false;
                divSummary.Visible = false;
                divSaveTOGSTN.Visible = false;
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
                    divSaveTOGSTN.Visible = true;
                    pnlFile.Visible = true;
                    divSubmit.Visible = true;
                    divSummary.Visible = true;
                    CheckSession();

                }
                else
                {
                    lblSuccess.InnerText = dt.Rows[0]["Message"].ToString();
                    divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-danger denger");
                    divOTP.Visible = true;
                    divOTP.Enabled = true;
                }
            }
            else
            {
                lblSuccess.InnerText = "Error Occured In verifying OTP Try Again.";
                divOTPSuccess.Attributes.Add("class", "col-sm-12 col-xs-12 alert alert-danger denger");
                divOTP.Visible = true;
                divOTP.Enabled = true;
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
       // divOTPSuccess.Style.Add("display", "none");
     //   DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
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
        tblInvoice.Visible = false;
        divSummary.Visible = false;
        divSubmit.Visible = false;
        lblUploadStatus.Text = "";
        DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/SaveGSTR1", objpl);
        if (dt != null)
        {
            lblTotalInvoices.Text = dt.Rows[0]["TotalInvoice"].ToString();
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                divSubmit.Visible = true;
                divSummary.Visible = true;
                tblInvoice.Visible = true;
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
                lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString()) - int.Parse(dt.Rows[0]["ErrorInvoice"].ToString())).ToString();
                lblErrorInvoice.Text = dt.Rows[0]["ErrorInvoice"].ToString();
                lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
                tblInvoice.Visible = true;
                lblUploadStatus.Text = "Error";// +dt.Rows[0]["referenceID"].ToString();
                lblUploadStatus.CssClass = "text-danger";
                grd.DataSource = dt;
                grd.DataBind();
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
        GridGSTR1Summ.DataSource = null;
        GridGSTR1Summ.DataBind();
      //  divOTPSuccess.Style.Add("display", "none");

     //   DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
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
        DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/GetSummary", objpl);
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
               // txtSummary.Text = dt.Rows[0]["Summary"].ToString();
               ViewState["Summary"]= dt.Rows[0]["Summary"].ToString();
                ClsGSTR1Summ objGstr1summ = JsonConvert.DeserializeObject<ClsGSTR1Summ>(dt.Rows[0]["Summary"].ToString());
               
                GridGSTR1Summ.DataSource = objGstr1summ.sec_sum;
                GridGSTR1Summ.DataBind();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowSummModal();", true);
              //  Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ShowSummModal();", true);
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
       // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#file').modal('show');});", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(document).ready(function(){$('#file').modal('show');});", true);
    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
      //  divOTPSuccess.Style.Add("display", "none");
      //  DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
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
        DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/TrackStatus", objpl);
        if (dt != null)
        {
            lblTotalInvoices.Text = dt.Rows[0]["TotalInvoice"].ToString();
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                divSubmit.Visible = true;
                divSummary.Visible = true;
                tblInvoice.Visible = true;
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
                lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString()) - int.Parse(dt.Rows[0]["ErrorInvoice"].ToString())).ToString();
                lblErrorInvoice.Text = dt.Rows[0]["ErrorInvoice"].ToString();
                lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
                tblInvoice.Visible = true;
                lblUploadStatus.Text = "Error";// +dt.Rows[0]["referenceID"].ToString();
                lblUploadStatus.CssClass = "text-danger";
                grd.DataSource = dt;
                grd.DataBind();
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
      //  divOTPSuccess.Style.Add("display", "none");
        //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
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
        DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/SubmitGSTR1", objpl);
        if (dt != null)
        {
            //if (dt.Rows[0]["res"].ToString() == "1")
            //{
                lblSubmitMsg.CssClass = "text-success";
                lblSubmitMsg.Text = "Data Submitted Successfully.";
            //}
            //else
            //{
            //    lblSubmitMsg.CssClass = "text-danger";
            //    JObject obj = JObject.Parse(dt.Rows[0]["Error"].ToString());
            //    lblSubmitMsg.Text = obj.GetValue("message").ToString();
            //}
        }
    }
    protected void btnFiled_Click(object sender, EventArgs e)
    {
        if (ViewState["Summary"] != null)
        {
            //string Base64Summ = Convert.ToBase64String(Encoding.ASCII.GetBytes(ViewState["Summary"].ToString()));
            //string SignData = ClsSignUtil.Sign(Base64Summ);
           
            // divOTPSuccess.Style.Add("display", "none");

          //  DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            objpl = new PL_APILog();
            //objpl.Ind = 6;
            //objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            //objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            //objpl.CaCode = int.Parse(Session["CaCode"].ToString());
            //objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            //objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
            //objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
            //objpl.RecordNo = 3;
            //objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
           
            //DataTable dtSumm = CLSCommon.CallApiPost("api/GSTR1File/GetSummary", objpl);
            //if (dtSumm != null)
            //{
            //    if (dtSumm.Rows[0]["res"].ToString() == "1")
            //    {
            //        objpl.SummaryData = dtSumm.Rows[0]["Summary"].ToString();
            //        byte[] encodeJson = UTF8Encoding.UTF8.GetBytes(objpl.SummaryData.Trim());
            //        string base64Payload = Convert.ToBase64String(encodeJson);
            //        objpl.SignedData = ClsSignUtil.Sign(base64Payload.Trim());

            divOTPSuccess.Style.Add("display", "none");
            // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            // objpl = new PL_APILog();
            objpl.Ind = 9;
            objpl.ReferenceId = lblreferenceId.Text;
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.CaCode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
            objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
            objpl.RecordNo = 3;
            objpl.SummaryData = ViewState["Summary"].ToString();
        //   objpl.SignedData = SignData;
            objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
            tblInvoice.Visible = false;
            lblUploadStatus.Text = "";
            btnRefresh.Visible = false;
            DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/FileGSTR1", objpl);
            if (dt != null)
            {
                if (dt.Rows[0]["res"].ToString() == "1")
                {
                    lblFileMessage.CssClass = "text-success";
                    lblFileMessage.Text = "Data Filed Successfully.";
                    lblAckNo.Text = "Acknowledgement No. :- " + dt.Rows[0]["ack_num"].ToString();
                }
                else
                {
                    lblFileMessage.CssClass = "text-danger";
                    JObject obj = JObject.Parse(dt.Rows[0]["Error"].ToString());
                    lblFileMessage.Text = obj.GetValue("message").ToString();
                }
                //  }
                //}
            }
        }else
        {
            lblFileMessage.CssClass = "text-danger";
            lblFileMessage.Text ="Upload Summary First.";
        }
    }
    protected void btnUploadSummary_Click(object sender, EventArgs e)
    {
        
            objpl = new PL_APILog();
          //  DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");

            objpl.Ind = 1;
            //  objplSigned.ReferenceId = lblreferenceId.Text;
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.CaCode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
            objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
            objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
            DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/GetSignedData", objpl);
            if (dt != null)
            {
                if (dt.Rows[0]["res"].ToString() == "1")
                {
                    lblFileMessage.CssClass = "text-danger";
                    ViewState["Summary"] = dt.Rows[0]["Summary"].ToString();
                    // JObject obj = JObject.Parse(dt.Rows[0]["Error"].ToString());
                    lblFileMessage.Text = dt.Rows[0]["Message"].ToString();

                }
                else
                {
                    lblFileMessage.CssClass = "text-danger";
                    // JObject obj = JObject.Parse(dt.Rows[0]["Error"].ToString());
                    lblFileMessage.Text = dt.Rows[0]["Error"].ToString();
                }
            }
        }

    protected void btnValidate_Click(object sender, EventArgs e)
    {

        X509Store store = new X509Store(StoreLocation.CurrentUser);
        store.Open(OpenFlags.ReadOnly);
        X509CertificateCollection certificates = X509Certificate2UI.SelectFromCollection(store.Certificates,
                                                                                        "Select Certificate",
                                                                                        "Select Certificate for encrypting return",
                                                                                        X509SelectionFlag.SingleSelection
                                                                                        );

        X509Certificate2 mycert = null;
        foreach (X509Certificate2 cert in store.Certificates)
        {
            if (cert.Subject.Contains("CN=BHAGWAT SINGH NAGORI"))
            {
                //byte[] certbyte = Encoding.ASCII.GetBytes(cert.ToString());
                mycert = cert;
                break;
            }
        }
        store.Close();
        objpl = new PL_APILog();
        objpl.Ind = 3;
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
        DataTable dt = CLSCommon.CallApiPost("api/GetSignedData/GetSignedData", objpl);
        if (dt != null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                byte[] SignByte = Convert.FromBase64String(dt.Rows[0]["SignedData"].ToString());
                //byte[] SignByte = Encoding.ASCII.GetBytes(EDecodedStringnc);
                bool Check = ClsSignUtil.Verify(SignByte,mycert);
            }
        }
    }
}