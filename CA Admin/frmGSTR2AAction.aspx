<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGSTR2AAction.aspx.cs" Inherits="CA_Admin_frmGSTR2AAction" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () { $('body').addClass('aside-collapsed'); });
    </script>
    <script>
        $(document).ready(function () {
            $('.liImportExcel').show();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="gstr2_page">
        <!-- START Page content-->
        <div class="content-wrapper" style="padding-bottom: 0">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <%--<h3 class="second_heading">Display GSTR-2A</h3>--%>
            <asp:ScriptManager runat="server" ID="scr"></asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="updatePanel1" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row">
                        <div class="panel panel-default panel-demo" style="margin-bottom: 0; margin-top: -14px">
                            <div class="panel-body p8">
                                <div>
                                    <style>
                                        .p8 {
                                            padding: 8px;
                                        }

                                        .summary-p p {
                                            margin: 0;
                                        }

                                        .gstr2action-right-tbl {
                                            float: right;
                                            width: 300px;
                                            margin-right: 20px;
                                        }

                                        .gstr2action-left-tbl {
                                            float: left;
                                            width: 340px;
                                        }

                                            .gstr2action-right-tbl tr td, .gstr2action-left-tbl tr td {
                                                padding: 2px;
                                            }
                                    </style>
                                    <div class="col-xs-12 col-sm-6 summary-p">
                                        <table class="gstr2action-left-tbl">
                                            <tr>
                                                <td class="text-bold">Total Invoice :</td>
                                                <td class="text-bold">
                                                    <asp:Label Text="05" ID="lblTotalInvoice" runat="server" /></td>
                                                <td style="width: 40px"></td>
                                                <td class="text-bold text-right">Pending Invoice :</td>
                                                <td class="text-bold">
                                                    <asp:Label Text="03" ID="lblPendingInvoice" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold">Action Taken Invoice :</td>
                                                <td class="text-bold">
                                                    <asp:Label Text="02" ID="lblActionTaken" runat="server" /></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>


                                        </table>

                                    </div>
                                    <div class="col-xs-12 col-sm-6 summary-p">
                                        <table class="gstr2action-right-tbl">
                                            <tr>
                                                <td class="text-bold text-success text-right">Accept :</td>
                                                <td class="text-bold text-success">
                                                    <asp:Label ID="lblAccepted" Text="0" runat="server" /></td>
                                                <td class="text-bold text-primary text-right">Reject :</td>
                                                <td class="text-bold text-primary">
                                                    <asp:Label ID="lblRejected" Text="0" runat="server" /></td>
                                                <td class="text-bold text-info text-right">Modify :</td>
                                                <td class="text-bold text-info">
                                                    <asp:Label Text="0" ID="lblModify" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td class="text-bold text-warning text-right">Pending :</td>
                                                <td class="text-bold text-warning">
                                                    <asp:Label ID="lblPending" Text="0" runat="server" /></td>
                                                <td class="text-bold text-danger text-right">Delete :</td>
                                                <td class="text-bold text-danger">
                                                    <asp:Label Text="0" ID="lblDelete" runat="server" /></td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>

                            <div style="padding-right: 17px">
                                <table class="table table-gstr2action">
                                    <tr>
                                        <%--<th style="width: 02%;"></th>--%>
                                        <th style="width: 05%;">Type</th>
                                        <th style="width: 10%;">Shipped GSTIN</th>
                                        <th style="width: 10%;">Invoice No.</th>
                                        <th style="width: 06%;">Invoice Date</th>
                                        <th style="width: 12%;">Place Of Supply</th>
                                        <th style="width: 4%;">Type</th>
                                        <th style="width: 4%;">Reverse Charge</th>
                                        <th style="width: 07%;">Invoice Value</th>
                                        <th style="width: 04%;">Rate</th>
                                        <th style="width: 09%;">Taxable Value</th>
                                        <th style="width: 07%;">IGST</th>
                                        <th style="width: 06%;">CGST</th>
                                        <th style="width: 06%;">SGST</th>
                                        <th style="width: 06%;">CESS</th>
                                         
                                        
                                    </tr>
                                </table>
                            </div>
                            <div>

                                <style>
                                    .lightgray{
                                        background:#d6d9dc;
                                    }

                                    .lightgreen{
                                        background:#ccdbea;
                                    }
                                    .table-gstr2action tr td, .table-gstr2action tr th {
                                        word-break: break-all;
                                    }

                                    .table-gstr2action tr th {
                                        text-align: center;
                                    }

                                    .table-gstr2action tr th, .table-gstr2action tr td {
                                        padding: 2px 3px !important;
                                        font-size: 12px;
                                    }

                                    @media (max-width:500px) {
                                        .table-gstr2action {
                                            width: 1024px;
                                        }
                                    }
                                </style>
                                <div style="max-height: 372px; overflow-y: scroll; overflow-x: hidden">
                                    <script type="text/javascript">
                                        function LoadAllScript() {
                                            LoadBasic();
                                            $(document).ready(function () {
                                                $('.checkbox input[type="checkbox"]').change(function () {
                                                    debugger;
                                                    var array;
                                                    array = this.id.split("_");
                                                    var invoiceNoid = 'ContentPlaceHolder1_grdMismatch_lblInvoiceNo_' + array[3];
                                                    var clsRow = $('#' + invoiceNoid).html().replace("/", "").replace("-", "").replace("/", "");
                                                    if ($('#' + this.id).is(':checked')) {
                                                        // alert('aa');
                                                        $('.' + clsRow).addClass('highlight_tr');
                                                    } else {
                                                        $('.' + clsRow).removeClass('highlight_tr');
                                                    }
                                                    var count = $("[type='checkbox']:checked").length;
                                                    $('#<%=lblSelected.ClientID%>').html("<i class='fa fa-check'></i> " + count + " Invoice Selected.");
                                                    if(parseInt(count)>0)
                                                    {
                                                        $('#<%=divbtn.ClientID%>').css('display', 'block');
                                                    }else
                                                    {
                                                        $('#<%=divbtn.ClientID%>').css('display', 'none');
                                                    }
                                                });
                                            });
                                        }
                                    </script>
                                    <script type="text/javascript">
                                        Sys.Application.add_load(LoadAllScript)
                                    </script>
                                    <asp:GridView runat="server" ShowHeader="false" OnRowCommand="grdMismatch_RowCommand" OnRowDataBound="grdMismatch_RowDataBound" DataKeyNames="GSTR2ARecNo,RowNo,CountInvoice,ActionCode,OrderInvoice" ID="grdMismatch" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                        <%----%>
                                        <Columns>
                                            <asp:TemplateField Visible="false" HeaderText="Select" ItemStyle-CssClass="text-center" ItemStyle-Width="02%">
                                                <ItemTemplate>
                                                    <div class="checkbox c-checkbox pull-left mt0">
                                                        <label>
                                                            <asp:CheckBox  runat="server" ID="chkSelect" />
                                                            <span class="fa fa-check"></span>
                                                        </label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:BoundField DataField="DataType"  ItemStyle-Width="05%" />

                                            <asp:BoundField HeaderText="Shipped GSTIN" DataField="PurchGSTIN" ItemStyle-CssClass="text-center" ItemStyle-Width="10%">
                                                <ItemStyle CssClass="c01 text-center"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Invoice No." ItemStyle-Width="10%">

                                                <ItemTemplate>
                                                    <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("CurrInvoiceNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="c02 text-center" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CurrinvoiceDt" HeaderText="Invoice Date" ItemStyle-CssClass="text-center" ItemStyle-Width="06%">
                                                <ItemStyle CssClass="c03 text-center" />
                                            </asp:BoundField>
                                             <asp:BoundField DataField="POSStateDesc" HeaderText="POS" ItemStyle-CssClass="text-center" ItemStyle-Width="12%">

                                                <ItemStyle CssClass="c11 text-center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="InvoiceType" HeaderText="Type" ItemStyle-CssClass="text-center" ItemStyle-Width="4%">

                                                <ItemStyle CssClass="c11 text-center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RevChargeDesc" HeaderText="Reverse Charge" ItemStyle-CssClass="text-center" ItemStyle-Width="4%">

                                                <ItemStyle CssClass="c11 text-center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CurrInvoiceValue" HeaderText="Invoice Value" ItemStyle-CssClass="text-right" ItemStyle-Width="07%">
                                                <ItemStyle CssClass="c04 text-right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Rate" HeaderText="Rate" ItemStyle-CssClass="text-right" ItemStyle-Width="04%">
                                                <ItemStyle CssClass="c05 text-right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value" ItemStyle-CssClass="text-right" ItemStyle-Width="09%">
                                                <ItemStyle CssClass="c06 text-right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="IGSTAmt" HeaderText="IGST" ItemStyle-CssClass="text-right" ItemStyle-Width="07%">
                                                <ItemStyle CssClass="c07 text-right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CGSTAmt" HeaderText="CGST" ItemStyle-CssClass="text-right" ItemStyle-Width="06%">
                                                <ItemStyle CssClass="c08 text-right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="SGSTAmt" HeaderText="SGST" ItemStyle-CssClass="text-right" ItemStyle-Width="06%">
                                                <ItemStyle CssClass="c09 text-right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="CessAmt" HeaderText="Cess" ItemStyle-CssClass="text-right" ItemStyle-Width="06%">
                                                <ItemStyle CssClass="c10 text-right" />
                                            </asp:BoundField>
                                           

                                            <asp:BoundField Visible="false" DataField="GSTR2ARecNo" ItemStyle-CssClass="text-center" ItemStyle-Width="08%">
                                                <ItemStyle CssClass="c01 text-center" />
                                            </asp:BoundField>

                                            <asp:BoundField DataField="CountInvoice" Visible="false" />
                                            <asp:BoundField DataField="RowNo" Visible="false" />
                                             <asp:BoundField DataField="ActionCode" Visible="false" />
                                            <asp:BoundField DataField="OrderInvoice" Visible="false" />



                                        </Columns>
                                    </asp:GridView>


                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12 text-center">
                                        <div class="col-md-8">
                                        <span class="pull-left text-bold">
                                            <asp:Label runat="server" ID="lblSelected"></asp:Label></span>
                                        <div runat="server" id="divbtn" style="display:none;">
                                            <asp:Button runat="server"  OnClick="btnAccept_Click" Text="Accept" ID="btnAccept" CssClass="btn btn-success" />
                                            <asp:Button runat="server" OnClick="btnReject_Click" Text="Reject" ID="btnReject" CssClass="btn btn-primary" />
                                            <asp:Button runat="server" OnClick="btnModify_Click" Text="Modify" ID="btnModify" CssClass="btn btn-info" />
                                            <asp:Button runat="server" OnClick="btnPending_Click" Text="Pending" ID="btnPending" CssClass="btn btn-warning" />
                                            <asp:Button runat="server" OnClientClick="return if(confirm('Are You Sure Delete These invoice.')==false){return False;}" Text="Delete" OnClick="btnDelete_Click" ID="btnDelete" CssClass="btn btn-danger" />
                                        </div>
                                            </div>
                                        <div class="col-md-4">
                                            <asp:Panel Visible="false" runat="server" ID="pnlMsg" CssClass="alert alert-success">
                                                <i class="fa r fa-check"></i><asp:Label runat="server" ID="lblMEssage"></asp:Label>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        </div>
    </section>
</asp:Content>

