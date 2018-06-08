using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmClientDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   ViewState["YearInd"] = null;
        ViewState["MonthCode"] = null;
        CLSCommon.CommonCheckSession();
        CLSCommon.ClientCheckSession();
        CLSCommon.CACheckSession();
        if (!IsPostBack)
        {
            DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");

            DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            ddl.DataSource = ds.Tables[0];
            ddl.DataTextField = "MonthYearDesc";
            ddl.DataValueField = "MonthYrCode";
            ddl.DataBind();
            //ViewState["MonthCode"] = Convert.ToInt32(ddl.SelectedValue.ToString());
            //string YearCode = (ddl.SelectedItem.Text.ToString());
            //ViewState["YearInd"] = Convert.ToInt32((YearCode.Substring(YearCode.Length - 4, 4))).ToString();
           
        }
        GetClientstatusDashboard();
    }
    public void GetClientstatusDashboard()
    {
        DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        PL_ClientDashboard objpl = new PL_ClientDashboard();
        objpl.ind = 1;
        objpl.ClientCode =Convert.ToInt32( HttpContext.Current.Session["ClientCode"]);
       // objpl.ClientCode = 52;
        objpl.ClientCodeOdp = Convert.ToInt32( HttpContext.Current.Session["ClientCodeOdp"]);
       // objpl.ClientCodeOdp = 136;
        objpl.GSTIN = HttpContext.Current.Session["ClientGSTNNO"].ToString();
       //objpl.GSTIN = "23CYBER1234I1ZA";
        objpl.MonthInd = Convert.ToInt32(ddl.SelectedValue.ToString());
        objpl.YearInd =0;
        DataTable dt = new DataTable();
        dt = CLSCommon.CallApiPost("api/ClientDashboard/GetClientstatusDashboard", objpl);
        if(dt.Rows.Count>0)
        {
            // " Record Inserted Successfully"

        }
        else
        { 
        // "Not Inserted"
        }

    }
   
}