using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_FrmGSTR1Summary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        if (!IsPostBack)
        {
          //  fillddl();
        }
    }

   
    protected void btnGstr1Summary_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        PL_GSTR1Summary obj = new PL_GSTR1Summary();
        DataTable dt = new DataTable();
        obj.Ind = 1;
        obj.CaCode = Convert.ToInt32(Session["CaCode"]);
       // obj.CaCode = 38;
        obj.CaCodeOdp = Convert.ToInt32(Session["CaCodeOdp"]);
       // DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        obj.MonthCD = Convert.ToInt32(Session["MonthYrCode"].ToString());
        if (Session["ClientCode"] != null && Session["ClientCodeOdp"]!=null)
        {
            obj.ClientCode = Convert.ToInt32(Session["ClientCode"].ToString());
            obj.ClientCodeOdp = Convert.ToInt32(Session["ClientCodeOdp"].ToString());
             obj.ClientGSTIN = Session["ClientGSTNNO"].ToString();
           // obj.ClientGSTIN = "33GSPTN3741G1Z9";
            dt = CLSCommon.CallApiPost("api/GSTR1Summary/GetGSTR1Summary/", obj);
            if (dt != null )
            {
                GridGSTR1Summ.DataSource = dt;
                GridGSTR1Summ.DataBind();
            }

        }else
        {
            lblmsg.Text = "Please Select Client";
        }
       

    }
}