using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmDisplayPurchaseData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
            //DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");

            //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            //ddl.DataSource = ds.Tables[0];
            //ddl.DataTextField = "MonthYearDesc";
            //ddl.DataValueField = "MonthYrCode";
            //ddl.DataBind();
        } GetGSTR2Data();
    }
    void GetGSTR2Data()
    {
      //  DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        DataSet ds1 = CLSCommon.CallApiGet("api/PurchaseData/GetPurchaseData?ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString() + "&ClientGSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCode=" + Session["MonthYrCode"].ToString());

        GrdTable3.DataSource = ds1.Tables[0];
        GrdTable3.DataBind();

        Grd4A.DataSource = ds1.Tables[1];
        Grd4A.DataBind();


        Grd4B.DataSource = ds1.Tables[2];
        Grd4B.DataBind();


        grd4C.DataSource = ds1.Tables[3];
        grd4C.DataBind();


        grd5A.DataSource = ds1.Tables[4];
        grd5A.DataBind();

        grd5B.DataSource = ds1.Tables[5];
        grd5B.DataBind();

        grd6A.DataSource = ds1.Tables[6];
        grd6A.DataBind();

        grd6B.DataSource = ds1.Tables[7];
        grd6B.DataBind();

        grd6C.DataSource = ds1.Tables[8];
        grd6C.DataBind();

        grd6D.DataSource = ds1.Tables[9];
        grd6D.DataBind();


        grd8.DataSource = ds1.Tables[10];
        grd8.DataBind();

        grd9.DataSource = ds1.Tables[11];
        grd9.DataBind();

        grd10A1.DataSource = ds1.Tables[12];
        grd10A1.DataBind();

        grd10A2.DataSource = ds1.Tables[13];
        grd10A2.DataBind();

        grd10b1.DataSource = ds1.Tables[14];
        grd10b1.DataBind();

        grd10b2.DataSource = ds1.Tables[15];
        grd10b2.DataBind();

        grd7A.DataSource = ds1.Tables[16];
        grd7A.DataBind();

        grd7B.DataSource = ds1.Tables[17];
        grd7B.DataBind();

        grd11.DataSource = ds1.Tables[18];
        grd11.DataBind();

        grd13.DataSource = ds1.Tables[19];
        grd13.DataBind();

    }

    protected void GrdTable3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(GrdTable3.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void Grd4A_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(Grd4A.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void Grd4B_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(Grd4B.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void grd4C_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(grd4C.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void grd5A_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(grd5A.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void grd5B_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(grd5B.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void grd6A_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(grd6A.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void grd6B_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(grd6B.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void grd6C_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(grd6C.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}
    }
    protected void grd6D_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    int Index = e.Row.RowIndex;
        //    if (int.Parse(grd6D.DataKeys[Index][0].ToString()) != 0)
        //    {
        //        e.Row.BackColor = System.Drawing.Color.Yellow;
        //    }
        //}

    }
    protected void grd13_RowCreated(object sender, GridViewRowEventArgs e)
    {
       
    }
}