<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGSTR2Action.aspx.cs" Inherits="CA_Admin_frmGSTR2Action" %>

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
    <style type="text/css">
        
            .table-gstr2action{
                /*background-color: #cce8ff;*/

            }
        
    </style>
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
                                            /*width: 340px;*/
                                        }

                                            .gstr2action-right-tbl tr td, .gstr2action-left-tbl tr td {
                                                padding: 2px;
                                            }
                                    </style>
                                      <div class="col-xs-12 col-sm-6 summary-p">
                                        <table class="gstr2action-left-tbl">
                                            <tr>
                                                
                                                <td class="text-bold text-info">
                                                    <asp:Label Text="" ForeColor="Black"  ID="lblTabName" runat="server" /></td>
                                            </tr>
                                              
                                              
                                        </table>

                                    </div>
                                </div>
                            </div>
                          

                            <asp:Panel ID="panelb2b" Visible="false" runat="server">

                              
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"  ID="Gridb2b" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            
                                            <Columns>
                                              
                                                <asp:BoundField HeaderText="GSTIN of Supplier" DataField="PurchGSTIN" ItemStyle-CssClass="text-center" >
                                                    <ItemStyle CssClass=" text-center"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Invoice No." >

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("CurrInvoiceNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass=" text-center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="CurrInvoiceDate" HeaderText="Invoice Date" ItemStyle-CssClass="text-center" >
                                                    <ItemStyle CssClass=" text-center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="POSStateDesc" HeaderText="POS" ItemStyle-CssClass="text-center" >

                                                    <ItemStyle CssClass=" text-center" />
                                                </asp:BoundField>
                                              
                                                <asp:BoundField DataField="CurrInvoiceValue" HeaderText="Invoice Value" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Rate" HeaderText="Rate" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IGSTAmt" HeaderText="IGST" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CGSTAmt" HeaderText="CGST" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SGSTAmt" HeaderText="SGST" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>



                                                  <asp:BoundField DataField="ITCDescDesc" HeaderText="Eligibility For ITC" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="ITCIGSTTax" HeaderText="ITC Integrated Tax" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="ITCCGSTTax" HeaderText="ITC Central Tax" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="ITCSGSTTax" HeaderText="ITC State/UT Tax" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="ITCCessTax" HeaderText="ITC Cess" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>

                                                <asp:BoundField Visible="false" DataField="GSTR2RecNo" ItemStyle-CssClass="text-center" >
                                                    <ItemStyle CssClass="text-center" />
                                                </asp:BoundField>
                                               
                                                <%--<asp:BoundField DataField="OrderInvoice" Visible="false" />--%>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="panelb2bur" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"   OnRowDataBound="Gridb2bur_RowDataBound"  ID="Gridb2bur" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>
                                               
                                                <asp:BoundField DataField="SupplyName" HeaderText="Supplier Name" />
                                               
                                                <asp:TemplateField HeaderText="Invoice No.">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("CurrInvoiceNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="text-center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="CurrInvoiceDate" HeaderText="Invoice Date" ItemStyle-CssClass="text-center" >
                                                    <ItemStyle CssClass="text-center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="POSStateDesc" HeaderText="POS" ItemStyle-CssClass="text-center" >

                                                    <ItemStyle CssClass="text-center" />
                                                </asp:BoundField>

                                                <asp:BoundField DataField="CurrInvoiceValue" HeaderText="Invoice Value" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>

                                                 <asp:BoundField DataField="SupplyTypeDesc" HeaderText="Supply Type" ItemStyle-CssClass="text-right">
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>

                                                <asp:BoundField DataField="Rate" HeaderText="Rate" ItemStyle-CssClass="text-right">
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="IGSTAmt" HeaderText="IGST" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CGSTAmt" HeaderText="CGST" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="SGSTAmt" HeaderText="SGST" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>

                                                 <asp:BoundField DataField="ITCDescDesc" HeaderText="Eligibility For ITC" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="ITCIGSTTax" HeaderText="ITC Integrated Tax" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="ITCCGSTTax" HeaderText="ITC Central Tax" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="ITCSGSTTax" HeaderText="ITC State/UT Tax" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>
                                                  <asp:BoundField DataField="ITCCessTax" HeaderText="ITC Cess" ItemStyle-CssClass="text-right" >
                                                    <ItemStyle CssClass="text-right" />
                                                </asp:BoundField>

                                                <asp:BoundField Visible="false" DataField="GSTR2RecNo" ItemStyle-CssClass="text-center">
                                                    <ItemStyle CssClass="text-center" />
                                                </asp:BoundField>
                                               
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>

                             <asp:Panel ID="panelImpg" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Gridimpg" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>
                                               
                                                <asp:BoundField DataField="PortCode" HeaderText="Port Code"  />
                                                <asp:BoundField DataField="BillOfEntryNo" HeaderText="Bill Of Entry Number"  />
                                                <asp:BoundField DataField="BillEntryDate" HeaderText="Bill Of Entry Date" />
                                                <asp:BoundField DataField="BillEntryValue" HeaderText="Bill Of Entry Value" />
                                                <asp:BoundField DataField="DocType" HeaderText="Document type"  />
                                                <asp:BoundField DataField="ClientGSTIN" HeaderText="GSTIN Of SEZ Supplier" />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate"/>
                                                <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value"  />
                                                <asp:BoundField DataField="IGSTAmt" HeaderText="Integrated Tax Paid"  />
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess Paid" />
                                                <asp:BoundField DataField="ITCDesc" HeaderText="Eligibility For ITC"  />
                                                <asp:BoundField DataField="ITCIGSTAmt" HeaderText="Availed ITC Integrated Tax"/>
                                                 <asp:BoundField DataField="ITCCessAmt" HeaderText="Availed ITC Cess" />
                                               
                                              <%--  <asp:BoundField DataField="CessAmt" HeaderText="Cess" ItemStyle-CssClass="text-right" ItemStyle-Width="07%">
                                                    <ItemStyle CssClass="c10 text-right" />
                                                </asp:BoundField>--%>
                                               
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>

                             <asp:Panel ID="panelImps" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Gridimps" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>
                                               
                                                <asp:BoundField DataField="InvoiceNumber" HeaderText="Invoice Number of Reg Recipient"  />
                                                <asp:BoundField DataField="InvoiceDate" HeaderText="Invoice Date"  />
                                                <asp:BoundField DataField="InvoiceValue" HeaderText="Invoice Value" />
                                                <asp:BoundField DataField="PosStateDesc" HeaderText="Place Of Supply" />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate"  />
                                                <asp:BoundField DataField="TaxableAmt" HeaderText="Taxable Value" />
                                                <asp:BoundField DataField="IGSTAmt" HeaderText="Integrated Tax Paid"/>
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess Paid"  />
                                                <asp:BoundField DataField="ITCDesc" HeaderText="Eligibility For ITC"  />

                                                <asp:BoundField DataField="ITCIGSTAmt" HeaderText="Availed ITC Integrated Tax" />
                                                <asp:BoundField DataField="ITCCessAmt" HeaderText="Availed ITC Cess"  />
                                            
                                            </Columns>
                                        </asp:GridView>


                                    </div>
                                </div>
                            </asp:Panel>

                             <asp:Panel ID="panelCdnr" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Gridcdn" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>
                                               
                                                <asp:BoundField DataField="ClientGSTIN" HeaderText="GSTIN Supplier"  />
                                                <asp:BoundField DataField="NoteRefVoucherNo" HeaderText="Note Voucher No."  />
                                                <asp:BoundField DataField="NoteRefVoucherDate" HeaderText="Note Voucher date" />
                                                <asp:BoundField DataField="ADVPayVoucherNo" HeaderText="Invoice Payment Voucher No." />
                                                <asp:BoundField DataField="ADVPayVoucherDate" HeaderText="Invoice Payment Voucher date"  />
                                                <asp:BoundField DataField="PreGST" HeaderText="Pre GST" />
                                                <asp:BoundField DataField="DocType" HeaderText="Document"/>
                                                <asp:BoundField DataField="ReasonForDrCrNote" HeaderText="Issuing document"  />
                                                <asp:BoundField DataField="SupplyType" HeaderText="Supply Type"  />

                                                <asp:BoundField DataField="NoteRefVoucherValue" HeaderText="Note Voucher Value" />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate"  />
                                                 <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value"  />
                                                 <asp:BoundField DataField="IGSTAmt" HeaderText="IGST Amt."  />
                                                 <asp:BoundField DataField="CGSTAmt" HeaderText="CGST Amt."  />
                                                 <asp:BoundField DataField="SGSTAmt" HeaderText="SGST Amt."  />
                                                  <asp:BoundField DataField="CessAmt" HeaderText="Cess Amt."  />
                                                  <asp:BoundField DataField="ITCDesc" HeaderText="Eligibility For ITC"  />
                                                  <asp:BoundField DataField="ITCIGSTAmt" HeaderText="ITC IGST Amt"  />
                                                  <asp:BoundField DataField="ITCCGSTAmt" HeaderText="ITC CGST Amt"  />
                                                  <asp:BoundField DataField="ITCSGSTAmt" HeaderText="ITC SGST Amt"  />
                                                  <asp:BoundField DataField="ITCCessAmt" HeaderText="ITC Cess"  />
                                          
                                               
                                            </Columns>
                                        </asp:GridView>


                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="panelCdnur" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Gridcdnur" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>
                                               
                                                <asp:BoundField DataField="NoteRefVoucherNo" HeaderText="Note/Voucher No."  />
                                                <asp:BoundField DataField="NoteRefVoucherDate" HeaderText="Note/Voucher date" />
                                                <asp:BoundField DataField="ADVPayVoucherNo" HeaderText="Invoice Voucher No." />
                                                <asp:BoundField DataField="ADVPayVoucherDate" HeaderText="Invoice Voucher date"  />
                                                <asp:BoundField DataField="PreGST" HeaderText="Pre GST" />
                                                <asp:BoundField DataField="DocType" HeaderText="Document Type"/>
                                                <asp:BoundField DataField="ReasonForDrCrNote" HeaderText="Issuing document"  />
                                                <asp:BoundField DataField="SupplyType" HeaderText="Supply Type"  />

                                                <asp:BoundField DataField="NoteRefVoucherValue" HeaderText="Voucher Value" />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate"  />
                                                 <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value"  />
                                                 <asp:BoundField DataField="IGSTAmt" HeaderText="IGST Amt."  />
                                                 <asp:BoundField DataField="CGSTAmt" HeaderText="CGST Amt"  />
                                                 <asp:BoundField DataField="SGSTAmt" HeaderText="SGST Amt"  />
                                                  <asp:BoundField DataField="CessAmt" HeaderText="Cess Amt"  />
                                                  <asp:BoundField DataField="ITCDesc" HeaderText="Eligibility ITC"  />
                                                  <asp:BoundField DataField="ITCIGSTAmt" HeaderText="ITC IGST"  />
                                                  <asp:BoundField DataField="ITCCGSTAmt" HeaderText="ITC CGST"  />
                                                  <asp:BoundField DataField="ITCSGSTAmt" HeaderText="ITC SGST"  />
                                                  <asp:BoundField DataField="ITCCessAmt" HeaderText="ITC Cess"  />                                           
                                               
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="panelAt" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Gridat" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>
                                                                                            
                                                <asp:BoundField DataField="PosStateDesc" HeaderText="Place Of Supply"  />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                <asp:BoundField DataField="GrossAdvPaid" HeaderText="Gross Advance Paid" />
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess Amount"  />                                        
                                               
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="panelAtadj" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Gridatadj" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>
                                                                                            
                                                <asp:BoundField DataField="PosStateDesc" HeaderText="Place Of Supply"  />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                <asp:BoundField DataField="GrossAdvPaidAdj" HeaderText="Gross Advance Paid to be Adjusted" />
                                                <asp:BoundField DataField="CessAdj" HeaderText="Cess Adjusted"  />                                           
                                               
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="panelexemp" Visible="false" runat="server">
                               
                                <div>
                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Gridexemp" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>                                              
                                              
                                                <asp:BoundField DataField="SupplyTypeDesc" HeaderText="Description"  />
                                                <asp:BoundField DataField="CompositionTax" HeaderText="Composition taxable person" />
                                                <asp:BoundField DataField="NilRatedTax" HeaderText="Nil Rated Supplies" />
                                                <asp:BoundField DataField="ExemptedTax" HeaderText="Exempted (other than nil rated/non GST supply )"  />
                                                 <asp:BoundField DataField="NonGSTTax" HeaderText="Non-GST supplies" />                                              
                                               
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="panelitcr" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Griditcr" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>                                              
                                                <asp:BoundField DataField="DescForITC" HeaderText="Description for reversal of ITC"  />
                                                <asp:BoundField DataField="TobeAddedDesc" HeaderText="To be added or reduced from output liability" />
                                                <asp:BoundField DataField="ITCIGSTAmt" HeaderText="ITC Integrated Tax Amount" />
                                                <asp:BoundField DataField="ITCCGSTAmt" HeaderText="ITC Central Tax Amount"  />
                                                 <asp:BoundField DataField="ITCSGSTAmt" HeaderText="ITC State/UT Tax Amount" />

                                                  <asp:BoundField DataField="ITCCessAmt" HeaderText="ITC Cess Amount" />                                                 
                                  
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="panelhsn" Visible="false" runat="server">
                               
                                <div>

                                    <style>
                                        .lightgray {
                                            background: #d6d9dc;
                                        }

                                        .lightgreen {
                                            background: #ccdbea;
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
                                            Sys.Application.add_load(LoadAllScript)
                                        </script>
                                        <asp:GridView runat="server"    ID="Gridhsn" AutoGenerateColumns="False" CssClass="table  table-gstr2action">
                                            <%----%>
                                            <Columns>
                                                                                            
                                                <asp:BoundField DataField="HSNCode" HeaderText="HSN"  />
                                                <asp:BoundField DataField="HSNDesc" HeaderText="Description" />
                                                <asp:BoundField DataField="UQC" HeaderText="UQC" />
                                                <asp:BoundField DataField="TotalQuantity" HeaderText="Total Quantity"  />
                                                 <asp:BoundField DataField="TotalValue" HeaderText="Total Value" />

                                                  <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value" />
                                                  <asp:BoundField DataField="IGST" HeaderText="IGST Amt." />
                                                  <asp:BoundField DataField="CGST" HeaderText="CGST Amt."  />
                                                  <asp:BoundField DataField="SGST" HeaderText="SGST Amt."  />
                                                  <asp:BoundField DataField="CESS" HeaderText="Cess Amt."  />
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </asp:Panel>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12 text-center">
                                        <div class="col-md-8">
                                            <span class="pull-left text-bold">
                                                <asp:Label runat="server" ID="lblSelected"></asp:Label></span>
                                            <div runat="server" id="divbtn" style="display: none;">
                                                <asp:Button runat="server" OnClick="btnAccept_Click" Text="Accept" ID="btnAccept" CssClass="btn btn-success" />
                                                <asp:Button runat="server" OnClick="btnReject_Click" Text="Reject" ID="btnReject" CssClass="btn btn-primary" />
                                                <%--<asp:Button runat="server" OnClick="btnModify_Click" Text="Modify" ID="btnModify" CssClass="btn btn-info" />
                                            <asp:Button runat="server" OnClick="btnPending_Click" Text="Pending" ID="btnPending" CssClass="btn btn-warning" />
                                            <asp:Button runat="server" OnClientClick="return if(confirm('Are You Sure Delete These invoice.')==false){return False;}" Text="Delete" OnClick="btnDelete_Click" ID="btnDelete" CssClass="btn btn-danger" />--%>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Panel Visible="false" runat="server" ID="pnlMsg" CssClass="alert alert-success">
                                                <i class="fa r fa-check"></i>
                                                <asp:Label runat="server" ID="lblMEssage"></asp:Label>
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

    </section>
</asp:Content>

