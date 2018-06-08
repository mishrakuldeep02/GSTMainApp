using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Schema;
using NPOI.HSSF.UserModel;
using NPOI.POIFS.FileSystem;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public static String GSTINFORMAT_REGEX = "[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9A-Za-z]{1}[Z]{1}[0-9a-zA-Z]{1}";
    public static String GSTN_CODEPOINT_CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public void main()
    {
        Console.Write("Enter GSTIN Number");
        String gstin = txtGSTIN.Text;
        try
        {
            if (validGSTIN(gstin))
                Response.Write("Valid GSTIN!");

            else
                Response.Write("Invalid GSTIN");
        }
        catch (Exception e)
        {
        }
    }
    private static Boolean validGSTIN(String gstin)
    {
        Boolean isValidFormat = false;
        if (checkPattern(gstin, GSTINFORMAT_REGEX))
        {
            isValidFormat = verifyCheckDigit(gstin);
        }
        return isValidFormat;
    }
    Regex r = new Regex(GSTINFORMAT_REGEX, RegexOptions.IgnoreCase);
    public static Boolean checkPattern(String inputval, String regxpatrn)
    {
        bool result = false;
        Regex r = new Regex(GSTINFORMAT_REGEX, RegexOptions.IgnoreCase);
        Match m = r.Match(inputval);
        return m.Success;
    }
    private static Boolean verifyCheckDigit(String gstinWCheckDigit)
    {
        Boolean isCDValid = false;
        String newGstninWCheckDigit = getGSTINWithCheckDigit(
                gstinWCheckDigit.Substring(0, gstinWCheckDigit.Length - 1));

        if (gstinWCheckDigit.Trim().Equals(newGstninWCheckDigit))
        {
            isCDValid = true;
        }
        return isCDValid;
    }
    public static String getGSTINWithCheckDigit(String gstinWOCheckDigit)
    {
        int factor = 2;
        int sum = 0;
        int checkCodePoint = 0;
        char[] cpChars;
        char[] inputChars;

        try
        {
            if (gstinWOCheckDigit == null)
            {

                throw new Exception("GSTIN supplied for checkdigit calculation is null");
            }
            cpChars = GSTN_CODEPOINT_CHARS.ToCharArray();
            inputChars = gstinWOCheckDigit.Trim().ToUpper().ToCharArray();

            int mod = cpChars.Length;
            for (int i = inputChars.Length - 1; i >= 0; i--)
            {
                int codePoint = -1;
                for (int j = 0; j < cpChars.Length; j++)
                {
                    if (cpChars[j] == inputChars[i])
                    {
                        codePoint = j;
                    }
                }
                int digit = factor * codePoint;
                factor = (factor == 2) ? 1 : 2;
                digit = (digit / mod) + (digit % mod);
                sum += digit;
            }
            checkCodePoint = (mod - (sum % mod)) % mod;
            String str = gstinWOCheckDigit + cpChars[checkCodePoint];
            return gstinWOCheckDigit + cpChars[checkCodePoint];
        }
        finally
        {
            inputChars = null;
            cpChars = null;
        }
    }
    protected void btnCheckValidGSTIN_Click(object sender, EventArgs e)
    {
        JSchema schema = JSchema.Parse(File.ReadAllText(Server.MapPath("~/Schema.json")));
        JToken json = JToken.Parse(File.ReadAllText(Server.MapPath("~/Payload.json")));
        IList<ValidationError> errors;
        bool valid = json.IsValid(schema, out errors);
    }
    //protected void btnUpload_Click(object sender, EventArgs e)
    //{
    //    string Extension = Path.GetExtension(fuExcel.PostedFile.FileName);
    //    fuExcel.PostedFile.SaveAs(Server.MapPath("~/ExcelFile/Amit" + Extension));
    //    if (Extension == ".xls")
    //    {
    //        DataTable dt = GetExcel(Server.MapPath("~/ExcelFile/Amit" + Extension),2);
    //    }
    //    else
    //    {
    //        DataTable dt = GetDataTableFromExcel(Server.MapPath("~/ExcelFile/Amit" + Extension),15,15,2);
    //    }
    //}
    //DataTable GetExcel(string extractFile,int SheetId)
    //{
    //    DataTable dt = new DataTable();
    //    try
    //    {
    //        using (StreamReader input = new StreamReader(extractFile))
    //        {
    //            IWorkbook workbook = new HSSFWorkbook(new POIFSFileSystem(input.BaseStream));

    //            // calculates/updates the formulas on the given workbook
    //            IFormulaEvaluator formulaEvaluator = new HSSFFormulaEvaluator(workbook);
    //            DataFormatter dataFormatter = new HSSFDataFormatter(new CultureInfo("en-US"));

    //            //foreach (ISheet sheet in workbook)
    //            //{
    //            ISheet sheet = workbook.GetSheetAt(SheetId);
    //            // IRow rows = .v;
    //           // string firstRow = GetValue(sheet.GetRow(0).GetCell(0), dataFormatter, formulaEvaluator, 2, 2, 0);
    //            int Rowindex = 3, colindex = 0,Emptyrowflage=0;
    //            while (sheet.GetRow(Rowindex) != null)
    //            {
    //                colindex = 0;
    //                dt.Rows.Add();
    //                string RowsValue = "";
    //                foreach (ICell cell in sheet.GetRow(Rowindex))
    //                {
    //                    if (Rowindex == 3)
    //                    {
    //                        string value = GetValue(cell, dataFormatter, formulaEvaluator, 2, 2, 0);
    //                        dt.Columns.Add(value);
    //                    }
    //                    else if (Rowindex > 3)
    //                    {
                           
    //                        string value = GetValue(cell, dataFormatter, formulaEvaluator, 2, 2, 1);
    //                        RowsValue += value;
    //                        dt.Rows[Rowindex -4][colindex] = value;
    //                        colindex++;
    //                    }
    //                }
    //                if (RowsValue=="")
    //                {
    //                    Emptyrowflage++;
    //                }
    //                if(Emptyrowflage==2)
    //                {
    //                    break;
    //                }
    //                Rowindex++;
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Console.WriteLine("Exception: " + ex.Message);
    //        if (null != ex.InnerException)
    //        {
    //            Console.WriteLine("Inner Exception: " + ex.InnerException.Message);
    //        }
    //    }
    //    return dt;
    //}

    //private DataTable GetDataTableFromExcel(String Path,int colindex1,int colindex2,int SheetId)
    //{
    //    XSSFWorkbook wb;
    //    XSSFSheet sh;
    //    String Sheet_name;

    //    using (var fs = new FileStream(Path, FileMode.Open, FileAccess.Read))
    //    {
    //        wb = new XSSFWorkbook(fs);

    //        Sheet_name = wb.GetSheetAt(SheetId).SheetName;  //get first sheet name
    //    }
    //    DataTable DT = new DataTable();
    //    DT.Rows.Clear();
    //    DT.Columns.Clear();

    //    // get sheet
    //    sh = (XSSFSheet)wb.GetSheet(Sheet_name);

    //    int i = 3, Emptyrowflage = 0;
    //    while (sh.GetRow(i) != null)
    //    {
    //        string RowsValue = "";
    //        DT.Rows.Add();
    //        for (int j = 0; j < sh.GetRow(i).Cells.Count; j++)
    //        {
                
    //            var cell = sh.GetRow(i).GetCell(j);
    //            if (cell != null)
    //            {
    //                switch (cell.CellType)
    //                {
    //                    case NPOI.SS.UserModel.CellType.Numeric:
    //                        if (i == 3)
    //                        {
    //                            DT.Columns.Add(sh.GetRow(i).GetCell(j).NumericCellValue.ToString(), typeof(string));
    //                        }
    //                        else
    //                        {
    //                            if (colindex1==j||colindex2==j)
    //                            {
    //                                DT.Rows[i - 4][j] = DateTime.FromOADate( sh.GetRow(i).GetCell(j).NumericCellValue).ToString("yyyy/MM/dd");
    //                                RowsValue += sh.GetRow(i).GetCell(j).NumericCellValue;
    //                            }else
    //                            {
    //                                DT.Rows[i - 4][j] = sh.GetRow(i).GetCell(j).NumericCellValue;
    //                                RowsValue += sh.GetRow(i).GetCell(j).NumericCellValue;
    //                            }
                                
    //                        }

    //                        break;
    //                    case NPOI.SS.UserModel.CellType.String:
    //                        if (i == 3)
    //                        {
    //                            DT.Columns.Add(sh.GetRow(i).GetCell(j).StringCellValue.ToString(), typeof(string));
    //                        }
    //                        else
    //                        {
    //                            DT.Rows[i - 4][j] = sh.GetRow(i).GetCell(j).StringCellValue;
    //                            RowsValue += sh.GetRow(i).GetCell(j).StringCellValue;
                                
    //                        }
    //                        break;
    //                }
    //            }
    //        }
    //        if (RowsValue == "")
    //        {
    //            Emptyrowflage++;
    //        }
    //        if (Emptyrowflage == 2)
    //        {
    //            break;
    //        }

    //        i++;
    //    }

    //    return DT;
    //}
    //private static string GetValue(ICell cell, DataFormatter dataFormatter, IFormulaEvaluator formulaEvaluator, int datecol1, int datecol2, int Rowindex)
    //{
    //    string ret = string.Empty;
    //    if (null == cell) { return ret; }
    //    if ((datecol1 == cell.ColumnIndex || datecol2 == cell.ColumnIndex) && Rowindex != 0)
    //    {
    //        ret = DateTime.Parse(dataFormatter.FormatCellValue(cell, formulaEvaluator)).ToString("yyyy/MM/dd");
    //    }
    //    else
    //    {
    //        ret = dataFormatter.FormatCellValue(cell, formulaEvaluator);
    //    }
    //    return ret.Replace("\n", " "); // remove line break
    //}
    //private static string GetComment(ICell cell)
    //{
    //    string ret = string.Empty;
    //    if ((null == cell) || (null == cell.CellComment)) { return ret; }
    //    IRichTextString str = cell.CellComment.String;
    //    if (str != null && str.Length > 0)
    //    {
    //        ret = str.ToString();
    //    }
    //    return ret.Replace("\n", " "); // remove line break
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(Days(DateTime.Parse(TextBox1.Text), DateTime.Parse(TextBox2.Text)));
        Response.Write("</br>"+(DateTime.Parse(TextBox2.Text) - DateTime.Parse(TextBox1.Text)).Days);
    }
    int Days(DateTime FromDate, DateTime Todate)
    {
        int days = 0,monthflage=0;
        if (FromDate.Year < Todate.Year && FromDate.Month <= Todate.Month && FromDate.Day <= Todate.Day)
        {
            days = (Todate.Year - FromDate.Year) * 12 * 30;
        }else
         if (FromDate.Year < Todate.Year)
            {
                days += ((Todate.Month - FromDate.Month)+12) * 30;
            }
        if (FromDate.Month < Todate.Month && FromDate.Day <= Todate.Day)
        {
           
           
                days += (Todate.Month - FromDate.Month) * 30;
            
            monthflage++;
        }
        if (FromDate.Month != Todate.Month)
        {
            if (monthflage > 0)
            {
                days += (Todate.Day) - FromDate.Day;
            }
            else
            {
                if((FromDate.Month-Todate.Month)==1||(FromDate.Month-Todate.Month)==-1)
                {
                days += (30 - FromDate.Day) + (Todate.Day) ;

                }else{
                    days += (Todate.Month - FromDate.Month) * 30 + Todate.Day-FromDate.Day;
                }
            }
        }else
        {
            days += Todate.Day - FromDate.Day;
        }
        return days;
    }
