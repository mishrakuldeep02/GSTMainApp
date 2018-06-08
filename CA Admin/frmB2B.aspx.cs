using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmB2B : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        if (!IsPostBack)
        {
            clearGrid();
            FillDDl();
            //fillddlMonthyear();
        }
    }

    protected void ClearB2B()      
    {
        lblsmsSave.Text = "";
        txtGstin.Text = "";
        lblErrorMsg.Text = "";
        txtInvoiceNo.Text = "";
        txtInvoiceValue.Text = "";
        txtInvoiceDate.Text = "";
        ddlPlaceSupply.SelectedIndex = 0;
        ddlReverseCharge.SelectedIndex = 0;
        txtEcommerceGstin.Text = "";
        ddltxtTaxRate.SelectedIndex = 0;
        txtTaxableValue.Text = "";
        txtCessAmount.Text = "";
    }
    protected void ClearB2cl()     
    {
        lblsmsSave.Text = "";

        lblB2clErrorMsg.Text = "";
        txtB2clInvoiceNo.Text = "";
        txtB2clInvoiceValue.Text = "";
        txtB2clInvoiceDate.Text = "";
        ddlB2clPlaceOfSupply.SelectedIndex = 0;
        txtB2clEcommerceGstin.Text = "";
        ddltxtB2clRate.SelectedIndex = 0;
        txtB2clTaxableValue.Text = "";
        txtB2clCessAmount.Text = "";
    }
    protected void ClearB2cs()     
    {
        lblsmsSave.Text = "";
        lblB2csErrorMsg.Text = "";

        ddlB2csType.SelectedIndex = 0;
        ddlB2csPlaceOfSupply.SelectedIndex = 0;
        txtB2csEcommerceGstin.Text = "";
        ddltxtB2csRate.SelectedIndex = 0;
        txtB2csTaxableValue.Text = "";
        txtB2csCessAmount.Text = "";


    }
    protected void ClearCdnur()    
    {
        ddlCdnurUrType.SelectedIndex = 0;
        txtCdnurVoucherNo.Text = "";
        txtCdnurVoucherDate.Text = "";
        ddlCdnurDocType.SelectedIndex = 0;
        txtCdnurInvoiceNo.Text = "";
        txtCdnurInvoiceDate.Text = "";
        ddlCdnurReasonForIssueDoc.SelectedIndex = 0;
        ddlCdnurPlaceOfSupply.SelectedIndex = 0;
        txtCdnurVoucherValue.Text = "";
        ddltxtCdnurRate.SelectedIndex = 0;
        txtCdnurTaxableValue.Text = "";
        txtCdnurCessAmount.Text = "";




    }
    protected void ClearExp()      
    {
        ddlExpExportType.SelectedIndex = 0;
        txtExpInvoiceNo.Text = "";
        txtExpInvoiceDate.Text = "";
        txtExpInvoiceValue.Text = "";
        txtExpPortCode.Text = "";
        txtExpShippingBillNo.Text = "";
        txtExpShippingBillDate.Text = "";
        ddltxtExpRate.SelectedIndex = 0;
        txtExpTaxableValue.Text = "";

    } 
    protected void ClearAt()       
    {
        lblsmsSave.Text = "";
        lblAtErrorMsg.Text = "";
        ddlAtPlaceOfSupply.SelectedIndex = 0;
        ddltxtAtRate.SelectedIndex = 0;
        txtAtGrossAdvReceived.Text = "";
        txtAtCessAmount.Text = "";



    }
    protected void ClearDocs()     
    {
        ddlDocsNatureOfDoc.SelectedIndex = 0;
        txtDocsSrNoFrom.Text = "";
        txtDocsSrNoTo.Text = "";
        txtDocsTotalNo.Text = "";
        txtDocsCancelled.Text = "";
    }
    protected void ClearAtAdj()    
    {
        lblsmsSave.Text = "";
        lblAtAdjErrorMsg.Text = "";
        ddlATADJPlaceOfSupply.SelectedIndex = 0;
        ddltxtAtAdjRate.SelectedIndex = 0;
        txtAtAdjGrossAdvAdjusted.Text = "";
        txtAtAdjCessAmount.Text = "";




    }
    protected void ClearExeMp()    
    {
        lblsmsSave.Text = "";
        lblExeMpErrorMsg.Text = "";
        ddlExeMpDescription.SelectedIndex = 0;
        txtExeMpNillRatedSupply.Text = "";
        txtExeMpExempted.Text = "";
        txtExeMpNonGstSupply.Text = "";
    }
    protected void ClearHsn()      
    {
        txtHSNCode.Text = "";
        txtHsnDescription.Text = "";
        ddlHsnUQC.SelectedIndex = 0;
        txtHSnTotalQuantity.Text = "";
        txtHSnTotalValue.Text = "";
        txtHSnTaxableValue.Text = "";
        txtHSnIntegratedTaxAmt.Text = "";
        txtHSnCentralTaxAmt.Text = "";
        txtHSnStateUtTaxAmt.Text = "";
        txtHSnCessAmount.Text = "";
    }
    protected void ClearCdnr()     
    {
        lblsmsSave.Text = "";
        txtCdnrGstin.Text = "";
        txtCdnrInvoiceNo.Text = "";
        txtCdnrInvoiceDate.Text = "";
        txtCdnrVoucherNo.Text = "";
        ddlCdnrPlaceOfSupply.SelectedIndex = 0;
        txtCdnrVoucherDate.Text = "";
        ddlCdnrDocType.SelectedIndex = 0;
        ddltxtCdnrReasonForIssueDoc.SelectedIndex = 0;
        txtCdnrVoucherValue.Text = "";
        ddltxtCdnrRate.SelectedIndex = 0;
        txtCdnrTaxableValue.Text = "";
        txtCdnrCessAmount.Text = "";
        ddlCdnrPreGst.SelectedIndex = 0;
    }
    protected void btnAllClear_Click(object sender, EventArgs e)
    {
        clearGrid();
    }
   
    protected void FillDDl()
    {
        DataSet ds = CLSCommon.CallApiGet("api/ImportTallyDDL/ImportTallyddl?Ind=1");
        if (ds.Tables.Count > 0)
        {
            ddlPlaceSupply.DataSource = ds.Tables[0];
            ddlPlaceSupply.DataTextField = "StateDesc";
            ddlPlaceSupply.DataValueField = "StateCode";
            ddlPlaceSupply.DataBind();
            ddlPlaceSupply.Items.Insert(0, new ListItem("Select", "0"));

            ddlB2clPlaceOfSupply.DataSource = ds.Tables[0];
            ddlB2clPlaceOfSupply.DataTextField = "StateDesc";
            ddlB2clPlaceOfSupply.DataValueField = "StateCode";
            ddlB2clPlaceOfSupply.DataBind();
            ddlB2clPlaceOfSupply.Items.Insert(0, new ListItem("Select", "0"));

            ddlB2csPlaceOfSupply.DataSource = ds.Tables[0];
            ddlB2csPlaceOfSupply.DataTextField = "StateDesc";
            ddlB2csPlaceOfSupply.DataValueField = "StateCode";
            ddlB2csPlaceOfSupply.DataBind();
            ddlB2csPlaceOfSupply.Items.Insert(0, new ListItem("Select", "0"));


            ddlCdnrPlaceOfSupply.DataSource = ds.Tables[0];
            ddlCdnrPlaceOfSupply.DataTextField = "StateDesc";
            ddlCdnrPlaceOfSupply.DataValueField = "StateCode";
            ddlCdnrPlaceOfSupply.DataBind();
            ddlCdnrPlaceOfSupply.Items.Insert(0, new ListItem("Select", "0"));

            ddlCdnurPlaceOfSupply.DataSource = ds.Tables[0];
            ddlCdnurPlaceOfSupply.DataTextField = "StateDesc";
            ddlCdnurPlaceOfSupply.DataValueField = "StateCode";
            ddlCdnurPlaceOfSupply.DataBind();
            ddlCdnurPlaceOfSupply.Items.Insert(0, new ListItem("Select", "0"));

            ddlB2bInvoiceType.DataSource = ds.Tables[1];
            ddlB2bInvoiceType.DataTextField = "TypeDesc";
            ddlB2bInvoiceType.DataValueField = "TypeId";
            ddlB2bInvoiceType.DataBind();

            ddlCdnurUrType.DataSource = ds.Tables[2];
            ddlCdnurUrType.DataTextField = "URTypeDesc";
            ddlCdnurUrType.DataValueField = "URTypeId";
            ddlCdnurUrType.DataBind();
            ddlCdnurUrType.Items.Insert(0, new ListItem("Select", "0"));

            ddlAtPlaceOfSupply.DataSource = ds.Tables[0];
            ddlAtPlaceOfSupply.DataTextField = "StateDesc";
            ddlAtPlaceOfSupply.DataValueField = "StateCode";
            ddlAtPlaceOfSupply.DataBind();
            ddlAtPlaceOfSupply.Items.Insert(0, new ListItem("Select", "0"));

            ddlATADJPlaceOfSupply.DataSource = ds.Tables[0];
            ddlATADJPlaceOfSupply.DataTextField = "StateDesc";
            ddlATADJPlaceOfSupply.DataValueField = "StateCode";
            ddlATADJPlaceOfSupply.DataBind();
            ddlATADJPlaceOfSupply.Items.Insert(0, new ListItem("Select", "0"));

            ddlExpExportType.DataSource = ds.Tables[3];
            ddlExpExportType.DataTextField = "ExportTypeDesc";
            ddlExpExportType.DataValueField = "ExportTypeId";
            ddlExpExportType.DataBind();
            ddlExpExportType.Items.Insert(0, new ListItem("Select", "0"));


            ddlDocsNatureOfDoc.DataSource = ds.Tables[5];
            ddlDocsNatureOfDoc.DataTextField = "DocIssueTypeDesc";
            ddlDocsNatureOfDoc.DataValueField = "DocIssueTypeCode";
            ddlDocsNatureOfDoc.DataBind();
            ddlDocsNatureOfDoc.Items.Insert(0, new ListItem("Select", "0"));


            ddltxtCdnrReasonForIssueDoc.DataSource = ds.Tables[6];
            ddltxtCdnrReasonForIssueDoc.DataTextField = "ReasonDesc";
            ddltxtCdnrReasonForIssueDoc.DataValueField = "ReasonId";
            ddltxtCdnrReasonForIssueDoc.DataBind();


            ddlCdnurReasonForIssueDoc.DataSource = ds.Tables[6];
            ddlCdnurReasonForIssueDoc.DataTextField = "ReasonDesc";
            ddlCdnurReasonForIssueDoc.DataValueField = "ReasonId";
            ddlCdnurReasonForIssueDoc.DataBind();
            //ddlCdnurReasonForIssueDoc.Items.Insert(0, new ListItem("Select", "0"));

            ddltxtTaxRate.DataSource = ds.Tables[7];
            ddltxtTaxRate.DataTextField = "Rate";
            ddltxtTaxRate.DataValueField = "RateId";
            ddltxtTaxRate.DataBind();
            ddltxtTaxRate.Items.Insert(0, new ListItem("Select", "0"));

            ddltxtB2clRate.DataSource = ds.Tables[7];
            ddltxtB2clRate.DataTextField = "Rate";
            ddltxtB2clRate.DataValueField = "RateId";
            ddltxtB2clRate.DataBind();
            ddltxtB2clRate.Items.Insert(0, new ListItem("Select", "0"));


            ddltxtB2csRate.DataSource = ds.Tables[7];
            ddltxtB2csRate.DataTextField = "Rate";
            ddltxtB2csRate.DataValueField = "RateId";
            ddltxtB2csRate.DataBind();
            ddltxtB2csRate.Items.Insert(0, new ListItem("Select", "0"));

            ddltxtCdnrRate.DataSource = ds.Tables[7];
            ddltxtCdnrRate.DataTextField = "Rate";
            ddltxtCdnrRate.DataValueField = "RateId";
            ddltxtCdnrRate.DataBind();
            ddltxtCdnrRate.Items.Insert(0, new ListItem("Select", "0"));

            ddltxtCdnurRate.DataSource = ds.Tables[7];
            ddltxtCdnurRate.DataTextField = "Rate";
            ddltxtCdnurRate.DataValueField = "RateId";
            ddltxtCdnurRate.DataBind();
            ddltxtCdnurRate.Items.Insert(0, new ListItem("Select", "0"));

            ddltxtExpRate.DataSource = ds.Tables[7];
            ddltxtExpRate.DataTextField = "Rate";
            ddltxtExpRate.DataValueField = "RateId";
            ddltxtExpRate.DataBind();
            ddltxtExpRate.Items.Insert(0, new ListItem("Select", "0"));

            ddltxtAtRate.DataSource = ds.Tables[7];
            ddltxtAtRate.DataTextField = "Rate";
            ddltxtAtRate.DataValueField = "RateId";
            ddltxtAtRate.DataBind();
            ddltxtAtRate.Items.Insert(0, new ListItem("Select", "0"));

            ddltxtAtAdjRate.DataSource = ds.Tables[7];
            ddltxtAtAdjRate.DataTextField = "Rate";
            ddltxtAtAdjRate.DataValueField = "RateId";
            ddltxtAtAdjRate.DataBind();
            ddltxtAtAdjRate.Items.Insert(0, new ListItem("Select", "0"));

            ddlHsnUQC.DataSource = ds.Tables[4];
            ddlHsnUQC.DataTextField = "UnitName";
            ddlHsnUQC.DataValueField = "UnitID";
            ddlHsnUQC.DataBind();
            ddlHsnUQC.Items.Insert(0, new ListItem("Select", "0"));
        }
    }
    int dataCheck = 0;
   
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblsmsSave.Text = "";
        lblErrorMsg.Text = "";
        if (ViewState["B2BTable"] == null)
        {


            dt.Columns.Add("GSTIN/UIN of Recipient");
            dt.Columns.Add("Invoice Number");
            dt.Columns.Add("Invoice date");
            dt.Columns.Add("Invoice Value");

            dt.Columns.Add("PlaceOfSupplyCode");
            dt.Columns.Add("Place Of Supply");
            dt.Columns.Add("Reverse Charge");
            dt.Columns.Add("Invoice Type");
            dt.Columns.Add("E-Commerce GSTIN");
            dt.Columns.Add("Rate");
            dt.Columns.Add("Taxable Value");
            dt.Columns.Add("Cess Amount");
            dt.Columns.Add("ItemIGSTValue");
            dt.Columns.Add("ItemCGSTValue");
            dt.Columns.Add("ItemSGSTValue");
        }
        else
        {
            dt = (DataTable)ViewState["B2BTable"];
        }
        //if (txtGstin.Text != "")
        //{
        //    foreach (DataRow row in dt.Rows)
        //    {
        //        if (row["GSTNNO"].ToString() == txtGstin.Text)
        //        {
        //            lblErrorMsg.Text = "GSTIN Already Added.";
        //            txtGstin.Focus();
        //            return;
        //        }
        //    }
        //}

       // string GSTIN = Session["ClientGSTNNO"].ToString();
               
        
        DataRow dr = dt.NewRow();
        dr["GSTIN/UIN of Recipient"] = txtGstin.Text;
        dr["Invoice Number"] = txtInvoiceNo.Text;

        dr["Invoice date"] = CLSCommon.DateFormat(txtInvoiceDate.Text);
        dr["Invoice Value"] = txtInvoiceValue.Text;

        dr["PlaceOfSupplyCode"] = ddlPlaceSupply.Text;
        dr["Place Of Supply"] = ddlPlaceSupply.SelectedItem.Text;
        if (ddlReverseCharge.SelectedItem.Text == "Yes")
        {
            dr["Reverse Charge"] = "Y";
        }
        else
            dr["Reverse Charge"] = "N";

        dr["Invoice Type"] = ddlB2bInvoiceType.SelectedItem.Text;
        dr["E-Commerce GSTIN"] = txtEcommerceGstin.Text.ToString();
        dr["Rate"] = ddltxtTaxRate.SelectedItem.Text.ToString();
        dr["Taxable Value"] = txtTaxableValue.Text;
        dr["Cess Amount"] = txtCessAmount.Text.Trim() == "" ? "0" : txtCessAmount.Text.Trim();

        string GSTIN = Session["ClientGSTNNO"].ToString();
        int stateCode = Convert.ToInt32(ddlPlaceSupply.SelectedValue);
        int gst = Convert.ToInt32(GSTIN.Substring(0, 2)); 
        if (gst != stateCode)
        {
            dr["ItemIGSTValue"] = ((Convert.ToDecimal(ddltxtTaxRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtTaxableValue.Text)) / 100).ToString();
            dr["ItemCGSTValue"] = "0";
            dr["ItemSGSTValue"] = "0";
        }
        else
        {
            dr["ItemIGSTValue"] = "0";
            dr["ItemCGSTValue"] = (((Convert.ToDecimal(ddltxtTaxRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtTaxableValue.Text)) / 100)/2).ToString();
            dr["ItemSGSTValue"] = (((Convert.ToDecimal(ddltxtTaxRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtTaxableValue.Text)) / 100) / 2).ToString(); ;
        }

        dt.Rows.Add(dr);
        ViewState["B2BTable"] = dt;
        grdB2B.DataSource = dt;
        grdB2B.DataBind();
        ClearB2B();
    }
    protected void grdB2B_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable GSTINTable = (DataTable)ViewState["B2BTable"];
            GSTINTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["B2BTable"] = GSTINTable;
            grdB2B.DataSource = GSTINTable;
            grdB2B.DataBind();
        }
    }
    protected void GridB2cl_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable B2clTable = (DataTable)ViewState["B2ClTable"];
            B2clTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["B2ClTable"] = B2clTable;
            GridB2cl.DataSource = B2clTable;
            GridB2cl.DataBind();
        }
    }
    protected void btnB2clAdd_Click(object sender, EventArgs e)
    {

        DataTable dt = new DataTable();
        lblB2clErrorMsg.Text = "";
        if (ViewState["B2ClTable"] == null)
        {
            dt.Columns.Add("Invoice Number");
            dt.Columns.Add("Invoice date");
            dt.Columns.Add("Invoice Value");

            dt.Columns.Add("PlaceOfSupplyCode");
            dt.Columns.Add("Place Of Supply");
            dt.Columns.Add("Rate");
            dt.Columns.Add("Taxable Value");
            dt.Columns.Add("Cess Amount");
            dt.Columns.Add("E-Commerce GSTIN");
            dt.Columns.Add("ItemIGSTValue");
            dt.Columns.Add("ItemCGSTValue");
            dt.Columns.Add("ItemSGSTValue");
        }
        else
        {
            dt = (DataTable)ViewState["B2ClTable"];
        }

        DataRow dr = dt.NewRow();

        dr["Invoice Number"] = txtB2clInvoiceNo.Text;
        dr["Invoice date"] = CLSCommon.DateFormat(txtB2clInvoiceDate.Text);
        dr["Invoice Value"] = txtB2clInvoiceValue.Text;

        dr["PlaceOfSupplyCode"] = ddlB2clPlaceOfSupply.Text;
        dr["Place Of Supply"] = ddlB2clPlaceOfSupply.SelectedItem.Text;
        dr["Rate"] = ddltxtB2clRate.SelectedItem.Text.ToString();
        dr["Taxable Value"] = txtB2clTaxableValue.Text.Trim();
        dr["Cess Amount"] = txtB2clCessAmount.Text.Trim() == "" ? "0" : txtB2clCessAmount.Text.Trim();
        dr["E-Commerce GSTIN"] = txtB2clEcommerceGstin.Text.ToString();

        string GSTIN = Session["ClientGSTNNO"].ToString();
        int stateCode = Convert.ToInt32(ddlB2clPlaceOfSupply.SelectedValue);
        int gst = Convert.ToInt32(GSTIN.Substring(0, 2));
        if (gst != stateCode)
        {
            dr["ItemIGSTValue"] = ((Convert.ToDecimal(ddltxtB2clRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtB2clTaxableValue.Text)) / 100).ToString();
            dr["ItemCGSTValue"] = "0";
            dr["ItemSGSTValue"] = "0";
        }
        else
        {
            dr["ItemIGSTValue"] = "0";
            dr["ItemCGSTValue"] = (((Convert.ToDecimal(ddltxtB2clRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtB2clTaxableValue.Text)) / 100) / 2).ToString();
            dr["ItemSGSTValue"] = (((Convert.ToDecimal(ddltxtB2clRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtB2clTaxableValue.Text)) / 100) / 2).ToString(); ;
        }

        dt.Rows.Add(dr);
        ViewState["B2ClTable"] = dt;
        GridB2cl.DataSource = dt;
        GridB2cl.DataBind();
        ClearB2cl();
    }
    protected void btnB2csAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblB2csErrorMsg.Text = "";
        if (ViewState["B2CSTable"] == null)
        {
            dt.Columns.Add("Type");
            dt.Columns.Add("PlaceOfSupplyCode");
            dt.Columns.Add("Place Of Supply");
            dt.Columns.Add("Rate");
            dt.Columns.Add("Taxable Value");
            dt.Columns.Add("Cess Amount");
            dt.Columns.Add("E-Commerce GSTIN");
            dt.Columns.Add("ItemIGSTValue");
            dt.Columns.Add("ItemCGSTValue");
            dt.Columns.Add("ItemSGSTValue");

        }
        else
        {
            dt = (DataTable)ViewState["B2CSTable"];
        }

        DataRow dr = dt.NewRow();


        dr["Type"] = ddlB2csType.SelectedItem.Text;
        dr["PlaceOfSupplyCode"] = ddlB2csPlaceOfSupply.Text;
        dr["Place Of Supply"] = ddlB2csPlaceOfSupply.SelectedItem.Text;
        dr["Rate"] = ddltxtB2csRate.SelectedItem.Text.ToString();
        dr["Taxable Value"] = txtB2csTaxableValue.Text;
        dr["Cess Amount"] = txtB2csCessAmount.Text.Trim() == "" ? "0" : txtB2csCessAmount.Text.Trim();
        dr["E-Commerce GSTIN"] = txtB2csEcommerceGstin.Text.ToString();

        string GSTIN = Session["ClientGSTNNO"].ToString();
        int stateCode = Convert.ToInt32(ddlB2csPlaceOfSupply.SelectedValue);
        int gst = Convert.ToInt32(GSTIN.Substring(0, 2));
        if (gst != stateCode)
        {
            dr["ItemIGSTValue"] = ((Convert.ToDecimal(ddltxtB2csRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtB2csTaxableValue.Text)) / 100).ToString();
            dr["ItemCGSTValue"] = "0";
            dr["ItemSGSTValue"] = "0";
        }
        else
        {
            dr["ItemIGSTValue"] = "0";
            dr["ItemCGSTValue"] = (((Convert.ToDecimal(ddltxtB2csRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtB2csTaxableValue.Text)) / 100) / 2).ToString();
            dr["ItemSGSTValue"] = (((Convert.ToDecimal(ddltxtB2csRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtB2csTaxableValue.Text)) / 100) / 2).ToString(); ;
        }

        dt.Rows.Add(dr);
        ViewState["B2CSTable"] = dt;
        GridB2cs.DataSource = dt;
        GridB2cs.DataBind();
        ClearB2cs();
    }
    protected void GridB2cs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable B2csTable = (DataTable)ViewState["B2CSTable"];
            B2csTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["B2CSTable"] = B2csTable;
            GridB2cs.DataSource = B2csTable;
            GridB2cs.DataBind();
        }
    }
    protected void btnCdnrAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblCdnrErrorMsg.Text = "";
        if (ViewState["CDNRTable"] == null)
        {
            dt.Columns.Add("GSTIN/UIN of Recipient");
            dt.Columns.Add("Invoice/Advance Receipt Number");
            dt.Columns.Add("Invoice/Advance Receipt date");
            dt.Columns.Add("Note/Refund Voucher Number");
            dt.Columns.Add("Note/Refund Voucher date");
            dt.Columns.Add("Document Type");
            dt.Columns.Add("Reason For Issuing document");
            dt.Columns.Add("PlaceOfSupplyCode");
            dt.Columns.Add("Place Of Supply");
            dt.Columns.Add("Note/Refund Voucher Value");
            dt.Columns.Add("Rate");
            dt.Columns.Add("Taxable Value");
            dt.Columns.Add("Cess Amount");
            dt.Columns.Add("Pre GST");
            dt.Columns.Add("ItemIGSTValue");
            dt.Columns.Add("ItemCGSTValue");
            dt.Columns.Add("ItemSGSTValue");

        }
        else
        {
            dt = (DataTable)ViewState["CDNRTable"];
        }

        DataRow dr = dt.NewRow();

        dr["GSTIN/UIN of Recipient"] = txtCdnrGstin.Text;
        dr["Invoice/Advance Receipt Number"] = txtCdnrInvoiceNo.Text;
        dr["Invoice/Advance Receipt date"] = CLSCommon.DateFormat(txtCdnrInvoiceDate.Text);
        dr["Note/Refund Voucher Number"] = txtCdnrVoucherNo.Text;
        dr["PlaceOfSupplyCode"] = ddlCdnrPlaceOfSupply.Text.ToString();
        dr["Place Of Supply"] = ddlCdnrPlaceOfSupply.SelectedItem.Text;
        dr["Note/Refund Voucher date"] = CLSCommon.DateFormat(txtCdnrVoucherDate.Text);
        dr["Document Type"] = ddlCdnrDocType.Text;
        dr["Reason For Issuing document"] = ddltxtCdnrReasonForIssueDoc.SelectedItem.Text.ToString();
        dr["Note/Refund Voucher Value"] = txtCdnrVoucherValue.Text;
        dr["Rate"] = ddltxtCdnrRate.SelectedItem.Text.ToString();
        dr["Taxable Value"] = txtCdnrTaxableValue.Text;
        dr["Cess Amount"] = txtCdnrCessAmount.Text.Trim() == "" ? "0" : txtCdnrCessAmount.Text.Trim();
        if (ddlCdnrPreGst.SelectedItem.Text.ToString() == "Yes")
            dr["Pre GST"] = "Y";
        else
            dr["Pre GST"] = "N";


        string GSTIN = Session["ClientGSTNNO"].ToString();
        int stateCode = Convert.ToInt32(ddlCdnrPlaceOfSupply.SelectedValue);
        int gst = Convert.ToInt32(GSTIN.Substring(0, 2));
        if (gst != stateCode)
        {
            dr["ItemIGSTValue"] = ((Convert.ToDecimal(ddltxtCdnrRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtCdnrTaxableValue.Text)) / 100).ToString();
            dr["ItemCGSTValue"] = "0";
            dr["ItemSGSTValue"] = "0";
        }
        else
        {
            dr["ItemIGSTValue"] = "0";
            dr["ItemCGSTValue"] = (((Convert.ToDecimal(ddltxtCdnrRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtCdnrTaxableValue.Text)) / 100) / 2).ToString();
            dr["ItemSGSTValue"] = (((Convert.ToDecimal(ddltxtCdnrRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtCdnrTaxableValue.Text)) / 100) / 2).ToString(); ;
        }
        dt.Rows.Add(dr);
        ViewState["CDNRTable"] = dt;
        GridCdnr.DataSource = dt;
        GridCdnr.DataBind();
        ClearCdnr();
    }
    protected void GridCdnr_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable CDNRTable = (DataTable)ViewState["CDNRTable"];
            CDNRTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["CdnrTable"] = CDNRTable;
            GridCdnr.DataSource = CDNRTable;
            GridCdnr.DataBind();
        }
    }
    protected void clearGrid()   // clear all grid or view state all tab data
    {
        grdB2B.DataSource = null;
        grdB2B.DataBind();
        GridB2cl.DataSource = null;
        GridB2cl.DataBind();
        GridB2cs.DataSource = null;
        GridB2cs.DataBind();
        GridCdnr.DataSource = null;
        GridCdnr.DataBind();
        GridCdnur.DataSource = null;
        GridCdnur.DataBind();
        GridExp.DataSource = null;
        GridExp.DataBind();
        GridAt.DataSource = null;
        GridAt.DataBind();
        GridAtAdj.DataSource = null;
        GridAtAdj.DataBind();
        GridHsn.DataSource = null;
        GridHsn.DataBind();
        GridExeMp.DataSource = null;
        GridExeMp.DataBind();
        GridDocs.DataSource = null;
        GridDocs.DataBind();

        ViewState["B2BTable"] = null;
        ViewState["B2ClTable"] = null;
        ViewState["B2CSTable"] = null;
        ViewState["CDNRTable"] = null;
        ViewState["CDNURTable"] = null;
        ViewState["ExpTable"] = null;
        ViewState["AtTable"] = null;
        ViewState["AtAdjTable"] = null;
        ViewState["HsnTable"] = null;
        ViewState["ExeMpTable"] = null;
        ViewState["DocsTable"] = null;

        ClearB2B()  ;
        ClearB2cl() ;
        ClearB2cs() ;
        ClearCdnur();
        ClearExp()  ;
        ClearAt()   ;
        ClearDocs() ;
        ClearAtAdj();
        ClearExeMp();
        ClearHsn()  ;
        ClearCdnr();

    }
    protected void btnCdnurAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblCdnrErrorMsg.Text = "";
        if (ViewState["CDNURTable"] == null)
        {
            dt.Columns.Add("UR Type");
            dt.Columns.Add("Note/Refund Voucher Number");
            dt.Columns.Add("Note/Refund Voucher date");
            dt.Columns.Add("Document Type");
            dt.Columns.Add("Invoice/Advance Receipt Number");
            dt.Columns.Add("Invoice/Advance Receipt date");
            dt.Columns.Add("Reason For Issuing document");
            dt.Columns.Add("PlaceOfSupplyCode");
            dt.Columns.Add("Place Of Supply");
            dt.Columns.Add("Note/Refund Voucher Value");
            dt.Columns.Add("Rate");
            dt.Columns.Add("Taxable Value");
            dt.Columns.Add("Cess Amount");
            dt.Columns.Add("Pre GST");
            dt.Columns.Add("ItemIGSTValue");
            dt.Columns.Add("ItemCGSTValue");
            dt.Columns.Add("ItemSGSTValue");
        }
        else
        {
            dt = (DataTable)ViewState["CDNURTable"];
        }

        DataRow dr = dt.NewRow();

        dr["UR Type"] = ddlCdnurUrType.SelectedItem.Text.Trim();
        dr["Note/Refund Voucher Number"] = txtCdnurVoucherNo.Text;
        dr["Note/Refund Voucher date"] = CLSCommon.DateFormat(txtCdnurVoucherDate.Text);
        dr["Document Type"] = ddlCdnurDocType.Text;
        dr["Invoice/Advance Receipt Number"] = txtCdnurInvoiceNo.Text;
        dr["Invoice/Advance Receipt date"] = CLSCommon.DateFormat(txtCdnurInvoiceDate.Text);
        dr["Reason For Issuing document"] = ddlCdnurReasonForIssueDoc.SelectedItem.Text.ToString();
        dr["PlaceOfSupplyCode"] = ddlCdnurPlaceOfSupply.Text.ToString();
        dr["Place Of Supply"] = ddlCdnurPlaceOfSupply.SelectedItem.Text;
        dr["Note/Refund Voucher Value"] = txtCdnurVoucherValue.Text;
        dr["Rate"] = ddltxtCdnurRate.SelectedItem.Text.ToString();
        dr["Taxable Value"] = txtCdnurTaxableValue.Text;
        dr["Cess Amount"] = txtCdnurCessAmount.Text.Trim() == "" ? "0" : txtCdnurCessAmount.Text.Trim();
        if (ddlCdnurPreGst.SelectedItem.Text.ToString() == "Yes")
            dr["Pre GST"] = "Y";
        else
            dr["Pre GST"] = "N";


        string GSTIN = Session["ClientGSTNNO"].ToString();
        int stateCode = Convert.ToInt32(ddlCdnurPlaceOfSupply.SelectedValue);
        int gst = Convert.ToInt32(GSTIN.Substring(0, 2));
        if (gst != stateCode)
        {
            dr["ItemIGSTValue"] = ((Convert.ToDecimal(ddltxtCdnurRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtCdnurTaxableValue.Text)) / 100).ToString();
            dr["ItemCGSTValue"] = "0";
            dr["ItemSGSTValue"] = "0";
        }
        else
        {
            dr["ItemIGSTValue"] = "0";
            dr["ItemCGSTValue"] = (((Convert.ToDecimal(ddltxtCdnurRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtCdnurTaxableValue.Text)) / 100) / 2).ToString();
            dr["ItemSGSTValue"] = (((Convert.ToDecimal(ddltxtCdnurRate.SelectedItem.Text.ToString()) * Convert.ToDecimal(txtCdnurTaxableValue.Text)) / 100) / 2).ToString(); ;
        }
        dt.Rows.Add(dr);
        ViewState["CDNURTable"] = dt;
        GridCdnur.DataSource = dt;
        GridCdnur.DataBind();
        ClearCdnur();
    }
    protected void GridCdnur_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable CDNURTable = (DataTable)ViewState["CDNURTable"];
            CDNURTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["CDNURTable"] = CDNURTable;
            GridCdnur.DataSource = CDNURTable;
            GridCdnur.DataBind();
        }
    }
    protected void btnExpAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblCdnrErrorMsg.Text = "";
        if (ViewState["ExpTable"] == null)
        {
            dt.Columns.Add("Export Type");
            dt.Columns.Add("Invoice Number");
            dt.Columns.Add("Invoice date");
            dt.Columns.Add("Invoice Value");
            dt.Columns.Add("Port Code");
            dt.Columns.Add("Shipping Bill Number");
            dt.Columns.Add("Shipping Bill Date");
            dt.Columns.Add("Rate");
            dt.Columns.Add("Taxable Value");
           

        }
        else
        {
            dt = (DataTable)ViewState["ExpTable"];
        }

        DataRow dr = dt.NewRow();

        dr["Export Type"] = ddlExpExportType.SelectedItem.Text.Trim();
        dr["Invoice Number"] = txtExpInvoiceNo.Text;
        dr["Invoice date"] = CLSCommon.DateFormat(txtExpInvoiceDate.Text);
        dr["Invoice Value"] = txtExpInvoiceValue.Text.Trim() == "" ? "0" : txtExpInvoiceValue.Text.Trim();
        dr["Port Code"] = txtExpPortCode.Text.Trim();
        dr["Shipping Bill Number"] = txtExpShippingBillNo.Text;
        dr["Shipping Bill Date"] = CLSCommon.DateFormat(txtExpShippingBillDate.Text.ToString());
        dr["Rate"] = ddltxtExpRate.SelectedItem.Text.ToString();
        dr["Taxable Value"] = txtExpTaxableValue.Text;

       
        dt.Rows.Add(dr);
        ViewState["ExpTable"] = dt;
        GridExp.DataSource = dt;
        GridExp.DataBind();
        ClearExp();

    }
    protected void GridExp_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable ExpTable = (DataTable)ViewState["ExpTable"];
            ExpTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["ExpTable"] = ExpTable;
            GridExp.DataSource = ExpTable;
            GridExp.DataBind();
        }

    }  
    protected void btnAtAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblAtErrorMsg.Text = "";
        if (ViewState["AtTable"] == null)
        {

            dt.Columns.Add("PlaceOfSupplyCode");
            dt.Columns.Add("Place Of Supply");
            dt.Columns.Add("Rate");
            dt.Columns.Add("Gross Advance Received");
            dt.Columns.Add("Cess Amount");


        }
        else
        {
            dt = (DataTable)ViewState["AtTable"];
        }

        DataRow dr = dt.NewRow();



        dr["PlaceOfSupplyCode"] = ddlAtPlaceOfSupply.Text;
        dr["Place Of Supply"] = ddlAtPlaceOfSupply.SelectedItem.Text;
        dr["Rate"] = ddltxtAtRate.SelectedItem.Text.ToString();
        dr["Gross Advance Received"] = txtAtGrossAdvReceived.Text.Trim();
        dr["Cess Amount"] = txtAtCessAmount.Text.Trim() == "" ? "0" : txtAtCessAmount.Text.Trim();

       
        dt.Rows.Add(dr);
        ViewState["AtTable"] = dt;
        GridAt.DataSource = dt;
        GridAt.DataBind();
        ClearAt();
    }
    protected void GridAt_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable AtTable = (DataTable)ViewState["AtTable"];
            AtTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["AtTable"] = AtTable;
            GridAt.DataSource = AtTable;
            GridAt.DataBind();
        }
    }
    protected void btnAtAdjAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblAtAdjErrorMsg.Text = "";
        if (ViewState["AtAdjTable"] == null)
        {

            dt.Columns.Add("PlaceOfSupplyCode");
            dt.Columns.Add("Place Of Supply");
            dt.Columns.Add("Rate");
            dt.Columns.Add("Gross Advance Adjusted");
            dt.Columns.Add("Cess Amount");


        }
        else
        {
            dt = (DataTable)ViewState["AtAdjTable"];
        }

        DataRow dr = dt.NewRow();



        dr["PlaceOfSupplyCode"] = ddlATADJPlaceOfSupply.Text;
        dr["Place Of Supply"] = ddlATADJPlaceOfSupply.SelectedItem.Text;
        dr["Rate"] = ddltxtAtAdjRate.SelectedItem.Text.ToString();
        dr["Gross Advance Adjusted"] = txtAtAdjGrossAdvAdjusted.Text.Trim();
        dr["Cess Amount"] = txtAtAdjCessAmount.Text.Trim() == "" ? "0" : txtAtAdjCessAmount.Text.Trim();

        dt.Rows.Add(dr);
        ViewState["AtAdjTable"] = dt;
        GridAtAdj.DataSource = dt;
        GridAtAdj.DataBind();
        ClearAtAdj();
    }
    protected void GridAtAdj_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable AtAdjTable = (DataTable)ViewState["AtAdjTable"];
            AtAdjTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["AtAdjTable"] = AtAdjTable;
            GridAtAdj.DataSource = AtAdjTable;
            GridAtAdj.DataBind();
        }
    }
    protected void btnExeMpAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblAtAdjErrorMsg.Text = "";
        if (ViewState["ExeMpTable"] == null)
        {

            dt.Columns.Add("Description");
            dt.Columns.Add("Nil Rated Supplies");
            dt.Columns.Add("Exempted (other than nil rated/non GST supply )");
            dt.Columns.Add("Non-GST supplies");



        }
        else
        {
            dt = (DataTable)ViewState["ExeMpTable"];
        }

        DataRow dr = dt.NewRow();



        dr["Description"] = ddlExeMpDescription.SelectedItem.Text.Trim();
        dr["Nil Rated Supplies"] = txtExeMpNillRatedSupply.Text.Trim();
        dr["Exempted (other than nil rated/non GST supply )"] = txtExeMpExempted.Text.ToString();
        dr["Non-GST supplies"] = txtExeMpNonGstSupply.Text.Trim();


        dt.Rows.Add(dr);
        ViewState["ExeMpTable"] = dt;
        GridExeMp.DataSource = dt;
        GridExeMp.DataBind();
        ClearExeMp();
    }
    protected void GridExeMp_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable ExeMpTable = (DataTable)ViewState["ExeMpTable"];
            ExeMpTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["ExeMpTable"] = ExeMpTable;
            GridExeMp.DataSource = ExeMpTable;
            GridExeMp.DataBind();
        }
    }
    protected void btnHsnAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblHsnErrorMsg.Text = "";
        if (ViewState["HsnTable"] == null)
        {

            dt.Columns.Add("HSN");
            dt.Columns.Add("Description");
            dt.Columns.Add("UQC");
            dt.Columns.Add("Total Quantity");
            dt.Columns.Add("Total Value");
            dt.Columns.Add("Taxable Value");
            dt.Columns.Add("Integrated Tax Amount");
            dt.Columns.Add("Central Tax Amount");
            dt.Columns.Add("State/UT Tax Amount");
            dt.Columns.Add("Cess Amount");

        }
        else
        {
            dt = (DataTable)ViewState["HsnTable"];
        }

        DataRow dr = dt.NewRow();
        dr["HSN"] = txtHSNCode.Text.Trim();
        dr["Description"] = txtHsnDescription.Text.Trim();
        dr["UQC"] = ddlHsnUQC.SelectedItem.Text;
        dr["Total Quantity"] = txtHSnTotalQuantity.Text.Trim();
        dr["Total Value"] = txtHSnTotalValue.Text.Trim();
        dr["Taxable Value"] = txtHSnTaxableValue.Text.Trim();
        dr["Integrated Tax Amount"] = txtHSnIntegratedTaxAmt.Text.Trim();
        dr["Central Tax Amount"] = txtHSnCentralTaxAmt.Text.Trim();
        dr["State/UT Tax Amount"] = txtHSnStateUtTaxAmt.Text.Trim();
        dr["Cess Amount"] = txtHSnCessAmount.Text.Trim() == "" ? "0" : txtHSnCessAmount.Text.Trim();
        dt.Rows.Add(dr);
        ViewState["HsnTable"] = dt;
        GridHsn.DataSource = dt;
        GridHsn.DataBind();
        ClearHsn();
    }
    protected void GridHsn_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable HsnTable = (DataTable)ViewState["HsnTable"];
            HsnTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["HsnTable"] = HsnTable;
            GridHsn.DataSource = HsnTable;
            GridHsn.DataBind();
        }

    }
    protected void btnDocsAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        lblDocsErrorMsg.Text = "";
        if (ViewState["DocsTable"] == null)
        {

            dt.Columns.Add("Nature  of Document");
            dt.Columns.Add("Sr. No. From");
            dt.Columns.Add("Sr. No. To");
            dt.Columns.Add("Total Number");
            dt.Columns.Add("Cancelled");


        }
        else
        {
            dt = (DataTable)ViewState["DocsTable"];
        }

        DataRow dr = dt.NewRow();



        dr["Nature  of Document"] = ddlDocsNatureOfDoc.SelectedItem.Text.ToString();
        dr["Sr. No. From"] = txtDocsSrNoFrom.Text.Trim();
        dr["Sr. No. To"] = txtDocsSrNoTo.Text.Trim();
        dr["Total Number"] = txtDocsTotalNo.Text.Trim();
        dr["Cancelled"] = txtDocsCancelled.Text.Trim() == "" ? "0" : txtDocsCancelled.Text.Trim();
        dt.Rows.Add(dr);
        ViewState["DocsTable"] = dt;
        GridDocs.DataSource = dt;
        GridDocs.DataBind();
        ClearDocs();
    }
    protected void GridDocs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecords")
        {
            DataTable DocsTable = (DataTable)ViewState["DocsTable"];
            DocsTable.Rows.RemoveAt(int.Parse(e.CommandArgument.ToString()));
            ViewState["DocsTable"] = DocsTable;
            GridDocs.DataSource = DocsTable;
            GridDocs.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        dataCheck = 0;
        lblsmsSave.Text = "";

        DataTable dt = new DataTable();
        PL_ImportTallySalesData objpl = new PL_ImportTallySalesData();
        DataTable dtTblb2b = new DataTable();
        DataTable dtTblb2cl = new DataTable();
        DataTable dtTblb2cs = new DataTable();
        DataTable dtTblcdn = new DataTable();
        DataTable dtTblcdnur = new DataTable();
        DataTable dtTblexp = new DataTable();
        DataTable dtTblexemp = new DataTable();
        DataTable dtTblhsn = new DataTable();
        DataTable dtTblat = new DataTable();
        DataTable dtTblatadj = new DataTable();
        DataTable dtTbldocs = new DataTable();

        if (ViewState["B2BTable"] != null)
        {
            dataCheck++;
            dtTblb2b = (DataTable)ViewState["B2BTable"];
            if (dtTblb2b.Columns.Count > 11)
            {
                dtTblb2b.Columns.Remove("PlaceOfSupplyCode");
                //dtTblb2b.Columns.Remove("ItemIGSTValue");
                //dtTblb2b.Columns.Remove("ItemCGSTValue");
                //dtTblb2b.Columns.Remove("ItemSGSTValue");                          
                
            }

        }

        dtTblb2b.TableName = "Tblb2b";
        objpl.ds.Tables.Add(dtTblb2b);

        if (ViewState["B2ClTable"] != null)
        {
            dataCheck++;
            dtTblb2cl = (DataTable)ViewState["B2ClTable"];

            if (dtTblb2cl.Columns.Count > 8)
            {
                dtTblb2cl.Columns.Remove("ItemIGSTValue");
                //dtTblb2cl.Columns.Remove("ItemCGSTValue");
                //dtTblb2cl.Columns.Remove("ItemSGSTValue");
                //dtTblb2cl.Columns.Remove("PlaceOfSupplyCode");
            }
        }
        dtTblb2cl.TableName = "Tblb2cl";
        objpl.ds.Tables.Add(dtTblb2cl);
        if (ViewState["B2CSTable"] != null)
        {
            dataCheck++;
            dtTblb2cs = (DataTable)ViewState["B2CSTable"];
            if (dtTblb2cs.Columns.Count > 6)
            {
                dtTblb2cs.Columns.Remove("PlaceOfSupplyCode");               
                //dtTblb2cs.Columns.Remove("ItemIGSTValue");
                //dtTblb2cs.Columns.Remove("ItemCGSTValue");
                //dtTblb2cs.Columns.Remove("ItemSGSTValue");
            }

        }
        dtTblb2cs.TableName = "Tblb2cs";
        objpl.ds.Tables.Add(dtTblb2cs);
        if (ViewState["CDNRTable"] != null)
        {
            dataCheck++;
            dtTblcdn = (DataTable)ViewState["CDNRTable"];
            if (dtTblcdn.Columns.Count > 13)
            {
                dtTblcdn.Columns.Remove("PlaceOfSupplyCode");
                //dtTblcdn.Columns.Remove("ItemIGSTValue");
                //dtTblcdn.Columns.Remove("ItemCGSTValue");
                //dtTblcdn.Columns.Remove("ItemSGSTValue");
            }

        }
        dtTblcdn.TableName = "Tblcdn";
        objpl.ds.Tables.Add(dtTblcdn);

        if (ViewState["CDNURTable"] != null)
        {
            dataCheck++;
            dtTblcdnur = (DataTable)ViewState["CDNURTable"];
            if (dtTblcdnur.Columns.Count > 13)
            {
                dtTblcdnur.Columns.Remove("PlaceOfSupplyCode");
                //dtTblcdnur.Columns.Remove("ItemIGSTValue");
                //dtTblcdnur.Columns.Remove("ItemCGSTValue");
                //dtTblcdnur.Columns.Remove("ItemSGSTValue");
            }

        }
        dtTblcdnur.TableName = "Tblcdnur";
        objpl.ds.Tables.Add(dtTblcdnur);

        if (ViewState["ExpTable"] != null)
        {
            dataCheck++;
            dtTblexp = (DataTable)ViewState["ExpTable"];
        }
        dtTblexp.TableName = "Tblexp";
        objpl.ds.Tables.Add(dtTblexp);


        if (ViewState["ExeMpTable"] != null)
        {
            dataCheck++;
            dtTblexemp = (DataTable)ViewState["ExeMpTable"];
        }
        dtTblexemp.TableName = "Tblexemp";
        objpl.ds.Tables.Add(dtTblexemp);


        if (ViewState["HsnTable"] != null)
        {
            dataCheck++;
            dtTblhsn = (DataTable)ViewState["HsnTable"];
        }
        dtTblhsn.TableName = "Tblhsn";
        objpl.ds.Tables.Add(dtTblhsn);

        if (ViewState["AtTable"] != null)
        {
            dataCheck++;
            dtTblat = (DataTable)ViewState["AtTable"];
            if (dtTblat.Columns.Count > 4)
            {
                dtTblat.Columns.Remove("PlaceOfSupplyCode");
            }

        }
        dtTblat.TableName = "Tblat";
        objpl.ds.Tables.Add(dtTblat);

        if (ViewState["AtAdjTable"] != null)
        {
            dataCheck++;
            dtTblatadj = (DataTable)ViewState["AtAdjTable"];
            if (dtTblatadj.Columns.Count > 4)
            {
                dtTblatadj.Columns.Remove("PlaceOfSupplyCode");
            }
        }
        dtTblatadj.TableName = "Tblatadj";
        objpl.ds.Tables.Add(dtTblatadj);

        if (ViewState["DocsTable"] != null)
        {
            dataCheck++;
            dtTbldocs = (DataTable)ViewState["DocsTable"];

        }
        dtTbldocs.TableName = "Tbldocs";
        objpl.ds.Tables.Add(dtTbldocs);

        lblErrorMsg.Text = "";

        objpl.ind = 1;
        objpl.CACode = Convert.ToInt32(Session["CaCode"]);
        objpl.CaCodeOdp = Convert.ToInt32(Session["CaCodeOdp"]);
        objpl.MonthCD = Convert.ToInt32(Session["MonthYrCode"].ToString());
        if (Session["ClientCode"] != null && Session["ClientCodeOdp"] != null)
        {
            objpl.ClientCode = Convert.ToInt32(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = Convert.ToInt32(Session["ClientCodeOdp"].ToString());
            objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();
            objpl.UserCode = 1;
            objpl.DataFromId = 3;
            if (dataCheck > 0)
            {
                dt = CLSCommon.CallApiPost("api/ImportTallySalesData/TallySalesImportData/", objpl);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (dt.Rows[0][0].ToString() == "1")
                    {
                        clearGrid();
                        lblsmsSave.Text = "Data SuccessFully Save";
                    }
                    else
                        lblsmsSave.Text = "Some Internal Problem";
                }
            }
            else
                lblsmsSave.Text = "Please Before Add Data!";

        }
        else
            lblErrorMsg.Text = "Please Select Client";        
       
    }

    protected void Exit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CA Admin/frmHomeAdminCA.aspx");
    }
}