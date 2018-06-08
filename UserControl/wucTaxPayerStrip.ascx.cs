using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_wucTaxPayerStrip : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
            DataSet ds = CLSCommon.CallApiGet("api/TaxPayer/SearchTaxPayer?Ind=1&ClientId=" + Session["ClientCode"].ToString() + "&ClientIdOdp=" + Session["ClientCodeOdp"].ToString() + "&ClientGSTIN=" + Session["ClientGSTNNO"].ToString());
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        //lblFirmName.Text = ds.Tables[0].Rows[0]["FirmName"].ToString();
                        lblClientName.Text = ds.Tables[0].Rows[0]["ClientNameE"].ToString();
                        lblEmailId.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
                        lblGSTINNo.Text = ds.Tables[0].Rows[0]["GSTNNO"].ToString();
                        lblMobileNo.Text = ds.Tables[0].Rows[0]["ClientMobileNo1"].ToString();
                        Session["ClientUserID"] = ds.Tables[0].Rows[0]["ClientUserID"].ToString();
                        lblMonthYear.Text = Session["MonthYearDesc"].ToString();
                        //ddlMonthYear.DataSource = ds.Tables[1];
                        //ddlMonthYear.DataTextField = "MonthYearDesc";
                        //ddlMonthYear.DataValueField = "MonthYrCode";
                        //ddlMonthYear.DataBind();
                    }
                    
                }
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(hfUrl.Value);
    }
}