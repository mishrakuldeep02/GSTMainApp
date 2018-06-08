using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmDeleteData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.ClientCheckSession();
        //if(Session["Client"]==null||Session["TaxPayerIdOdp"]==null||Session["ClientGSTNNO"]==null)
        //{
        //    Response.Redirect("~/MasterPage/frmLogout.aspx");
        //}
        if (!IsPostBack)
        {
          
        }
    }
    protected void btnGSTR1Delete_Click(object sender, EventArgs e)
    {
        DeleteData(1);
    }
    protected void btnSGTR2Delete_Click(object sender, EventArgs e)
    {
        DeleteData(2);
    }
    void DeleteData(int Ind)
    {   
      //  DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        DataTable dt = CLSCommon.CallApiGetdt("api/DeleteClientData/DeleteData?Ind=" + Ind.ToString() + "&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString());
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                lblMsg.Text = "Data Deleted Successfully.";
            }
        }
    }
    protected void btnGSTR2A_Click(object sender, EventArgs e)
    {
      
    }
    protected void btnGST3B_Click(object sender, EventArgs e)
    {
        DeleteData(3);
    }
}