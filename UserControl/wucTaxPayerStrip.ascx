<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucTaxPayerStrip.ascx.cs" Inherits="UserControl_wucTaxPayerStrip" %>
<%@ Register Src="~/UserControl/wucSiteMap.ascx" TagName="UserControl" TagPrefix="cc1" %>

<div class="row strip_row">
    <div class="selected_client_details">
        <%-- <div class="col-sm-5"><b>
            <asp:Label runat="server" ID="lblFirmName"></asp:Label></b></div>
        <div class="col-sm-7 client_details_strip">
            <span class="grid_contact"><b>GSTIN : </b>
                <asp:Label runat="server" ID="lblGSTINNo"></asp:Label>
            </span><span class="spacer_contact"></span>
            <span class="grid_contact"><i class="fa r fa-user"></i>
                <asp:Label runat="server" ID="lblClientName"></asp:Label>
            </span><span class="spacer_contact"></span>
            <span class="grid_contact"><i class="fa r fa-phone"></i>
                <asp:Label runat="server" ID="lblMobileNo"></asp:Label></span><span class="spacer_contact"></span>
            <span class="grid_contact"><i class="fa r fa-envelope"></i>
                <asp:Label runat="server" ID="lblEmailId"></asp:Label></span>
        </div>--%>

        <div class="col-xs-12">
            <div class="taxpayer_strip_details divider">

                <div class="taxpayer_strip_details_col1">
                    <span class="details_sp">GSTIN&nbsp;:&nbsp;<b><asp:Label runat="server" ID="lblGSTINNo"></asp:Label></b></span>
                </div>
                <div class="taxpayer_strip_details_col2">

                    <span class="details_sp"><i class="fa fa-building"></i>&nbsp;<asp:Label runat="server" ID="lblClientName"></asp:Label></span>

                </div>
                <div class="taxpayer_strip_details_col3">
                    <span class="details_sp"><i class="fa fa-phone"></i>&nbsp;<asp:Label runat="server" ID="lblMobileNo"></asp:Label>
                    </span>
                    <span class="details_sp"><i class="fa fa-envelope"></i>&nbsp;<asp:Label runat="server" ID="lblEmailId"></asp:Label></span>
                </div>
            </div>

        </div>
        <hr class="taxpayer_strip_divider"/>
        <div class="col-xs-12">
            <div class="taxpayer_strip_details">
                <div class="taxpayer_strip_details_col1a">

                    <asp:SiteMapDataSource ID="SiteMapDataSource1"  runat="server" ShowStartingNode="false" />
                    <asp:SiteMapPath  ID="SiteMapPath1" runat="server" PathSeparator=" > " RenderCurrentNodeAsLink="false">
                    </asp:SiteMapPath>
                </div>
                <div class="taxpayer_strip_details_col1b">


                    <div style="visibility: hidden"><i class="fa r fa-clock-o"></i><span id="lblDateTime"></span></div>
                </div>
                <div class="taxpayer_strip_details_col1c">
                    <asp:Label runat="server" Font-Bold="true" ID="lblMonthYear"></asp:Label>
                   <%-- <asp:DropDownList AutoPostBack="true" runat="server" ID="ddlMonthYear" class="form-control">
                    </asp:DropDownList>--%>
                </div>
            </div>
        </div>
    </div>
    <cc1:UserControl ID="wucSiteMap" runat="server" />
    <asp:HiddenField runat="server" ID="hfUrl" />

</div>
