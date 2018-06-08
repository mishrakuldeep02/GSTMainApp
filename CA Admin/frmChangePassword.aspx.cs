using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


public partial class CA_Admin_frmChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
     {
        DivOtp.Visible = false;
        DivPw.Visible = false;
        Lbl_ErrorMsg.Visible = false;
    }
   
    protected void GenerateOtp_Click(object sender, EventArgs e)
    {

        var CACode = Session["CACode"];
        var CACodeOdp = Session["CACodeOdp"];
        var UserCode = Session["UserCode"];
        var UserLevel = Session["UserLevel"];
        var OldOtp = Text_OldOtp.Text;
        if (OldOtp != "")
        {
            DataSet ds = CLSCommon.CallApiGet("api/ChangePassword/ChangePassword?Ind=0&UserLevel=" + UserLevel + "&UserCode=" + UserCode + "&CACode=" + CACode + "&CACodeOdp=" + CACodeOdp + "&OldPassword=" + Text_OldOtp.Text.Trim());
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows[0]["res"].ToString() == "0")
                {
                    Lbl_ErrorMsg.Visible = true;
                    Lbl_ErrorMsg.Text = "Invalid Old Password...";
                    Text_OldOtp.Text = "";
                }
                else
                {
                    string Mobileno =ds.Tables[0].Rows[0]["MobileNo"].ToString();
                    ViewState["MobileNo"] = ds.Tables[0].Rows[0]["MobileNo"].ToString();
                    CLSCommon.SendMessage(Mobileno, "Your OTP For GSTSaathi Password Reset Is " + ds.Tables[0].Rows[0]["OneTimePass"].ToString());
                   
                    Lbl_ErrorMsg.Visible = true;
                    Lbl_ErrorMsg.Text = "OTP Sent Successfully... ";
                    DivOtp.Visible = true;
                    Text_OldOtp.Text = "";
                    Txt_VerifyOtp.Text = "";
                }
            }
            else
            {
                Lbl_ErrorMsg.Visible = true;
                Lbl_ErrorMsg.Text = "No Record Found...";
            }
            
         }

        else
        {
            Lbl_ErrorMsg.Visible = true;
            Lbl_ErrorMsg.Text = "Please Enter Old Password...";
        }
    }

    protected void VerifyOtp_Click(object sender, EventArgs e)
    {
        if(Txt_VerifyOtp.Text != "")
        {
            DataSet ds = CLSCommon.CallApiGet("api/ChangePassword/ChangePassword?Ind=1&OneTimePass=" + Txt_VerifyOtp.Text + "&MobileNo=" + ViewState["MobileNo"].ToString());
            if(ds.Tables[0].Rows.Count > 0)
            {                   
                Lbl_ErrorMsg.Visible = true;
                Lbl_ErrorMsg.Text = "OTP Is Correct";
                DivOtp.Visible = true;
                DivPw.Visible = true;
                Txt_VerifyOtp.Text = "";
                Txt_VerifyOtp.Text = null;
                Txt_EnewPW.Text = "";
                Txt_RNewPW.Text = "";
            }
            else
            {
                Lbl_ErrorMsg.Visible = true;
                Lbl_ErrorMsg.Text = "OTP is Not Correct";
                DivOtp.Visible = true;
                Txt_VerifyOtp.Text = "";
                Txt_EnewPW.Text = "";
                Txt_RNewPW.Text = "";
                
            }
        }
        else
        {
            Lbl_ErrorMsg.Visible = true;
            Lbl_ErrorMsg.Text = "Please Enter OTP";
            DivOtp.Visible = true;
            Txt_EnewPW.Text = "";
            Txt_RNewPW.Text = "";
        }
    }

    
    protected void Changepassword_Click(object sender, EventArgs e)
    {
        var UserCode = Session["UserCode"];
        if(Txt_EnewPW.Text != "" && Txt_RNewPW.Text != "")
        {
            if (Txt_EnewPW.Text == Txt_RNewPW.Text)
            {
                DataSet ds = CLSCommon.CallApiGet("api/ChangePassword/ChangePassword?Ind=2&Password=" + Txt_EnewPW.Text + "&UserCode=" + UserCode);
                if(ds.Tables.Count > 0)
                {
                    Lbl_ErrorMsg.Visible = true;
                    Lbl_ErrorMsg.Text = "Password has been Successfully Changed";
                    Txt_EnewPW.Text = "";
                    Txt_RNewPW.Text = "";
                    DivOtp.Visible = false;
                    DivPw.Visible = false;
                }
            }
            else
            {
                Lbl_ErrorMsg.Visible = true;
                Lbl_ErrorMsg.Text = "The Re-Enter New Password should be same as New Password";
                Txt_EnewPW.Text = "";
                Txt_RNewPW.Text = "";
                DivOtp.Visible = true;
                DivPw.Visible = true;
                
            }
        }
        else
        {
            Lbl_ErrorMsg.Visible = true;
            Lbl_ErrorMsg.Text = "Please Enter New Password";
            DivOtp.Visible = true;
            DivPw.Visible = true;
        }
    }
    
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Txt_VerifyOtp.Text = "";
        Txt_RNewPW.Text = "";
        Txt_EnewPW.Text = "";
        Lbl_ErrorMsg.Visible = false;
    }
}