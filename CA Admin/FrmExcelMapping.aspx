<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="FrmExcelMapping.aspx.cs" Inherits="CA_Admin_FrmExcelMapping" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function ShowPopup() {
            // $('#ProgressModal').modal({ backdrop: 'static', keyboard: false });
             $('.loading').addClass('active');
        }
    </script>
    <script>
        $(document).ready(function () {
            $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
            $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">Excel Mapping</li>');
            $('.liImportExcel').show();
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="modal fade" id="ProgressModal" role="dialog">
        <div class="modal-dialog modal-sm" style="width: 228px;">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                    <h5 class="modal-title">Processing Please Wait.</h5>
                </div>
                <div class="modal-body">
                    <img style="height: 100px; width: 100%;" src="../Content/img/loader4.gif" />
                </div>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                </div>
            </div>
        </div>
    </div>
    <asp:ScriptManager runat="server"></asp:ScriptManager>

    <section>
        <div class="content-wrapper">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <h3 class="second_heading">Excel Mapping</h3>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-xs-12">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-xs-12 col-sm-3 control-label mb15">Select Excel File :</label>
                                <div class="col-xs-12 col-sm-4 mb15">
                                    <asp:FileUpload accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel,text/comma-separated-values, text/csv, application/csv" runat="server" ID="fileExcel" AllowMultiple="false" CssClass="form-control" />
                                   
                                </div>
                                <div class="col-xs-12 col-sm-5 mb15">
                                    <asp:Button ID="btnImport" OnClick="btnImport_Click" OnClientClick="return ShowPopup();" CssClass="btn-primary btn" runat="server" Text="Import" />
                                    <asp:Button ID="btnClear" OnClick="btnClear_Click" class="btn-info btn" runat="server" Text="Clear" />
                                    <asp:Button ID="btnExit" OnClick="btnExit_Click" class="btn-danger btn" runat="server" Text="Exit" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="col-xs-12">
                        <div style="max-height: 300px; overflow-x: hidden; overflow-y: scroll">
                            <asp:GridView ID="GridDdl" AutoGenerateColumns="false" OnRowDataBound="GridDdl_RowDataBound" runat="server" CssClass="table table-bordered table-hover table-padding-xs">
                                <Columns>
                                    <asp:BoundField Visible="false" DataField="RowNumber" HeaderText="Row Number" />
                                    <%-- <asp:BoundField  DataField="Field" HeaderText="Excel Column" />--%>
                                    <asp:TemplateField HeaderStyle-Width="50%" HeaderText="Database Fields">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHeader" Text="" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Width="50%" HeaderText="New Excel Fields">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" CssClass="chzn-select form-control form-control-xs">
                                                <asp:ListItem Value="-1">Select</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-sm-8 text-center">
                             <asp:Label runat="server" ID="lblmsg" Font-Bold="true" ForeColor="Red"></asp:Label>
                        </div>
                        <div class="col-sm-4 pull-right">
                            <div class="input-group">
                                <asp:TextBox runat="server" ID="txtMappingName" placeholder="Mapping Name" CssClass="form-control" />
                                  <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtMappingName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters" />
                                <span class="input-group-btn">
                                    <asp:Button ID="BtnExcelMapping" class="btn-info btn" OnClick="BtnExcelMapping_Click" runat="server" Text="Excel Mapping" />
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

