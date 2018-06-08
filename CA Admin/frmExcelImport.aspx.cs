using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmExcelImport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // ScriptManager.GetCurrent(this.Page).RegisterPostBackControl(this.btnUpload);
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        //CLSCommon.ClientCheckSession();

        if (!IsPostBack)
        {
            //fillddl();
            lblMonthYear.Text = Session["MonthYearDesc"].ToString();
        }

    }
    string ExcelNo = "";
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {

            if (!fuExcelImport.HasFile)
            {
                Panels.Attributes.Add("class", "alert alert-danger");
                lblTotalRecords.Text = "0";
                lblImported.Text = "0";
                Panels.Visible = true;
                lblMessage.Text = "Please Select Excel File.";
                return;
            }
            else if (Path.GetExtension(fuExcelImport.FileName) != ".xls" && Path.GetExtension(fuExcelImport.FileName) != ".xlsx" && Path.GetExtension(fuExcelImport.FileName) != ".xlsm")
            {
                Panels.Attributes.Add("class", "alert alert-danger");
                lblTotalRecords.Text = "0";
                lblImported.Text = "0";
                Panels.Visible = true;
                lblMessage.Text = "Please Select Only Excel File.";
                return;
            }
            else
            {
                DataSet ds = CLSCommon.CallApiGet("api/GenerateExcelNo/GenerateExcelNo?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&ClientGSTNNO=" + Session["ClientGSTNNO"].ToString() + "&GSTRInd=1&MonthCD=" + Session["MonthYrCode"].ToString());
                if (ds != null)
                {
                    if (ds.Tables[0].Rows[0]["res"].ToString() == "1")
                    {
                        string FileName = Path.GetFileName(fuExcelImport.PostedFile.FileName);
                        string Extension = Path.GetExtension(fuExcelImport.PostedFile.FileName);
                        string FolderPath = "~/GSTR1Excel/";
                        string FilePath = Server.MapPath(FolderPath + ds.Tables[0].Rows[0]["ExcelNo"].ToString());
                        ExcelNo = ds.Tables[0].Rows[0]["ExcelNo"].ToString();
                        fuExcelImport.SaveAs(FilePath + Extension);
                        Import_To_Grid(FilePath, Extension, ExcelNo);
                    }
                    else
                    {
                        Panels.Visible = true;
                        Panels.Attributes.Add("class", "alert alert-warning");
                        lblTotalRecords.Text = "0";
                        lblImported.Text = "0";
                        lblMessage.Text = "Data Already Imported for " + Session["MonthYearDesc"].ToString();
                        //lnkbtn1.Visible = false;
                    }

                }
            }
        }
        catch (Exception ex)
        {
            Panels.Attributes.Add("class", "alert alert-danger");
            Panels.Visible = true;
            lblMessage.Text = ex.Message;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
        }
    }
   
    private void Import_To_Grid(string FilePath, string Extension,string ExcelNo)
    {
        OleDbConnection connExcel = null;
        OleDbCommand cmdExcel;
        OleDbDataAdapter oda;
        try
        {
            string conStr = "";
            switch (Extension)
            {
                case ".xls": //Excel 97-03
                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]
                             .ConnectionString;
                    break;
                case ".xlsx": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    break;

                case ".xlsm": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    break;
                default:
                    {
                        Panels.Attributes.Add("class", "alert alert-danger");
                        lblMessage.Text = "Please Select Excel File Only.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                        Panels.Visible = true;
                        return;
                        //break;
                    }
            }
            conStr = String.Format(conStr, FilePath + Extension, "Yes");
            connExcel = new OleDbConnection(conStr);
            cmdExcel = new OleDbCommand();
            oda = new OleDbDataAdapter();
            DataTable dt = new DataTable();

            cmdExcel.Connection = connExcel;
            DataTable dt1 = new DataTable();
            DataTable dt2 = new DataTable();
            //Get the name of First Sheet
            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

            connExcel.Close();
           // string str1 = " ";
            //Read Data from First Sheet
            connExcel.Open();
            if (rdbExcelOswal.Checked)
            {
                cmdExcel.CommandText = "SELECT [LineNo],[ClientGstin],[DocType],[Billgstin] ,[InvoiceNo],Format( [InvoiceDate],'yyyy/MM/dd') AS [InvoiceDate],[InvoiceValue] ,[GoodsSacInd] ,[HsnSacCode],[HsnSacDesc] ,[ItemTaxRate],[Quantity],[Unit] ,[ItemTaxableVal] ,[IgstTax] ,[CgstTax] ,[SGstTax] ,[CessRate],[CessAmount] ,[SuppyStatecode] ,[Suppystateename] ,[ReverseChargInd] ,[E-commerceInd] ,[EcommGstin] ,[ZeroDeemedExp],[shippBillExportNo] ,Format([shippBillExportDate],'yyyy/MM/dd') AS  [shippBillExportDate],[OrignalInvoNo] ,[OrignalGstIn] ,Format([OrignalInvoDt],'yyyy/MM/dd') AS [OrignalInvoDt] ,[ind],[Validate],[Reason For Issuing document],[UR Type]  From [GSTR1Sales$] where [LineNo] IS NOT NULL";
            }
            else
            {
                DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/GetClientExcelQuery?Ind=1&ClientCode=" + Session["ClientCode"].ToString());
                if (ds != null)
                {
                    if (ds.Tables[0].Rows[0]["Query"].ToString() == "0")
                    {
                        Panels.Attributes.Add("class", "alert alert-danger");
                        lblMessage.Text = "Your Excel file is not mapped with oswal excel file. Please Map Your Excel File To Oswal Excel File.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                        Panels.Visible = true;
                        connExcel.Close();
                        return;

                    }
                    else
                    {
                        cmdExcel.CommandText = ds.Tables[0].Rows[0]["Query"].ToString();
                    }
                }
                else
                {
                    return;
                }
            }
            //"SELECT [SNO#],[Month],[Year],[ClientGstin] ,[Legal Name] ,[TradeName] ,[AggrturnOver] ,[AggrturnOverAprJune] ,[ClientStatecode] ,[Billgstin] ,[InvoiceNo] ,[InvoiceDate] ,[InvoiceValue] ,[GoodsSacInd] ,[HsnSacCode] ,[HsnSacDesc] ,[ItemRate] ,[ItemTaxableVal] ,[IgstTax] ,[CgstTax] ,[SGstTax] ,[Cess] ,[SuppyStatecode] ,[Suppystateename] ,[ReverseChargInd] ,[E-commerceInd] ,[EcommGstin] ,[shippBillExportNo] ,[shippBillExportDate]  ,[NillExmNonGstInd] ,[SaleAmdRecInd] ,[OrignalInvoNo] ,[OrignalGstIn] ,[OrignalInvoDt] ,[AdvanceSalInd] ,[AdvRecvOrAdjustInd] ,[ind],[ZeroDeemedSezInd],[ZeroDeemedSezDesc]  From [Sheet1$] where [Month] IS NOT NULL";

            oda.SelectCommand = cmdExcel;
            oda.Fill(dt);
            //dt.Columns[4].DataType = typeof(string);
            cmdExcel.CommandText = "Select [LineNo],	InfoPeriod,	AdvAdjInd,	Rate,	GrossAdvAdj	,PosCode	,PosName	,IGSTTax	,CGSTTax	,SGSTTax	,CessTax from [GSTR1Adv$] where [LineNo] is not null";
            oda.Fill(dt1);
            cmdExcel.CommandText = "Select [LineNo],	[Nature Of Doc],	[SrNo From],	[SrNo To],	[Total Number],	[Cancelled],[Net Issued] from [DocIssued$] where [LineNo] is not null";
            oda.Fill(dt2);
            //dt.Columns["shippBillExportDate"].DataType = typeof(DateTime);
            //dt.Columns["InvoiceDate"].DataType = typeof(DateTime);
            //dt.Columns["OrignalInvoDt"].DataType = typeof(DateTime);
            connExcel.Close();
            PL_ImportTaxPayerData objpl = new PL_ImportTaxPayerData();
            //objpl.dt = dt;
            objpl.ds.Tables.Add(dt);
            objpl.ds.Tables.Add(dt1);
            objpl.ds.Tables.Add(dt2);
            objpl.ds.Tables[0].TableName = "Table1";
            objpl.ds.Tables[1].TableName = "Table2";
            objpl.ds.Tables[2].TableName = "Table3";
            objpl.ind = 1;
            objpl.UserCode = int.Parse(Session["UserCode"].ToString());
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            //Label lbl = (Label)wucTaxPayerStrip.FindControl("lblGSTINNo");
            objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();//lbl.Text;
            objpl.CACode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
            objpl.MonthYearDesc = Session["MonthYearDesc"].ToString();
            objpl.ExcelType = rdbSale.Checked ? 1 : 2;
            objpl.ExcelNo =int.Parse( ExcelNo);
            DataTable dtresponse = CLSCommon.CallApiPost("api/ImportTaxPayerData/ImportData", objpl);
            if (dtresponse != null)
            {
                if (dtresponse.Rows.Count > 0)
                {
                    if (dtresponse.Rows[0][0].ToString() == "1")
                    {
                      //  DataSet ds1 = CLSCommon.CallApiGet("api/GSTR1Payload/SaveSGTR1Payload?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CacodeOdp=" + Session["CacodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + ddlMonthYear.SelectedValue.ToString() + "&UserCode=" + Session["UserCode"].ToString() + "&ExcelNo=" + dtresponse.Rows[0]["ExcelNo"].ToString());
                       // txtPayload.Text = ds1.Tables[0].Rows[0]["Payload"].ToString();
                       // lnkbtn1.Visible = true;
                        Panels.Visible = true;
                        lnkbtnViewError.Visible = false;
                        Panels.Attributes.Add("class", "alert alert-success");
                        lblTotalRecords.Text = dt.Rows.Count.ToString();
                        lblImported.Text = dt.Rows.Count.ToString();
                        lblMessage.Text = "Excel Imported Successfully. \n Total Rows : " + dt.Rows.Count.ToString();
                        // lnkbtn.Visible = true;
                    }
                    else if (dtresponse.Rows[0][0].ToString() == "2")
                    {
                        Label lblOrganisation = (Label)wucTaxPayerStrip.FindControl("lblClientName");
                        Panels.Visible = true;
                        Panels.Attributes.Add("class", "alert alert-warning");
                        lblTotalRecords.Text = "0";
                        lblImported.Text = "0";
                       
                        lblMessage.Text = "Excel File Data Contains Validity Errors Download Error Invoices Here.";
                        
                        StringBuilder sb = new StringBuilder();
                        sb.AppendLine("-------------------------------------------------------------------------------------------------------------");
                        sb.AppendLine("-------------------------------------------------------------------------------------------------------------");
                        sb.AppendLine("");
                        sb.AppendLine("***GST SAATHI REUTRN FILING PORTAL****                           Client Code : " + Session["ClientCode"].ToString());
                        sb.AppendLine("");
                        sb.AppendLine("   SALES DATA IMPORT VALIDITY :                                  Client Name : " + lblOrganisation.Text);
                        sb.AppendLine("   Date & Time : " + DateTime.Parse(dtresponse.Rows[0]["CurrentDate"].ToString()).ToString("dd/MM/yyyy HH:mm:ss tt") + "                          Client GSTIN : " + Session["ClientGSTNNO"].ToString());
                        sb.AppendLine("");
                        sb.AppendLine("-------------------------------------------------------------------------------------------------------------");
                        sb.AppendLine("-------------------------------------------------------------------------------------------------------------");
                        sb.AppendLine("");
                        sb.AppendLine("LineNo|Invoice No.    |Invoice Date|Invoice Value|Error Desc With Code");
                        foreach(DataRow dr in dtresponse.Rows)
                        {
                            sb.AppendLine(dr["LineNo"].ToString().PadRight(6, ' ') + "|" + dr["CurrInvoiceNo"].ToString().PadRight(15, ' ') + "|" + dr["InvoiceDate"].ToString().PadRight(12, ' ') + "|" + dr["TotInvoiceValue"].ToString().PadRight(13, ' ') + "|" + dr["ErrorCode"].ToString() + " - " + dr["ErrorDesc"].ToString());
                        }
                        sb.AppendLine("");
                        sb.AppendLine("******************************************END OF THE RECORDS***************************************************");
                        System.IO.File.WriteAllText(Server.MapPath("~/ErrorTextFile/"+ExcelNo+".txt"), sb.ToString());
                        lnkbtnViewError.Attributes.Add("href", "../ErrorTextFile/" + ExcelNo + ".txt");
                        lnkbtnViewError.Attributes.Add("download","GSTR1_ErrorFile_"+ExcelNo);
                        //lnkbtnViewError.Attributes.Add("target", "_blanck");
                        lnkbtnViewError.Visible = true;
                    }
                    else
                    {
                        Panels.Visible = true;
                        Panels.Attributes.Add("class", "alert alert-warning");
                        lblTotalRecords.Text = "0";
                        lblImported.Text = "0";

                        lblMessage.Text = dtresponse.Rows[0]["ErrorMessage"].ToString().Replace("{{MonthYear}}", Session["MonthYearDesc"].ToString());

                    }
                }
                else
                {
                    lblTotalRecords.Text = "0";
                    lblImported.Text = "0";
                    Panels.Visible = true;
                    Panels.Attributes.Add("class", "alert alert-danger");
                    lblMessage.Text = "The File is not in the correct format.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                }
                // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
            }
            else
            {
                lblTotalRecords.Text = "0";
                lblImported.Text = "0";
                Panels.Visible = true;
                Panels.Attributes.Add("class", "alert alert-danger");
                lblMessage.Text = "The File is not in the correct format.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
            }
        }

        catch (Exception ex)
        {
            connExcel.Close();
            lblTotalRecords.Text = "0";
            lblImported.Text = "0";
            Panels.Visible = true;
            Panels.Attributes.Add("class", "alert alert-danger");
            lblMessage.Text = ex.Message;//"The File is not in the correct format.";

        }
    }
 
    protected void lnkbtn1_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#ProgressModal1').modal('show');});", true);
    }
}