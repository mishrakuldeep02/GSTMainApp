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
            //DataSet ds1 = CLSCommon.CallApiGet("api/ImportTaxPayerData/FillMonthYear?Ind=1");

            //DropDownList ddl = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
            //ddl.DataSource = ds1.Tables[0];
            //ddl.DataTextField = "MonthYearDesc";
            //ddl.DataValueField = "MonthYrCode";
            //ddl.DataBind();
        } GetGSTR2Data();
    }
    void GetGSTR2Data()
    {
        //  DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        DataSet ds1 = CLSCommon.CallApiGet("api/PurchaseData/GetPurchaseData?ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString() + "&ClientGSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCode=" + Session["MonthYrCode"].ToString());

        // For display b2b

        if (ds1 != null)
        {
            if(ds1.Tables[0].Rows.Count>0)
            {
                GrdTable3.DataSource = ds1.Tables[0];
                GrdTable3.DataBind();
            }
            else
            {

                GrdTable3.DataSource =null;
                GrdTable3.DataBind();
            }
            if (ds1.Tables[1].Rows.Count > 0)
            {
                lblb2bTotalInvoice.Text = ds1.Tables[1].Rows[0]["TotalInvoice"].ToString();
                lblb2bInvoiceValue.Text = ds1.Tables[1].Rows[0]["TotalInvoiceValue"].ToString();
                lblb2bTaxableValue.Text = ds1.Tables[1].Rows[0]["TotalTaxableValue"].ToString();

                lblb2bIGST.Text = ds1.Tables[1].Rows[0]["TotalIGST"].ToString();
                lblb2bCGST.Text = ds1.Tables[1].Rows[0]["TotalCGST"].ToString();
                lblb2bSGST.Text = ds1.Tables[1].Rows[0]["TotalSGST"].ToString();
                lblb2bCess.Text = ds1.Tables[1].Rows[0]["TotalCESS"].ToString();

                lblb2bITCIGST.Text = ds1.Tables[1].Rows[0]["TotalITCIGST"].ToString();
                lblb2bITCCGST.Text = ds1.Tables[1].Rows[0]["TotalITCCGST"].ToString();
                lblb2bITCSGST.Text = ds1.Tables[1].Rows[0]["TotalITCSGST"].ToString();
                lblb2bITCCESS.Text = ds1.Tables[1].Rows[0]["TotalITCCESS"].ToString();
            }else
            {
               lblb2bTotalInvoice.Text ="0";
               lblb2bInvoiceValue.Text ="0";
               lblb2bTaxableValue.Text ="0";
               lblb2bIGST.Text ="0";
               lblb2bCGST.Text ="0";
               lblb2bSGST.Text ="0";
               lblb2bCess.Text ="0";
               lblb2bITCIGST.Text = "0";
               lblb2bITCCGST.Text = "0";
               lblb2bITCSGST.Text = "0";
               lblb2bITCCESS.Text = "0";

            }
           
            


         

            // For display b2bur
            if (ds1.Tables[2].Rows.Count > 0)
            {
                Grd4A.DataSource = ds1.Tables[2];
                Grd4A.DataBind();
            }
            else
            {
                Grd4A.DataSource =null;
                Grd4A.DataBind();
            }


            if (ds1.Tables[3].Rows.Count > 0)
            {
                lblb2burTotalInvoice.Text = ds1.Tables[3].Rows[0]["TotalInvoice"].ToString();
                lblb2burInvoiceValue.Text = ds1.Tables[3].Rows[0]["TotalInvoiceValue"].ToString();
                lblb2burTaxableValue.Text = ds1.Tables[3].Rows[0]["TotalTaxableValue"].ToString();
                lblb2burIGST.Text = ds1.Tables[3].Rows[0]["TotalIGST"].ToString();
                lblb2burCGST.Text = ds1.Tables[3].Rows[0]["TotalCGST"].ToString();
                lblb2burSGST.Text = ds1.Tables[3].Rows[0]["TotalSGST"].ToString();
                lblb2burCESS.Text = ds1.Tables[3].Rows[0]["TotalCESS"].ToString();
                lblb2burITCIGST.Text = ds1.Tables[3].Rows[0]["TotalITCIGST"].ToString();
                lblb2burITCCGST.Text = ds1.Tables[3].Rows[0]["TotalITCCGST"].ToString();
                lblb2burITCSGST.Text = ds1.Tables[3].Rows[0]["TotalITCSGST"].ToString();
                lblb2burITCCESS.Text = ds1.Tables[3].Rows[0]["TotalITCCESS"].ToString();
            }else
            {

               lblb2burTotalInvoice.Text= "0";
               lblb2burInvoiceValue.Text= "0";
               lblb2burTaxableValue.Text= "0";
              lblb2burIGST.Text = "0";
              lblb2burCGST.Text = "0";
              lblb2burSGST.Text = "0";
              lblb2burCESS.Text = "0";
              lblb2burITCIGST.Text = "0";
              lblb2burITCCGST.Text = "0";
              lblb2burITCSGST.Text = "0";
              lblb2burITCCESS.Text = "0";


            }
            // For display imps
            if (ds1.Tables[4].Rows.Count > 0)
            {
                grd5A.DataSource = ds1.Tables[4];
                grd5A.DataBind();
            }
            else
            {
                grd5A.DataSource = null;
                grd5A.DataBind();
            }

            if (ds1.Tables[5].Rows.Count > 0)
            {
                lblIMPSTotalInvoice.Text = ds1.Tables[5].Rows[0]["TotalInvoice"].ToString();
                lblIMPSTotalInvoiceValue.Text = ds1.Tables[5].Rows[0]["TotalInvoiceValue"].ToString();
                lblIMPSTotalTaxableValue.Text = ds1.Tables[5].Rows[0]["TotalTaxableValue"].ToString();

                lblIMPSTotalIGST.Text = ds1.Tables[5].Rows[0]["TotalIGST"].ToString();
                lblIMPSTotalCESS.Text = ds1.Tables[5].Rows[0]["TotalCESS"].ToString();
                lblIMPSTotalITCIGST.Text = ds1.Tables[5].Rows[0]["TotalITCIGST"].ToString();
                lblIMPSTotalITCCESS.Text = ds1.Tables[5].Rows[0]["TotalITCCESS"].ToString();
            }else
            {
               lblIMPSTotalInvoice.Text  ="0";
               lblIMPSTotalInvoiceValue.Text ="0";
               lblIMPSTotalTaxableValue.Text ="0";
               lblIMPSTotalIGST.Text= "0";
               lblIMPSTotalCESS.Text= "0";
               lblIMPSTotalITCIGST.Text = "0";
               lblIMPSTotalITCCESS.Text = "0";

            }

            // For display impg
            if (ds1.Tables[6].Rows.Count > 0)
            {

                Gridimpg.DataSource = ds1.Tables[6];
                Gridimpg.DataBind();
            }
            else
            {
                Gridimpg.DataSource =null;
                Gridimpg.DataBind();
            }

            if (ds1.Tables[7].Rows.Count > 0)
            {
                lblIMPGTotalInvoice.Text = ds1.Tables[7].Rows[0]["TotalInvoice"].ToString();
                lblIMPGTotalInvoiceValue.Text = ds1.Tables[7].Rows[0]["TotalInvoiceValue"].ToString();
                lblIMPGTotalTaxableValue.Text = ds1.Tables[7].Rows[0]["TotalTaxableValue"].ToString();
                lblIMPGTotalIGST.Text = ds1.Tables[7].Rows[0]["TotalIGST"].ToString();
                lblIMPGTotalCESS.Text = ds1.Tables[7].Rows[0]["TotalCESS"].ToString();
                lblIMPGTotalITCIGST.Text = ds1.Tables[7].Rows[0]["TotalITCIGST"].ToString();
                lblIMPGTotalITCCESS.Text = ds1.Tables[7].Rows[0]["TotalITCCESS"].ToString();
            }
            else
            {
                lblIMPGTotalInvoice.Text = "0";
                lblIMPGTotalInvoiceValue.Text = "0";
                lblIMPGTotalTaxableValue.Text = "0";
                lblIMPGTotalIGST.Text = "0";
                lblIMPGTotalCESS.Text = "0";
                lblIMPGTotalITCIGST.Text  = "0";
                lblIMPGTotalITCCESS.Text  = "0";
            }



            //For display cdnr
            if (ds1.Tables[8].Rows.Count > 0)
            {

                lblCdnrTotNoteRefVoucherValue.Text = ds1.Tables[8].Rows[0]["TotalNoteRefVoucherValue"].ToString();
                lblCdnrTotTax.Text = ds1.Tables[8].Rows[0]["TotalTaxableValue"].ToString();
                lblCdnrTotITC.Text = ds1.Tables[8].Rows[0]["TotalITC"].ToString();
                lblCdnrTotInvoRow.Text = ds1.Tables[8].Rows[0]["TotalInvoice"].ToString();
            
            }
            else
            {
                lblCdnrTotNoteRefVoucherValue.Text="0";
                 lblCdnrTotTax.Text ="0";
                 lblCdnrTotITC.Text ="0";
                 lblCdnrTotInvoRow.Text = "0";
            }
            if (ds1.Tables[9].Rows.Count > 0)
            {
                Gridcdnr.DataSource = ds1.Tables[9];
                Gridcdnr.DataBind();
            }
            else
            {
                Gridcdnr.DataSource = null;
                Gridcdnr.DataBind();
            }


            //For display cdnur
            if (ds1.Tables[10].Rows.Count > 0)
            {
                lblCdnurTotNoteRefVoucherValue.Text = ds1.Tables[10].Rows[0]["TotalNoteRefVoucherValue"].ToString();
                lblCdnurTotTax.Text = ds1.Tables[10].Rows[0]["TotalTaxableValue"].ToString();
                lblCdnurTotITC.Text = ds1.Tables[10].Rows[0]["TotalITC"].ToString();
                lblCdnurTotInvoRow.Text = ds1.Tables[10].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
               lblCdnurTotNoteRefVoucherValue.Text  ="0";
               lblCdnurTotTax.Text = "0";
               lblCdnurTotITC.Text = "0";
               lblCdnurTotInvoRow.Text = "0";
            }

            if (ds1.Tables[11].Rows.Count > 0)
            {
                Gridcdnur.DataSource = ds1.Tables[11];
                Gridcdnur.DataBind();
            }else
            {
                Gridcdnur.DataSource =null;
                Gridcdnur.DataBind();
            }

            //For display at
            if (ds1.Tables[12].Rows.Count > 0)
            {
                lblAtGrossAdv.Text = ds1.Tables[12].Rows[0]["TotalAdvPaid"].ToString();
                lblAtTotalCESS.Text = ds1.Tables[12].Rows[0]["TotalCESS"].ToString();
                lblatTotRow.Text = ds1.Tables[12].Rows[0]["TotalInvoice"].ToString();
            }else
            {

                lblAtGrossAdv.Text = "0";
                lblAtTotalCESS.Text ="0";
                lblatTotRow.Text = "0";
            }
            if (ds1.Tables[13].Rows.Count > 0)
            {
                Gridat.DataSource = ds1.Tables[13];
                Gridat.DataBind();
            }
            else
            {
                Gridat.DataSource =null;
                Gridat.DataBind();
            }

            //For display atadj
            if (ds1.Tables[14].Rows.Count > 0)
            {
                lblAtAdjGrossAdv.Text = ds1.Tables[14].Rows[0]["TotalAdvPaid"].ToString();
                lblAtadjTotalCESS.Text = ds1.Tables[14].Rows[0]["TotalCESS"].ToString();
                lblatadjTotRow.Text = ds1.Tables[14].Rows[0]["TotalInvoice"].ToString();
            }else
            {

                lblAtAdjGrossAdv.Text = "0";
                lblAtadjTotalCESS.Text ="0";
                lblatadjTotRow.Text = "0";
            }

            if (ds1.Tables[15].Rows.Count > 0)
            {
                Gridatadj.DataSource = ds1.Tables[15];
                Gridatadj.DataBind();
            }
            else
            {
                Gridatadj.DataSource = null;
                Gridatadj.DataBind();
            }

            // For display exemp
            if (ds1.Tables[16].Rows.Count > 0)
            {
                lblExempCompTax.Text = ds1.Tables[16].Rows[0]["TotalCompositionTax"].ToString();
                lblExempTotalNilRatedTax.Text = ds1.Tables[16].Rows[0]["TotalNilRatedTax"].ToString();
                lblExempTotalNonGSTTax.Text = ds1.Tables[16].Rows[0]["TotalNonGSTTax"].ToString();
                lblexempTotRow.Text = ds1.Tables[16].Rows[0]["TotalInvoice"].ToString();
            }
            else
            {
                lblExempTotalNilRatedTax.Text ="0";
                         lblExempCompTax.Text ="0";
                  lblExempTotalNonGSTTax.Text ="0";
                  lblexempTotRow.Text = "0";

            }
            if (ds1.Tables[17].Rows.Count > 0)
            {
                Gridexemp.DataSource = ds1.Tables[17];
                Gridexemp.DataBind();
            }else
            {
                Gridexemp.DataSource = null;
                Gridexemp.DataBind();


            }

            // For display itcr
            if (ds1.Tables[18].Rows.Count > 0)
            {
                lblItcrTotalITC.Text = ds1.Tables[18].Rows[0]["TotalITC"].ToString();
                lblitcrTotRow.Text = ds1.Tables[18].Rows[0]["TotalInvoice"].ToString();
            
            
            }else
            {
                lblItcrTotalITC.Text ="0";
                lblitcrTotRow.Text = "0";
            }
            if (ds1.Tables[19].Rows.Count > 0)
            {
                Griditcr.DataSource = ds1.Tables[19];
                Griditcr.DataBind();
            }else
            {
                Griditcr.DataSource = null;
                Griditcr.DataBind();

            }

            //For display hsn summary
            if (ds1.Tables[20].Rows.Count > 0)
            {
                lblHsnTotalQuantity.Text = ds1.Tables[20].Rows[0]["TotalQuantity"].ToString();
                lblHsnTotalTaxableValue.Text = ds1.Tables[20].Rows[0]["TotalTaxableValue"].ToString();
                lblHsnTotalValue.Text = ds1.Tables[20].Rows[0]["TotalValue"].ToString();
                lblhsnTotRow.Text = ds1.Tables[20].Rows[0]["TotalInvoice"].ToString();
            
            }else
            {

                lblHsnTotalQuantity.Text = "0";
            lblHsnTotalTaxableValue.Text = "0";
                   lblHsnTotalValue.Text = "0";
                   lblhsnTotRow.Text = "0";
            }
            if (ds1.Tables[21].Rows.Count > 0)
            {
                Gridhsn.DataSource = ds1.Tables[21];
                Gridhsn.DataBind();
            }else
            {
                Gridhsn.DataSource = null;
                Gridhsn.DataBind();
            }
        }
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