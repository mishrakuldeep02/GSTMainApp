using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class CA_Admin_frmTrueCopyDSC : System.Web.UI.Page
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
                   // divSaveTOGSTN.Visible = true;
                 //   pnlFile.Visible = true;
                   // divSubmit.Visible = true;
                    divSummary.Visible = true;

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
        //divOTPSuccess.Style.Add("display", "none");
        //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        //objpl = new PL_APILog();
        //objpl.Ind = 6;
        //objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        //objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        //objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        //objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        //objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        //objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        //objpl.RecordNo = 3;
        //objpl.MonthCD = int.Parse(ddl.SelectedValue.ToString());
        //tblInvoice.Visible = false;
        //divSummary.Visible = false;
        //divSubmit.Visible = false;
        //lblUploadStatus.Text = "";
        //DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/SaveGSTR1", objpl);
        //if (dt != null)
        //{
        //    lblTotalInvoices.Text = dt.Rows[0]["TotalInvoice"].ToString();
        //    if (dt.Rows[0]["res"].ToString() == "1")
        //    {
        //        divSubmit.Visible = true;
        //        divSummary.Visible = true;
        //        tblInvoice.Visible = true;
        //        btnView.Enabled = false;
        //        lblUploadStatus.Text = "Prcoess";// +dt.Rows[0]["referenceID"].ToString();
        //        lblUploadStatus.CssClass = "text-success";
        //        lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
        //        lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString())).ToString();
        //        lblErrorInvoice.Text = "0";
        //    }
        //    else if (dt.Rows[0]["res"].ToString() == "2")
        //    {
        //        divSubmit.Visible = true;
        //        divSummary.Visible = true;
        //        btnView.Enabled = true;
        //        lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString()) - int.Parse(dt.Rows[0]["ErrorInvoice"].ToString())).ToString();
        //        lblErrorInvoice.Text = dt.Rows[0]["ErrorInvoice"].ToString();
        //        lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
        //        tblInvoice.Visible = true;
        //        lblUploadStatus.Text = "Error";// +dt.Rows[0]["referenceID"].ToString();
        //        lblUploadStatus.CssClass = "text-danger";
        //        grd.DataSource = dt;
        //        grd.DataBind();
        //    }
        //    else if (dt.Rows[0]["res"].ToString() == "3")
        //    {
        //        lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
        //        lblUploadStatus.Text = "In Process";
        //        lblUploadStatus.CssClass = "text-danger";
        //        btnRefresh.Visible = true;
        //    }
        //    else
        //    {
        //        lblUploadStatus.Text = dt.Rows[0]["Error"].ToString();
        //    }
        //}
    }
    protected void btnGetSummary_Click(object sender, EventArgs e)
    {
        divOTPSuccess.Style.Add("display", "none");

      //  DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
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
                txtSummary.Text = dt.Rows[0]["Summary"].ToString();
                UploadForSigning();
               
            }
            else
            {
                divsuccessmsg.CssClass = "alert alert-danger";
                divsuccessmsg.Visible = true;
                lblSummMessage.Text = dt.Rows[0]["Error"].ToString();
            }
        }
        else
        {
            divsuccessmsg.CssClass = "alert alert-danger";
            divsuccessmsg.Visible = true;
            
            lblSummMessage.Text = "Some Error Occured try Again.";
        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#file').modal('show');});", true);
    }
    ClsEncryption encrypt;
    public void UploadForSigning()
    {
        lblSummMessage.Text = string.Empty;
        ClsTCUtilsUploadHash clsTCUtil = new ClsTCUtilsUploadHash();
        encrypt = new ClsEncryption();
        //clsGstr1 = new ClsGSTR1();

        byte[] encodeJson = UTF8Encoding.UTF8.GetBytes(txtSummary.Text.Trim());
        string base64Payload = Convert.ToBase64String(encodeJson);

        var sha256_hash = clsTCUtil.sha256_hash(base64Payload);

        string email = "harshng@gmail.com";
        ClsCommon.uuid = "OSWA" + "180717" + ClsCommon.SBGSTINNO.Substring(0, 6) + ClsCommon.generateRandomNumber(16);

        var json4 = clsTCUtil.uploadHash(ClsCommon.uuid, email, sha256_hash.ToString());
        XmlDocument xDoc = new XmlDocument();
        string status = string.Empty;
        xDoc.LoadXml(json4.ToString());
        var node = xDoc.SelectSingleNode("response");
        if (node.ChildNodes.Count > 0)
        {
            foreach (XmlNode n in node.ChildNodes)
            {
                status = n.FirstChild.Value;
                break;
            }

        }
        if (status == "0")
        {
            ClsCommon.did = ClsCommon.uuid;
            lblSummMessage.Text = "Summary Successfully Generated.";
            divsuccessmsg.Visible = true;
            divsuccessmsg.CssClass = "alert alert-success";

        }
    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        //divOTPSuccess.Style.Add("display", "none");
        //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        //objpl = new PL_APILog();
        //objpl.Ind = 6;
        //objpl.ReferenceId = lblreferenceId.Text;
        //objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        //objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        //objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        //objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        //objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        //objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        //objpl.RecordNo = 3;
        //objpl.MonthCD = int.Parse(ddl.SelectedValue.ToString());
        //tblInvoice.Visible = false;
        //lblUploadStatus.Text = "";
        //btnRefresh.Visible = false;
        //DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/TrackStatus", objpl);
        //if (dt != null)
        //{
        //    lblTotalInvoices.Text = dt.Rows[0]["TotalInvoice"].ToString();
        //    if (dt.Rows[0]["res"].ToString() == "1")
        //    {
        //        divSubmit.Visible = true;
        //        divSummary.Visible = true;
        //        tblInvoice.Visible = true;
        //        btnView.Enabled = false;
        //        lblUploadStatus.Text = "Prcoess";// +dt.Rows[0]["referenceID"].ToString();
        //        lblUploadStatus.CssClass = "text-success";
        //        lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
        //        lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString())).ToString();
        //        lblErrorInvoice.Text = "0";
        //    }
        //    else if (dt.Rows[0]["res"].ToString() == "2")
        //    {
        //        divSubmit.Visible = true;
        //        divSummary.Visible = true;
        //        btnView.Enabled = true;
        //        lblUploaded.Text = (int.Parse(dt.Rows[0]["TotalInvoice"].ToString()) - int.Parse(dt.Rows[0]["ErrorInvoice"].ToString())).ToString();
        //        lblErrorInvoice.Text = dt.Rows[0]["ErrorInvoice"].ToString();
        //        lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
        //        tblInvoice.Visible = true;
        //        lblUploadStatus.Text = "Error";// +dt.Rows[0]["referenceID"].ToString();
        //        lblUploadStatus.CssClass = "text-danger";
        //        grd.DataSource = dt;
        //        grd.DataBind();
        //    }
        //    else if (dt.Rows[0]["res"].ToString() == "3")
        //    {
        //        lblreferenceId.Text = dt.Rows[0]["referenceID"].ToString();
        //        lblUploadStatus.Text = "In Process";
        //        lblUploadStatus.CssClass = "text-danger";
        //        btnRefresh.Visible = true;
        //    }
        //    else
        //    {
        //        lblUploadStatus.Text = dt.Rows[0]["Error"].ToString();
        //    }
        //}
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //divOTPSuccess.Style.Add("display", "none");
        //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        //objpl = new PL_APILog();
        //objpl.Ind = 1;
        //objpl.ReferenceId = lblreferenceId.Text;
        //objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        //objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        //objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        //objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        //objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        //objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        //objpl.RecordNo = 3;
        //objpl.MonthCD = int.Parse(ddl.SelectedValue.ToString());
        //tblInvoice.Visible = false;
        //lblUploadStatus.Text = "";
        //btnRefresh.Visible = false;
        //DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/SubmitGSTR1", objpl);
        //if (dt != null)
        //{
        //    if (dt.Rows[0]["res"].ToString() == "1")
        //    {
        //        lblSubmitMsg.CssClass = "text-success";
        //        lblSubmitMsg.Text = "Data Submitted Successfully.";
        //    }
        //    else
        //    {
        //        lblSubmitMsg.CssClass = "text-danger";
        //        JObject obj = JObject.Parse(dt.Rows[0]["Error"].ToString());
        //        lblSubmitMsg.Text = obj.GetValue("message").ToString();
        //    }
        //}
    }
    protected void btnFiled_Click(object sender, EventArgs e)
    {
        //divOTPSuccess.Style.Add("display", "none");

        //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        //objpl = new PL_APILog();
        //objpl.Ind = 6;
        //objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        //objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        //objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        //objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        //objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        //objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        //objpl.RecordNo = 3;
        //objpl.MonthCD = int.Parse(ddl.SelectedValue.ToString());
        //DataTable dtSumm = CLSCommon.CallApiPost("api/GSTR1File/GetSummary", objpl);
        //if (dtSumm != null)
        //{
        //    if (dtSumm.Rows[0]["res"].ToString() == "1")
        //    {
        //        objpl.SummaryData = dtSumm.Rows[0]["Summary"].ToString();
        //        byte[] encodeJson = UTF8Encoding.UTF8.GetBytes(objpl.SummaryData.Trim());
        //        string base64Payload = Convert.ToBase64String(encodeJson);
        //        objpl.SignedData = ClsSignUtil.Sign(base64Payload.Trim());

        //        divOTPSuccess.Style.Add("display", "none");
        //        // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        //        // objpl = new PL_APILog();
        //        objpl.Ind = 9;
        //        objpl.ReferenceId = lblreferenceId.Text;
        //        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        //        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        //        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        //        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        //        objpl.GSTNNO = Session["ClientGSTNNo"].ToString();
        //        objpl.LogId = Convert.ToInt64(hfLogId.Value.ToString());
        //        objpl.RecordNo = 3;
        //        objpl.MonthCD = int.Parse(ddl.SelectedValue.ToString());
        //        tblInvoice.Visible = false;
        //        lblUploadStatus.Text = "";
        //        btnRefresh.Visible = false;
        //        DataTable dt = CLSCommon.CallApiPost("api/GSTR1File/FileGSTR1", objpl);
        //        if (dt != null)
        //        {
        //            if (dt.Rows[0]["res"].ToString() == "1")
        //            {
        //                lblFileMessage.CssClass = "text-success";
        //                lblFileMessage.Text = "Data Filed Successfully.";
        //                lblAckNo.Text = "Acknowledgement No. :- " + dt.Rows[0]["ack_num"].ToString();
        //            }
        //            else
        //            {
        //                lblFileMessage.CssClass = "text-danger";
        //                JObject obj = JObject.Parse(dt.Rows[0]["Error"].ToString());
        //                lblFileMessage.Text = obj.GetValue("message").ToString();
        //            }
        //        }
        //    }
        //}
    }
    static bool ESign = false;
    static bool DSC = false;
    
    StringBuilder sb;
    protected void btnEsign_Click(object sender, EventArgs e)
    {
        lblSummMessage.Text = string.Empty;
        if (ClsCommon.did != null)
        {
            ESign = true;
            HttpClient hClient = new System.Net.Http.HttpClient();

            sb = new StringBuilder();
            sb.Append("uuid=" + ClsCommon.uuid + "");
            sb.Append("&cs=" + ClsCommon.cheksum + "");
            sb.Append("&an=");
            sb.Append("&fn=");
            string hfuuid = ClsCommon.eSignDomain + ClsCommon.UPLOAD_WidgetSigner + "?" + sb.ToString();
            //hfcs.Value = "AVerifyDiv";
            ifmAuth.Src = hfuuid;
            ifmAuth.Style.Add("display", "block");

        }
        else
        {
            ifmAuth.Style.Add("display", "none");
        }
    }
    protected void btnDSC_Click(object sender, EventArgs e)
    {
        lblSummMessage.Text = string.Empty;
        ifmAuth.Style.Add("display", "none");
        ClsTCUtilsUploadHash clsTCUtil = new ClsTCUtilsUploadHash();
        encrypt = new ClsEncryption();
        //clsGstr1 = new ClsGSTR1();

        string status = string.Empty;
        string msg = string.Empty;
        string did = string.Empty;

        string doc_category = "OTHER";
        string Email = "harshng@gmail.com"; //"verma.satishkumar6783@gmail.com";
        string SendMail = "YES";
        if (ClsCommon.did != null)
        {
            var response = clsTCUtil.MarkForSignCorpfileDSC(ClsCommon.uuid, ClsCommon.cheksum, doc_category, Email, SendMail);
            XmlDocument xDoc = new XmlDocument();
            xDoc.LoadXml(response.ToString());
            var node = xDoc.SelectSingleNode("response");
            if (node.ChildNodes.Count > 0)
            {
                foreach (XmlNode n in node.ChildNodes)
                {
                    status = n.FirstChild.Value;
                    break;
                }
            }
            if (status == "0")
            {
                DSC = true;
                //string url = ClsCommon.URLForDownProduction + ClsCommon.DownDSCUpdater;
                ////string url = "https://files.truecopy.in/esign/deploy/DSCUpdaterQA.zip";
                //Response.Write("<script>window.open('" + url + "','_blank');</script>");
                lblSummMessage.Text= "Data Mark Successfully For Dsc Signing.";
                divsuccessmsg.CssClass = "alert alert-success";
                divsuccessmsg.Visible = true;
                divsuccessmsg.CssClass = "alert alert-success";
            }
        }

    }
    protected void btnCheckApproval_Click(object sender, EventArgs e)
    {
        lblSummMessage.Text = string.Empty;
        ifmAuth.Style.Add("display", "none");
        ClsTCUtilsUploadHash clsTCUtil = new ClsTCUtilsUploadHash();
        encrypt = new ClsEncryption();
        //clsGstr1 = new ClsGSTR1();
        string doc_category = "OTHER";
        string DownCs = clsTCUtil.GetDownloadCS(ClsCommon.eSignAPIKEY, ClsCommon.uuid);
        var response = clsTCUtil.GetSignedStatus(ClsCommon.eSignDomain, doc_category, DownCs);
        XmlDocument xDoc = new XmlDocument();
        string status = string.Empty;
        xDoc.LoadXml(response.ToString());
        var node = xDoc.SelectSingleNode("docstatus");
        if (node.ChildNodes.Count > 0)
        {
            foreach (XmlNode n in node.ChildNodes)
            {
                status = n.FirstChild.Value;
                break;
            }

        }
        if (status != "")
        {
            lblSummMessage.Text = "Data Successfully Signed.";
        }
    }
    protected void btnDownloadSign_Click(object sender, EventArgs e)
    {
         lblSummMessage.Text =  string.Empty;
        ClsTCUtilsUploadHash clsTCUtil = new ClsTCUtilsUploadHash();
        encrypt = new ClsEncryption();
//        clsGstr1 = new ClsGSTR1();
        
        string DownCs = clsTCUtil.GetDownloadCS(ClsCommon.eSignAPIKEY, ClsCommon.uuid);
        if (ClsCommon.uuid != null && ClsCommon.uuid != string.Empty)
        {
            var response = clsTCUtil.GetDownloadSignedData(ClsCommon.eSignDomain, DownCs);
            JObject jobj = JObject.Parse(response.ToString());
            if (jobj.GetValue("status") != null && jobj.GetValue("status").ToString() == "0")
            {
                ClsCommon.AadhaarNo = jobj.GetValue("aadhaarno") == null ? "" : jobj.GetValue("aadhaarno").ToString();
                ClsCommon.SignedData = jobj.GetValue("PKCS7").ToString();
                divsuccessmsg.Visible = true;
                divsuccessmsg.CssClass = "alert alert-success";
                lblSummMessage.Text = "Successfully download signed data.";
                txtSummary.Text = ClsCommon.SignedData;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#viewsubmit').modal('show');});", true);
            }
            else
            {
                divsuccessmsg.Visible = true;
                divsuccessmsg.CssClass = "alert alert-danger";
                lblSummMessage.Text = "Error in downloading signed data.";
            }
        }
        else
        {
            divsuccessmsg.Visible = true;
            divsuccessmsg.CssClass = "alert alert-danger";
            lblSummMessage.Text = "Error: uuid is null or blank.";
        }
    }
}