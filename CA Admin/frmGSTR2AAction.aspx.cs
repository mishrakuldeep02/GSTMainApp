using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGSTR2AAction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if(!IsPostBack)
        {
            FillGRID();
        }
    }
    void FillGRID()
    {
        DataSet ds = CLSCommon.CallApiGet("api/GSTR2AAction/GetGSTR2AData?ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString());
        grdMismatch.DataSource = ds.Tables[0];
        grdMismatch.DataBind();
        lblTotalInvoice.Text = ds.Tables[2].Rows[0]["TotalInvoices"].ToString();
        lblPendingInvoice.Text = ds.Tables[3].Rows[0]["Pending"].ToString();
        lblActionTaken.Text = ds.Tables[1].Rows[0]["ActionTakenCount"].ToString();
        lblAccepted.Text = ds.Tables[4].Rows[0]["TotalAccept"].ToString();
        lblRejected.Text = ds.Tables[4].Rows[0]["TotalReject"].ToString();
        lblModify.Text = ds.Tables[4].Rows[0]["TotalModify"].ToString();
        lblPending.Text = ds.Tables[4].Rows[0]["TotalPending"].ToString();
        lblDelete.Text = ds.Tables[4].Rows[0]["TotalDelete"].ToString();
    }
    protected void grdMismatch_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    int CountInvoice = 0;
    int Color = 0;
    protected void grdMismatch_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            int Index = e.Row.RowIndex;
            int RowNo = int.Parse(grdMismatch.DataKeys[Index].Values[1].ToString());
            int ActionCode = int.Parse(grdMismatch.DataKeys[Index].Values[3].ToString());
            string CssClass=((Label)e.Row.FindControl("lblInvoiceNo")).Text.Replace("/", "").Replace("-", "");
            int OrderRows = int.Parse(grdMismatch.DataKeys[Index].Values[4].ToString());
         //   CheckBox chk = (CheckBox)e.Row.FindControl("chkSelect");
            //if(OrderRows==1)
            //{
            //   // e.Row.BackColor = ColorTranslator.FromHtml("#d6d9dc");
            //   // e.Row.CssClass = "lightgray";
            //}else
            //{
            //  //  e.Row.BackColor = ColorTranslator.FromHtml("#ccdbea");
            //    e.Row.CssClass = "lightgreen";
            //}
            if (RowNo == 1)
            {
                CountInvoice = int.Parse(grdMismatch.DataKeys[Index].Values[2].ToString());
                e.Row.Cells[0].RowSpan = CountInvoice;
            }
            else
            {
                e.Row.Cells[0].Visible = false;
            }
            if(ActionCode!=0)
            {
                e.Row.Cells[0].Enabled = false;
            }
            if(ActionCode==1)
            {
                CssClass += " tr-success";
                e.Row.CssClass = CssClass;
            }else if(ActionCode==2)
            {
                CssClass += " tr-primary";
                e.Row.CssClass = CssClass;
            }
            else if(ActionCode==3)
            {
                CssClass += " tr-info";
                e.Row.CssClass = CssClass;
            }
            
            else if(ActionCode==4)
            {
                CssClass += " tr-warning";
                e.Row.CssClass = CssClass;
            }

            else if (ActionCode == 5)
            {
                CssClass += " tr-danger";
                e.Row.CssClass = CssClass;
            }
            else
            {

                if (RowNo == 1)
                {
                    CountInvoice = int.Parse(grdMismatch.DataKeys[Index].Values[2].ToString());

                    e.Row.Cells[0].RowSpan = CountInvoice;
                    //e.Row.Cells[1].RowSpan = CountInvoice;
                    //e.Row.Cells[2].RowSpan = CountInvoice;
                    //e.Row.Cells[3].RowSpan = CountInvoice;
                    //e.Row.Cells[4].RowSpan = CountInvoice;
                    if (Color == 0)
                    {
                     //   e.Row.BackColor = ColorTranslator.FromHtml("#d6d9dc");
                        CssClass += " lightgray";
                        e.Row.CssClass = CssClass;
                        // Color clr = ColorTranslator.FromHtml() 
                    }
                    else
                    {
                        CssClass += " lightgreen";
                        e.Row.CssClass = CssClass;
                       // e.Row.BackColor = ColorTranslator.FromHtml("#ccdbea");
                    }
                    CountInvoice--;
                    if (CountInvoice == 0)
                    {
                        Color = Color == 0 ? 1 : 0;
                    }
                }
                else
                {
                    e.Row.Cells[0].Visible = false;
                    //e.Row.Cells[1].Visible = false;
                    //e.Row.Cells[2].Visible = false;
                    //e.Row.Cells[3].Visible = false;
                    //e.Row.Cells[4].Visible = false;
                    CountInvoice--;
                    if (Color == 0)
                    {
                        CssClass += " lightgray";
                        e.Row.CssClass = CssClass;
                       // e.Row.BackColor = ColorTranslator.FromHtml("#d6d9dc");
                    }
                    else
                    {
                        CssClass += " lightgreen";
                        e.Row.CssClass = CssClass;
                       // e.Row.BackColor = ColorTranslator.FromHtml("#ccdbea");
                    }
                    if (CountInvoice == 0)
                    {
                        Color = Color == 0 ? 1 : 0;
                    }
                }
            }
        }
    }
    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
         CheckBox chk = (CheckBox)sender;
         GridViewRow gvr = (GridViewRow)chk.NamingContainer;
         int RowIndex = gvr.RowIndex;
         int InvoiceCount = int.Parse( grdMismatch.DataKeys[RowIndex][2].ToString());
        if(chk.Checked)
        {
            //gvr.CssClass = "highlight_tr";
            for(int i=RowIndex;i<RowIndex+InvoiceCount;i++)
            {
                grdMismatch.Rows[i].CssClass = "highlight_tr";
            }
        }else
        {
            for (int i = RowIndex; i < RowIndex + InvoiceCount; i++)
            {
                grdMismatch.Rows[i].CssClass = "";
            }
        }
        int CheckedCount = 0;
        foreach(GridViewRow Row in grdMismatch.Rows)
        {
            CheckBox chks = (CheckBox)Row.FindControl("chkSelect");
            if(chks.Checked)
            {
                CheckedCount++;
            }
        }
        lblSelected.Text = "<i class='fa fa-check'></i> "+CheckedCount.ToString()+" Invoice Selected.";
        chk.Focus();
        if(CheckedCount==0)
        {
            divbtn.Visible = false;
        }else
        {
            divbtn.Visible = true;
        }
    }
    void TakeAction(int ActionCode,string ActionDesc)
    {
        PL_GSTR2AAction objpl=new PL_GSTR2AAction();
        objpl.Ind=2;
        objpl.ClientCode=int.Parse( Session["ClientCode"].ToString());
        objpl.ClientCodeOdp=int.Parse( Session["ClientCodeOdp"].ToString());
        objpl.GSTIN=Session["ClientGSTNNO"].ToString();
        objpl.MonthCD=int.Parse(Session["MonthYrCode"].ToString());
        objpl.ActionCode=ActionCode;
        objpl.ActionDesc=ActionDesc;
        objpl.UserCode=int.Parse(Session["UserCode"].ToString());
        DataTable dt=new DataTable();
        dt.Columns.Add("InvoiceNumber");
        objpl.dt = dt;
        int Rowindex=0;
        foreach(GridViewRow gvr in grdMismatch.Rows)
        {
            CheckBox chk=(CheckBox)gvr.FindControl("chkSelect");
            Label lblInvoiceNo=(Label)gvr.FindControl("lblInvoiceNo");
            if(chk.Checked)
            {
                dt.Rows.Add();
                dt.Rows[Rowindex][0]=lblInvoiceNo.Text;
                Rowindex++;
            }
        }
        DataSet dsres = CLSCommon.CallApiPostDS("api/GSTR2AAction/TakeAction", objpl);
        if(dsres!=null)
        {
            pnlMsg.Visible = true;
            lblMEssage.Text = "Action Taken Successfully On "+dt.Rows.Count.ToString()+" Invoices.";
            grdMismatch.DataSource = dsres.Tables[0];
            grdMismatch.DataBind();
            lblTotalInvoice.Text = dsres.Tables[2].Rows[0]["TotalInvoices"].ToString();
            lblPendingInvoice.Text = dsres.Tables[3].Rows[0]["Pending"].ToString();
            lblActionTaken.Text = dsres.Tables[1].Rows[0]["ActionTakenCount"].ToString();
            lblAccepted.Text = dsres.Tables[4].Rows[0]["TotalAccept"].ToString();
            lblRejected.Text = dsres.Tables[4].Rows[0]["TotalReject"].ToString();
            lblModify.Text = dsres.Tables[4].Rows[0]["TotalModify"].ToString();
            lblPending.Text = dsres.Tables[4].Rows[0]["TotalPending"].ToString();
            lblDelete.Text = dsres.Tables[4].Rows[0]["TotalDelete"].ToString();
        }
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        TakeAction(1, "Accept");
    }
    protected void btnReject_Click(object sender, EventArgs e)
    {
        TakeAction(2, "Reject");
    }
    protected void btnModify_Click(object sender, EventArgs e)
    {
        TakeAction(3, "Modify");
    }
    protected void btnPending_Click(object sender, EventArgs e)
    {
        TakeAction(4, "pending");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        TakeAction(5, "Delete");
    }
}