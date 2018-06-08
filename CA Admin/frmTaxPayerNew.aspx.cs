using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmTaxPayerNew : System.Web.UI.Page
{
    //string RecordNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
           // DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");

            //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            //ddl.DataSource = ds.Tables[0];
            //ddl.DataTextField = "MonthYearDesc";
            //ddl.DataValueField = "MonthYrCode";
            //ddl.DataBind();

            ////var clientcode = Session["ClientCode"];
            ////var clientcodeodp = Session["ClientCodeOdp"];
            ////var GSTIN = Session["ClientGSTNNO"];
            DataSet ds1 = CLSCommon.CallApiGet("api/TaxPayeNew/GetALlGSTRName?Ind=0&ClientCode=" + Session["ClientCode"] + "&ClientCodeOdp=" + Session["ClientCodeOdp"] + "&ClientGSTNNO=" + Session["ClientGSTNNO"]);
            if (ds1.Tables.Count > 0)
            {
                grdAllGstrName.DataSource = ds1.Tables[0];
                grdAllGstrName.DataBind();
            }
           
            //foreach(GridViewRow grow in grdAllGstrName.Rows)
            //{
            //    LinkButton lnkbtn = (LinkButton)grow.FindControl("lnkbtn");
            //    if(grow.RowIndex==0)
            //    {
                   
            //        lnkbtn.CssClass = "list-group-item text-center brdno active";
            //    }else
            //    {
            //        lnkbtn.Attributes.Remove("href");
            //    }
            //}
            //GetStatus(0);
        }
        
            GetStatus(0);
       
    }
    void GetStatus(int RowIndex)
    {
        if (grdAllGstrName.Rows.Count > 0)
        {
            int data = int.Parse(grdAllGstrName.DataKeys[RowIndex][0].ToString());

            foreach (GridViewRow grow in grdAllGstrName.Rows)
            {
                LinkButton lnkbtn1 = (LinkButton)grow.FindControl("lnkbtn");
                lnkbtn1.CssClass = "list-group-item text-center brdno";
            }

            LinkButton lnkbtn = (LinkButton)grdAllGstrName.Rows[RowIndex].FindControl("lnkbtn");
            lnkbtn.CssClass = "list-group-item text-center brdno active";

            //DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            PL_TaxPayerNew objpl = new PL_TaxPayerNew();
            objpl.Ind = 1;
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();
            objpl.RecordNo = data.ToString();
            objpl.MonthCD = Session["MonthYrCode"].ToString();
            DataTable dt = CLSCommon.CallApiPost("api/TaxPayeNew/GetAllData", objpl);

            li3bGenerated.Attributes.Remove("class");
            liSaved.Attributes.Remove("class");
            liSubmit.Attributes.Remove("class");
            liFiled.Attributes.Remove("class");
            step1.Attributes.Remove("class");
            step2.Attributes.Remove("class");
            step3.Attributes.Remove("class");
            if (dt.Rows.Count > 0)
            {
                if (int.Parse(dt.Rows[0]["TotalCompleted"].ToString()) > 0)
                {
                    li3bGenerated.Attributes.Add("class", "active");

                }
                if (int.Parse(dt.Rows[0]["TotalSaved"].ToString()) > 0)
                {
                    liSaved.Attributes.Add("class", "active");
                    step1.Attributes.Add("class", "step active");
                }
                if (int.Parse(dt.Rows[0]["TotalSubmit"].ToString()) > 0)
                {
                    liSubmit.Attributes.Add("class", "active");
                    step2.Attributes.Add("class", "step active");
                }
                if (int.Parse(dt.Rows[0]["TotalFiled"].ToString()) > 0)
                {
                    liFiled.Attributes.Add("class", "active");
                    step3.Attributes.Add("class", "step active");
                }
            }
        }
    }
    protected void grdAllGstrName_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int RowIndex = 0;
        RowIndex = int.Parse(e.CommandArgument.ToString());
        GetStatus(RowIndex);
    }
    
}