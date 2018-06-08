using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGSTR3b : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if(!IsPostBack)
        {
             
        }
      //   DropDownList ddl1 = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        DataSet ds = CLSCommon.CallApiGet("api/GSTR3b/GetAllData?Ind=0&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString() + "&ClientGSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString());
                
            grd3_1.DataSource = ds.Tables[0];
            grd3_1.DataBind();
        
            grd3_2.DataSource = ds.Tables[1];
            grd3_2.DataBind();
       
            grd4A.DataSource = ds.Tables[2];
            grd4A.DataBind();;
       
        grd5.DataSource = ds.Tables[3];
        grd5.DataBind();
        grd6_1.DataSource = ds.Tables[4];
        grd6_1.DataBind();

        grd4B.DataSource = ds.Tables[5];
        grd4B.DataBind();

        grd4C.DataSource = ds.Tables[6];
        grd4C.DataBind();

        Grd4D.DataSource = ds.Tables[7];
        Grd4D.DataBind();
     
    }

    protected void grdAllGstr3b_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //DataSet ds = CLSCommon.CallApiGet("api/GSTR3b/GetAllData?Ind=0");
        //if(ds.Tables.Count > 0)
        //{
        //    grdShowAlldata.DataSource = ds;
        //    grdShowAlldata.DataBind();
        //}
    }
}