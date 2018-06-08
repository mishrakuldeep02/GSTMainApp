using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_CaHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        if (!IsPostBack)
        {
            GetHomeData();
            lblGstrName.InnerText = ddlGSTR.SelectedItem.Text;
            GetTotalByGSTRName();
        }

    }
    void GetHomeData()
    {
        try
        {
            DataSet ds = CLSCommon.CallApiGet("api/CaHome/GetCaHomeData?Ind=1&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString());
            if (ds != null)
            {

                ddlGSTR.DataSource = ds.Tables[2];
                ddlGSTR.DataTextField = "GSTRName";
                ddlGSTR.DataValueField = "RecordNo";
                ddlGSTR.DataBind();
            }
        }
        catch { }
    }
    void GetTotalByGSTRName()
    {
        DataSet ds = CLSCommon.CallApiGet("api/CaHome/GetCaHomeData?Ind=2&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString() + "&RecordNo=" + ddlGSTR.SelectedValue.ToString());
        if (ds != null)
        {
            decimal TotalRecords, TotalCompleted, PercentData, PercentSubmit, PercentFiled, PercentSaved, TotalSubmit, TotalFiled, TotalSaved;
            TotalRecords = decimal.Parse(ds.Tables[0].Rows[0]["TotalClient"].ToString());

            TotalCompleted = decimal.Parse(ds.Tables[1].Rows[0]["TotalCompleted"].ToString());
            lblTotalRecords.Text = TotalRecords.ToString();
            lblCompleted.InnerHtml = TotalCompleted.ToString();

            TotalSaved = decimal.Parse(ds.Tables[2].Rows[0]["TotalSaved"].ToString());
            TotalSubmit = decimal.Parse(ds.Tables[3].Rows[0]["TotalSubmit"].ToString());
            TotalFiled = decimal.Parse(ds.Tables[4].Rows[0]["TotalFiled"].ToString());

            if (TotalRecords > 0)
            {
                PercentData = (TotalCompleted / TotalRecords) * 100;
                PercentSubmit = (TotalSubmit / TotalRecords) * 100;
                PercentSaved = (TotalSaved / TotalRecords) * 100;
                PercentFiled = (TotalFiled / TotalRecords) * 100;
            }
            else
            {
                PercentData = 0;
                PercentSubmit = 0;
                PercentSaved = 0;
                PercentFiled = 0;
            }
            // divCompleted.Attributes.Add("data-label", TotalCompleted.ToString());
            divCompleted.Attributes.Add("data-percent", Math.Floor(PercentData).ToString());
            divSaved.Attributes.Add("data-percent", Math.Floor(PercentSaved).ToString());
            divSubmit.Attributes.Add("data-percent", Math.Floor(PercentSubmit).ToString());
            divFiled.Attributes.Add("data-percent", Math.Floor(PercentFiled).ToString());

            lblSaved.InnerText = TotalSaved.ToString();
            lblSubmit.InnerText = TotalSubmit.ToString();
            lblFiled.InnerText = TotalFiled.ToString();

        }
    }
    protected void ddlGSTR_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblGstrName.InnerText = ddlGSTR.SelectedItem.Text;
        GetTotalByGSTRName();
    }
}