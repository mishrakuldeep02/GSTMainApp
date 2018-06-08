using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGSTR1 : System.Web.UI.Page
{
    public DataSet ds1 = new DataSet();
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

          

            //dvExceldata.Visible = true;
            
        }
        FillGSTR14A();
    }
    void FillGSTR14A()
    {
        // ContentPlaceHolder mpContentPlaceHolder =    (ContentPlaceHolder)Master.FindControl("ContentPlaceHolder1");
        //   DropDownList ddlMonthYear = (DropDownList)Master.FindControl("ddlMonthYear");
      //  DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        ds1 = CLSCommon.CallApiGet("api/GSTR1/GetGSTR1Data?ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString() + "&ClientGSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCode=" + Session["MonthYrCode"].ToString());
        if (ds1.Tables[0].Rows[0]["datafromid"].ToString() == "1")
        {
            dvTallydata.Visible = false;
            dvExceldata.Visible = true;

            grdGSTR14A.DataSource = ds1.Tables[1];
            grdGSTR14A.DataBind();


            grdGSTR4B.DataSource = ds1.Tables[2];
            grdGSTR4B.DataBind();

            grdGSTR14C.DataSource = ds1.Tables[3];
            grdGSTR14C.DataBind();

            grdGSTR15A.DataSource = ds1.Tables[4];
            grdGSTR15A.DataBind();

            grdGSTR15B.DataSource = ds1.Tables[5];
            grdGSTR15B.DataBind();

            grdGSTR16A.DataSource = ds1.Tables[6];
            grdGSTR16A.DataBind();

            grdGSTR16B.DataSource = ds1.Tables[7];
            grdGSTR16B.DataBind();

            grdGSTR16C.DataSource = ds1.Tables[8];
            grdGSTR16C.DataBind();

            grd7A1.DataSource = ds1.Tables[9];
            grd7A1.DataBind();


            grd7A2.DataSource = ds1.Tables[10];
            grd7A2.DataBind();


            grd7B1.DataSource = ds1.Tables[11];
            grd7B1.DataBind();

            grd7B2.DataSource = ds1.Tables[12];
            grd7B2.DataBind();

            grd8.DataSource = ds1.Tables[13];
            grd8.DataBind();

            grd9A.DataSource = ds1.Tables[14];
            grd9A.DataBind();

            grd9B.DataSource = ds1.Tables[15];
            grd9B.DataBind();

            grd9C.DataSource = ds1.Tables[16];
            grd9C.DataBind();

            grd11A1.DataSource = ds1.Tables[17];
            grd11A1.DataBind();

            grd11A2.DataSource = ds1.Tables[18];
            grd11A2.DataBind();

            grd11B1.DataSource = ds1.Tables[19];
            grd11B1.DataBind();

            grd11B2.DataSource = ds1.Tables[20];
            grd11B2.DataBind();

            grd13.DataSource = ds1.Tables[21];
            grd13.DataBind();

            Grd10A.DataSource = ds1.Tables[22];
            Grd10A.DataBind();


            Grd10A1.DataSource = ds1.Tables[23];
            Grd10A1.DataBind();

            Grd10B.DataSource = ds1.Tables[24];
            Grd10B.DataBind();


            Grd10B1.DataSource = ds1.Tables[25];
            Grd10B1.DataBind();

            grdHSNSumm.DataSource = ds1.Tables[26];
            grdHSNSumm.DataBind();
        }
        else if (ds1.Tables[0].Rows[0]["datafromid"].ToString() == "2" || ds1.Tables[0].Rows[0]["datafromid"].ToString() == "3")
        
        {
            dvTallydata.Visible = true;
            dvExceldata.Visible = false;
           
            grdb2bdata .DataSource= ds1.Tables[1];
            grdb2bdata.DataBind();
            if (ds1.Tables[1].Rows.Count > 0)
            {
                lblb2bTinvoice.Text = Convert.ToString(ds1.Tables[1].Compute("SUM(CurrInvoiceVal)", string.Empty));
                lblb2bTIGST.Text = Convert.ToString(ds1.Tables[1].Compute("SUM(IGSTTax)", string.Empty));
                lblb2bTCGST.Text = Convert.ToString(ds1.Tables[1].Compute("SUM(CGSTTax)", string.Empty));
                lblb2bTSGST.Text = Convert.ToString(ds1.Tables[1].Compute("SUM(SGSTTax)", string.Empty));
            }

            grdb2cldata.DataSource = ds1.Tables[2];
            grdb2cldata.DataBind();
            if (ds1.Tables[2].Rows.Count > 0)
            {
                lblb2clTinvoice.Text = Convert.ToString(ds1.Tables[2].Compute("SUM(CurrInvoiceVal)", string.Empty));
                lblb2clTIGST.Text = Convert.ToString(ds1.Tables[2].Compute("SUM(IGSTTax)", string.Empty));
                lblb2clTCGST.Text = Convert.ToString(ds1.Tables[2].Compute("SUM(CGSTTax)", string.Empty));
                lblb2clTSGST.Text = Convert.ToString(ds1.Tables[2].Compute("SUM(SGSTTax)", string.Empty));
            }
            grdb2csdata.DataSource = ds1.Tables[3];
            grdb2csdata.DataBind();
            if (ds1.Tables[3].Rows.Count > 0)
            {
                lblb2csTIGST.Text = Convert.ToString(ds1.Tables[3].Compute("SUM(IGSTTax)", string.Empty));
                lblb2csTCGST.Text = Convert.ToString(ds1.Tables[3].Compute("SUM(CGSTTax)", string.Empty));
                lblb2csTSGST.Text = Convert.ToString(ds1.Tables[3].Compute("SUM(SGSTTax)", string.Empty));
            }

            grddcnrdata.DataSource = ds1.Tables[4];
            grddcnrdata.DataBind();
            if (ds1.Tables[4].Rows.Count > 0)
            {
                lblcdnrTinvoice.Text = Convert.ToString(ds1.Tables[4].Compute("SUM(CurrInvoiceVal)", string.Empty));
                lblcdnrTIGST.Text = Convert.ToString(ds1.Tables[4].Compute("SUM(IGSTTax)", string.Empty));
                lblcdnrTCGST.Text = Convert.ToString(ds1.Tables[4].Compute("SUM(CGSTTax)", string.Empty));
                lblcdnrTSGST.Text = Convert.ToString(ds1.Tables[4].Compute("SUM(SGSTTax)", string.Empty));
            }

            grdcdnurdata.DataSource = ds1.Tables[5];
            grdcdnurdata.DataBind();
            if (ds1.Tables[5].Rows.Count > 0)
            {
                lblcdnurTinvoice.Text = Convert.ToString(ds1.Tables[5].Compute("SUM(CurrInvoiceVal)", string.Empty));
                lblcdnurTIGST.Text = Convert.ToString(ds1.Tables[5].Compute("SUM(IGSTTax)", string.Empty));
                lblcdnurTCGST.Text = Convert.ToString(ds1.Tables[5].Compute("SUM(CGSTTax)", string.Empty));
                lblcdnurTSGST.Text = Convert.ToString(ds1.Tables[5].Compute("SUM(SGSTTax)", string.Empty));
            }
            grdexpdata.DataSource = ds1.Tables[6];
            grdexpdata.DataBind();
            if(ds1.Tables[6].Rows.Count>0)
            { 
            lblexpTinvoice.Text = Convert.ToString(ds1.Tables[6].Compute("SUM(CurrInvoiceVal)", string.Empty));
            lblexpTIGST.Text = Convert.ToString(ds1.Tables[6].Compute("SUM(IGSTTax)", string.Empty));
            lblexpTCGST.Text = Convert.ToString(ds1.Tables[6].Compute("SUM(CGSTTax)", string.Empty));
            lblexpTSGST.Text = Convert.ToString(ds1.Tables[6].Compute("SUM(SGSTTax)", string.Empty));
            }
            grdatdata.DataSource = ds1.Tables[7];
            grdatdata.DataBind();
            if (ds1.Tables[7].Rows.Count > 0)
            {
                lblatTGrossReceived.Text = Convert.ToString(ds1.Tables[7].Compute("SUM(GrossAdvAdj)", string.Empty));
            }

            grdatadjdata.DataSource = ds1.Tables[8];
            grdatadjdata.DataBind();
            if (ds1.Tables[8].Rows.Count > 0)
            {
                lblatadjTGrossAdjusted.Text = Convert.ToString(ds1.Tables[8].Compute("SUM(GrossAdvAdj)", string.Empty));
            }

            grdexempdata.DataSource = ds1.Tables[9];
            grdexempdata.DataBind();
            if (ds1.Tables[9].Rows.Count > 0)
            {
                lblexempTNilRated.Text = Convert.ToString(ds1.Tables[9].Compute("SUM(NillInvoiceAmt)", string.Empty));
                lblexempTNonGst.Text = Convert.ToString(ds1.Tables[9].Compute("SUM(NonGSTInvoiceAmt)", string.Empty));
                lblexempTExempted.Text = Convert.ToString(ds1.Tables[9].Compute("SUM(NonGSTInvoiceAmt)", string.Empty));
            }

            grdhsndata.DataSource = ds1.Tables[10];
            grdhsndata.DataBind();
            if (ds1.Tables[10].Rows.Count > 0)
            {
                lblhsnTvalue.Text = Convert.ToString(ds1.Tables[10].Compute("SUM(TotalValue)", string.Empty));
                lblhsnTIntegratedTaxAmount.Text = Convert.ToString(ds1.Tables[10].Compute("SUM(IGSTAmt)", string.Empty));
                lblhsnTCentralTaxAmount.Text = Convert.ToString(ds1.Tables[10].Compute("SUM(CGSTAmt)", string.Empty));
                lblhsnTStateTaxAmount.Text = Convert.ToString(ds1.Tables[10].Compute("SUM(SGSTAmt)", string.Empty));
            }

            grddocsdata.DataSource = ds1.Tables[11];
            grddocsdata.DataBind();
            if (ds1.Tables[11].Rows.Count > 0)
            {
                lbldocsTotalNumber.Text = Convert.ToString(ds1.Tables[11].Compute("SUM(TotalNumber)", string.Empty));
                lbldocsTotalCancelled.Text = Convert.ToString(ds1.Tables[11].Compute("SUM(Cancelled)", string.Empty));
            }
            
        }
        else
        {
            dvTallydata.Visible = false;
            dvExceldata.Visible = false;
        }
    }
}