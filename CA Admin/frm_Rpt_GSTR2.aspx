<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frm_Rpt_GSTR2.aspx.cs" Inherits="CA_Admin_frm_Rpt_GSTR2" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="content-wrapper">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <asp:ScriptManager runat="server" ID="drc"></asp:ScriptManager>
            <asp:Button Text="View" ID="btnView" CssClass="btn btn-primary" OnClick="btnView_Click" runat="server" />
        </div>
    </section>
    <script>
        $(document).ready(function () {

            $('.liImportExcel').show();
        });
    </script>
</asp:Content>

