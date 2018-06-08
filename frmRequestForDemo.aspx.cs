using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modal;
using System.Text;
public partial class frmRequestForDemo : System.Web.UI.Page
{
    PL_CARegis plobj;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }
    protected void Submit_Click(object sender, EventArgs e)
    {      
            plobj = new PL_CARegis();
        plobj.Ind = 1;
        plobj.CA_Name = Txt_CaName.Text.Trim().ToUpper();
        plobj.CA_OrganizationName = Txt_OrganizationName.Text;
        plobj.CA_MobileNo = Txt_MobNo.Text;
       // plobj.CA_LandlineNo = Txt_LandLineNo.Text;
        plobj.CA_EmailId = Txt_EmailId.Text;
        plobj.DemoInd = 1;
      
        DataTable dt = CLSCommon.CallApiPost("api/CARegis/SaveData/",plobj);
        if(dt.Rows.Count >0)
        {
            if (dt.Rows[0]["res"].ToString() == "1")
            {
                string errormsg = dt.Rows[0]["ErrorMsg"].ToString();
                string Mobileno = dt.Rows[0]["CaMobileNo1"].ToString();
                string emailid = dt.Rows[0]["CaEmailid"].ToString();
                string Password = dt.Rows[0]["Password"].ToString();

                StringBuilder sbmail = new StringBuilder();
                sbmail.AppendLine("Dear " + Txt_CaName.Text.Trim().ToUpper());
                sbmail.AppendLine("");
                sbmail.AppendLine("Thank you for showing interest in \"GST-SAATHI\" Return Filing Portal.");
                sbmail.AppendLine("");
                sbmail.AppendLine("To access the application please go to : http://www.gstsaathifiling.com.");
                sbmail.AppendLine("");
                sbmail.AppendLine("UserId :- " + Mobileno);
                sbmail.AppendLine("Password : " + Password);
                sbmail.AppendLine("");
                // sb.AppendLine("Valid Only For 48 Hour" );
                sbmail.AppendLine("Regards");
                sbmail.AppendLine("Team-\"GST-SAATHI\"");
                sbmail.AppendLine("Missed Call No. : 08030-63-63-48");
                sbmail.AppendLine("Phone No. : +91-975502-44-44");
                sbmail.AppendLine("60, Electronics Complex");
                sbmail.AppendLine("Pardeshipura");
                sbmail.AppendLine("Indore-452010 (M.P.)");
                sbmail.AppendLine("India.");

                sbmail.AppendLine("http://www.gstsaathi.com");


                CLSCommon.SendMessage(Mobileno, sbmail.ToString());
                CLSCommon.SendHtmlFormattedEmail(sbmail.ToString(), Txt_EmailId.Text);
                Label_ErrorMsg.Visible = true;
                Label_ErrorMsg.Text = "Thank You for showing interest in \"GST-Saathi\" . Login details have been sent to you via sms & email!";
               
                Txt_CaName.Text = "";
                // Txt_LandLineNo.Text = "";
                Txt_MobNo.Text = "";
                Txt_OrganizationName.Text = "";
                Txt_EmailId.Text = "";
            }
            else if (dt.Rows[0]["res"].ToString() == "0")
            {
                Label_ErrorMsg.Visible = true;
                Label_ErrorMsg.Text = dt.Rows[0]["Message"].ToString();
            }
        }
      
 
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Clear();       
    }
    public void Clear()
    {
        Txt_CaName.Text = "";
        //Txt_LandLineNo.Text = "";
        Txt_MobNo.Text = "";
        Txt_OrganizationName.Text = "";
        Txt_EmailId.Text = "";
       Label_ErrorMsg.Visible = false;
        
    }
}