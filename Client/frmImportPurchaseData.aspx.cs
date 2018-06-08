using Newtonsoft.Json;
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

public partial class Client_frmImportPurchaseData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // ScriptManager.GetCurrent(this.Page).RegisterPostBackControl(this.btnUpload);
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        //CLSCommon.ClientCheckSession();

        if (!IsPostBack)
        {
            lblMonthYear.Text = Session["MonthYearDesc"].ToString();
           // fillddl();
        }

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            //if (Session["TaxPayerId"] == null || Session["TaxPayerIdOdp"] == null || Session["ClientGSTNNO"] == null || Session["ClientId"] == null || Session["ClientIdOdp"] == null)
            //{
            //    Response.Redirect("~/MasterPage/frmLogout.aspx");
            //}
            if (fuExcelImport.HasFile)
            {
                string FileName = Path.GetFileName(fuExcelImport.PostedFile.FileName);
                string Extension = Path.GetExtension(fuExcelImport.PostedFile.FileName);
                string FolderPath = "~/ExcelFile/";

                string FilePath = Server.MapPath(FolderPath + FileName);
                fuExcelImport.SaveAs(FilePath);
                Import_To_Grid(FilePath, Extension);
            }
            else
            {
                Panel.Attributes.Add("class", "alert alert-danger");
                lblTotalRecords.Text = "0";
                lblImported.Text = "0";
                Panel.Visible = true;
                lblMessage.Text = "Please Select Excel File.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
            }
        }
        catch (Exception ex)
        {
            Panel.Attributes.Add("class", "alert alert-danger");
            Panel.Visible = true;
            lblMessage.Text = ex.Message;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
        }
    }
   
    DataTable ImportExcel(string Query,OleDbCommand OleCmd)
    {
        OleDbDataAdapter oda=new OleDbDataAdapter(OleCmd);
        DataTable dt=new DataTable();
        oda.Fill(dt);
        return dt;
    }
    private void Import_To_Grid(string FilePath, string Extension)
    {
        OleDbConnection connExcel = null;
        OleDbCommand cmdExcel;
      
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
                default:
                    {
                        Panel.Attributes.Add("class", "alert alert-danger");
                        lblMessage.Text = "Please Select Excel File Only.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                        Panel.Visible = true;
                        return;
                    }
            }
            conStr = String.Format(conStr, FilePath, "Yes");
            connExcel = new OleDbConnection(conStr);
            cmdExcel = new OleDbCommand();
            DataSet DsExcelDs = new DataSet();
            cmdExcel.Connection = connExcel;
            connExcel.Open();
            if (rdbExcelOswal.Checked || !rdbExcelOswal.Checked)
            {
                //cmdExcel.CommandText = "SELECT [LineNo],[DocType],[ClientGstIn],[PurchGstIn],[InvoiceNo],FORMAT( [InvoiceDate],'yyyy/MM/dd') as [InvoiceDate],[InvoiceValue],[GoodsServInd],[HsnSacCode],[HsnSacDesc],[Quantity],[Unit],[Rate],[TaxableVal],[IGstTax],[CGstTax],[SGstTax],[CessRate],[CessAmount],[PlaceOfSuplyStates],[PlaceOfSuplyName],[ITCInligibleInd],[ITCInligibleDesc],[ITCIGst],[ITCCGst],[ITCSGst],[ITCCess],[ReversechgInd],[ImportOfSerInd],[OverSeasSez],[BillEntryNo],FORMAT([BillEntryDt],'yyyy/MM/dd') as [BillEntryDt],[BillEntryvalue],[OrignalInvoiceNo],FORMAT([OrignalInvoiceDate],'yyyy/MM/dd') as [OrignalInvoiceDate],[OrignalGSIn],[OrignalBillEntNo],FORMAT([OrignalBillEntDt] ,'yyyy/MM/dd') as [OrignalBillEntDt] ,[OrignalBillEntGstin],[ComoNillExeInd],[ComoNillExeDesc],[DebitNotCreditNotInd],[ISDCreditInd],[ISDInvoCredit],[IsdDocNo],[IsdDocdate],[TDSTCCCrdInd],[TDSTcsCredit],[TDSTcsGrossVal],[TDSTcsSalseReturn],[TDSTcsNetValue],[AdvancePaidInd],[GrossAdvPaid] From [Table3To7$] where [LineNo] IS NOT NULL";
                cmdExcel.CommandText = "SELECT [LineNo],[DocType],[ClientGstIn],[PurchGstIn],[InvoiceNo],FORMAT( [InvoiceDate],'yyyy/MM/dd') as [InvoiceDate],[InvoiceValue],[GoodsServInd],[HsnSacCode],[HsnSacDesc],[Quantity],[Unit],[Rate],[TaxableVal],[IGstTax],[CGstTax],[SGstTax],[CessRate],[CessAmount],[PlaceOfSuplyStates],[PlaceOfSuplyName],[ITCInligibleInd],[ITCInligibleDesc],[ITCIGst],[ITCCGst],[ITCSGst],[ITCCess],[ReversechgInd],[ImportOfSerInd],[OverSeasSez],[BillEntryNo],FORMAT([BillEntryDt],'yyyy/MM/dd') as [BillEntryDt],[BillEntryvalue],[OrignalInvoiceNo],FORMAT([OrignalInvoiceDate],'yyyy/MM/dd') as [OrignalInvoiceDate],[OrignalGSIn],[OrignalBillEntNo],FORMAT([OrignalBillEntDt] ,'yyyy/MM/dd') as [OrignalBillEntDt] ,[OrignalBillEntGstin] From [Table3To7$] where [LineNo] IS NOT NULL ";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[0].TableName = "dtPurchaseData";

                cmdExcel.CommandText = "SELECT [LineNo]	,[ClientGSTNNO]	,[GSTINISD]	,[ISDINVOCreditNote]	,[ISDDocNo]	,FORMAT( [ISDDocDate],'yyyy/MM/dd') as 	[ISDDocDate],[ISDIGST]	,[ISDCGST]	,[ISDSGST]	,[ISDUT]	,[ISDCess]	,[EligITCIGST]	,[EligITCCGST]	,[EligITCSGST]	,[EligITCCess]	,[InelITCIGST]	,[InelITCCGST]	,[InelITCSGST]	,[InelITCCess] From [Table8ISD$] where [LineNo] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[1].TableName = "dtISDData";

                cmdExcel.CommandText = "select [LineNo],	[TDSTCS],	[ClientGstIn],	[TDSTCSGSTIN],	[GrossValue],	[SalesReturn],	[NetValue],	[IGSTTax],	[CGSTTax],	[SGSTTax] from [Table9TDSTCS$] where [LineNo] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[2].TableName = "dtTDSData";

                cmdExcel.CommandText = "select [LineNo],	[InfoMonth],	[AdvPaidAdjust],	[ClientGstIn]	,[AdvGSTIN]	,[InvoDocNo]	,FORMAT( [InvoiceDate],'yyyy/MM/dd') as	[InvoiceDate],[InvoiceValue]	,[GoodServiceInd]	,[HSNSACCode]	,[HSNSACDesc]	,[Rate]	,[GrossAdvPaid]	,[TaxableValue]	,[PosStateCode]	,[PosStateDesc]	,[IGSTTax]	,[CGSTTax]	,[SGSTTax]	,[CessTax] from [Table10Adv$] where [LineNo] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[3].TableName = "dtTable10Adv";

                cmdExcel.CommandText = "select [LineNo],	[DesRevOfITC],	[InfoPeriods],	[Tobeadded],[IGSTTax],	[CGSTTax],[SGSTTax],[Cess] from [TablePur11$] where [LineNo] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[4].TableName = "dtTable11";
            }
            else
            {
                DataSet ds = CLSCommon.CallApiGet("api/ImportTaxPayerData/GetClientExcelQuery?Ind=1&ClientCode=" + Session["ClientCode"].ToString());
                if (ds != null)
                {
                    if (ds.Tables[0].Rows[0]["Query"].ToString() == "0")
                    {
                        Panel.Attributes.Add("class", "alert alert-danger");
                        lblMessage.Text = "Your Excel file is not mapped with oswal excel file. Please Map Your Excel File To Oswal Excel File.";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                        Panel.Visible = true;
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
           
            connExcel.Close();
            PL_PurchaseImportData objpl = new PL_PurchaseImportData();
           // objpl.dt = DsExcelDs.Tables[0];
            objpl.ds = DsExcelDs;
            objpl.ind = 1;
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();//lbl.Text;
            objpl.CACode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
            objpl.MonthYearDesc = Session["MonthYearDesc"].ToString();
            objpl.ExcelType = rdbSale.Checked ? 1 : 2;
            objpl.UserCode = int.Parse(Session["UserCode"].ToString());

           // objpl.ImportDate = JsonConvert.SerializeObject(DsExcelDs, Formatting.Indented);
            DataTable dtresponse = CLSCommon.CallApiPost("api/PurchaseImportData/PurchaseImportData", objpl);
            if (dtresponse != null)
            {
                if (dtresponse.Rows.Count > 0)
                {
                    if (dtresponse.Rows[0][0].ToString() == "1")
                    {
                        Panel.Visible = true;
                        Panel.Attributes.Add("class", "alert alert-success");
                        lblTotalRecords.Text = DsExcelDs.Tables[0].Rows.Count.ToString();
                        lblImported.Text = DsExcelDs.Tables[0].Rows.Count.ToString();
                        lblMessage.Text = "Excel Imported Successfully. \n Total Rows : " + DsExcelDs.Tables[0].Rows.Count.ToString();
                       // lnkbtn.Visible = true;
                    }
                    else
                    {
                        Panel.Visible = true;
                        Panel.Attributes.Add("class", "alert alert-warning");
                        lblTotalRecords.Text = "0";
                        lblImported.Text = "0";
                      //  lblMessage.Text = dtresponse.Rows[0]["ErrorDesc"].ToString().Replace("{{MonthYear}}", ddlMonthYear.SelectedItem.Text);
                    }
                 //   Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                }
                else
                {
                    lblTotalRecords.Text = "0";
                    lblImported.Text = "0";
                    Panel.Visible = true;
                    Panel.Attributes.Add("class", "alert alert-danger");
                    lblMessage.Text = "The File is not in the correct format.";
                 //   Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                }
            }
        }
        catch (Exception ex)
        {
            connExcel.Close();
            lblTotalRecords.Text = "0";
            lblImported.Text = "0";
            Panel.Visible = true;
            Panel.Attributes.Add("class", "alert alert-danger");
            lblMessage.Text = ex.Message;//"The File is not in the correct format.";
          //  Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
        }


    }


}