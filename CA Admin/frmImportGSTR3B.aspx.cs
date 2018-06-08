using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmImportGSTR3B : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
          
          if(!fuExcelImport.HasFile)
          {
              Panel.Attributes.Add("class", "alert alert-danger");
              lblTotalRecords.Text = "0";
              lblImported.Text = "0";
              Panel.Visible = true;
              lblMessage.Text = "Please Select Excel File.";
              return;
          }
          else if (Path.GetExtension(fuExcelImport.FileName) != ".xls" && Path.GetExtension(fuExcelImport.FileName) != ".xlsx" && Path.GetExtension(fuExcelImport.FileName) != ".xlsm")
          {
              Panel.Attributes.Add("class", "alert alert-danger");
              lblTotalRecords.Text = "0";
              lblImported.Text = "0";
              Panel.Visible = true;
              lblMessage.Text = "Please Select Only Excel File.";
              return;
          }
          else
          {
              DataSet ds = CLSCommon.CallApiGet("api/GenerateExcelNo/GenerateExcelNo?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&ClientGSTNNO=" + Session["ClientGSTNNO"].ToString() + "&GSTRInd=3&MonthCD=" + Session["MonthYrCode"].ToString());
              if (ds != null)
              {
                  if (ds.Tables[0].Rows[0]["res"].ToString() == "1")
                  {
                          string FileName = Path.GetFileName(fuExcelImport.PostedFile.FileName);
                          string Extension = Path.GetExtension(fuExcelImport.PostedFile.FileName);
                          string FolderPath = "~/GSTR3BExcel/";
                          string FilePath = Server.MapPath(FolderPath + ds.Tables[0].Rows[0]["ExcelNo"].ToString());

                          fuExcelImport.SaveAs(FilePath+Extension);
                          Import_To_Grid(FilePath, Extension);
                  }
                  else
                  {
                      Panel.Visible = true;
                      Panel.Attributes.Add("class", "alert alert-warning");
                      lblTotalRecords.Text = "0";
                      lblImported.Text = "0";
                      lblMessage.Text = "Data Already Imported for " + Session["MonthYearDesc"].ToString();
                      lnkbtn1.Visible = false;
                  }

              }
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
   
    DataTable ImportExcel(string Query, OleDbCommand OleCmd)
    {
        OleDbDataAdapter oda = new OleDbDataAdapter(OleCmd);
        DataTable dt = new DataTable();
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
                case ".xlsm": //Excel 07
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
            conStr = String.Format(conStr, FilePath+Extension, "Yes");
            connExcel = new OleDbConnection(conStr);
            cmdExcel = new OleDbCommand();
            DataSet DsExcelDs = new DataSet();
            
            cmdExcel.Connection = connExcel;
            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            //if (rdbExcelOswal.Checked || !rdbExcelOswal.Checked)
            //{
                //cmdExcel.CommandText = "SELECT [LineNo],[DocType],[ClientGstIn],[PurchGstIn],[InvoiceNo],FORMAT( [InvoiceDate],'yyyy/MM/dd') as [InvoiceDate],[InvoiceValue],[GoodsServInd],[HsnSacCode],[HsnSacDesc],[Quantity],[Unit],[Rate],[TaxableVal],[IGstTax],[CGstTax],[SGstTax],[CessRate],[CessAmount],[PlaceOfSuplyStates],[PlaceOfSuplyName],[ITCInligibleInd],[ITCInligibleDesc],[ITCIGst],[ITCCGst],[ITCSGst],[ITCCess],[ReversechgInd],[ImportOfSerInd],[OverSeasSez],[BillEntryNo],FORMAT([BillEntryDt],'yyyy/MM/dd') as [BillEntryDt],[BillEntryvalue],[OrignalInvoiceNo],FORMAT([OrignalInvoiceDate],'yyyy/MM/dd') as [OrignalInvoiceDate],[OrignalGSIn],[OrignalBillEntNo],FORMAT([OrignalBillEntDt] ,'yyyy/MM/dd') as [OrignalBillEntDt] ,[OrignalBillEntGstin],[ComoNillExeInd],[ComoNillExeDesc],[DebitNotCreditNotInd],[ISDCreditInd],[ISDInvoCredit],[IsdDocNo],[IsdDocdate],[TDSTCCCrdInd],[TDSTcsCredit],[TDSTcsGrossVal],[TDSTcsSalseReturn],[TDSTcsNetValue],[AdvancePaidInd],[GrossAdvPaid] From [Table3To7$] where [LineNo] IS NOT NULL";
                cmdExcel.CommandText = "SELECT [Nature of Supplies],[Total Taxable Value],[Integrated Tax],[Central Tax],[State/ UT Tax],[Cess] From [3#1$2:100] where [Nature of Supplies] IS NOT NULL ";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[0].TableName = "dt3_1";

                cmdExcel.CommandText = "SELECT [Description],[Place of Supply (State/UT)],[Total Taxable Value],[Amount of Integrated Tax] From [3#2$2:100] where [Description] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[1].TableName = "dt3_2";

                cmdExcel.CommandText = "select [Details],[No],[Integrated Tax],[Central Tax],[State/ UT Tax],[Cess] from [4$2:100] where [Details] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[2].TableName = "dt4";

                cmdExcel.CommandText = "select [Nature of supplies],[Inter-State supplies],[Intra-State supplies] from [5$2:100] where [Nature of supplies] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[3].TableName = "dt5";

                cmdExcel.CommandText = "select [Description],[Tax payable],[Integrated Tax] as [Integrated Tax(ITC)],[Central Tax] as [Central Tax(ITC)],[State/UT tax] as [State/UT tax(ITC)],[Cess] as [Cess(ITC)],[Tax Paid TDS/TCS],[Tax/Cess paid in cash],[Interest],[Late Fee] from [6#1$3:100] where [Description] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[4].TableName = "dt6_1";


                cmdExcel.CommandText = "select [Details],[Integrated Tax],[Central Tax],[State/ UT Tax] from [6#2$2:100] where [Details] IS NOT NULL";
                DsExcelDs.Tables.Add(ImportExcel("", cmdExcel));
                DsExcelDs.Tables[5].TableName = "dt6_2";
            //}
            //else
            //{
                //DataSet ds = CLSCommon.CallApiGet("api/ImportGSTR3B/GetClientExcelQuery?Ind=1&ClientCode=" + Session["ClientCode"].ToString());
                //if (ds != null)
                //{
                //    if (ds.Tables[0].Rows[0]["Query"].ToString() == "0")
                //    {
                //        Panel.Attributes.Add("class", "alert alert-danger");
                //        lblMessage.Text = "Your Excel file is not mapped with oswal excel file. Please Map Your Excel File To Oswal Excel File.";
                //        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#inputModal').modal('show');});", true);
                //        Panel.Visible = true;
                //        connExcel.Close();
                //        return;

                //    }
                //    else
                //    {
                //        cmdExcel.CommandText = ds.Tables[0].Rows[0]["Query"].ToString();
                //    }
                //}
                //else
                //{
                //    return;
                //}
          //  }

            connExcel.Close();
            PL_ImportGSTR3B objpl = new PL_ImportGSTR3B();
            // objpl.dt = DsExcelDs.Tables[0];
            objpl.ds = DsExcelDs;
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
           // objpl.UserCode = int.Parse(Session["UserCode"].ToString());

            // objpl.ImportDate = JsonConvert.SerializeObject(DsExcelDs, Formatting.Indented);
            DataTable dtresponse = CLSCommon.CallApiPost("api/ImportGSTR3B/ImportGSTR3BData", objpl);
            if (dtresponse != null)
            {
                if (dtresponse.Rows.Count > 0)
                {
                    if (dtresponse.Rows[0][0].ToString() == "1")
                    {
                        DataSet ds1 = CLSCommon.CallApiGet("api/GSTR3B_SavePayload/saveGSTR3BPayLoad?Ind=1&ClientCode=" + Session["ClientCode"].ToString() + "&ClientCodeOdp=" + Session["ClientCodeOdp"].ToString() + "&CaCode=" + Session["CaCode"].ToString() + "&CacodeOdp=" + Session["CacodeOdp"].ToString() + "&GSTIN=" + Session["ClientGSTNNO"].ToString() + "&MonthCD=" + Session["MonthYrCode"].ToString() + "&UserCode=" + Session["UserCode"].ToString() + "&ExcelNo=" + dtresponse.Rows[0]["ExcelNo"].ToString());
                        txtPayload.Text = ds1.Tables[0].Rows[0]["Payload"].ToString();
                        Panel.Visible = true;
                        Panel.Attributes.Add("class", "alert alert-success");
                        int count=DsExcelDs.Tables[0].Rows.Count + DsExcelDs.Tables[1].Rows.Count + DsExcelDs.Tables[2].Rows.Count + DsExcelDs.Tables[3].Rows.Count + DsExcelDs.Tables[4].Rows.Count + DsExcelDs.Tables[5].Rows.Count;
                        lblTotalRecords.Text = (count).ToString();
                        lblImported.Text = count.ToString();
                        lblMessage.Text = "Excel Imported Successfully. \n Total Rows : " + count.ToString();
                        // lnkbtn.Visible = true;
                        
                    }
                    else
                    {
                        Panel.Visible = true;
                        Panel.Attributes.Add("class", "alert alert-warning");
                        lblTotalRecords.Text = "0";
                        lblImported.Text = "0";
                        lblMessage.Text = dtresponse.Rows[0]["ErrorDesc"].ToString().Replace("{{MonthYear}}", Session["MonthYearDesc"].ToString());
                    }
                   
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
    protected void lnkbtn_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){$('#ProgressModal1').modal('show');});", true);
    }
}