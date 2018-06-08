using NPOI.HSSF.UserModel;
using NPOI.POIFS.FileSystem;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_FrmImportEwayBill : System.Web.UI.Page
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
        if (!fuTallyExcelImport.HasFile)
        {
            Panels.Attributes.Add("class", "alert alert-danger");
            lblTotalRecords.Text = "0";
            lblImported.Text = "0";
            Panels.Visible = true;
            lblMessage.Text = "Please Select Excel File.";
            return;
        }
        else if (Path.GetExtension(fuTallyExcelImport.FileName) != ".xls" && Path.GetExtension(fuTallyExcelImport.FileName) != ".xlsx" && Path.GetExtension(fuTallyExcelImport.FileName) != ".xlsm")
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

            DataSet ds = CLSCommon.CallApiGet("api/GenerateExcelNo/GenerateExcelNo?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&ClientGSTNNO=" + Session["ClientGSTNNO"].ToString() + "&GSTRInd=5&MonthCD=" + Session["MonthYrCode"].ToString());
            if (ds != null)
            {
                if (ds.Tables[0].Rows[0]["res"].ToString() == "1")
                {
                    string FileName = Path.GetFileName(fuTallyExcelImport.PostedFile.FileName);
                    string Extension = Path.GetExtension(fuTallyExcelImport.PostedFile.FileName);
                    string FolderPath = "~/GSTR1Excel/";
                    string FilePath = Server.MapPath(FolderPath + ds.Tables[0].Rows[0]["ExcelNo"].ToString());
                    ExcelNo = ds.Tables[0].Rows[0]["ExcelNo"].ToString();
                    fuTallyExcelImport.SaveAs(FilePath + Extension);
                     Import_To_Grid(FilePath, Extension, ExcelNo);
                   //GetDataFromExcel(FilePath + Extension, Extension);
                    //Import_To_Grid
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
   

   

    DataTable GetDTFromExcel2003(string extractFile, int datecol1, int datecol2, bool ExtraCol, string SheetName, int Rowindex, IWorkbook workbook, List<int> lstint)
    {
        DataTable dt = new DataTable();
        IFormulaEvaluator formulaEvaluator = new HSSFFormulaEvaluator(workbook);
        DataFormatter dataFormatter = new HSSFDataFormatter(new CultureInfo("en-US"));
        ISheet sheet = workbook.GetSheet(SheetName);
        if (sheet != null)
        {
            while (sheet.GetRow(Rowindex) != null)
            {
                dt.Rows.Add();
                string RowsValue = "";
                for (int j = 0; j < sheet.GetRow(Rowindex).Cells.Count; j++)
                {
                    var cell = sheet.GetRow(Rowindex).GetCell(j);
                    if (cell != null)
                    {
                        if (cell.CellType == NPOI.SS.UserModel.CellType.Numeric || cell.CellType == NPOI.SS.UserModel.CellType.Formula)
                        {
                            if (Rowindex == 3)
                            {
                                dt.Columns.Add(sheet.GetRow(Rowindex).GetCell(j).NumericCellValue.ToString().Replace(" ", "").Replace("(S+C+I+Cess)", "").Replace("(Km)", ""), typeof(string));
                                RowsValue += sheet.GetRow(Rowindex).GetCell(j).NumericCellValue.ToString().Replace(" ", "").Replace("(S+C+I+Cess)", "").Replace("(Km)", "");
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
                                    if (ExtraCol)
                                    {
                                        dt.Rows[Rowindex - 4]["ItemIGSTValue"] = 0;
                                        dt.Rows[Rowindex - 4]["ItemcGSTValue"] = 0;
                                        dt.Rows[Rowindex - 4]["ItemSGSTValue"] = 0;
                                    }
                                }
                            }
                        }
                        else if (cell.CellType == NPOI.SS.UserModel.CellType.String)
                        {
                            if (Rowindex == 3)
                            {
                                dt.Columns.Add(sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString().Replace(" ", "").Replace("(S+C+I+Cess)", "").Replace("(Km)", ""), typeof(string));
                                RowsValue += sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString().Replace(" ", "").Replace("(S+C+I+Cess)", "").Replace("(Km)", "");
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
                                                dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (Rowindex + 1).ToString();
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
                                            dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (Rowindex + 1).ToString();
                                            dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Date Format Must Be \"DD/MM/YYYY\"";
                                            dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                        }
                                    }
                                }
                                else
                                {
                                    var res = from k in lstint
                                              where k == j
                                              select k;
                                    if (res.Count() > 0)
                                    {
                                        double parsedValue;
                                        if (!double.TryParse(sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim(), out parsedValue) && sheet.GetRow(Rowindex).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim() != "")
                                        {
                                            dtError.Rows.Add(1);
                                            dtError.Rows[dtError.Rows.Count - 1]["Section"] = sheet.SheetName;
                                            dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (Rowindex + 1).ToString();
                                            dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Invalid Numeric value";//"Invalid Numberic value";
                                            dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                        }
                                        else
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
                                if (ExtraCol)
                                {
                                    dt.Rows[Rowindex - 4]["ItemIGSTValue"] = 0;
                                    dt.Rows[Rowindex - 4]["ItemcGSTValue"] = 0;
                                    dt.Rows[Rowindex - 4]["ItemSGSTValue"] = 0;
                                }
                            }
                        }
                    }
                }
                if (Rowindex == 3 && ExtraCol)
                {
                    dt.Columns.Add("ItemIGSTValue");
                    dt.Columns.Add("ItemCGSTValue");
                    dt.Columns.Add("ItemSGSTValue");
                }
                Rowindex++;
            }
        }
        return RemoveEmptyRows(dt);
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
    DataTable dtError = new DataTable();
    List<string> lstcol = new List<string>();
    private DataTable GetDTFromExcel2007(String Path, int colindex1, int colindex2, bool ExtraCol, string SheetName, int i, XSSFWorkbook wb, List<int> lstint)
    {
        XSSFSheet sh;
        DataTable DT = new DataTable();
        DT.Rows.Clear();
        DT.Columns.Clear();
        sh = (XSSFSheet)wb.GetSheet(SheetName);
        if (sh != null)
        {
            while (sh.GetRow(i) != null)
            {
                string RowsValue = "";
                DT.Rows.Add();
                for (int j = 0; j < 37; j++)
                {
                    var cell = sh.GetRow(i).GetCell(j);
                    if (cell != null)
                    {
                        if (cell.CellType == NPOI.SS.UserModel.CellType.Numeric || cell.CellType == NPOI.SS.UserModel.CellType.Formula)
                        {
                            if (i == 3)
                            {
                                DT.Columns.Add(sh.GetRow(i).GetCell(j).NumericCellValue.ToString().Replace(" ", "").Replace("(S+C+I+Cess)", "").Replace("(Km)", ""), typeof(string));
                                RowsValue += sh.GetRow(i).GetCell(j).NumericCellValue.ToString().Replace(" ", "").Replace("(S+C+I+Cess)", "").Replace("(Km)", "");
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
                                    if (ExtraCol)
                                    {
                                        DT.Rows[i - 4]["ItemIGSTValue"] = 0;
                                        DT.Rows[i - 4]["ItemcGSTValue"] = 0;
                                        DT.Rows[i - 4]["ItemSGSTValue"] = 0;
                                    }
                                }
                            }
                        }
                        else if (cell.CellType == NPOI.SS.UserModel.CellType.String)
                        {
                            if (i == 3)
                            {
                                DT.Columns.Add(sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(" ", "").Replace("(S+C+I+Cess)", "").Replace("(Km)", ""), typeof(string));
                                RowsValue += sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(" ", "").Replace("(S+C+I+Cess)", "").Replace("(Km)", "");
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
                                    var res = from k in lstint
                                              where k == j
                                              select k;
                                    if (res.Count() > 0)
                                    {
                                        double parsedValue;
                                        if (!double.TryParse(sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim(), out parsedValue) && sh.GetRow(i).GetCell(j).StringCellValue.ToString().Replace(",", "").Trim() != "")
                                        {
                                            dtError.Rows.Add(1);
                                            dtError.Rows[dtError.Rows.Count - 1]["Section"] = sh.SheetName;
                                            dtError.Rows[dtError.Rows.Count - 1]["LineNo"] = (i + 1).ToString();
                                            dtError.Rows[dtError.Rows.Count - 1]["Error"] = "Invalid Numeric value";
                                            dtError.Rows[dtError.Rows.Count - 1]["ColumnName"] = lstcol[j];
                                        }
                                        else
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
                                if (ExtraCol)
                                {
                                    DT.Rows[i - 4]["ItemIGSTValue"] = 0;
                                    DT.Rows[i - 4]["ItemcGSTValue"] = 0;
                                    DT.Rows[i - 4]["ItemSGSTValue"] = 0;
                                }

                            }
                        }
                    }
                }
                if (i == 3 && ExtraCol)
                {
                    DT.Columns.Add("ItemIGSTValue");
                    DT.Columns.Add("ItemCGSTValue");
                    DT.Columns.Add("ItemSGSTValue");
                }
                i++;
            }
        }
        return RemoveEmptyRows(DT);
    }
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
                    maxRow = "3:64000";
                    break;
                case ".xlsx": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    maxRow = "3:10000";
                    break;

                case ".xlsm": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    maxRow = "3:10000";
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
            conStr = String.Format(conStr, FilePath + Extension, "No");
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
                string strqry1 = "SELECT * From [eWayBill" + maxRow + "]";

                cmdExcel.CommandText = strqry1;
                oda.SelectCommand = cmdExcel;
                oda.Fill(dt);

               
            }

            //connExcel.Close();
            PL_EwayBill objpl = new PL_EwayBill();
            //objpl.dt = dt;
            objpl.ds.Tables.Add(dt);

            objpl.ds.Tables[0].TableName = "EwayBill";
          
            objpl.ind = 1;
            objpl.UserCode = int.Parse(Session["UserCode"].ToString());
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();//lbl.Text;
            objpl.CACode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
            objpl.ExcelNo = Convert.ToInt32(ExcelNo);
            //#region

            DataTable dtresponse = CLSCommon.CallApiPost("api/EwayBill/ImportEwayBill", objpl);
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
        DataTable dt = new DataTable();
        List<int> EwayBill = new List<int>() { 
        23,24,26,27,28,29,31
        };
        if (Extension == ".xls")
        {
            using (StreamReader input = new StreamReader(Path))
            {
                IWorkbook workbook = new HSSFWorkbook(new POIFSFileSystem(input.BaseStream));
                dt = GetDTFromExcel2003(Path, 4, 35, false, "eWayBill", 2, workbook, EwayBill);
            }
        }
        else
        {
            ICSharpCode.SharpZipLib.Zip.ZipConstants.DefaultCodePage = Encoding.Default.CodePage;
            XSSFWorkbook wb;
            using (MemoryStream memstream = new MemoryStream())
            {
                fuTallyExcelImport.PostedFile.InputStream.CopyTo(memstream);
                memstream.Position = 0;
                wb = new XSSFWorkbook(memstream);
            }

            //using (var fs = new FileStream(Path, FileMode.Open, FileAccess.Read))
            //{
            //    fs.Position = 0;
            //    wb = new XSSFWorkbook(fs);
            //}
            dt = GetDTFromExcel2007(Path, 4, 35, false, "eWayBill", 2, wb, EwayBill);
        }

        StringBuilder sb1 = new StringBuilder();
        if (dtError.Rows.Count > 0)
        {
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
            objcmn.DeleteData(1);
        }
        else
        {
            PL_EwayBill objpl = new PL_EwayBill();

            objpl.ds.Tables.Add(dt);

            objpl.ds.Tables[0].TableName = "EwayBill";
           
            objpl.ind = 1;
            objpl.UserCode = int.Parse(Session["UserCode"].ToString());
            objpl.ClientCode = int.Parse(Session["ClientCode"].ToString());
            objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
            objpl.ClientGSTNNO = Session["ClientGSTNNO"].ToString();//lbl.Text;
            objpl.CACode = int.Parse(Session["CaCode"].ToString());
            objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
            objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
         
            objpl.ExcelNo = Convert.ToInt32(ExcelNo);
            //#region

            DataTable dtresponse = CLSCommon.CallApiPost("api/EwayBill/ImportEwayBill", objpl);
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
                        string TotalRows = Convert.ToString(dt.Rows.Count );
                        lblTotalRecords.Text = TotalRows;//dt.Rows.Count.ToString();
                        lblImported.Text = TotalRows;//dt.Rows.Count.ToString();
                        lblMessage.Text = "Excel Imported Successfully. \n Total Rows : " + TotalRows;// dt.Rows.Count.ToString();
                        lnkbtnViewError.Visible = false;
                    }
                    else if (dtresponse.Rows[0][0].ToString() == "2")
                    {
                        // Label lblOrganisations = (Label)wucTaxPayerStrip.FindControl("lblClientName");
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
                    CLSCommon objcmn = new CLSCommon();
                    objcmn.DeleteData(1);
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
                CLSCommon objcmn = new CLSCommon();
                objcmn.DeleteData(1);
                lblTotalRecords.Text = "0";
                lblImported.Text = "0";
                Panels.Visible = true;
                Panels.Attributes.Add("class", "alert alert-danger");
                lblMessage.Text = "The File is not in the correct format.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
            }
        }
    }
}