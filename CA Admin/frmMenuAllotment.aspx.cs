using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CA_Admin_frmMenuAllotment : System.Web.UI.Page
{

    PL_MenuAllotmentSave plob = new PL_MenuAllotmentSave();
    DataTable dtItems;
    DataRow dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        CLSCommon.CommonCheckSession();
        CLSCommon.CACheckSession();
        if (!IsPostBack)
        {
            FillUserLevel();
        }
    }

    protected void FillUserLevel()
    {
        lblMsg.Text = "";
        lblMsg.CssClass = "";
        try
        {
            DataTable dt = CLSCommon.CallApiGetdt("api/MenuAllotment/FillUserLevel?Ind=1");
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    ddlUserLevel.DataSource = dt;
                    ddlUserLevel.DataTextField = "LevelDesc";
                    ddlUserLevel.DataValueField = "LevelId";
                    ddlUserLevel.DataBind();
                    ddlUserLevel.Items.Insert(0, new ListItem("-- Select --", "0"));
                }
            }
        }
        catch { }
    }

    protected void ddlUserLevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        lblMsg.CssClass = "";
        try
        {
            DataTable dt = CLSCommon.CallApiGetdt("api/MenuAllotment/FillClient_CA_Arti?Ind=2&CaCode=" + Session["CaCode"].ToString() + "&CaCodeOdp=" + Session["CaCodeOdp"].ToString() + "&UserLevel=" + ddlUserLevel.SelectedValue.ToString());
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    ViewState["grdData"] = null;
                    gvData.DataSource = null;
                    gvData.DataBind();
                    ddlClient_Ca_Arti.DataSource = dt;
                    ddlClient_Ca_Arti.DataTextField = "ClientNameE";
                    ddlClient_Ca_Arti.DataValueField = "ClientCode";
                    ddlClient_Ca_Arti.DataBind();
                    ddlClient_Ca_Arti.Items.Insert(0, new ListItem("-- Select --", "0"));
                }
                else
                {
                    ddlClient_Ca_Arti.Items.Clear();
                    chkListMainMenu.Items.Clear();
                }
            }
        }
        catch { }
    }

    protected void ddlClient_Ca_Arti_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = CLSCommon.CallApiGetdt("api/MenuAllotment/FillMenu?Ind=3&UserLevel=" + ddlUserLevel.SelectedValue.ToString());
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    ViewState["grdData"] = null;
                    gvData.DataSource = null;
                    gvData.DataBind();
                    chkListMainMenu.DataSource = dt;
                    chkListMainMenu.DataTextField = "MenuDesc";
                    chkListMainMenu.DataValueField = "MenuId";
                    chkListMainMenu.DataBind();
                    menuPanel.Visible = true;
                }
            }
        }
        catch { }
    }

    protected void chkListMainMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        lblMsg.CssClass = "";
        try
        {
            DataTable dt = CLSCommon.CallApiGetdt("api/MenuAllotment/FillSubMenu?Ind=4&MainMenuId=" + chkListMainMenu.SelectedValue);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    chkListSubMenu.DataSource = dt;
                    chkListSubMenu.DataTextField = "SubMenuDesc";
                    chkListSubMenu.DataValueField = "SubMenuId";
                    chkListSubMenu.DataBind();
                }
                else
                {
                    ShowMessage("Sub Menu Are Not Available", false);
                    chkListSubMenu.Items.Clear();
                }
            }
        }
        catch { }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (chkListMainMenu.SelectedValue == "")
        {
            return;
        }
        lblMsg.Text = "";
        lblMsg.CssClass = "";
        gvPanel.Visible = true;
        DataTable dtGvItemDetail = new DataTable();
        if (VsdtGvItemDetail == null)
        {
            dtGvItemDetail = CreatGridDtItem();
        }
        else
        {
            dtGvItemDetail = VsdtGvItemDetail;
            ViewState["grdData"] = dtGvItemDetail;
        }

        dtItems = InddtItems;
        dr = dtGvItemDetail.NewRow();


        dr["MenuId"] = chkListMainMenu.SelectedValue;
        dr["MenuDesc"] = chkListMainMenu.SelectedItem.Text;
        dr["MenuInd"] = 1;
        dtGvItemDetail.Rows.Add(dr);
        ViewState["grdData"] = dtGvItemDetail;
        gvData.DataSource = VsdtGvItemDetail = dtGvItemDetail;
        gvData.DataBind();

        foreach (ListItem lst in chkListSubMenu.Items)
        {
            if (lst.Selected)
            {
                dtItems = InddtItems;
                dr = dtGvItemDetail.NewRow();
                dr["MenuId"] = lst.Value;
                dr["MenuDesc"] = lst.Text;
                dr["MenuInd"] = 0;
                dtGvItemDetail.Rows.Add(dr);
                ViewState["grdData"] = dtGvItemDetail;
                gvData.DataSource = VsdtGvItemDetail = dtGvItemDetail;
                gvData.DataBind();
                lst.Selected = false;
                //lst.Enabled = false;
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        lblMsg.CssClass = "";
        DataTable dt = CreatGridDtItem();
        foreach (ListItem lst in chkListMainMenu.Items)
        {
            if (lst.Selected)
            {
                DataRow dr = dt.NewRow();
                dr["MenuId"] = lst.Value;
                dr["MenuDesc"] = lst.Text;
                dt.Rows.Add(dr);
            }
        }
        if (ddlUserLevel.SelectedIndex <= 0)
        {
            ShowMessage("Please Select User Level", false);
            ddlUserLevel.Focus();
            return;
        }
        if (ddlClient_Ca_Arti.SelectedIndex <= 0)
        {
            ShowMessage("Please Select CA / Article / Client", false);
            ddlUserLevel.Focus();
            return;
        }
        if (dt.Rows.Count <= 0)
        {
            ShowMessage("Please Select At Least One Menu", false);
            return;
        }

        if (VsdtGvItemDetail == null || VsdtGvItemDetail.Rows.Count <= 0)
        {
            ShowMessage("Please Add Menu In Grid First", false);
            return;
        }
        plob.Ind = 5;
        plob.UserLevelId = Convert.ToInt32(ddlUserLevel.SelectedValue);
        plob.UserLevelDesc = ddlUserLevel.SelectedItem.Text;
        plob.ClientId = Convert.ToInt32(Session["CaCode"]);
        plob.ClientIdOdp = Convert.ToInt32(Session["CaCodeOdp"]);
        plob.LoginId = Convert.ToInt32(Session["UserCode"]);
        plob.CAAdminCode = Convert.ToInt32(Session["CaCode"]);
        plob.dt_Menu = VsdtGvItemDetail;
        DataTable dtApi = new DataTable();

        dtApi = CLSCommon.CallApiPost("api/MenuAllotment/MenuAllotmentSave", plob);
        if (dtApi.Rows.Count > 0)
        {
            Clear();
            ShowMessage("Record Save Successfully....!!!!", true);
        }
    }

    protected void gvData_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        try
        {
            DataTable dtGvItemDetail = new DataTable();
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "DeleteRow")
            {
                dtGvItemDetail = VsdtGvItemDetail;
                dtGvItemDetail.Rows[rowIndex].Delete();
                VsdtGvItemDetail = dtGvItemDetail;
                gvData.DataSource = dtGvItemDetail;
                gvData.DataBind();
            }
        }
        catch (Exception ex)
        {
            ShowMessage("Internal Server Error!", false);
        }
    }

    public void ShowMessage(string Message, bool type)
    {
        lblMsg.Text = (type ? "<i class='fa fa-check-circle fa-lg'></i> " : "<i class='fa fa-info-circle fa-lg'></i> ") + Message;
        lblMsg.CssClass = type ? "alert alert-success" : "alert alert-danger";
    }
    DataTable VsdtGvItemDetail
    {
        get { return (DataTable)ViewState["grdData"]; }
        set { ViewState["grdData"] = value; }
    }
    DataTable InddtItems
    {
        get { return (DataTable)ViewState["dtItems"]; }
        set { ViewState["dtItems"] = value; }
    }
    DataTable CreatGridDtItem()
    {
        DataTable ChkColumn = new DataTable();
        ChkColumn.Columns.Add("MenuId", typeof(int));
        ChkColumn.Columns.Add("MenuDesc", typeof(string));
        ChkColumn.Columns.Add("MenuInd", typeof(int));
        return ChkColumn;
    }
    void Clear()
    {
        lblMsg.Text = "";
        lblMsg.CssClass = "";
        ddlUserLevel.ClearSelection();
        ddlClient_Ca_Arti.Items.Clear();
        chkListMainMenu.Items.Clear();
        chkListSubMenu.Items.Clear();
        gvData.DataSource = VsdtGvItemDetail = null;
        gvData.DataBind();
        menuPanel.Visible = false;
        gvPanel.Visible = false;
    }
    protected void brnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void btnExit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/CA Admin/frmHomeAdminCA.aspx");
    }

}