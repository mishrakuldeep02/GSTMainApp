<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="FrmGSTRPayment.aspx.cs" Inherits="CA_Admin_FrmGSTRPayment" %>

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
            <h1>Payment</h1>
        </div>
    </section>
    <script>
        $(document).ready(function () {

            $('.liImportExcel').show();
        });
    </script>
</asp:Content>

