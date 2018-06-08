using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Http;
using System.Configuration;
using System.Net.Http.Headers;
using System.Data;
using Newtonsoft.Json;


public partial class Common_frmSearchReg : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    void GetRecord()
    {
        DataSet ds = new DataSet();
        ds = CLSCommon.CallApiGet("api/SearchReg/GetRecordByRegNo?Ind=1&RegNo=" + txtRegNo.Text);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["RegNo"] = txtRegNo.Text;
                if (ds.Tables[0].Rows[0]["CatgoryId"].ToString() == "4")
                {
                    Response.Redirect("FrmClientProfile.aspx");
                }
                else if (ds.Tables[0].Rows[0]["CatgoryId"].ToString() == "1")
                {
                    Response.Redirect("frmCAReg.aspx");
                }
            }
            else
            {
                pnlError.Visible = true;
                lblMsg.Text = "Registration Number not found.";
            }
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        GetRecord();
    }
}