using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_CommonMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        hfUrl.Value = HttpContext.Current.Request.Url.AbsoluteUri;
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        CLSCommon.CommonCheckSession();

        if (Session["UserLevel"].ToString() == "1")
        {
            divAdminCA.Visible = true;
        }
        else if (Session["UserLevel"].ToString() == "3")
        {
            divArtical.Visible = true;
        }
        else if (Session["UserLevel"].ToString() == "4")
        {
            divSideContent.Visible = true;

        }
        else if (Session["UserLevel"].ToString() == "5")
        {
            divAdministrator.Visible = true;
        }
        else if (Session["UserLevel"].ToString() == "2")
        {
            divca.Visible = true;
        }
        if (!IsPostBack)
        {
            if (Session["ClientCode"] == null || Session["ClientCode"] == "" || Session["ClientCode"] == "0" ||
               Session["ClientCodeOdp"] == null || Session["ClientCodeOdp"] == "" || Session["ClientCodeOdp"] == "0" ||
              Session["ClientGSTNNO"] == null || Session["ClientGSTNNO"] == "" || Session["ClientGSTNNO"] == "0")
            {
            }
            else
            {
                if (!IsPostBack)
                {
                    DataSet ds = CLSCommon.CallApiGet("api/TaxPayer/SearchTaxPayer?Ind=1&ClientId=" + Session["ClientCode"].ToString() + "&ClientIdOdp=" + Session["ClientCodeOdp"].ToString() + "&ClientGSTIN=" + Session["ClientGSTNNO"].ToString());
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            txtNameMsg.Text = ds.Tables[0].Rows[0]["ClientNameE"].ToString();
                            txtToEmail.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
                            txtMobileNoMsg.Text = ds.Tables[0].Rows[0]["ClientMobileNo1"].ToString();
                        }
                    }
                }
            }
        }

        txtMessageMsg.Attributes.Add("maxlength", txtMessageMsg.MaxLength.ToString());
        txtMessageEmail.Attributes.Add("maxlength", txtMessageMsg.MaxLength.ToString());

    }


    protected void btnSendEmail_Click(object sender, EventArgs e)
    {
        lblErrorMsgEmail.Text = "";
        lblErrorMsgSMS.Text = "";
        CLSCommon.SendHtmlFormattedEmail(txtMessageEmail.Text.Trim(), txtToEmail.Text.Trim(), txtSubjectEmail.Text.Trim());
        txtSubjectEmail.Text = "";
        txtMessageEmail.Text = "";

    }

    protected void btnSendMsg_Click(object sender, EventArgs e)
    {
        lblErrorMsgEmail.Text = "";
        lblErrorMsgSMS.Text = "";
        CLSCommon.SendMessage(txtMobileNoMsg.Text.Trim(), txtMessageMsg.Text.Trim());
        txtMessageMsg.Text = "";
    }

    //void fillddl()
    //{
    //    DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");

    //    DropDownList ddl = (DropDownList)wucImportData.FindControl("ddlMonthYear");
    //    ddl.DataSource = ds.Tables[0];
    //    ddl.DataTextField = "MonthYearDesc";
    //    ddl.DataValueField = "MonthYrCode";
    //    ddl.DataBind();
    //    ddl.Items.Insert(0, new ListItem("Select", "0"));
    //}
}
