using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CA_Admin_frmGSTR2Summary_design : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlDataAdapter da;
    SqlDataReader dr;
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CACheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
            GetGstr2SummaryTotal();
        }
    }
    private void GetGstr2SummaryTotal()
    {
        DataSet ds = new DataSet();
        ds = CLSCommon.CallApiGet("api/GSTR2Action/GetSGTR2TotalSummary?ind=12&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString());

        if (ds != null && ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblB2bTotInvo.Text = ds.Tables[0].Rows[0]["TotalInvoiceValue"].ToString();
                lblB2bTotTax.Text = ds.Tables[0].Rows[0]["TotalTaxableValue"].ToString();
                lblB2bTotITC.Text = ds.Tables[0].Rows[0]["TotalITC"].ToString();
                lblB2bTotInvoRow.Text = ds.Tables[0].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblB2bTotInvo.Text ="0";
                lblB2bTotTax.Text = "0";
                lblB2bTotITC.Text = "0";
                lblB2bTotInvoRow.Text = "0";
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                lblB2burTotInvo.Text = ds.Tables[1].Rows[0]["TotalInvoiceValue"].ToString();
                lblB2burTotTax.Text = ds.Tables[1].Rows[0]["TotalTaxableValue"].ToString();
                lblB2burTotITC.Text = ds.Tables[1].Rows[0]["TotalITC"].ToString();
                lblB2burTotInvoRow.Text = ds.Tables[1].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblB2burTotInvo.Text ="0";
                lblB2burTotTax.Text = "0";
                lblB2burTotITC.Text = "0";
                lblB2burTotInvoRow.Text = "0";
            }

            if (ds.Tables[2].Rows.Count > 0)
            {
                lblImpsTotInvo.Text = ds.Tables[2].Rows[0]["TotalInvoiceValue"].ToString();
                lblImpsTotTax.Text = ds.Tables[2].Rows[0]["TotalTaxableValue"].ToString();
                lblImpsTotITC.Text = ds.Tables[2].Rows[0]["TotalITC"].ToString();
                lblImpsTotInvoRow.Text = ds.Tables[2].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblImpsTotInvo.Text ="0";
                lblImpsTotTax.Text = "0";
                lblImpsTotITC.Text = "0";
                lblImpsTotInvoRow.Text = "0";
            }

            if (ds.Tables[3].Rows.Count > 0)
            {
                lblImpgTotInvo.Text = ds.Tables[3].Rows[0]["TotalInvoiceValue"].ToString();
                lblImpgTotTax.Text = ds.Tables[3].Rows[0]["TotalTaxableValue"].ToString();
                lblImpgTotITC.Text = ds.Tables[3].Rows[0]["TotalITC"].ToString();
                lblImpgTotInvoRow.Text = ds.Tables[3].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblImpgTotInvo.Text ="0";
                lblImpgTotTax.Text = "0";
                lblImpgTotITC.Text = "0";
                lblImpgTotInvoRow.Text = "0";
            }


            if (ds.Tables[4].Rows.Count > 0)
            {
                lblCdnrTotNoteRefVoucherValue.Text = ds.Tables[4].Rows[0]["TotalNoteRefVoucherValue"].ToString();
                lblCdnrTotTax.Text = ds.Tables[4].Rows[0]["TotalTaxableValue"].ToString();
                lblCdnrTotITC.Text = ds.Tables[4].Rows[0]["TotalITC"].ToString();
                lblCdnrTotInvoRow.Text = ds.Tables[4].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblCdnrTotNoteRefVoucherValue.Text ="0";
                lblCdnrTotTax.Text ="0";
                lblCdnrTotITC.Text = "0";
                lblCdnrTotInvoRow.Text = "0";
            }


            if (ds.Tables[5].Rows.Count > 0)
            {
                lblCdnurTotNoteRefVoucherValue.Text = ds.Tables[5].Rows[0]["TotalNoteRefVoucherValue"].ToString();
                lblCdnurTotTax.Text = ds.Tables[5].Rows[0]["TotalTaxableValue"].ToString();
                lblCdnurTotITC.Text = ds.Tables[5].Rows[0]["TotalITC"].ToString();
                lblCdnurTotInvoRow.Text = ds.Tables[5].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblCdnurTotNoteRefVoucherValue.Text ="0";
                                lblCdnurTotTax.Text ="0";
                                lblCdnurTotITC.Text = "0";
                lblCdnurTotInvoRow.Text = "0";
            }

            if (ds.Tables[6].Rows.Count > 0)
            {
                lblAtGrossAdv.Text = ds.Tables[6].Rows[0]["TotalAdvPaid"].ToString();
                lblAtTotalCESS.Text = ds.Tables[6].Rows[0]["TotalCESS"].ToString();
                lblatTotRow.Text = ds.Tables[6].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblatTotRow.Text = "0";
                lblAtGrossAdv.Text =  "0";
                lblAtTotalCESS.Text = "0";
            }


            if (ds.Tables[7].Rows.Count > 0)
            {
                lblAtAdjGrossAdv.Text = ds.Tables[7].Rows[0]["TotalAdvPaid"].ToString();
                lblAtadjTotalCESS.Text = ds.Tables[7].Rows[0]["TotalCESS"].ToString();
                lblatadjTotRow.Text = ds.Tables[7].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblAtAdjGrossAdv.Text = "0";
                lblAtadjTotalCESS.Text = "0";
                lblatadjTotRow.Text = "0";

            }


            if (ds.Tables[8].Rows.Count > 0)
            {
                lblExempCompTax.Text = ds.Tables[8].Rows[0]["TotalCompositionTax"].ToString();
                lblExempTotalNilRatedTax.Text = ds.Tables[8].Rows[0]["TotalNilRatedTax"].ToString();
                lblExempTotalNonGSTTax.Text = ds.Tables[8].Rows[0]["TotalNonGSTTax"].ToString();
                lblexempTotRow.Text = ds.Tables[8].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                         lblExempCompTax.Text = "0";
                lblExempTotalNilRatedTax.Text = "0";
                lblExempTotalNonGSTTax.Text = "0";
                lblexempTotRow.Text = "0";
            }


            if (ds.Tables[9].Rows.Count > 0)
            {
                lblItcrTotalITC.Text = ds.Tables[9].Rows[0]["TotalITC"].ToString();
                lblitcrTotRow.Text = ds.Tables[9].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblItcrTotalITC.Text = "0";
                lblitcrTotRow.Text = "0";

            }


            if (ds.Tables[10].Rows.Count > 0)
            {
                lblHsnTotalQuantity.Text = ds.Tables[10].Rows[0]["TotalQuantity"].ToString();
                lblHsnTotalTaxableValue.Text = ds.Tables[10].Rows[0]["TotalTaxableValue"].ToString();
                lblHsnTotalValue.Text = ds.Tables[10].Rows[0]["TotalValue"].ToString();
                lblhsnTotRow.Text = ds.Tables[10].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                     lblHsnTotalQuantity.Text ="0";
                lblHsnTotalTaxableValue.Text = "0";
                lblHsnTotalValue.Text = "0";
                lblhsnTotRow.Text = "0";
            }

        }

    }
}