using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using Modal;
using System.Data;
using System.IO;
using System.Configuration;
using System.Data.OleDb;
public partial class CA_Admin_FrmExcelMapping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.ClientCheckSession();
        if (!IsPostBack)
        {
           
        }
    }
    PL_ExcelMapping objpl;  
    List<string> ExcellstHeader = new List<string>();
    List<string> InternalExcellstHeader = new List<string>(); 
    static DataTable dtField;
    DataSet ds;
    public void GetField()    // Get Table Field
    {
        dtField = new DataTable();
        ds = new DataSet();
      //  ds = CLSCommon.CallApiGet("api/ExcelMapping/GetField?Ind=" + 1);
        dtField = ds.Tables[1];
        if (dtField.Rows.Count > 0)
        {
            GridDdl.DataSource = InternalExcellstHeader;
            GridDdl.DataBind();
        }
    }

    protected void GridDdl_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {          
            var dd = e.Row.Cells[1].FindControl("DropDownList1") as DropDownList;
            var lbl = e.Row.Cells[0].FindControl("lblHeader") as Label;
            if (null != dd)
            {
               // dd.DataSource = ds.Tables[1];
                dd.DataSource = ExcellstHeader;
                dd.DataTextField = "";
                dd.DataValueField = "";
                dd.DataBind();
                lbl.Text = InternalExcellstHeader[e.Row.RowIndex].ToString();              
            }           
        }
    }

    public void InternalExcelFileColumn()
    {
        string FileName = "Salesdataformat.xlsx";
        string Extension = ".xlsx";
        string FolderPath = "~/ExcelFile/";
        string FilePath = Server.MapPath(FolderPath + FileName);  
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
        }
        conStr = String.Format(conStr, FilePath, "Yes");
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        DataTable dt = new DataTable();
        cmdExcel.Connection = connExcel;
        connExcel.Open();
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();         
        connExcel.Close();
        connExcel.Open();
        //cmdExcel.CommandText = "SELECT [SNO#],[Month],[Year],[ClientGstin] ,[Legal Name] ,[TradeName] ,[AggrturnOver] ,[AggrturnOverAprJune] ,[ClientStatecode] ,[Billgstin] ,[InvoiceNo] ,[InvoiceDate] ,[InvoiceValue] ,[GoodsSacInd] ,[HsnSacCode] ,[HsnSacDesc] ,[ItemRate] ,[ItemTaxableVal] ,[IgstTax] ,[CgstTax] ,[SGstTax] ,[Cess] ,[SuppyStatecode] ,[Suppystateename] ,[ReverseChargInd] ,[E-commerceInd] ,[EcommGstin] ,[shippBillExportNo] ,[shippBillExportDate] ,[ExportInd] ,[NillExmNonGstInd] ,[SaleAmdRecInd] ,[OrignalInvoNo] ,[OrignalGstIn] ,[OrignalInvoDt] ,[AdvanceSalInd] ,[AdvRecvOrAdjustInd] ,[ind]  From [Sheet1$] where [Month] IS NOT NULL";     // fix column name
        //oda.SelectCommand = cmdExcel;
        oda = new OleDbDataAdapter("Select * FROM [Sheet1$] where 1=2", connExcel);       //  for all field 
        oda.Fill(dt);     
        connExcel.Close();
        // excel_con.Close();
        int colCount = dt.Columns.Count;
        for (int i = 0; i < colCount; i++)    // add Excel Header in List
        {
            string a = dt.Columns[i].ToString().Trim();
            //a == "SNO#" || a == "Month" || a == "Year" || a == "ClientGstin" || a == "Legal Name" || a == "TradeName" || a == "AggrturnOver" || a == "AggrturnOverAprJune" || a == "ClientStatecode" || a == "ind" || 
            if ((a.Substring(0, 1) == "F" && a.Length == 3))
            { 
            }else
            {
                InternalExcellstHeader.Add(a);
            }
        }
        GridDdl.DataSource = InternalExcellstHeader;
        GridDdl.DataBind();
    }

    protected void btnImport_Click(object sender, EventArgs e)
    {
        string DelPath;
        try
        {
            InternalExcellstHeader.Clear();
            ExcellstHeader.Clear(); 
            lblmsg.Text = "";
            if (fileExcel.PostedFile.FileName != "")
            {            
                string FileName = Path.GetFileName(fileExcel.PostedFile.FileName);
                string Extension = Path.GetExtension(fileExcel.PostedFile.FileName);
                string FolderPath = "~/ExcelFile/";
                string FilePath = Server.MapPath(FolderPath + FileName);
                fileExcel.SaveAs(FilePath);
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
                }
                conStr = String.Format(conStr, FilePath, "Yes");
                OleDbConnection connExcel = new OleDbConnection(conStr);
                OleDbCommand cmdExcel = new OleDbCommand();
                OleDbDataAdapter oda = new OleDbDataAdapter();
                DataTable dt = new DataTable();
                cmdExcel.Connection = connExcel;
                connExcel.Open();
                DataTable dtExcelSchema;
                dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
                connExcel.Close();
                connExcel.Open();
                // cmdExcel.CommandText = "SELECT [SNO#],[Month],[Year],[ClientGstin] ,[Legal Name] ,[TradeName] ,[AggrturnOver] ,[AggrturnOverAprJune] ,[ClientStatecode] ,[Billgstin] ,[InvoiceNo] ,[InvoiceDate] ,[InvoiceValue] ,[GoodsSacInd] ,[HsnSacCode] ,[HsnSacDesc] ,[ItemRate] ,[ItemTaxableVal] ,[IgstTax] ,[CgstTax] ,[SGstTax] ,[Cess] ,[SuppyStatecode] ,[Suppystateename] ,[ReverseChargInd] ,[E-commerceInd] ,[EcommGstin] ,[shippBillExportNo] ,[shippBillExportDate] ,[ExportInd] ,[NillExmNonGstInd] ,[SaleAmdRecInd] ,[OrignalInvoNo] ,[OrignalGstIn] ,[OrignalInvoDt] ,[AdvanceSalInd] ,[AdvRecvOrAdjustInd] ,[ind]  From [Sheet1$] where [Month] IS NOT NULL";
                //oda.SelectCommand = cmdExcel;
                oda = new OleDbDataAdapter("Select * FROM [Sheet1$] where 1=2", connExcel);
                oda.Fill(dt);
                connExcel.Close();                
                int colCount = dt.Columns.Count;
                for (int i = 0; i < colCount; i++)    // add Excel Header in List
                {
                    string a = dt.Columns[i].ToString().Trim();
                    if ((a.Substring(0, 1) != "F" && a.Length != 3))
                    {
                        ExcellstHeader.Add(a);
                    }
                }
                InternalExcelFileColumn();
                // GetField();
            }else
            {
                lblmsg.Text = "Please Select Excel File.";
            }
        }
        catch (Exception ex)
        {
            string msg = ex.Message;
            //if (msg == "External table is not in the expected format." || msg == "No value given for one or more required parameters.")
            //{
            //    DelPath = Server.MapPath("~/ExcelFile/" + fileExcel.PostedFile.FileName);
            //    if (File.Exists(DelPath))
            //    {
            //        File.Delete(DelPath);
            //    }
            //}
            lblmsg.Text = ex.Message;// "Invalid Excel Format.";
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        GridDdl.DataSource = null;
        GridDdl.DataBind();
        InternalExcellstHeader.Clear();
        ExcellstHeader.Clear();
    }
    protected void btnExit_Click(object sender, EventArgs e)
    {
        Response.Redirect("frmHomeAdminCA.aspx");
    }
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DropDownList drp = (DropDownList)sender;
    //    GridViewRow gv = (GridViewRow)drp.NamingContainer;
    //    int index = gv.RowIndex;
    //    DropDownList DropDownList1 = (DropDownList)GridDdl.Rows[index].FindControl("DropDownList1");
    //    Label label1 = (Label)GridDdl.Rows[index].FindControl("lblHeader");
    //    label1.Text = DropDownList1.SelectedItem.Text;
    //}
    protected int DeleteRecord()
    {
        int flag = 0;
        ds = CLSCommon.CallApiGet("api/ExcelMapping/DeleteAfterInsertExcelMapping?Ind=" + 3);
       
        if (ds.Tables[0].Rows.Count > 0)
        {
            flag = 1;
        }
        else
            flag = 0;
        return flag;
    }

    protected void BtnExcelMapping_Click(object sender, EventArgs e)
    {
        if(txtMappingName.Text.Trim()=="")
        {
            lblmsg.Text = "Enter Mapping Name.";
            return ;
        }else
        if(GridDdl.Rows.Count>0)
        {
            int Flage = 0;
            foreach (GridViewRow row in GridDdl.Rows)
            {
                DropDownList ddlOdpExcel = (DropDownList)row.FindControl("DropDownList1");
                if(ddlOdpExcel.SelectedValue.ToString()=="-1")
                {
                    Flage++;
                    ddlOdpExcel.Focus();
                    row.Focus();
                    break;
                }
            }
            if (Flage >0)
            {
                lblmsg.Text = "Please Map All Fields With Database.";
                return;
            }
            else
            {
                objpl = new PL_ExcelMapping();
                objpl.Ind = 2;
                objpl.ClientCode = Convert.ToInt32(Session["ClientCode"]);
                objpl.MappingName = txtMappingName.Text.Trim();
                foreach (GridViewRow row in GridDdl.Rows)
                {
                    Label lblClientExcel = (Label)row.FindControl("lblHeader");
                    DropDownList ddlOdpExcel = (DropDownList)row.FindControl("DropDownList1");
                    objpl.ClientExcelField = ddlOdpExcel.SelectedItem.Text.ToString();
                    objpl.OdpExcelField = lblClientExcel.Text;
                    DataTable dtresponse = new DataTable();
                    dtresponse = CLSCommon.CallApiPost("api/ExcelMapping/InsertExcelMapping", objpl);

                    if (dtresponse != null && dtresponse.Rows.Count > 0)
                    {
                        if (dtresponse.Rows[0]["Result"].ToString() == "1")
                        {
                            objpl.MappingId = int.Parse(dtresponse.Rows[0]["MappingId"].ToString());
                            lblmsg.Text = "Excel File Mapped Successfully Complete";
                        }else
                        {

                        }
                    }
                    else
                        lblmsg.Text = "Excel File Not Mapped";
                }
            }
           

        }
    }
}