using Microsoft.Reporting.WebForms;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrmReportViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlPrintDraftPatta.Visible = true;

            function();
           // downloadpdf();
        }
    }
    public void function()
    {
        ReportViewer1.ShowCredentialPrompts = true;
        Microsoft.Reporting.WebForms.IReportServerCredentials irsc = new CustomReportCredentials(ConfigurationManager.AppSettings["UserName"].ToString(), ConfigurationManager.AppSettings["Password"].ToString(), ConfigurationManager.AppSettings["ReportServer"].ToString());//"http://occweb02/ReportServer");
        ReportViewer1.ServerReport.ReportServerCredentials = irsc;
        Hashtable HT = new Hashtable();
        HT = (Hashtable)Session["HT"];
        ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
        ReportViewer1.ServerReport.ReportServerUrl = new Uri(ConfigurationManager.AppSettings["ReportServer"].ToString());
        ReportViewer1.ServerReport.ReportPath = ConfigurationManager.AppSettings["ReportProjectName"].ToString() + Session["Report"].ToString();
        if (HT != null)
        {
            ReportParameter[] parm = new ReportParameter[HT.Count];
            int i = 0;
            foreach (DictionaryEntry Dt in HT)
            {
                parm[i] = new ReportParameter(Convert.ToString(Dt.Key), Convert.ToString(Dt.Value));
                i++;
            }
            ReportViewer1.ServerReport.SetParameters(parm);
            ReportViewer1.ServerReport.Refresh();
        }

    }
    public class CustomReportCredentials : Microsoft.Reporting.WebForms.IReportServerCredentials
    {
        private string _UserName;
        private string _PassWord;
        private string _DomainName;
        public CustomReportCredentials(string UserName, string PassWord, string DomainName)
        {
            _UserName = UserName;
            _PassWord = PassWord;
            _DomainName = DomainName;
        }
        public System.Security.Principal.WindowsIdentity ImpersonationUser
        {
            get
            {
                return null;
            }
        }
        public ICredentials NetworkCredentials
        {
            get
            {
                return new NetworkCredential(_UserName, _PassWord, _DomainName);
            }
        }
        public bool GetFormsCredentials(out Cookie authCookie, out string user, out string password, out string authority)
        {

            authCookie = null;
            user = password = authority = null;
            return false;
        }
    }
    private void downloadpdf()
    {
        string mimeType, encoding, extension, deviceInfo;
        string[] streamids;
        Microsoft.Reporting.WebForms.Warning[] warnings;

        string format = "";
        if (Session["format"] != null)
        {
            format = Session["format"].ToString(); //Desired format goes here (PDF, Excel, or Image)
        }
        else
        {
            format = "Excel";
        }

        deviceInfo = "<DeviceInfo>+<SimplePageHeaders>True</SimplePageHeaders>+</DeviceInfo>";

        byte[] bytes = ReportViewer1.ServerReport.Render(format, deviceInfo, out mimeType, out encoding, out extension, out streamids, out warnings);
        Response.Clear();

        if (format == "Pdf")
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + Session["FileName"] + ".pdf");
        }
        else if (format == "Excel")
        {
            Response.ContentType = "application/excel";
            Response.AddHeader("Content-disposition", "filename=" + Session["FileName"] + ".xls");
        }

        Response.OutputStream.Write(bytes, 0, bytes.Length);

    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Administrator/frmPaymentStatus.aspx");
    }
}