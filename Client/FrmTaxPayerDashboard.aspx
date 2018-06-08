<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="FrmTaxPayerDashboard.aspx.cs" Inherits="Client_FrmTaxPayerDashboard" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            //$('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
            //$('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-1</li>');
            $('.liImportExcel').show();
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="content-wrapper ">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <div class="row">
                <div class="col-md-9 col-md-offset-1">
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="pt0">
                                <div>
                                    <div class="table-responsive">
                                        <asp:GridView DataKeyNames="ImportInd,ValidateInd,FinilizeInd,RetunsSubInd" CssClass="table table-bordered" OnRowDataBound="GridDashboard_RowDataBound" ID="GridDashboard" runat="server" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField Visible="false" DataField="ImportInd" />
                                                <asp:BoundField Visible="false" DataField="ValidateInd" />
                                                <asp:BoundField Visible="false" DataField="FinilizeInd" />
                                                <asp:BoundField Visible="false" DataField="RetunsSubInd" />
                                                <asp:TemplateField HeaderText="S. No." HeaderStyle-CssClass="inverse_head">
                                                    <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Returns" HeaderStyle-CssClass="inverse_head">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGSTR" runat="server" Text='<%#Eval("GSTRDesc") %>'></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Data Import" HeaderStyle-CssClass="inverse_head">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblImport" runat="server" Font-Size="15px" Text='<%#Eval("ImportInd") %>'></asp:Label>
                                                        <asp:LinkButton Text="View Validity" Visible="false" ID="lnkbtn" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--   <asp:TemplateField HeaderText="Validate">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblValidate" runat="server" Text='<%#Eval("ValidateInd") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Data Finalize" HeaderStyle-CssClass="inverse_head">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFinilize" runat="server" Font-Size="15px" Text='<%#Eval("FinilizeInd") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Uploads"  HeaderStyle-CssClass="inverse_head">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUpload" runat="server" Font-Size="15px" Text='<%#Eval("RetunsSubInd") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

