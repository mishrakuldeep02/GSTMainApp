using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmAddArticle : System.Web.UI.Page
{
    PL_AddArticle objpl;
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objpl = new PL_AddArticle();
        objpl.Ind = 1;
        objpl.Name = txtName.Text;
        objpl.MobileNo = txtMobileNo.Text;
        objpl.EmailId = txtEmailId.Text;
        objpl.CaCode = int.Parse(Session["CaCode"].ToString());
        objpl.CaCodeOdp = int.Parse(Session["CaCodeOdp"].ToString());
        objpl.UserLevel = int.Parse(Session["UserLevel"].ToString());
        DataTable dt = CLSCommon.CallApiPost("api/Article/SaveArticle", objpl);
        if(dt!=null)
        {
            if(dt.Rows.Count>0)
            {
                pnlError.Visible = true;
                Session["ErrorMsg"] = dt.Rows[0]["ErrorMsg"].ToString();
                Response.Redirect("frmSubmitted.aspx");
            }
        }

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
    }
    protected void btnExit_Click(object sender, EventArgs e)
    {

    }
}