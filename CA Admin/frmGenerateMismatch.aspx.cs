using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
public partial class CA_Admin_frmGenerateMismatch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.ClientCheckSessionClient();
        CLSCommon.CACheckSession();
        if(!IsPostBack)
        {
            ddlMismatchType.Visible = false;
            
        } GetGSTr2Count();
        ScriptManager _scriptMan = ScriptManager.GetCurrent(this);
        _scriptMan.AsyncPostBackTimeout = 36000;
    }

    void GetGSTr2Count()
    {
         DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
         DataSet ds = CLSCommon.CallApiGet("api/GenerateMismatch/GetGstr2Count?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCd=" + Session["MonthYrCode"].ToString());
        if(ds!=null)
        {
            btnGSTR2A.Attributes.Remove("class");
            btnPurchaseData.Attributes.Remove("class");
            iGSTR2a.Attributes.Remove("class");
            iPurchase.Attributes.Remove("class");
            if(int.Parse( ds.Tables[0].Rows[0]["GSTR2ACount"].ToString())>0)
            {
                btnGSTR2A.Attributes.Add("class", "btn btn-success");
                iGSTR2a.Attributes.Add("class", "fa fa-check");
            }else
            {
                btnGSTR2A.Attributes.Add("class", "btn btn-danger");
                iGSTR2a.Attributes.Add("class", "fa fa-info");
            }


            if (int.Parse(ds.Tables[0].Rows[0]["PurchaseCount"].ToString()) > 0)
            {
                btnPurchaseData.Attributes.Add("class", "btn btn-success");
                iPurchase.Attributes.Add("class", "fa fa-check");
            }
            else
            {
                btnPurchaseData.Attributes.Add("class", "btn btn-danger");
                iPurchase.Attributes.Add("class", "fa fa-info");
            }
            if(int.Parse( ds.Tables[0].Rows[0]["GSTR2ACount"].ToString())>0&&int.Parse(ds.Tables[0].Rows[0]["PurchaseCount"].ToString()) > 0)
            {
                
                btnGenerateMismatch.Visible = true;

            }else
            {
                btnGenerateMismatch.Visible = false;
            }
        }
    }

    void ShowFigure(int Ind)
    {
       // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        DataSet ds = CLSCommon.CallApiGet("api/GenerateMismatch/GenerateMismatch?Ind=" + Ind.ToString()+ "&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCd=" + Session["MonthYrCode"].ToString() + "&CACode=" + Session["CACode"].ToString() + "&CACodeOdp=" + Session["CACodeOdp"].ToString());
        if (ds != null)
        {
            ddlMismatchType.DataSource = ds.Tables[4];
            ddlMismatchType.DataValueField = "MismatchCode";
            ddlMismatchType.DataTextField = "MismatchDesc";
            ddlMismatchType.DataBind();
            ddlMismatchType.Items.Insert(0,new ListItem( "All","0"));

            if (ds.Tables[0].Rows[0]["result"].ToString() == "99")
            {
                lblMsg.Text = "GSTR 2 Mismatch Generated Successfully.";
                pnlMismatch.Visible = true;
                lblTotalInvoicePurchaseData.Text = ds.Tables[1].Rows[0]["PurchaseCount"].ToString();
                lblGSTR2AData.Text = ds.Tables[2].Rows[0]["GSTR2ACount"].ToString();
                lblReconcileData.Text = ds.Tables[3].Rows[0]["ActionTakenRecocile"].ToString() + "/" + ds.Tables[3].Rows[0]["FullMatching"].ToString();
                lblProbablyCount.Text = ds.Tables[3].Rows[0]["ActionTakenProbably"].ToString() + "/" + ds.Tables[3].Rows[0]["ProbablyCount"].ToString();
                if (ds.Tables[3].Rows[0]["ActionTakenRecocile"].ToString() == ds.Tables[3].Rows[0]["FullMatching"].ToString())
                {
                    lblReconcileData.CssClass = "text-success";
                }
                if (ds.Tables[3].Rows[0]["Additional2AActionTaken"].ToString() == ds.Tables[3].Rows[0]["Additional2A"].ToString())
                {
                    lblAddtional2AData.CssClass = "text-success";
                }else
                {
                    lblAddtional2AData.CssClass = "text-danger";
                }
                lblAddtional2AData.Text = ds.Tables[3].Rows[0]["Additional2AActionTaken"].ToString() + "/" + ds.Tables[3].Rows[0]["Additional2A"].ToString();
                if (ds.Tables[3].Rows[0]["AddPurchaseDataActionTaken"].ToString() == ds.Tables[3].Rows[0]["AddPurchaseData"].ToString())
                {
                    lblAddtionalInPurchaseData.CssClass = "text-success";
                }
                else
                {
                    lblAddtionalInPurchaseData.CssClass = "text-danger";
                }

                lblb2bur.Text = ds.Tables[3].Rows[0]["actiontakenb2bur"].ToString() + "/" + ds.Tables[3].Rows[0]["b2burcount"].ToString();
                if (ds.Tables[3].Rows[0]["actiontakenb2bur"].ToString() == ds.Tables[3].Rows[0]["b2burcount"].ToString())
                {
                    lblb2bur.CssClass = "text-success";
                }
                else
                {
                    lblb2bur.CssClass = "text-danger";
                }

                lblAddtionalInPurchaseData.Text = ds.Tables[3].Rows[0]["AddPurchaseDataActionTaken"].ToString() + "/" + ds.Tables[3].Rows[0]["AddPurchaseData"].ToString();

                if (ds.Tables[3].Rows[0]["MismatchCaseActinTaken"].ToString() == ds.Tables[3].Rows[0]["MismatchCase"].ToString())
                {
                    lblMismatchInvoice.CssClass = "text-success";
                }
                else
                {
                    lblMismatchInvoice.CssClass = "text-danger";
                }

                if (ds.Tables[3].Rows[0]["ActionTakenProbably"].ToString() == ds.Tables[3].Rows[0]["ProbablyCount"].ToString())
                {
                    lblProbablyCount.CssClass = "text-success";
                }
                else
                {
                    lblProbablyCount.CssClass = "text-danger";
                }
                lblMismatchInvoice.Text = ds.Tables[3].Rows[0]["MismatchCaseActinTaken"].ToString() + "/" + ds.Tables[3].Rows[0]["MismatchCase"].ToString();
            }
            else
            {

            }
        }
    }

    protected void btnGenerateMismatch_Click(object sender, EventArgs e)
    {
        ShowFigure(1);
    }

    void ShowMismatch()
    {

       // DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        int ind = 0;
        if (chkAdditionalPurchase.Checked)
        {
            ind = 2;

            divSelectAll.Visible = false;
            divButton.Visible = false;
        }
        else if (chkMismatchInvoice.Checked)
        {
            ind = 1;

            divSelectAll.Visible = false;
            divButton.Visible = false;
        }
        else if (chkAdditionalIn2A.Checked)
        {
            ind = 3;

            divSelectAll.Visible = false;
            divButton.Visible = false;
        }
        else if (chkReconcile.Checked)
        {
            ind = 4;
            divSelectAll.Visible = true;
            divButton.Visible = true;
        }else if(rdbb2bur.Checked)
        {
            ind = 5;
            divSelectAll.Visible = true;
            divButton.Visible = true;
        }else if(rdbProbably.Checked)
        {
            ind = 6;
            divSelectAll.Visible = false;
            divButton.Visible = false;
        }
        else
        {
            divSelectAll.Visible = false;
            divButton.Visible = false;
            lblMsg.Text = "Please Select Option To Display Summary.";
            return;
        }
        DataSet ds = CLSCommon.CallApiGet("api/GenerateMismatch/GetMismatch?Ind=" + ind.ToString() + "&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCd=" + Session["MonthYrCode"].ToString() + "&CACode=" + Session["CACode"].ToString() + "&CACodeOdp=" + Session["CACodeOdp"].ToString() + "&MismatchTypeCode=" + ddlMismatchType.SelectedValue.ToString());
        if (ds != null)
        {
            grdMismatch.DataSource = ds.Tables[0];
            grdMismatch.DataBind();
            if(ds.Tables[0].Rows.Count<=0)
            {
                divSelectAll.Visible = false;
                divButton.Visible = false;
            }
        }
    }

    protected void btnShowMismatch_Click(object sender, EventArgs e)
    {
        chkSelectAll.Checked = false;
        ShowMismatch();
    }

    int CountInvoice = 0;
    int Color = 0;
    protected void grdMismatch_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            int Index = e.Row.RowIndex;
            if (chkReconcile.Checked||rdbb2bur.Checked)
            {
                Panel pnlRecocile = (Panel)e.Row.FindControl("pnlRecocile");
                Panel pnlMismatch = (Panel)e.Row.FindControl("pnlAdditional");
                pnlRecocile.Visible = true;
                pnlMismatch.Visible = false;
            }else
            if (chkAdditionalPurchase.Checked)
            {
                Panel pnlPurchase = (Panel)e.Row.FindControl("pnlPurchase");
                pnlPurchase.Visible = true;
            }else if(chkAdditionalIn2A.Checked)
            {
                Panel pnl2A = (Panel)e.Row.FindControl("pnl2A");
                pnl2A.Visible = true;
            }else if(chkMismatchInvoice.Checked)
            {
                Panel pnlMismatch = (Panel)e.Row.FindControl("pnlMismatch");
                pnlMismatch.Visible = true;
                
            }else if(rdbProbably.Checked)
            {
                Panel pnlProbable = (Panel)e.Row.FindControl("pnlProbable");
                pnlProbable.Visible = true;
            }
            int RowNo = int.Parse(grdMismatch.DataKeys[Index].Values[10].ToString());
            int InvoiceInd=int.Parse(grdMismatch.DataKeys[Index][0].ToString());
            int InvoiceDateInd = int.Parse(grdMismatch.DataKeys[Index][1].ToString());
            int InvoiceValueInd = int.Parse(grdMismatch.DataKeys[Index][2].ToString());
            int RateInd = int.Parse(grdMismatch.DataKeys[Index][3].ToString());
            int TaxableValueInd = int.Parse(grdMismatch.DataKeys[Index][4].ToString());
            int IGSTInd = int.Parse(grdMismatch.DataKeys[Index][5].ToString());
            int CGSTInd = int.Parse(grdMismatch.DataKeys[Index][6].ToString());
            int SGSTInd = int.Parse(grdMismatch.DataKeys[Index][7].ToString());
            int CessInd = int.Parse(grdMismatch.DataKeys[Index][8].ToString());
            if (RowNo == 1 )
            {
                CountInvoice = int.Parse(grdMismatch.DataKeys[Index].Values[11].ToString());
                e.Row.Cells[29].RowSpan = CountInvoice;
                if(Color==0)
                {
                    e.Row.BackColor = ColorTranslator.FromHtml("#d6d9dc");
                   // Color clr = ColorTranslator.FromHtml() 
                }else
                {
                    e.Row.BackColor = ColorTranslator.FromHtml("#ccdbea"); 
                }
                CountInvoice--;
                if (CountInvoice == 0)
                {
                    Color = Color == 0 ? 1 : 0;
                }
            }
            else
            {
                e.Row.Cells[29].Visible = false;
                CountInvoice--;
                if (Color == 0)
                {
                    e.Row.BackColor = ColorTranslator.FromHtml("#d6d9dc");
                }
                else
                {
                    e.Row.BackColor = ColorTranslator.FromHtml("#ccdbea"); 
                }
                if(CountInvoice==0)
                {
                    Color = Color == 0 ? 1 : 0;
                }
            }

                if (InvoiceInd == 1)
                {
                    e.Row.Cells[2].CssClass ="text-right txt-mismatch";
                }
            if(InvoiceDateInd==1)
            {
                e.Row.Cells[3].CssClass ="text-right txt-mismatch";
            }

            if (InvoiceValueInd == 1)
            {
                e.Row.Cells[4].CssClass ="text-right txt-mismatch";
            }

            if (RateInd == 1)
            {
                e.Row.Cells[5].CssClass ="text-right txt-mismatch";
            }

            if (TaxableValueInd == 1)
            {
                e.Row.Cells[6].CssClass ="text-right txt-mismatch";
            }

            if (IGSTInd == 1)
            {
                e.Row.Cells[7].CssClass ="text-right txt-mismatch";
            }

            if (CGSTInd == 1)
            {
                e.Row.Cells[8].CssClass ="text-right txt-mismatch";
            }

            if (SGSTInd == 1)
            {
                e.Row.Cells[9].CssClass ="text-right txt-mismatch";
            }

            if (CessInd == 1)
            {
                e.Row.Cells[10].CssClass= "text-right txt-mismatch";
            }
        }
    }

    void SaveMismatchAction(int ind, Int64 recordNo, int ActionId, string ActionDesc, string invoiceNo, Int64 RecordNo2A, DataTable dtinv, string PurchGSTIN, string G2APurchGSTIN, string G2AinvoiceNo)
    {
        //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        PL_GenerateMismatch objpl = new PL_GenerateMismatch();
        objpl.Ind = ind;
        objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
        objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
        objpl.GSTIN = Session["ClientGSTNNO"].ToString();
        objpl.MonthCd = int.Parse(Session["MonthYrCode"].ToString());
        objpl.ActionId = ActionId;
        objpl.ActionDesc = ActionDesc;
        objpl.RecordNo = recordNo;
        objpl.UserCode = int.Parse(Session["UserCode"].ToString());
        objpl.InvoiceNo = invoiceNo;
        objpl.RecordNo2A = RecordNo2A;
        objpl.dtInvoice = dtinv;
        objpl.PurchGSTIN = PurchGSTIN;
        objpl.G2APurchGSTIN = G2APurchGSTIN;
        objpl.G2AInvoiceNo = G2AinvoiceNo;
        DataTable dt = CLSCommon.CallApiPost("api/GenerateMismatch/SaveMismatchAction",objpl);
        if(dt!=null)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                lblActinLabel.Text = "Action Taken Successfully.";
                lblActinLabel.CssClass = "text-success";
            }else
            {
                lblActinLabel.Text = "Invoice Already Available In GSTR-2.";
                lblActinLabel.CssClass = "text-danger";
            }
        }
    }
    DataTable dt = new DataTable();
    protected void grdMismatch_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int RowIndex = Convert.ToInt32(e.CommandArgument.ToString());
        Int64 recordNo =Convert.ToInt64(grdMismatch.DataKeys[RowIndex][9].ToString());
        string invoiceNo=((Label)grdMismatch.Rows[RowIndex+1].FindControl("lblInvoiceNo")).Text;
        string PurchGSTIN = ((Label)grdMismatch.Rows[RowIndex+1].FindControl("lblPurchGSTIN")).Text;
        string G2AinvoiceNo = ((Label)grdMismatch.Rows[RowIndex].FindControl("lblInvoiceNo")).Text;
        string G2APurchGSTIN = ((Label)grdMismatch.Rows[RowIndex].FindControl("lblPurchGSTIN")).Text;
        Int64 RecordNo2A = 0;
        
        if(e.CommandName=="Correct")
        {
            SaveMismatchAction(1, recordNo, 1, "Add To GSTR-2", invoiceNo, 0, dt, PurchGSTIN,"","");
        }else if(e.CommandName=="InCorrect")
        {
            SaveMismatchAction(1, recordNo, 2, "Error In Purchase Data 2A Data Is Correct", invoiceNo, 0, dt, PurchGSTIN, "", "");
        }else 
        
            
            if(e.CommandName=="Accept")
        {
            SaveMismatchAction(2, recordNo, 3, "Accept Data In 2A", invoiceNo, 0, dt, PurchGSTIN, "", "");
        }else if(e.CommandName=="Reject")
        {
            SaveMismatchAction(2, recordNo, 4, "Reject Data In 2A", invoiceNo, 0, dt, PurchGSTIN, "", "");

        }else if(e.CommandName=="Pending")
        {
            SaveMismatchAction(2, recordNo, 5, "Pending", invoiceNo, 0, dt, PurchGSTIN, "", "");

        }
         
         
         else if(e.CommandName=="MisAccept")
        {
            SaveMismatchAction(3, recordNo, 6, "Accept Data In 2A", invoiceNo, RecordNo2A, dt, PurchGSTIN, "", "");
        }
        else if (e.CommandName == "Modify")
        {
            SaveMismatchAction(3, recordNo, 7, "Modify 2A Data With My Data (My Data Is Correct)", invoiceNo, RecordNo2A, dt, PurchGSTIN, "", "");
        }
            else if (e.CommandName == "ProbableAccept")
            {
                SaveMismatchAction(6, recordNo, 10, "Accept Data From 2A", invoiceNo, RecordNo2A, dt, PurchGSTIN,G2APurchGSTIN,G2AinvoiceNo);
            }
        ShowMismatch();
        ShowFigure(2);
    }
    protected void chkReconcile_CheckedChanged(object sender, EventArgs e)
    {
        lblMismatchType.Text = "(B2B) Reconcile Records (Full Matching) :";
        ddlMismatchType.Visible = false;
    }
    protected void chkAdditionalIn2A_CheckedChanged(object sender, EventArgs e)
    {
        lblMismatchType.Text = "(B2B) Additional in 2A DATA :";
        ddlMismatchType.Visible = false;
    }
    protected void chkAdditionalPurchase_CheckedChanged(object sender, EventArgs e)
    {
        lblMismatchType.Text = "(B2B) Additional in Purchase DATA :";
        ddlMismatchType.Visible = false;
    }
    protected void chkMismatchInvoice_CheckedChanged(object sender, EventArgs e)
    {
        lblMismatchType.Text = "(B2B) Mismatch Invoice :";
        ddlMismatchType.Visible = true;
    }
    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
            foreach (GridViewRow gvr in grdMismatch.Rows)
            {
                CheckBox chk = (CheckBox)gvr.FindControl("chkSelect");
                chk.Checked = chkSelectAll.Checked;
                if (chkSelectAll.Checked)
                {
                    gvr.CssClass = gvr.CssClass + " highlight_tr";
                }else
                {
                    gvr.CssClass = gvr.CssClass.Replace(" highlight_tr","");
                }
            }
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        if (chkReconcile.Checked)
        {
            if (chkSelectAll.Checked)
            {
                dt = new DataTable();
                dt.Columns.Add("InvoiceNumber");
                dt.Columns.Add("PurchGSTIN");
                dt.Columns.Add("UniqueNo");
                int index = 0;
                foreach (GridViewRow gvr in grdMismatch.Rows)
                {
                    if (((CheckBox)gvr.FindControl("chkSelect")).Checked)
                    {
                        dt.Rows.Add();
                        dt.Rows[index]["UniqueNo"] = grdMismatch.DataKeys[gvr.RowIndex][9].ToString();//((Label)gvr.FindControl("lblInvoiceNo")).Text;
                       // dt.Rows[index]["PurchGSTIN"] = ((Label)gvr.FindControl("lblPurchGSTIN")).Text;
                        index++;
                    }
                }
                SaveMismatchAction(4, 0, 8, "Accept Data From 2A", "", 0, dt, "","","");
            }
        }
        if(rdbb2bur.Checked)
        {
            if (chkSelectAll.Checked)
            {
                dt = new DataTable();
                dt.Columns.Add("InvoiceNumber");
                dt.Columns.Add("PurchGSTIN");
                dt.Columns.Add("UniqueNo");
                int index = 0;
                foreach (GridViewRow gvr in grdMismatch.Rows)
                {
                    if (((CheckBox)gvr.FindControl("chkSelect")).Checked)
                    {
                        dt.Rows.Add();
                        dt.Rows[index]["UniqueNo"] = grdMismatch.DataKeys[gvr.RowIndex][9].ToString();
                        index++;
                    }
                }
                SaveMismatchAction(5, 0, 8, "Accept Data From 2A", "", 0, dt, "","","");
            }
        }
        ShowMismatch();
        ShowFigure(2);
        chkSelectAll.Checked = false;
    }
    protected void rdbb2bur_CheckedChanged(object sender, EventArgs e)
    {
        lblMismatchType.Text = "B2B Unregistered Supplies :";
        ddlMismatchType.Visible = false;
    }
    protected void rdbProbably_CheckedChanged(object sender, EventArgs e)
    {
        lblMismatchType.Text = "B2B Probably Matched Invoice :";
        ddlMismatchType.Visible = false;
    }
}