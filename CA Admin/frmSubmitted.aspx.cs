using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CA_Admin_frmSubmitted : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            hfBack.Value = Request.UrlReferrer.AbsoluteUri;
        }
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        if (Session["ErrorMsg"] != null)
        {
            lblMessage.Text = Session["ErrorMsg"].ToString();
        }
    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(hfBack.Value.ToString());
    }
}