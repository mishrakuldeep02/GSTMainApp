using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGovernmentExcel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          
        }
    }
    void CreateExcel(DataSet ds, string ExcelName)
    {
        try
        {
            DataSet ImportDs = ds;//new DataSet();
            //foreach (DataTable item in ds.Tables)
            //{
            //    if (item.Rows.Count > 0)
            //    {
            //        ImportDs.Tables.Add(item.Copy());
            //    }
            //}


            using (ImportDs)
            {
                //Set Name of DataTables.

                using (XLWorkbook wb = new XLWorkbook())
                {
                    CreateXlWorkBook(ImportDs, wb);

                    //Export the Excel file.
                    Response.Clear();
                    Response.Buffer = true;
                   // Response.Charset = "";
                   // Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;filename=" + ExcelName + ".xlsx");
                    using (MemoryStream MyMemoryStream = new MemoryStream())
                    {
                        wb.SaveAs(MyMemoryStream);
                        MyMemoryStream.WriteTo(Response.OutputStream);
                       //Response.Flush();
                        //Response.End();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            //Response.Flush();
            //Response.End();
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
    }

    XLWorkbook CreateXlWorkBook(DataSet ImportDs, XLWorkbook wb)
    {
        try
        {
            int Index = 0;

            foreach (DataTable dt in ImportDs.Tables)
            {
                
                    if (dt.Rows.Count <= 0)
                    {
                        dt.Columns.Add("No records", typeof(string));
                        dt.Rows.Add("No records");
                    }
                    if (Index % 2 != 0 || Index == 0)
                    {
                    //Add DataTable as Worksheet.

                    IXLWorksheet worksheet = wb.Worksheets.Add(dt);
                    worksheet.Tables.FirstOrDefault().ShowAutoFilter = false;
                    
                    /////      Add Header        ///                    
                    worksheet.Row(1).InsertRowsAbove(1);
                    worksheet.Row(2).InsertRowsAbove(1);
                    worksheet.Row(3).InsertRowsAbove(1);

                    int UsedCol = worksheet.ColumnsUsed().Count();
                    // worksheet.Row(1).Cell(UsedCol).Hyperlink.Cell.Value = "Help";
                    // worksheet.Row(1).Cell(UsedCol).Hyperlink.InternalAddress = "www.gstsaathiaccounts.in";
                    // worksheet.Row(1).Cell(UsedCol).Style.Alignment.SetHorizontal(XLAlignmentHorizontalValues.Center);


                    // Put a Blue Color in a 2 Rows Of Cells
                    foreach (var c in Enumerable.Range(1, UsedCol))
                    {
                        //worksheet.Cell(2, c).Style.Border.
                        worksheet.Cell(2, c).Style.Fill.BackgroundColor = XLColor.FromArgb(0, 112, 192);
                        worksheet.Cell(2, c).Style.Font.FontColor = XLColor.White;
                     //   worksheet.Cell(2, c).Style.Border.OutsideBorderColor = XLColor.Black;
                    }

                    // Put a Orange Color in a 4 Rows Of Cells Of Headers of Data
                    foreach (var c in Enumerable.Range(1, UsedCol))
                    {
                        worksheet.Cell(4, c).Style.Fill.BackgroundColor = XLColor.FromArgb(250, 191, 143);
                        worksheet.Cell(4, c).Style.Font.FontColor = XLColor.Black;
                       // worksheet.Cell(4, c).Style.Border.OutsideBorderColor = XLColor.Black;
                    }

                    //  Excel Name Row 1 Cell 1;
                    //worksheet.Cell(1, 1).Style.Fill.BackgroundColor = XLColor.FromArgb(0, 112, 192);
                    //worksheet.Cell(1, 1).Style.Fill.BackgroundColor = XLColor.White;
                    worksheet.Cells("A1").Style.Fill.BackgroundColor = XLColor.FromArgb(0, 112, 192);
                    worksheet.Cells("A1").Style.Font.FontColor = XLColor.White;

                    #region b2b
                    if (worksheet.Name == "b2b")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For B2B(4)";
                        worksheet.Cell("A2").Value = "No. of Recipients";
                        worksheet.Cell("B2").Value = "No. of Invoices";
                        worksheet.Cell("D2").Value = "Total Invoice Value";
                        worksheet.Cell("J2").Value = "Total Taxable Value";
                        worksheet.Cell("K2").Value = "Total Cess";

                        //if (dt.Rows.Count > 0)
                        //{
                            //DataView view = new DataView(dt);
                            worksheet.Cell("A3").Value = ImportDs.Tables[2].Rows[0]["TotalParty"].ToString();
                            worksheet.Cell("B3").Value = ImportDs.Tables[2].Rows[0]["TotalInvoice"].ToString();
                            worksheet.Cell("D3").Value = ImportDs.Tables[2].Rows[0]["invoiceValue"].ToString();
                            worksheet.Cell("J3").Value = ImportDs.Tables[2].Rows[0]["Taxableval"].ToString();
                            worksheet.Cell("K3").Value = ImportDs.Tables[2].Rows[0]["Cess"].ToString();

                            //view.ToTable(true, "GSTIN/UIN of Recipient").Rows.Count;
                            //view.ToTable(true, "Invoice Number").Rows.Count;
                            //dt.Compute("SUM([Invoice Value])", string.Empty);
                            //dt.Compute("SUM([Taxable Value])", string.Empty);
                            //dt.Compute("SUM([Cess Amount])", string.Empty);
                        //}
                    }
                    #endregion

                    #region b2cl
                    if (worksheet.Name == "b2cl")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For B2CL(5)";
                        worksheet.Cell("A2").Value = "No. of Invoices";
                        worksheet.Cell("C2").Value = "Total Invoice Value";
                        worksheet.Cell("F2").Value = "Total Taxable Value";
                        worksheet.Cell("G2").Value = "Total Cess";

                       
                            //DataView view = new DataView(dt);
                            worksheet.Cell("A3").Value = ImportDs.Tables[4].Rows[0]["TotalInvoice"].ToString();
                            worksheet.Cell("C3").Value = ImportDs.Tables[4].Rows[0]["invoiceValue"].ToString();
                            worksheet.Cell("F3").Value = ImportDs.Tables[4].Rows[0]["Taxableval"].ToString();
                            worksheet.Cell("G3").Value = ImportDs.Tables[4].Rows[0]["Cess"].ToString();
                            //view.ToTable(true, "Invoice Number").Rows.Count;
                            //dt.Compute("SUM([Invoice Value])", string.Empty);
                            //dt.Compute("SUM([Taxable Value])", string.Empty);
                            //dt.Compute("SUM([Cess Amount])", string.Empty);
                        
                    }
                    #endregion

                    #region b2cs
                    if (worksheet.Name == "b2cs")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For B2CS(7)";

                        worksheet.Cell("D2").Value = "Total Taxable Value";
                        worksheet.Cell("E2").Value = "Total Cess";

                        
                            //DataView view = new DataView(dt);

                            worksheet.Cell("D3").Value = ImportDs.Tables[6].Rows[0]["Taxableval"].ToString();
                            worksheet.Cell("E3").Value = ImportDs.Tables[6].Rows[0]["Cess"].ToString();
                            //dt.Compute("SUM([Taxable Value])", string.Empty);
                            //dt.Compute("SUM([Cess Amount])", string.Empty);
                        
                    }
                    #endregion

                    #region cdnr
                    if (worksheet.Name == "cdnr")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For CDNR(9B)";
                        worksheet.Cell("A2").Value = "No. of Recipients";
                        worksheet.Cell("B2").Value = "No. of Invoices";
                        worksheet.Cell("D2").Value = "No. of Notes/Vouchers";
                        worksheet.Cell("I2").Value = "Total Note/Refund Voucher Value";
                        worksheet.Cell("K2").Value = "Total Taxable Value";
                        worksheet.Cell("L2").Value = "Total Cess";

                        

                            //DataView view = new DataView(dt);
                            worksheet.Cell("A3").Value = ImportDs.Tables[8].Rows[0]["TotalReciepent"].ToString();
                            worksheet.Cell("B3").Value = ImportDs.Tables[8].Rows[0]["AmdTotalInvoice"].ToString();
                            worksheet.Cell("D3").Value = ImportDs.Tables[8].Rows[0]["TotalInvoice"].ToString();
                            worksheet.Cell("I3").Value = ImportDs.Tables[8].Rows[0]["invoiceValue"].ToString();
                            worksheet.Cell("K3").Value = ImportDs.Tables[8].Rows[0]["Taxableval"].ToString();
                            worksheet.Cell("L3").Value = ImportDs.Tables[8].Rows[0]["Cess"].ToString();

                            //view.ToTable(true, "GSTIN/UIN of Recipient").Rows.Count;
                            //view.ToTable(true, "Invoice/Advance Receipt Number").Rows.Count;
                            //view.ToTable(true, "Note/Refund Voucher Number").Rows.Count;
                            //dt.Compute("SUM([Note/Refund Voucher Value])", string.Empty);
                            //dt.Compute("SUM([Taxable Value])", string.Empty);
                            //dt.Compute("SUM([Cess Amount])", string.Empty);
                        
                    }
                    #endregion

                    #region cdnur
                    if (worksheet.Name == "cdnur")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For CDNUR(9B)";
                        worksheet.Cell("B2").Value = "No. of Notes/Vouchers";
                        worksheet.Cell("E2").Value = "No. of Invoices";
                        worksheet.Cell("I2").Value = "Total Note Value";
                        worksheet.Cell("K2").Value = "Total Taxable Value";
                        worksheet.Cell("L2").Value = "Total Cess";

                       
                            //DataView view = new DataView(dt);
                            worksheet.Cell("B3").Value = ImportDs.Tables[10].Rows[0]["AmdTotalInvoice"].ToString();
                            worksheet.Cell("E3").Value = ImportDs.Tables[10].Rows[0]["TotalInvoice"].ToString();
                            worksheet.Cell("I3").Value = ImportDs.Tables[10].Rows[0]["invoiceValue"].ToString();
                            worksheet.Cell("K3").Value = ImportDs.Tables[10].Rows[0]["Taxableval"].ToString();
                            worksheet.Cell("L3").Value = ImportDs.Tables[10].Rows[0]["Cess"].ToString();
                            
                            // view.ToTable(true, "Note/Refund Voucher Number").Rows.Count;
                            //view.ToTable(true, "Invoice/Advance Receipt Number").Rows.Count;
                            //dt.Compute("SUM([Note/Refund Voucher Value])", string.Empty);
                            //dt.Compute("SUM([Taxable Value])", string.Empty);
                            //dt.Compute("SUM([Cess Amount])", string.Empty);
                        
                    }
                    #endregion

                    #region exp
                    if (worksheet.Name == "exp")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For EXP(6)";
                        worksheet.Cell("B2").Value = "No. of Invoices";
                        worksheet.Cell("D2").Value = "Total Note Value";
                        worksheet.Cell("F2").Value = "No. of Shipping Bill";
                        worksheet.Cell("I2").Value = "Total Taxable Value";

                     
                            //DataView view = new DataView(dt);
                            worksheet.Cell("B3").Value = ImportDs.Tables[12].Rows[0]["TotalInvoice"].ToString();
                            worksheet.Cell("D3").Value = ImportDs.Tables[12].Rows[0]["InvoiceValue"].ToString();
                            worksheet.Cell("F3").Value = ImportDs.Tables[12].Rows[0]["ShippedInvoice"].ToString();
                            worksheet.Cell("I3").Value = ImportDs.Tables[12].Rows[0]["Taxablevalue"].ToString();

                            //view.ToTable(true, "Invoice Number").Rows.Count;
                            //dt.Compute("SUM([Invoice Value])", string.Empty);
                            //view.ToTable(true, "Shipping Bill Number").Rows.Count;
                            //dt.Compute("SUM([Taxable Value])", string.Empty);
                        
                    }
                    #endregion

                    #region at
                    if (worksheet.Name == "at")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For Advance Adjusted (11B)";
                        worksheet.Cell("C2").Value = "Total Advance Received";
                        worksheet.Cell("D2").Value = "Total Cess";


                        worksheet.Cell("C3").Value = ImportDs.Tables[14].Rows[0]["GrossReceived"].ToString();
                        worksheet.Cell("D3").Value = ImportDs.Tables[14].Rows[0]["CessAmt"].ToString();
                            //dt.Compute("SUM([Gross Advance Received])", string.Empty);
                            //dt.Compute("SUM([Cess Amount])", string.Empty);
                        
                    }
                    #endregion

                    #region atadj
                    if (worksheet.Name == "atadj")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For Advance Adjusted (11B)";
                        worksheet.Cell("C2").Value = "Total Advance Adjusted";
                        worksheet.Cell("D2").Value = "Total Cess";

                       
                            worksheet.Cell("C3").Value = ImportDs.Tables[16].Rows[0]["GrossReceived"].ToString();
                            worksheet.Cell("D3").Value = ImportDs.Tables[16].Rows[0]["CessAmt"].ToString();
                       
                    }
                    #endregion

                    #region exemp
                    if (worksheet.Name == "exemp")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For Nil rated, exempted and non GST outward supplies (8)";

                        worksheet.Cell("B2").Value = "Total Nil Rated Supplies";
                        worksheet.Cell("C2").Value = "Total Exempted Supplies";
                        worksheet.Cell("D2").Value = "Total Non-GST Supplies";

                       
                            //DataView view = new DataView(dt);
                            worksheet.Cell("B3").Value = ImportDs.Tables[18].Rows[0]["NillRated"].ToString();
                            worksheet.Cell("C3").Value = ImportDs.Tables[18].Rows[0]["ExmTotal"].ToString();
                            worksheet.Cell("D3").Value = ImportDs.Tables[18].Rows[0]["NonGstTotal"].ToString();

                            //dt.Compute("SUM([Nil Rated Supplies])", string.Empty);
                            //dt.Compute("SUM([Exempted (other than nil rated/non GST supply )])", string.Empty);
                            //dt.Compute("SUM([Non-GST supplies])", string.Empty);
                       
                    }
                    #endregion

                    #region hsn
                    if (worksheet.Name == "hsn")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary For HSN(12)";
                        worksheet.Cell("A2").Value = "No. of HSN";
                        worksheet.Cell("E2").Value = "Total Value";
                        worksheet.Cell("F2").Value = "Total Taxable Value";
                        worksheet.Cell("G2").Value = "Total Integrated Tax";
                        worksheet.Cell("H2").Value = "Total Central Tax";
                        worksheet.Cell("I2").Value = "Total State/UT Tax";
                        worksheet.Cell("J2").Value = "Total Cess";

                        //if (dt.Rows.Count > 0)
                        //{
                           // DataView view = new DataView(dt);
                            worksheet.Cell("A3").Value = ImportDs.Tables[20].Rows[0]["HSN"].ToString();
                            worksheet.Cell("E3").Value = ImportDs.Tables[20].Rows[0]["TotalValue"].ToString();
                            worksheet.Cell("F3").Value = ImportDs.Tables[20].Rows[0]["TotalTaxValue"].ToString();
                            worksheet.Cell("G3").Value = ImportDs.Tables[20].Rows[0]["IGSTAmt"].ToString();
                            worksheet.Cell("H3").Value = ImportDs.Tables[20].Rows[0]["CGSTAmt"].ToString();
                            worksheet.Cell("I3").Value = ImportDs.Tables[20].Rows[0]["SGSTAmt"].ToString();
                            worksheet.Cell("J3").Value = ImportDs.Tables[20].Rows[0]["Cess"].ToString();

                            //view.ToTable(true, "HSN").Rows.Count;
                            //dt.Compute("SUM([Total Value])", string.Empty);
                            //dt.Compute("SUM([Taxable Value])", string.Empty);
                            //dt.Compute("SUM([Integrated Tax Amount])", string.Empty);
                            //dt.Compute("SUM([Central Tax Amount])", string.Empty);
                            //dt.Compute("SUM([State/UT Tax Amount])", string.Empty);
                            //dt.Compute("SUM([Cess Amount])", string.Empty);

                            worksheet.Column("D").CellsUsed().Style.NumberFormat.Format = "0.00";
                            worksheet.Row(3).Cell("E").Style.NumberFormat.Format = "0.00";
                            worksheet.Row(3).Cell("F").Style.NumberFormat.Format = "0.00";

                            //var validE3 = worksheet.Row(3).Cell("E").DataValidation;
                            //validE3.Decimal.GetType();                    
                            //validE3.ErrorStyle = XLErrorStyle.Warning;
                            //validE3.ErrorTitle = "Number out of range";
                            //validE3.ErrorMessage = "This cell only allows the number 2.";

                            //worksheet.Cell("E3").Style.NumberFormat.Format = "0.00"; //"#,##0.00";
                            //worksheet.Cell("F3").Style.NumberFormat.Format = "0.00"; //"#,##0.00";
                            //worksheet.Range("D4", "D" + worksheet.RowsUsed().Count()).Style.NumberFormat.Format = "0.00";
                            //worksheet.CellsUsed("A").Style.NumberFormat.Format = "0.00";
                            //worksheet.Columns(4,6).CellsUsed().Style.NumberFormat.Format = "0.00";
                       // }
                    }
                    #endregion

                    #region docs
                    if (worksheet.Name == "docs")
                    {
                        worksheet.Row(1).Cell(1).Value = "Summary of documents issued during the tax period (13)";
                        worksheet.Cell("D2").Value = "Total Number";
                        worksheet.Cell("E2").Value = "Total Cancelled";

                       
                           // DataView view = new DataView(dt);
                            worksheet.Cell("D3").Value = ImportDs.Tables[22].Rows[0]["TotalNumber"].ToString();
                            worksheet.Cell("E3").Value = ImportDs.Tables[22].Rows[0]["Cancelled"].ToString();

                            //dt.Compute("SUM([Total Number])", string.Empty);
                            //dt.Compute("SUM([Cancelled])", string.Empty);
                       
                    }
                    #endregion
                }
                Index++;
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
            throw ex;
        }
        return wb;
    }
    protected void btnGenerateExcel_Click(object sender, EventArgs e)
    {
       // DropDownList ddlMonthYear = (DropDownList)wucTaxPayerStrip.FindControl("ddlMonthYear");
        DataSet ds = CLSCommon.CallApiGet("api/GSTR1/GetGSTR1Data?ind=2&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString() + "&ClientGSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCode=" + Session["MonthYrCode"].ToString());
        ds.Tables[0].TableName = "HELP";
        ds.Tables[1].TableName="b2b";
        ds.Tables[3].TableName="b2cl";
        ds.Tables[5].TableName="b2cs";
        ds.Tables[7].TableName="cdnr";
        ds.Tables[9].TableName="cdnur";
        ds.Tables[11].TableName="exp";
        ds.Tables[13].TableName="at";
        ds.Tables[15].TableName="atadj";
        ds.Tables[17].TableName="exemp";
        ds.Tables[19].TableName = "hsn";
        ds.Tables[21].TableName = "docs";


        CreateExcel(ds, "GSTR1" + Session["ClientGSTNNO"].ToString() + Session["MonthYearDesc"].ToString());
   }
     //Release COM objects from memory
//    public void ReleaseComObject(object reference)
//    {
//        try
//        {
//            while (System.Runtime.InteropServices.Marshal.ReleaseComObject(reference) <= 0)
//            {
//            }
//        }
//        catch
//        {
//        }
       
//}
}