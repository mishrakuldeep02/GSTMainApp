using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_frmPaymentStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
       if( rdbDateWise.Checked &&(txtFromDate.Text=="" || txtToDate.Text==""))
       {
           lblerror.Text = "Please Enter Form Date And To Date ";
       }
       else
       {
           Session["Report"] = "PaymentStatusReport";//Report Name
           Hashtable HT = new Hashtable();
           HT.Add("Ind", 1);
           HT.Add("FromDate", rdbDateWise.Checked ? txtFromDate.Text.Substring(6, 4) + "/" + txtFromDate.Text.Substring(3, 2) + "/" + txtFromDate.Text.Substring(0, 2) : "");
           HT.Add("ToDate", rdbDateWise.Checked ? txtToDate.Text.Substring(6, 4) + "/" + txtToDate.Text.Substring(3, 2) + "/" + txtToDate.Text.Substring(0, 2) : "");
           HT.Add("Type", ddlUserType.SelectedValue.ToString());
           HT.Add("DateWiseind", rdbAll.Checked ? 1 : 2);
           Session["HT"] = HT;
           Session["format"] = "Pdf";
           Session["FileName"] = "PaymentStataus";
           Response.Redirect("~/Reports/FrmReportViewer.aspx");
       }
       
    }
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        txtFromDate.Text = "";
        txtToDate.Text = "";
        fstar.InnerHtml = "";
        tstar.InnerHtml = "";
    }
}