//DataTable dt=new DataTable();
    public DataTable dtgrd
    {
        get { return (DataTable)ViewState["dtgrd"]; }
        set
        {
            ViewState["dtgrd"]=value;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (dtgrd==null)
        {
            dtgrd = new DataTable();
            dtgrd.Columns.Add("Name");
            dtgrd.Columns.Add("Address");
        }
        DataRow dr = dtgrd.NewRow();
        dr["Name"] = "Name" + dtgrd.Rows.Count.ToString();
        dr["Address"] = "Address" + dtgrd.Rows.Count.ToString();
        dtgrd.Rows.Add(dr);
        grd.DataSource = dtgrd;
        grd.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string fileName = FileUpload1.PostedFile.FileName;

        string Path = Server.MapPath("~/Files/" + fileName);
        FileUpload1.PostedFile.SaveAs(Path);
        SpreadsheetDocument spreadsheetDoc = SpreadsheetDocument.Open(Path,true);
        WorkbookPart bookpart = spreadsheetDoc.WorkbookPart;
        Workbook book = bookpart.Workbook;

        WorksheetPart sheetpart = bookpart.WorksheetParts.ElementAt(2);
        Worksheet worksheet = sheetpart.Worksheet;
        worksheet.RemoveAllChildren<SheetProtection>();
        worksheet.Save();
        spreadsheetDoc.Close();
    
    }

    private void Decrypt(string inputFilePath, string outputfilePath)
    {
        string EncryptionKey = "AAABBBBBAAA7";
        using (Aes encryptor = Aes.Create())
        {
            encryptor.Padding = PaddingMode.Zeros;
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (FileStream fsInput = new FileStream(inputFilePath, FileMode.Open))
            {
                using (CryptoStream cs = new CryptoStream(fsInput, encryptor.CreateDecryptor(), CryptoStreamMode.Read))
                {
                    using (FileStream fsOutput = new FileStream(outputfilePath, FileMode.Create))
                    {
                        int data;
                        fsInput.Position = 0;
                        while ((data = cs.ReadByte()) != -1)
                        {
                            fsOutput.WriteByte((byte)data);
                        }
                    }
                }
            }
        }
    }

}