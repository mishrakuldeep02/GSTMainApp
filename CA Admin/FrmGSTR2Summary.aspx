<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="FrmGSTR2Summary.aspx.cs" Inherits="CA_Admin_FrmGSTR2Summary" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script>
        $(document).ready(function () {
            $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
            $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
            $('.liImportExcel').show();
        });

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="content-wrapper">

            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <asp:ScriptManager runat="server" ID="drc"></asp:ScriptManager>
            <h3 class="second_heading">GSTR-2 Summary</h3>
            <div class="col-xs-12">
                <div class="row">
                    <section class="registration_page_section">
                        <!-- START Page content-->

                        <div class="row">
                            <div id="pnlRegistration" runat="server" class="col-sm-12 col-xs-12" visible="true">

                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <asp:Button ID="btnGstr2Summary" runat="server" OnClick="btnGstr2Summary_Click" Text="Get GSTR2 Summary" CssClass="btn btn-primary" />
                                                <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="table-responsive mt-lg">
                                            <asp:GridView ID="GridGSTR2Summ" runat="server" class="table table-bordered" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Table Type" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotInvoice" runat="server" Text='<%#Eval("ApiTableType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total Invoice No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotInvoice" runat="server" Text='<%#Eval("InvoiceCount") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CGST Tax" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCgstTax" runat="server" Text='<%#Eval("TotalCgstTax") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SGST Tax" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSgstTax" runat="server" Text='<%#Eval("TotalSgstTax") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="IGST Tax" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIgstTax" runat="server" Text='<%#Eval("TotalIgstTax") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- END Page content-->

                    </section>
                </div>
            </div>
        </div>
        <!-- Modal -->

    </section>
</asp:Content>

