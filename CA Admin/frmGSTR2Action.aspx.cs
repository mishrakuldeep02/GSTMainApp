using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGSTR2Action : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        int recordNo = 0;
        if (Request.QueryString["RecordNo"] != null)
        {
            if (!Regex.IsMatch(Request.QueryString["RecordNo"].ToString(), @"^\d+$"))
            {
                Response.Redirect("frmGSTR2Summary_design.aspx");
            }
            else
            {
                recordNo = int.Parse(Convert.ToString(Request.QueryString["RecordNo"]));
            }
        }
        else
        {
            Response.Redirect("frmGSTR2Summary_design.aspx");
        }
        if (!IsPostBack)
        {
            FillGRID(recordNo);
        }
    }
    void TakeAction(int ActionCode, string ActionDesc)
    {
        PL_GSTR2Action objpl = new PL_GSTR2Action();
        objpl.Ind = 2;
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.GSTIN = Session["ClientGSTNNO"].ToString();
        objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
        objpl.ActionCode = ActionCode;
        objpl.ActionDesc = ActionDesc;
        objpl.UserCode = int.Parse(Session["UserCode"].ToString());
        objpl.ApiTableCode = int.Parse(Convert.ToString(Request.QueryString["RecordNo"]));
        DataTable dt = new DataTable();
        dt.Columns.Add("InvoiceNumber");
        objpl.dt = dt;
        int Rowindex = 0;
        foreach (GridViewRow gvr in Gridb2b.Rows)
        {
            CheckBox chk = (CheckBox)gvr.FindControl("chkSelect");
            Label lblInvoiceNo = (Label)gvr.FindControl("lblInvoiceNo");
            if (chk.Checked)
            {
                dt.Rows.Add();
                dt.Rows[Rowindex][0] = lblInvoiceNo.Text;
                Rowindex++;
            }
        }
        DataSet dsres = CLSCommon.CallApiPostDS("api/GSTR2Action/TakeAction", objpl);
        if (dsres != null)
        {
            pnlMsg.Visible = true;
            lblMEssage.Text = "Action Taken Successfully On " + dt.Rows.Count.ToString() + " Invoices.";
            Gridb2b.DataSource = dsres.Tables[0];
            Gridb2b.DataBind();
         
        }
    }
    void FillGRID(int RecordNo)
    {
        lblTabName.Text = "";
        DataSet ds = null;
        if (RecordNo == 20)
        {
            lblTabName.Text = "3,4A - Inward Supplies received from Registerd person including reverse charge supplies";
            panelb2b.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridb2b.DataSource = ds.Tables[0];
            Gridb2b.DataBind();
        }
        if (RecordNo == 21)
        {
            lblTabName.Text = "4B - Inward supplies from an unregistered supplier";
            panelb2bur.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=2&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridb2bur.DataSource = ds.Tables[0];
            Gridb2bur.DataBind();

        }

        if (RecordNo == 24)
        {
            lblTabName.Text = "4C - Import of service";
            panelImps.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=4&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridimps.DataSource = ds.Tables[0];
            Gridimps.DataBind();
        }
        if (RecordNo == 22)  // for GSTR2 cdn 
        {
            lblTabName.Text = "6C - Debit/Credit Notes for supplies from registered person";
            panelCdnr.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=5&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridcdn.DataSource = ds.Tables[0];
            Gridcdn.DataBind();

        }

        if (RecordNo == 30)  // for GSTR2 cdnur 
        {
            lblTabName.Text = "6C - Debit Notes/Credit Notes for Unregistered Supplier";
            panelCdnur.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=6&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridcdnur.DataSource = ds.Tables[0];
            Gridcdnur.DataBind();

        }

        if (RecordNo == 23)
        {
            lblTabName.Text = "5 - Import of Inputs/Capital goods and Supplies received from SEZ";
            panelImpg.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=3&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridimpg.DataSource = ds.Tables[0];
            Gridimpg.DataBind();

        }

        if (RecordNo == 26)  // GSTR2 At
        {
            lblTabName.Text = "10(I) - 10A - Advance amount paid for reverse charge supplies";
            panelAt.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=7&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridat.DataSource = ds.Tables[0];
            Gridat.DataBind();

        }

        if (RecordNo == 27)  // GSTR2 Atadj
        {
            lblTabName.Text = "10(I) - 10B - Adjustment of Advance amount paid earilier for reverse charge supplies";
            panelAtadj.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=8&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridatadj.DataSource = ds.Tables[0];
            Gridatadj.DataBind();

        }
        if (RecordNo == 25)  // GSTR2 exemp
        {
            lblTabName.Text = "7 - Supplies from composition taxable person and other exempt/nil rated/non GST supplies";
            panelexemp.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=9&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridexemp.DataSource = ds.Tables[0];
            Gridexemp.DataBind();

        }

        if (RecordNo == 28)  // GSTR2 itcr
        {
            lblTabName.Text = "11 - Input Tax Credit Reversal/Reclaim";
            panelitcr.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=10&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Griditcr.DataSource = ds.Tables[0];
            Griditcr.DataBind();

        }

        if (RecordNo == 29)  // GSTR2 hsn
        {
            lblTabName.Text = "13 - HSN summary of inward supplies";
            panelhsn.Visible = true;
            ds = CLSCommon.CallApiGet("api/GSTR2Action/GetGSTR2Data?ind=11&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&RecordNo=" + RecordNo.ToString());
            Gridhsn.DataSource = ds.Tables[0];
            Gridhsn.DataBind();

        }
    }
    int CountInvoice = 0;
    int Color = 0;
    protected void grdMismatch_RowCommand(object sender, GridViewCommandEventArgs e)
    {


    }
    //protected void grdMismatch_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        int Index = e.Row.RowIndex;
    //        int RowNo = int.Parse(grdMismatch.DataKeys[Index].Values[1].ToString());
    //        int ActionCode = int.Parse(grdMismatch.DataKeys[Index].Values[3].ToString());
    //        string CssClass = ((Label)e.Row.FindControl("lblInvoiceNo")).Text.Replace("/", "").Replace("-", "");
        
    //        if (RowNo == 1)
    //        {
    //            CountInvoice = int.Parse(grdMismatch.DataKeys[Index].Values[2].ToString());
    //            e.Row.Cells[0].RowSpan = CountInvoice;
    //        }
    //        else
    //        {
    //            e.Row.Cells[0].Visible = false;
    //        }
    //        if (ActionCode != 0)
    //        {
    //            e.Row.Cells[0].Enabled = false;
    //        }
    //        if (ActionCode == 6)
    //        {
    //            CssClass += " tr-success";
    //            e.Row.CssClass = CssClass;
    //        }
    //        else if (ActionCode == 7)
    //        {
    //            CssClass += " tr-primary";
    //            e.Row.CssClass = CssClass;
    //        }
    //        else if (ActionCode == 3)
    //        {
    //            CssClass += " tr-info";
    //            e.Row.CssClass = CssClass;
    //        }

    //        else if (ActionCode == 4)
    //        {
    //            CssClass += " tr-warning";
    //            e.Row.CssClass = CssClass;
    //        }

    //        else if (ActionCode == 5)
    //        {
    //            CssClass += " tr-danger";
    //            e.Row.CssClass = CssClass;
    //        }
    //        else
    //        {

    //            if (RowNo == 1)
    //            {
    //                CountInvoice = int.Parse(grdMismatch.DataKeys[Index].Values[2].ToString());

    //                e.Row.Cells[0].RowSpan = CountInvoice;
                   
    //                if (Color == 0)
    //                {
                     
    //                    CssClass += " lightgray";
    //                    e.Row.CssClass = CssClass;
                      
    //                }
    //                else
    //                {
    //                    CssClass += " lightgreen";
    //                    e.Row.CssClass = CssClass;
                      
    //                }
    //                CountInvoice--;
    //                if (CountInvoice == 0)
    //                {
    //                    Color = Color == 0 ? 1 : 0;
    //                }
    //            }
    //            else
    //            {
    //                e.Row.Cells[0].Visible = false;
                    
    //                CountInvoice--;
    //                if (Color == 0)
    //                {
    //                    CssClass += " lightgray";
    //                    e.Row.CssClass = CssClass;
                       
    //                }
    //                else
    //                {
    //                    CssClass += " lightgreen";
    //                    e.Row.CssClass = CssClass;
                       
    //                }
    //                if (CountInvoice == 0)
    //                {
    //                    Color = Color == 0 ? 1 : 0;
    //                }
    //            }
    //        }
    //    }
    //}
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        TakeAction(6, "Add from GSTR-2");
    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        TakeAction(7, "Add from GSTR-2");

    }
    protected void Gridb2bur_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
        
    }
}