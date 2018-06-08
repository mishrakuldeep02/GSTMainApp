using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;
using System.Configuration;
using System.Text;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using NPOI.HSSF.UserModel;
using NPOI.POIFS.FileSystem;
using System.Globalization;

public partial class CA_Admin_FrmImportExcelGSTR2Purchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();

        if (!IsPostBack)
        {
            lblMonthYear.Text = Session["MonthYearDesc"].ToString();
        }
    }

    string ExcelNo = "";
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (!GSTR2PurchaseExcelImport.HasFile)
        {
            Panels.Attributes.Add("class", "alert alert-danger");
            lblTotalRecords.Text = "0";
            lblImported.Text = "0";
            Panels.Visible = true;
            lblMessage.Text = "Please Select Excel File.";
            return;
        }
        else if (Path.GetExtension(GSTR2PurchaseExcelImport.FileName) != ".xls" && Path.GetExtension(GSTR2PurchaseExcelImport.FileName) != ".xlsx" && Path.GetExtension(GSTR2PurchaseExcelImport.FileName) != ".xlsm")
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
            DataSet ds = CLSCommon.CallApiGet("api/GenerateExcelNo/GenerateExcelNo?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&ClientGSTNNO=" + Session["ClientGSTNNO"].ToString() + "&GSTRInd=2&MonthCD=" + Session["MonthYrCode"].ToString());
            if (ds != null)
            {
                if (ds.Tables[0].Rows[0]["res"].ToString() == "1")
                {
                    string FileName = Path.GetFileName(GSTR2PurchaseExcelImport.PostedFile.FileName);
                    string Extension = Path.GetExtension(GSTR2PurchaseExcelImport.PostedFile.FileName);
                    string FolderPath = "~/GSTR2Excel/";
                    string FilePath = Server.MapPath(FolderPath + ds.Tables[0].Rows[0]["ExcelNo"].ToString());
                    ExcelNo = ds.Tables[0].Rows[0]["ExcelNo"].ToString();
                    GSTR2PurchaseExcelImport.SaveAs(FilePath + Extension);
                    // Import_To_Grid(FilePath, Extension, ExcelNo);
                    GetDataFromExcel(FilePath + Extension, Extension);
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
    
    //int b2bError = 0, LineNo = 0;
    //bool flage = false;
    DataTable dtError = new DataTable();
    List<string> lstcol = new List<string>();
    void GetDataFromExcel(string Path, string Extension)
    {
        dtError.Columns.Add("Section");
        dtError.Columns.Add("LineNo");
        dtError.Columns.Add("Error");
        dtError.Columns.Add("ColumnName");
        lstcol = new List<string>() { 
        "A",
        "B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
        };
        Label lblOrganisation = (Label)wucTaxPayerStrip.FindControl("lblClientName");
        List<int> lstb2b = new List<int>(){
                    3,
                    7,8,9,10,11,12,14,15,16,17
            };
        List<int> lstb2bur = new List<int>(){
                    3,
                    7,8,9,10,11,6,14,15,16,13
            };
        List<int> lstimps = new List<int>(){
                    2,
                    4,5,6,7,10,9
            };
        List<int> lstimpg = new List<int>(){
                    3,
                    6,7,8,9,11,12
            };
        List<int> lstcdnr = new List<int>(){
                    10,
                    11,12,13,14,15,16,18,19,20,21
            };
        List<int> lstcdnur = new List<int>(){
                    10,
                    11,12,13,14,8,9,18,19,16,17
            };
        List<int> lstat = new List<int>(){
                    2,3
            };
        List<int> lstatadj = new List<int>(){
                    2,3
            };
        List<int> lstexmpNitc = new List<int>(){
                    1,2,3,4
            };
        List<int> lsthsn = new List<int>(){
                    4,5,6,7,8,9
            };
        
        StringBuilder sb1 = new StringBuilder();
        sb1.AppendLine("-------------------------------------------------------------------------------------------------------------");
        sb1.AppendLine("-------------------------------------------------------------------------------------------------------------");
        sb1.AppendLine("");
        sb1.AppendLine("***GST SAATHI REUTRN FILING PORTAL****                           Client Code : " + Session["ClientCode"].ToString());
        sb1.AppendLine("");
        sb1.AppendLine("   SALES DATA IMPORT VALIDITY :                                  Client Name : " + lblOrganisation.Text);
        sb1.AppendLine("   Date & Time : " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt") + "                          Client GSTIN : " + Session["ClientGSTNNO"].ToString());
        sb1.AppendLine("");
        sb1.AppendLine("-------------------------------------------------------------------------------------------------------------");
        sb1.AppendLine("-------------------------------------------------------------------------------------------------------------");
        sb1.AppendLine("");
        sb1.AppendLine("Section   |Line No |Column|Error Desc With Code");

        DataTable dt = new DataTable();

        DataTable dt1 = new DataTable();

        DataTable dt2 = new DataTable();

        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataTable dt6 = new DataTable();
        DataTable dt7 = new DataTable();
        DataTable dt8 = new DataTable();
        DataTable dt9 = new DataTable();
        DataTable dt10 = new DataTable();
        //  DataTable dt11 = new DataTable();

        if (Extension == ".xls")
        {
            using (StreamReader input = new StreamReader(Path))
            {
                IWorkbook workbook = new HSSFWorkbook(new POIFSFileSystem(input.BaseStream));

                dt = GetDTFromExcel2003(Path, 2, 2, "b2b", 3, workbook,lstb2b);

                dt1 = GetDTFromExcel2003(Path, 2, 2, "b2bur", 3, workbook,lstb2bur);

                dt2 = GetDTFromExcel2003(Path, 1, 1, "imps", 3, workbook,lstimps);

                dt3 = GetDTFromExcel2003(Path, 2, 2, "impg", 3, workbook,lstimpg);

                dt4 = GetDTFromExcel2003(Path, 2, 4, "cdnr", 3, workbook, lstcdnr);

                dt5 = GetDTFromExcel2003(Path, 1, 3, "cdnur", 3, workbook,lstcdnur);

                dt6 = GetDTFromExcel2003(Path, 100, 100, "at", 3, workbook,lstat);
                dt7 = GetDTFromExcel2003(Path, 100, 100, "atadj", 3, workbook,lstatadj);
                dt8 = GetDTFromExcel2003(Path, 100, 100, "exemp", 3, workbook,lstexmpNitc);
                dt9 = GetDTFromExcel2003(Path, 100, 100, "itcr", 3, workbook,lstexmpNitc);
                dt10 = GetDTFromExcel2003(Path, 100, 100, "hsnsum", 3, workbook,lsthsn);

            }
        }
        else
        {
            ICSharpCode.SharpZipLib.Zip.ZipConstants.DefaultCodePage = Encoding.Default.CodePage;
            XSSFWorkbook wb;
            using (var fs = new FileStream(Path, FileMode.Open, FileAccess.Read))
            {
                wb = new XSSFWorkbook(fs);
            }

            dt = GetDTFromExcel2007(Path, 2, 2, "b2b", 3, wb,lstb2b);

            dt1 = GetDTFromExcel2007(Path, 2, 2, "b2bur", 3, wb, lstb2bur);

            dt2 = GetDTFromExcel2007(Path, 1, 1, "imps", 3, wb,lstimps);

            dt3 = GetDTFromExcel2007(Path, 2, 2, "impg", 3, wb,lstimpg);

            dt4 = GetDTFromExcel2007(Path, 2, 4, "cdnr", 3, wb,lstcdnr);

            dt5 = GetDTFromExcel2007(Path, 1, 3, "cdnur", 3, wb,lstcdnur);

            dt6 = GetDTFromExcel2007(Path, 100, 100, "at", 3, wb,lstat);
            dt7 = GetDTFromExcel2007(Path, 100, 100, "atadj", 3, wb,lstatadj);
            dt8 = GetDTFromExcel2007(Path, 100, 100, "exemp", 3, wb,lstexmpNitc);
            dt9 = GetDTFromExcel2007(Path, 100, 100, "itcr", 3, wb, lstexmpNitc);
            dt10 = GetDTFromExcel2007(Path, 100, 100, "hsnsum", 3, wb,lsthsn);

        }

        if (dtError.Rows.Count > 0)
        {
            foreach (DataRow dr in dtError.Rows)
            {
                sb1.AppendLine(dr["Section"].ToString().PadRight(10, ' ') + "|" + dr["LineNo"].ToString().PadRight(8, ' ') + "|" + dr["ColumnName"].ToString().PadRight(6, ' ') + "|" + dr["Error"].ToString());
            }
            sb1.AppendLine("");
            sb1.AppendLine("******************************************END OF THE RECORDS***************************************************");
            System.IO.File.WriteAllText(Server.MapPath("~/ErrorTextFile/" + ExcelNo + ".txt"), sb1.ToString());
            lnkbtnViewError.Attributes.Add("href", "../ErrorTextFile/" + ExcelNo + ".txt");
            lnkbtnViewError.Attributes.Add("download", "GSTR2_ErrorFile_" + ExcelNo);
            Panels.Visible = true;
            Panels.Attributes.Add("class", "alert alert-warning");
            lblTotalRecords.Text = "0";
            lblImported.Text = "0";
            lnkbtnViewError.Visible = true;
            lblMessage.Text = "Excel File Data Contains Validity Errors Download Error Invoices Here.";
            CLSCommon objcmn = new CLSCommon();
            objcmn.DeleteData(2);
        }
        else
        {
            PL_ImportExcelGSTR2Purchase objpl = new PL_ImportExcelGSTR2Purchase();

            objpl.ds.Tables.Add(dt);
            objpl.ds.Tables.Add(dt1);
            objpl.ds.Tables.Add(dt2);
            objpl.ds.Tables.Add(dt3);
            objpl.ds.Tables.Add(dt4);
            objpl.ds.Tables.Add(dt5);
            objpl.ds.Tables.Add(dt6);
            objpl.ds.Tables.Add(dt7);
            objpl.ds.Tables.Add(dt8);
            objpl.ds.Tables.Add(dt9);
            objpl.ds.Tables.Add(dt10);
            objpl.ds.Tables[0].TableName = "b2b";
            objpl.ds.Tables[1].TableName = "b2bur";
            objpl.ds.Tables[2].TableName = "imps";
            objpl.ds.Tables[3].TableName = "impg";
            objpl.ds.Tables[4].TableName = "cdnr";
            objpl.ds.Tables[5].TableName = "cdnur";
            objpl.ds.Tables[6].TableName = "at";
            objpl.ds.Tables[7].TableName = "atadj";
            objpl.ds.Tables[8].TableName = "exemp";
            objpl.ds.Tables[9].TableName = "itcr";
            objpl.ds.Tables[10].TableName = "hsnsum";
            // objpl.ds.Tables[11].TableName = "master";
            objpl.ind = 1;
            objpl.UserCode = int.Parse(Session["UserCode"].ToString());
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();//lbl.Text;
            objpl.CACode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
            objpl.MonthYearDesc = Session["MonthYearDesc"].ToString();
            objpl.ExcelType = rdbSale.Checked ? 1 : 2;
            objpl.DataFromId = 2;//tally
            objpl.ExcelNo = Convert.ToInt32(ExcelNo);
            //#region

            DataTable dtresponse = CLSCommon.CallApiPost("api/ImportExcelGSTR2Purchase/ImportExcelGSTR2PurchaseData", objpl);
            if (dtresponse != null)
            {
                if (dtresponse.Rows.Count > 0)
                {
                    if (dtresponse.Rows[0][0].ToString() == "1")
                    {
                        //            DataSet ds1 = CLSCommon.CallApiGet("api/GSTR1Payload/SaveSGTR1Payload?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CacodeOdp=" + Session["CacodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + ddlMonthYear.SelectedValue.ToString() + "&UserCode=" + Session["UserCode"].ToString() + "&ExcelNo=" + dtresponse.Rows[0]["ExcelNo"].ToString());
                        //            txtPayload.Text = ds1.Tables[0].Rows[0]["Payload"].ToString();                     
                        Panels.Visible = true;
                        Panels.Attributes.Add("class", "alert alert-success");
                        string TotalRows = Convert.ToString(dt.Rows.Count);
                        lblTotalRecords.Text = TotalRows;//dt.Rows.Count.ToString();
                        lblImported.Text = TotalRows;//dt.Rows.Count.ToString();
                        lblMessage.Text = "Excel Imported Successfully. \n Total Rows : " + TotalRows;// dt.Rows.Count.ToString();
                        lnkbtnViewError.Visible = false;
                    }
                    else if (dtresponse.Rows[0][0].ToString() == "2")
                    {

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
                        sb.AppendLine("   Date & Time : " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss tt") + "                          Client GSTIN : " + Session["ClientGSTNNO"].ToString());
                        sb.AppendLine("");
                        sb.AppendLine("-------------------------------------------------------------------------------------------------------------");
                        sb.AppendLine("-------------------------------------------------------------------------------------------------------------");
                        sb.AppendLine("");
                        sb.AppendLine("Section   |Line No |Invoice No.    |Invoice Date|Invoice Value|Error Desc With Code");
                        foreach (DataRow dr in dtresponse.Rows)
                        {
                            sb.AppendLine(dr["Section"].ToString().PadRight(10, ' ') + "|" + dr["ErrorId"].ToString().PadRight(8, ' ') + "|" + dr["InvoiceNo"].ToString().PadRight(15, ' ') + "|" + dr["InvoiceDate"].ToString().PadRight(12, ' ') + "|" + dr["InvoiceValue"].ToString().PadRight(13, ' ') + "|" + dr["ErrorDesc"].ToString());
                        }
                        sb.AppendLine("");
                        sb.AppendLine("******************************************END OF THE RECORDS***************************************************");
                        System.IO.File.WriteAllText(Server.MapPath("~/ErrorTextFile/" + ExcelNo + ".txt"), sb.ToString());
                        lnkbtnViewError.Attributes.Add("href", "../ErrorTextFile/" + ExcelNo + ".txt");
                        lnkbtnViewError.Attributes.Add("download", "GSTR2_ErrorFile_" + ExcelNo);
                        //lnkbtnViewError.Attributes.Add("target", "_blanck");
                        lnkbtnViewError.Visible = true;
                    }
                    else
                    {
                        Panels.Visible = true;
                        Panels.Attributes.Add("class", "alert alert-warning");
                        lblTotalRecords.Text = "0";
                        lblImported.Text = "0";
                        lblMessage.Text = dtresponse.Rows[0]["ErrorMessage"].ToString().Replace("{{MonthYear}}", Session["MonthYrCode"].ToString());

                    }
                }
                else
                {
                    CLSCommon objcmn = new CLSCommon();
                    objcmn.DeleteData(2);
                    lblTotalRecords.Text = "0";
                    lblImported.Text = "0";
                    Panels.Visible = true;
                    Panels.Attributes.Add("class", "alert alert-danger");
                    lblMessage.Text = "The File is not in the correct format.";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                }
                //  // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
            }
            else
            {
                CLSCommon objcmn = new CLSCommon();
                objcmn.DeleteData(2);
                lblTotalRecords.Text = "0";
                lblImported.Text = "0";
                Panels.Visible = true;
                Panels.Attributes.Add("class", "alert alert-danger");
                lblMessage.Text = "The File is not in the correct format.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
            }
        }
    }

    DataTable GetDTFromExcel2003(string extractFile, int datecol1, int datecol2, string SheetName, int Rowindex, IWorkbook workbook, List<int> lstint)
    {
        DataTable dt = new DataTable();
        //try
        //{
       
        IFormulaEvaluator formulaEvaluator = new HSSFFormulaEvaluator(workbook);
        DataFormatter dataFormatter = new HSSFDataFormatter(new CultureInfo("en-US"));

        ISheet sheet = workbook.GetSheet(SheetName);
        // int Rowindex = 3;
        // int  Emptyrowflage = 0;
        while (sheet.GetRow(Rowindex) != null)
        {
            //  colindex = 0;
            dt.Rows.Add();
            string RowsValue = "";
            for (int j = 0; j < sheet.GetRow(Rowindex).Cells.Count; j++)
            {
                var cell = sheet.GetRow(Rowindex).GetCell(j);
                if (cell != null)
                {
                    //switch (cell.CellType)
                    //{
                    if (cell.CellType == NPOI.SS.UserModel.CellType.Numeric || cell.CellType == NPOI.SS.UserModel.CellType.Formula)
                    {
                        if (Rowindex == 3)
                        {
                            dt.Columns.Add(sheet.GetRow(Rowindex).GetCell(j).NumericCellValue.ToString(), typeof(string));
                            RowsValue += sheet.GetRow(Rowindex).GetCell(j).NumericCellValue.ToString();
                        }
                        else
                        {

                            if (datecol1 == j || datecol2 == j)
                            {
                                dt.Rows[Rowindex - 4][j] = DateTime.FromOADate(sheet.GetRow(Rowindex).GetCell(j).NumericCellValue).ToString("yyyy/MM/dd");
                                RowsValue += sheet.GetRow(Rowindex).GetCell(j).NumericCellValue;
                            }

                            else
                            {
                                dt.Rows[Rowindex - 4][j] = sheet.GetRow(Rowindex).GetCell(j).NumericCellValue.ToString().Replace(",", "").Trim();
                                RowsValue += sheet.GetRow(Rowindex).GetCell(j).NumericCellValue;
                                //if (ExtraCol)
                                //{
                                //    dt.Rows[Rowindex - 4]["ItemIGSTValue"] = 0;
                                //    dt.Rows[Rowindex - 4]["ItemcGSTValue"] = 0;
                                //    dt.Rows[Rowindex - 4]["ItemSGSTValue"] = 0;
                                //    }
                            }

                        }

                    }
                    else if (cell.CellType == NPOI.SS.UserModel.CellType.String)
                    {
                        if (Rowindex == 3)
                        {
                            dt.Columns.Add(sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString(), typeof(string));
                            RowsValue += sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString();
                        }
                        else
                        {
                            DateTime date;
                            if (datecol1 == j || datecol2 == j)
                            {
                                if (sheet.GetRow(Rowindex).GetCell(j).StringCellValue == "")
                                {
                                    dt.Rows[Rowindex - 4][j] = "";
                                }
                                else
                                {
                                    if (sheet.GetRow(Rowindex).GetCell(j).StringCellValue.Length == 10)
                                    {
                                        
                                        if (!DateTime.TryParse(CLSCommon.DateFormat(sheet.GetRow(Rowindex).GetCell(j).StringCellValue), new System.Globalization.CultureInfo("en-GB"), System.Globalization.DateTimeStyles.None, out date))
                                        {
                                            dtError.Rows.Add(1);
                                            dtError.Rows[dtError.Rows.Count - 1]["Section"] = sheet.SheetName;
                                            dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (Rowindex+1).ToString();
                                            dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Date Format Must Be \"DD/MM/YYYY\"";
                                            dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                        }
                                        else
                                        {
                                            dt.Rows[Rowindex - 4][j] = DateTime.Parse(CLSCommon.DateFormat(sheet.GetRow(Rowindex).GetCell(j).StringCellValue)).ToString("yyyy/MM/dd");
                                            RowsValue += sheet.GetRow(Rowindex).GetCell(j).StringCellValue;
                                        }
                                    }
                                    else if ((sheet.GetRow(Rowindex).GetCell(j).StringCellValue.Length == 11 || sheet.GetRow(Rowindex).GetCell(j).StringCellValue.Length == 9) &&
                                    ((DateTime.TryParseExact((sheet.GetRow(Rowindex).GetCell(j).StringCellValue), "dd-MMM-yyyy", null, DateTimeStyles.None, out date))
                                    || (DateTime.TryParseExact((sheet.GetRow(Rowindex).GetCell(j).StringCellValue), "dd-MMM-yy", null, DateTimeStyles.None, out date))
                                    ))
                                    {
                                        dt.Rows[Rowindex - 4][j] = DateTime.Parse(sheet.GetRow(Rowindex).GetCell(j).StringCellValue).ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                                        RowsValue += sheet.GetRow(Rowindex).GetCell(j).StringCellValue;
                                    }
                                    else
                                    {
                                        dtError.Rows.Add(1);
                                        dtError.Rows[dtError.Rows.Count - 1]["Section"] = sheet.SheetName;
                                        dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (Rowindex+1).ToString();
                                        dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Date Format Must Be \"DD/MM/YYYY\"";
                                        dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                    }
                                }
                            }
                            else
                            {
                                var res = from k in lstint where k==j
                                          select k ;
                                if ( res.Count() > 0)
                                {
                                    double parsedValue;
                                    if (!double.TryParse(sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim(), out parsedValue) && sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim()!="")
                                    {
                                        dtError.Rows.Add(1);
                                        dtError.Rows[dtError.Rows.Count - 1]["Section"] = sheet.SheetName;
                                        dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (Rowindex + 1).ToString();
                                        dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Invalid Numeric value";//"Invalid Numberic value";
                                        dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                    }else
                                    {
                                        dt.Rows[Rowindex - 4][j] = sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim();
                                        RowsValue += sheet.GetRow(Rowindex).GetCell(j).StringCellValue;
                                    }
                                }
                                else
                                {
                                    dt.Rows[Rowindex - 4][j] = sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim();
                                    RowsValue += sheet.GetRow(Rowindex).GetCell(j).StringCellValue;
                                }
                            }
                            //if (ExtraCol)
                            //{
                            //    dt.Rows[Rowindex - 4]["ItemIGSTValue"] = 0;
                            //    dt.Rows[Rowindex - 4]["ItemcGSTValue"] = 0;
                            //    dt.Rows[Rowindex - 4]["ItemSGSTValue"] = 0;
                            //}                                              

                        }

                    }

                }
            }
            
            //if (Rowindex == 3 && ExtraCol)
            //{
            //    dt.Columns.Add("ItemIGSTValue");
            //    dt.Columns.Add("ItemCGSTValue");
            //    dt.Columns.Add("ItemSGSTValue");
            //}
            Rowindex++;
        }

        return RemoveEmptyRows(dt);
    }                                                                    
    private DataTable GetDTFromExcel2007(String Path, int colindex1, int colindex2, string SheetName, int i, XSSFWorkbook wb,List<int> lstint)
    {
        XSSFSheet sh;
        DataTable DT = new DataTable();
        DT.Rows.Clear();
        DT.Columns.Clear();
        sh = (XSSFSheet)wb.GetSheet(SheetName);
        //int i = 3;
        // int  Emptyrowflage = 0;
        while (sh.GetRow(i) != null)
        {
            string RowsValue = "";
            DT.Rows.Add();
            for (int j = 0; j < sh.GetRow(i).Cells.Count; j++)
            {

                var cell = sh.GetRow(i).GetCell(j);
                if (cell != null)
                {
                    //switch (cell.CellType)
                    //{
                    if (cell.CellType == NPOI.SS.UserModel.CellType.Numeric || cell.CellType == NPOI.SS.UserModel.CellType.Formula)
                    {
                        if (i == 3)
                        {
                            DT.Columns.Add(sh.GetRow(i).GetCell(j).NumericCellValue.ToString(), typeof(string));
                            RowsValue += sh.GetRow(i).GetCell(j).NumericCellValue.ToString();
                        }
                        else
                        {
                            if (colindex1 == j || colindex2 == j)
                            {
                                DT.Rows[i - 4][j] = DateTime.FromOADate(sh.GetRow(i).GetCell(j).NumericCellValue).ToString("yyyy/MM/dd");
                                RowsValue += sh.GetRow(i).GetCell(j).NumericCellValue;
                            }

                            else
                            {
                                DT.Rows[i - 4][j] = sh.GetRow(i).GetCell(j).NumericCellValue.ToString().Replace(",", "").Trim();
                                RowsValue += sh.GetRow(i).GetCell(j).NumericCellValue;
                                //if (ExtraCol)
                                //{
                                //    DT.Rows[i - 4]["ItemIGSTValue"] = 0;
                                //    DT.Rows[i - 4]["ItemcGSTValue"] = 0;
                                //    DT.Rows[i - 4]["ItemSGSTValue"] = 0;
                                //}
                            }

                        }

                    }
                    else if (cell.CellType == NPOI.SS.UserModel.CellType.String)
                    {
                        if (i == 3)
                        {
                            DT.Columns.Add(sh.GetRow(i).GetCell(j).StringCellValue.ToString(), typeof(string));
                            RowsValue += sh.GetRow(i).GetCell(j).StringCellValue.ToString();
                        }
                        else
                        {
                            DateTime date;
                            if (colindex1 == j || colindex2 == j)
                            {
                                if (sh.GetRow(i).GetCell(j).StringCellValue == "")
                                {
                                    DT.Rows[i - 4][j] = "";
                                }
                                else
                                {
                                    if (sh.GetRow(i).GetCell(j).StringCellValue.Length == 10)
                                    {
                                       
                                        if (!DateTime.TryParse(CLSCommon.DateFormat(sh.GetRow(i).GetCell(j).StringCellValue), new System.Globalization.CultureInfo("en-GB"), System.Globalization.DateTimeStyles.None, out date))
                                        {
                                            dtError.Rows.Add(1);
                                            dtError.Rows[dtError.Rows.Count - 1]["Section"] = sh.SheetName;
                                            dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (i + 1).ToString();
                                            dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Date Format Must Be \"DD/MM/YYYY\"";
                                            dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                        }
                                        else
                                        {
                                            DT.Rows[i - 4][j] = DateTime.Parse(CLSCommon.DateFormat(sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim())).ToString("yyyy/MM/dd");
                                            RowsValue += sh.GetRow(i).GetCell(j).StringCellValue;
                                        }
                                    }
                                    else if ((sh.GetRow(i).GetCell(j).StringCellValue.Length == 11 || sh.GetRow(i).GetCell(j).StringCellValue.Length == 9) &&
                                       ((DateTime.TryParseExact((sh.GetRow(i).GetCell(j).StringCellValue), "dd-MMM-yyyy", null, DateTimeStyles.None, out date))
                                       || (DateTime.TryParseExact((sh.GetRow(i).GetCell(j).StringCellValue), "dd-MMM-yy", null, DateTimeStyles.None, out date))
                                       ))
                                    {
                                        DT.Rows[i - 4][j] = DateTime.Parse(sh.GetRow(i).GetCell(j).StringCellValue).ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
                                        RowsValue += sh.GetRow(i).GetCell(j).StringCellValue;
                                    }
                                    else
                                    {
                                        dtError.Rows.Add(1);
                                        dtError.Rows[dtError.Rows.Count - 1]["Section"] = sh.SheetName;
                                        dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (i + 1).ToString();
                                        dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Date Format Must Be \"DD/MM/YYYY\"";
                                        dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                    }
                                }
                            }
                            else
                            {
                                 var res = from k in lstint where k==j
                                          select k ;
                                 if ( res.Count() > 0)
                                 {
                                     double parsedValue;
                                     if (!double.TryParse(sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim(), out parsedValue) && sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim()!="")
                                     {
                                         dtError.Rows.Add(1);
                                         dtError.Rows[dtError.Rows.Count - 1]["Section"] = sh.SheetName;
                                         dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (i + 1).ToString();
                                         dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Invalid Numeric value";
                                         dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                     }else
                                     {
                                         DT.Rows[i - 4][j] = sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim();
                                         RowsValue += sh.GetRow(i).GetCell(j).StringCellValue;
                                     }
                                 }
                                 else
                                 {
                                     DT.Rows[i - 4][j] = sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim();
                                     RowsValue += sh.GetRow(i).GetCell(j).StringCellValue;
                                 }
                            }
                            //if (ExtraCol)
                            //{
                            //    DT.Rows[i - 4]["ItemIGSTValue"] = 0;
                            //    DT.Rows[i - 4]["ItemcGSTValue"] = 0;
                            //    DT.Rows[i - 4]["ItemSGSTValue"] = 0;
                            //}

                        }
                    }
                }
            } i++;
        }

        //if (i == 3 && ExtraCol)
        //{
        //    DT.Columns.Add("ItemIGSTValue");
        //    DT.Columns.Add("ItemCGSTValue");
        //    DT.Columns.Add("ItemSGSTValue");
        //}



        return RemoveEmptyRows(DT);
    }

    private static string GetValue(ICell cell, DataFormatter dataFormatter, IFormulaEvaluator formulaEvaluator, int datecol1, int datecol2, int Rowindex)
    {
        string ret = string.Empty;
        if (null == cell) { return ret; }
        if ((datecol1 == cell.ColumnIndex || datecol2 == cell.ColumnIndex) && Rowindex != 0)
        {
            ret = DateTime.Parse(dataFormatter.FormatCellValue(cell, formulaEvaluator)).ToString("yyyy/MM/dd");
        }
        else
        {
            ret = dataFormatter.FormatCellValue(cell, formulaEvaluator);
        }
        return ret.Replace("\n", " "); // remove line break
    }
    private static string GetComment(ICell cell)
    {
        string ret = string.Empty;
        if ((null == cell) || (null == cell.CellComment)) { return ret; }
        IRichTextString str = cell.CellComment.String;
        if (str != null && str.Length > 0)
        {
            ret = str.ToString();
        }
        return ret.Replace("\n", " "); // remove line break
    }
    private DataTable RemoveEmptyRows(DataTable source)
    {
        DataTable dtReturn = source;
        try
        {

            int RowIndex = 0;
            int TotalRows = source.Rows.Count;
            for (int i = 0; i < TotalRows; i++)
            {
                string rowval = "";
                DataRow currentRow = dtReturn.Rows[RowIndex];
                foreach (var colValue in currentRow.ItemArray)
                {
                    rowval += colValue.ToString();
                }
                if (rowval.Trim() == "")
                {
                    dtReturn.Rows.RemoveAt(RowIndex);
                    //  TotalRows--;
                }
                else
                {
                    RowIndex++;
                }
            }
        }
        catch
        {

        }
        return dtReturn;
    }

    #region Old Code For Excel Import By OLEDB
    private void Import_To_Grid(string FilePath, string Extension, string ExcelNo)
    {
        OleDbConnection connExcel = null;
        OleDbCommand cmdExcel = null;
        OleDbDataAdapter oda = null;
        try
        {
            string conStr = "";
            string maxRow = "";
            switch (Extension)
            {
                case ".xls": //Excel 97-03
                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]
                             .ConnectionString;
                    maxRow = "4:64000";
                    break;
                case ".xlsx": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    maxRow = "4:1000000";
                    break;

                case ".xlsm": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    maxRow = "4:1000000";
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
            DataTable dt1 = new DataTable();
            DataTable dt2 = new DataTable();
            DataTable dt3 = new DataTable();
            DataTable dt4 = new DataTable();
            DataTable dt5 = new DataTable();
            DataTable dt6 = new DataTable();
            DataTable dt7 = new DataTable();
            DataTable dt8 = new DataTable();
            DataTable dt9 = new DataTable();
            DataTable dt10 = new DataTable();
            cmdExcel.Connection = connExcel;

            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

            //  connExcel.Close();

            //  connExcel.Open();
            if (rdbExcelTally.Checked)
            {
                //dt.Columns.Add("GSTIN/UIN of Recipient",typeof(string));
                //dt.Columns.Add("Invoice Number", typeof(string));
                //dt.Columns.Add("Invoice date", typeof(DateTime));
                //dt.Columns.Add("Invoice Value", typeof(string));	
                // dt.Columns.Add("Place Of Supply"  ,typeof(string));
                // dt.Columns.Add("Reverse Charge", typeof(string));
                // dt.Columns.Add("Invoice Type", typeof(string));
                // dt.Columns.Add("E-Commerce GSTIN", typeof(string));
                // dt.Columns.Add("Rate", typeof(string));
                // dt.Columns.Add("Taxable Value", typeof(string));
                // dt.Columns.Add("Cess Amount", typeof(string));
                //dt = GetDataTableFromExcel(FilePath + Extension);
                //dt = ImportExcelOpenXML("b2b", "C", "C", FilePath + Extension, "C", true, 11);
                //dt1 = ImportExcelOpenXML("b2cl", "B", "B", FilePath + Extension, "B", true, 8);
                //dt2 = ImportExcelOpenXML("b2cs", "/", "/", FilePath + Extension, "A", true, 6);
                //dt3 = ImportExcelOpenXML("cdnr", "C", "E", FilePath + Extension, "C", true, 13);
                //dt4 = ImportExcelOpenXML("cdnur", "C", "F", FilePath + Extension, "C", true, 13);
                //dt5 = ImportExcelOpenXML("exp", "C", "C", FilePath + Extension, "C", false, 9);

                //dt6 = ImportExcelOpenXML("exemp", "-", "-", FilePath + Extension, "A", false, 4);
                //dt7 = ImportExcelOpenXML("hsn", "-", "-", FilePath + Extension, "C", false, 10);
                //dt8 = ImportExcelOpenXML("docs", "-", "-", FilePath + Extension, "A", false, 5);
                //dt9 = ImportExcelOpenXML("at", "-", "-", FilePath + Extension, "A", false, 4);
                //dt10 = ImportExcelOpenXML("atadj", "-", "-", FilePath + Extension, "A", false, 4);

                //string strqry1 = "SELECT [GSTIN/UIN of Recipient],CVar([Invoice Number]) as [Invoice Number],Format([Invoice date],'yyyy/MM/dd') as [Invoice date],CVar( [Invoice Value] ) as  [Invoice Value] ,[Place Of Supply],";
                //strqry1 += " [Reverse Charge] ,[Invoice Type] ,[E-Commerce GSTIN] ,[Rate] , [Taxable Value],[Cess Amount],0 as [ItemIGSTValue],0 as [ItemCGSTValue],0 as [ItemSGSTValue] From [b2b$" + maxRow + "]";
                //strqry1 += " where  [GSTIN/UIN of Recipient] is not null or [Invoice Number] is not null  or [Invoice Value] is not null or [Place Of Supply] is not null or [Reverse Charge] is not null ";
                //strqry1 += " or [Invoice Type] is not null or [E-Commerce GSTIN] is not null or [Rate] is not null or [Taxable Value] is not null or [Cess Amount] is not null ";
                string strqry1 = "SELECT * From [b2b$" + maxRow + "]";

                cmdExcel.CommandText = strqry1;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt);

                //Read Data from 2nd Sheet 

                string strqry2 = "select CVar([Invoice Number]) as [Invoice Number] ,Format([Invoice date],'yyyy/MM/dd') AS [Invoice date],[Invoice Value],[Place Of Supply],[Rate],[Taxable Value],";
                strqry2 += "[Cess Amount],[E-Commerce GSTIN],0 as [ItemIGSTValue],0 as [ItemCGSTValue],0 as [ItemSGSTValue] from [b2cl$" + maxRow + "] where [Invoice Number] is not null or [Invoice date] is not null or [Invoice Value] is not null ";
                strqry2 += " or [Place Of Supply] is not null or [Rate] is not null or [Taxable Value] is not null";
                cmdExcel.CommandText = strqry2;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt1);
                // 3 sheet b2cs
                string strqry3 = "select [Type],[Place Of Supply],[Rate],[Taxable Value],[Cess Amount],[E-Commerce GSTIN],0 as [ItemIGSTValue],0 as [ItemCGSTValue],0 as [ItemSGSTValue]  from [b2cs$" + maxRow + "] ";
                strqry3 += " where [Type] IS NOT NULL or [Place Of Supply] is not null or [Rate] is not null or [Taxable Value] is not null or [Cess Amount] is not null";
                strqry3 += " or [E-Commerce GSTIN] is not null";
                cmdExcel.CommandText = strqry3;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt2);
                //4 cdnr
                string strqry4 = " select [GSTIN/UIN of Recipient],CVar([Invoice/Advance Receipt Number]) as [Invoice/Advance Receipt Number] ,[Invoice/Advance Receipt date],CVar([Note/Refund Voucher Number]) as [Note/Refund Voucher Number],[Note/Refund Voucher date],";
                strqry4 += " [Document Type],[Reason For Issuing document],	[Place Of Supply],[Note/Refund Voucher Value],[Rate],[Taxable Value],[Cess Amount],[Pre GST],";
                strqry4 += " 0 as [ItemIGSTValue],0 as [ItemCGSTValue],0 as [ItemSGSTValue]  from [cdnr$" + maxRow + "]";
                strqry4 += " where [GSTIN/UIN of Recipient] is not null or [Invoice/Advance Receipt Number] is not null or [Invoice/Advance Receipt date] is not null or ";
                strqry4 += " [Note/Refund Voucher Number] is not null or [Note/Refund Voucher date] is not null or  [Document Type] is not null or [Reason For Issuing document] is not null or ";
                strqry4 += " [Place Of Supply] is not null or [Note/Refund Voucher Value] is not null or [Rate] is not null or [Taxable Value]is not null or [Cess Amount] is not null or [Pre GST] is not null ";
                cmdExcel.CommandText = strqry4;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt3);
                ////5 cdnur
                string strqry5 = " select [UR Type],CVar([Note/Refund Voucher Number]) as [Note/Refund Voucher Number],[Note/Refund Voucher date],[Document Type],CVar([Invoice/Advance Receipt Number]) as [Invoice/Advance Receipt Number],[Invoice/Advance Receipt date],";
                strqry5 += " [Reason For Issuing document],[Place Of Supply],[Note/Refund Voucher Value],[Rate],[Taxable Value],[Cess Amount],[Pre GST],";
                strqry5 += " 0 as [ItemIGSTValue],0 as [ItemCGSTValue],0 as [ItemSGSTValue]  from [cdnur$" + maxRow + "]";
                strqry5 += " where [UR Type] is not null or [Note/Refund Voucher Number] is not null or [Note/Refund Voucher date] is not null or ";
                strqry5 += " [Document Type] is not null or [Invoice/Advance Receipt Number] is not null or  [Invoice/Advance Receipt date] is not null or [Reason For Issuing document] is not null or ";
                strqry5 += " [Place Of Supply] is not null or [Note/Refund Voucher Value] is not null or [Rate] is not null or[Taxable Value]is not null or [Cess Amount] is not null or[Pre GST] is not null ";
                cmdExcel.CommandText = strqry5;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt4);

                ////6 exp 		
                string strqry6 = "select [Export Type],CVar([Invoice Number]) as [Invoice Number],Format([Invoice date],'yyyy/MM/dd') AS [Invoice date],[Invoice Value],[Port Code],CVar([Shipping Bill Number]) as [Shipping Bill Number],";
                strqry6 += " Format([Shipping Bill Date],'yyyy/MM/dd') as [Shipping Bill Date],[Rate],[Taxable Value] from [exp$" + maxRow + "]";
                strqry6 += " where [Export Type] is not null or [Invoice Number] is not null or [Invoice date]  is not null or [Invoice Value] is not null or ";
                strqry6 += " [Port Code] is not null or [Shipping Bill Number] is not null or [Shipping Bill Date] is not null or [Rate] is not null  or [Taxable Value] is not null ";
                cmdExcel.CommandText = strqry6;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt5);
                ////7 exemp
                string strqry7 = "select [Description],[Nil Rated Supplies],[Exempted (other than nil rated/non GST supply )],[Non-GST supplies] from [exemp$" + maxRow + "]";
                strqry7 += "where [Description] is not null or [Nil Rated Supplies] is not null or [Exempted (other than nil rated/non GST supply )] is not null or [Non-GST supplies] is not null ";
                cmdExcel.CommandText = strqry7;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt6);
                ////8  hsn
                string strqry8 = "select CVar([HSN]) as [HSN],	[Description],	[UQC],	[Total Quantity],[Total Value],[Taxable Value],[Integrated Tax Amount],[Central Tax Amount],[State/UT Tax Amount],[Cess Amount] from [hsn$" + maxRow + "]";
                strqry8 += " where [HSN]  is not null or [Description]  is not null or	[UQC] is not null or [Total Quantity]  is not null or [Total Value] is not null or ";
                strqry8 += " [Taxable Value] is not null or [Integrated Tax Amount] is not null or [Central Tax Amount] is not null or [State/UT Tax Amount] is not null or [Cess Amount]  is not null";
                cmdExcel.CommandText = strqry8;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt7);
                ////9 docs
                string strqry9 = "select [Nature  of Document], CVar([Sr. No. From]) as [Sr. No. From], CVar([Sr. No. To]) as [Sr. No. To],[Total Number],[Cancelled] from [docs$" + maxRow + "]";
                strqry9 += " where [Nature  of Document] is not null  or [Sr. No. From] is not null or [Sr. No. To] is not null or [Total Number] is not null or [Cancelled] is not null";
                cmdExcel.CommandText = strqry9.Replace(".", "#");
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt8);

                ////10  at
                string strqry10 = "select [Place Of Supply],[Rate],[Gross Advance Received],[Cess Amount] from [at$" + maxRow + "]";
                strqry10 += " where [Place Of Supply] is not null or [Rate] is not null or [Gross Advance Received] is not null or [Cess Amount] is not null ";
                cmdExcel.CommandText = strqry10;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt9);

                ////11 atadj
                string strqry11 = "select [Place Of Supply],[Rate],[Gross Advance Adjusted],[Cess Amount] from [atadj$" + maxRow + "]";
                strqry11 += "where [Place Of Supply] is not null or [Rate] is not null or [Gross Advance Adjusted] is not null or [Cess Amount] is not null ";
                cmdExcel.CommandText = strqry11;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt10);
            }

            //connExcel.Close();
            PL_ImportExcelGSTR2Purchase objpl = new PL_ImportExcelGSTR2Purchase();
            //objpl.dt = dt;
            objpl.ds.Tables.Add(dt);
            objpl.ds.Tables.Add(dt1);
            objpl.ds.Tables.Add(dt2);
            objpl.ds.Tables.Add(dt3);
            objpl.ds.Tables.Add(dt4);
            objpl.ds.Tables.Add(dt5);
            objpl.ds.Tables.Add(dt6);
            objpl.ds.Tables.Add(dt7);
            objpl.ds.Tables.Add(dt8);
            objpl.ds.Tables.Add(dt9);
            objpl.ds.Tables.Add(dt10);
            objpl.ds.Tables[0].TableName = "Tblb2b";
            objpl.ds.Tables[1].TableName = "Tblb2cl";
            objpl.ds.Tables[2].TableName = "Tblb2cs";
            objpl.ds.Tables[3].TableName = "Tblcdn";
            objpl.ds.Tables[4].TableName = "Tblcdnur";
            objpl.ds.Tables[5].TableName = "Tblexp";
            objpl.ds.Tables[6].TableName = "Tblexemp";
            objpl.ds.Tables[7].TableName = "Tblhsn";
            objpl.ds.Tables[8].TableName = "Tbldocs";
            objpl.ds.Tables[9].TableName = "Tblat";
            objpl.ds.Tables[10].TableName = "Tblatadj";
            objpl.ind = 1;
            objpl.UserCode = int.Parse(Session["UserCode"].ToString());
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();//lbl.Text;
            objpl.CACode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
            objpl.MonthYearDesc = Session["MonthYearDesc"].ToString();
            objpl.ExcelType = rdbSale.Checked ? 1 : 2;
            objpl.DataFromId = 2;//tally
            objpl.ExcelNo = Convert.ToInt32(ExcelNo);
            //#region

            DataTable dtresponse = CLSCommon.CallApiPost("api/ImportTallySalesData/TallySalesImportData", objpl);
            if (dtresponse != null)
            {
                if (dtresponse.Rows.Count > 0)
                {
                    if (dtresponse.Rows[0][0].ToString() == "1")
                    {
                        //            DataSet ds1 = CLSCommon.CallApiGet("api/GSTR1Payload/SaveSGTR1Payload?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CacodeOdp=" + Session["CacodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + ddlMonthYear.SelectedValue.ToString() + "&UserCode=" + Session["UserCode"].ToString() + "&ExcelNo=" + dtresponse.Rows[0]["ExcelNo"].ToString());
                        //            txtPayload.Text = ds1.Tables[0].Rows[0]["Payload"].ToString();                     
                        Panels.Visible = true;
                        Panels.Attributes.Add("class", "alert alert-success");
                        string TotalRows = Convert.ToString(dt.Rows.Count + dt1.Rows.Count + dt2.Rows.Count + dt3.Rows.Count + dt4.Rows.Count + dt5.Rows.Count + dt6.Rows.Count + dt7.Rows.Count + dt8.Rows.Count + dt9.Rows.Count + dt10.Rows.Count);
                        lblTotalRecords.Text = TotalRows;//dt.Rows.Count.ToString();
                        lblImported.Text = TotalRows;//dt.Rows.Count.ToString();
                        lblMessage.Text = "Excel Imported Successfully. \n Total Rows : " + TotalRows;// dt.Rows.Count.ToString();
                        lnkbtnViewError.Visible = false;
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
                        sb.AppendLine("Section   |Line No |Invoice No.    |Invoice Date|Invoice Value|Error Desc With Code");
                        foreach (DataRow dr in dtresponse.Rows)
                        {
                            sb.AppendLine(dr["ApNameDesc"].ToString().PadRight(10, ' ') + "|" + dr["LineNo"].ToString().PadRight(8, ' ') + "|" + dr["CurrInvoiceNo"].ToString().PadRight(15, ' ') + "|" + dr["InvoiceDate"].ToString().PadRight(12, ' ') + "|" + dr["TotInvoiceValue"].ToString().PadRight(13, ' ') + "|" + dr["ErrorCode"].ToString() + " - " + dr["ErrorDesc"].ToString());
                        }
                        sb.AppendLine("");
                        sb.AppendLine("******************************************END OF THE RECORDS***************************************************");
                        System.IO.File.WriteAllText(Server.MapPath("~/ErrorTextFile/" + ExcelNo + ".txt"), sb.ToString());
                        lnkbtnViewError.Attributes.Add("href", "../ErrorTextFile/" + ExcelNo + ".txt");
                        lnkbtnViewError.Attributes.Add("download", "GSTR1_ErrorFile_" + ExcelNo);
                        //lnkbtnViewError.Attributes.Add("target", "_blanck");
                        lnkbtnViewError.Visible = true;
                    }
                    else
                    {
                        Panels.Visible = true;
                        Panels.Attributes.Add("class", "alert alert-warning");
                        lblTotalRecords.Text = "0";
                        lblImported.Text = "0";

                        lblMessage.Text = dtresponse.Rows[0]["ErrorMessage"].ToString().Replace("{{MonthYear}}", Session["MonthYrCode"].ToString());

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
                //    // Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
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
            //#endregion
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
    #endregion
}