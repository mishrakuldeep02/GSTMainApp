using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmGstr2Importjson : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if(fuExcelImport.HasFile)
        {
            if(Path.GetExtension(fuExcelImport.PostedFile.FileName)==".json")
            {
                PL_GSTR2ImportJson objpl = new PL_GSTR2ImportJson();
                objpl.Ind = 1;
                objpl.ClientCode = int.Parse( Session["ClientCode"].ToString());
                objpl.ClientCodeOdp = int.Parse(Session["ClientCodeOdp"].ToString());
                objpl.GSTNNO = Session["ClientGSTNNO"].ToString();
                objpl.MonthCD = int.Parse(Session["MonthYrCode"].ToString());
                objpl.UserCode = int.Parse(Session["UserCode"].ToString());
                string inputContent;
                using (StreamReader inputStreamReader = new StreamReader(fuExcelImport.PostedFile.InputStream))
                {
                    inputContent = inputStreamReader.ReadToEnd();
                }
                objpl.JsonData = inputContent;
                DataSet ds = CLSCommon.CallApiPostDS("api/GSTR2ImportJson/Importjson", objpl);
                 if (ds != null)
                 {
                     if (ds.Tables[0].Rows.Count > 0)
                     {
                         if (ds.Tables[0].Rows[0][0].ToString() == "1")
                         {
                             Panels.Visible = true;
                             Panels.Attributes.Add("class", "alert alert-success");
                             DataView view = new DataView(ds.Tables[0]);
                             DataTable distinctValues = view.ToTable(true, "CurrInvoiceNo");
                             string TotalRows = Convert.ToString(distinctValues.Rows.Count);
                             lblTotalRecords.Text = TotalRows;//dt.Rows.Count.ToString();
                             lblImported.Text = TotalRows;//dt.Rows.Count.ToString();
                             lblMessage.Text = "Json File Imported Successfully. \n Total Invoice : " + TotalRows;// dt.Rows.Count.ToString();
                             lnkbtnViewError.Visible = false;
                         }
                     }
                 }
            }
        }
    }
}