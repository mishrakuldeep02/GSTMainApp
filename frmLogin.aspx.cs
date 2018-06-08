using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modal;
using System.Data;
using System.Net;
public partial class Common_frmLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string stringHostName = Dns.GetHostName();
        //IPAddress[] arrIpAddress = Dns.GetHostAddresses(stringHostName);
        //Response.Write(arrIpAddress[2].ToString());
        if(!IsPostBack)
        {
            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                chkRememberMe.Checked = true;
                txtLoginId.Text = Request.Cookies["UserName"].Value;
                txtPassWord.Attributes["value"] = Request.Cookies["Password"].Value;
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds = CLSCommon.CallApiGet("api/Login/CheckLogin?Ind=1&LoginId=" + txtLoginId.Text.Trim() + "&Password=" + txtPassWord.Text.Trim());
        if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count==0)
        {
            pnlAlert.Style.Remove("display");
            pnlAlert.Style.Add("display","block");
            lblErrorMsg.Text = "Invalid login Id And Password.";
        }else
        {
            if (chkRememberMe.Checked)
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            }
            Response.Cookies["UserName"].Value = txtLoginId.Text.Trim();
            Response.Cookies["Password"].Value = txtPassWord.Text.Trim();
            Session["UserCode"] =  ds.Tables[0].Rows[0]["UserCode"].ToString();
            Session["UserLevel"] = ds.Tables[0].Rows[0]["UserLevel"].ToString();
            Session["LoginName"] = ds.Tables[0].Rows[0]["LoginName"].ToString();
            Session["LevelDesc"] = ds.Tables[0].Rows[0]["LevelDesc"].ToString();
           
            if (Session["UserLevel"].ToString() == "1")
            {
                Session["CACode"] = ds.Tables[0].Rows[0]["CACode"].ToString();
                Session["CaCodeOdp"] = ds.Tables[0].Rows[0]["CaCodeOdp"].ToString();
                Response.Redirect("~/CA Admin/frmHomeAdminCA.aspx");
            }
            else if (Session["UserLevel"].ToString() == "2" )
            {
                Session["CACode"] = ds.Tables[0].Rows[0]["CACode"].ToString();
                Session["CaCodeOdp"] = ds.Tables[0].Rows[0]["CaCodeOdp"].ToString();
              //  Response.Redirect("~/CA Admin/frmHomeAdminCA.aspx");
                Response.Redirect("~/CA/CaHome.aspx");
            }
            else if (Session["UserLevel"].ToString() == "3")
            {
                Response.Redirect("~/Artical/frmHomeArtical.aspx");
            }

            else if (Session["UserLevel"].ToString() == "4")
            {
                Session["CACode"] = ds.Tables[0].Rows[0]["CACode"].ToString();
                Session["CaCodeOdp"] = ds.Tables[0].Rows[0]["CaCodeOdp"].ToString();
                Session["ClientCode"] = ds.Tables[0].Rows[0]["ClientCode"].ToString();
                Session["ClientCodeOdp"] = ds.Tables[0].Rows[0]["ClientCodeOdp"].ToString();
                Response.Redirect("~/Client/frmHometaxPayer.aspx");
            }
            else if (Session["UserLevel"].ToString() == "5")
            {
                Response.Redirect("~/Administrator/frmHomeAdministrator.aspx");
            }
        }
    }
}