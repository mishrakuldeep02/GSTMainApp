<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmDisplayPurchData.aspx.cs" Inherits="CA_Admin_frmDisplayPurchaseData" %>

<%@ Register Src="~/UserControl/wucImportData.ascx" TagName="UserControlModal" TagPrefix="cc1" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('.btn_back_url').attr('href', 'frmTaxPayerSearch.aspx');
            $('.gstr_sitemap').append('<li class="breadcrumb-item active">Client</li>');
            $('.liImportExcel').show();
        });

    </script>
    <script type="text/javascript">
        $(document).ready(function () { $('body').addClass('aside-collapsed'); });
    </script>
    <style>
        .clssumm {
            text-decoration: none;
            color: black;
            font-weight: 600;
            display: inline-block;
            width: 100%;
            margin-top: 4px;
        }

        .table_3a_details {
            width: 100%;
        }

            .table_3a_details tr td {
                padding: 3px 8px;
            }
            .gstr_row_title
            {
                color: #0d4f86;
            }
                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="gstr2_page">
        <!-- START Page content-->
        <div class="content-wrapper">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <h3 class="second_heading">Display Purchase Data</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div id="accordion" class="panel-group">
                            <!-- START Table 3-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table3">
                                            <span  class="gstr_row_title">B2B:</span>
                                            <span class="gstr_row_desc blue">3,4A - Inward Supplies received from Registerd person including reverse charge supplies 
                                                <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :<asp:Label runat="server" ID="lblb2bTotalInvoice"></asp:Label>
                                                            </td>
                                                            <td>Invoice Value :
                                                                <asp:Label runat="server" ID="lblb2bInvoiceValue"></asp:Label></td>
                                                            <td>Taxable Value :
                                                                <asp:Label runat="server" ID="lblb2bTaxableValue"></asp:Label>
                                                            </td>
                                                            <td>IGST :<asp:Label runat="server" ID="lblb2bIGST"></asp:Label>
                                                            </td>
                                                            <td>CGST :
                                                                <asp:Label runat="server" ID="lblb2bCGST"></asp:Label>
                                                            </td>
                                                            <td>SGST :
                                                                <asp:Label runat="server" ID="lblb2bSGST"></asp:Label>
                                                            </td>
                                                            <td>CESS :
                                                                <asp:Label runat="server" ID="lblb2bCess"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>ITCIGST :
                                                                <asp:Label runat="server" ID="lblb2bITCIGST"></asp:Label>
                                                            </td>
                                                            <td>ITCCGST :
                                                                <asp:Label runat="server" ID="lblb2bITCCGST"></asp:Label>
                                                            </td>
                                                            <td>ITCSGST :
                                                                <asp:Label runat="server" ID="lblb2bITCSGST"></asp:Label>
                                                            </td>
                                                            <td>ITCCESS :
                                                                <asp:Label runat="server" ID="lblb2bITCCESS"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </span>
                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table3" class="panel-collapse collapse in" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <table class="table table-bordered table-gstr table_psm table3">
                                            <thead>
                                                <tr>
                                                    <th class="c01" rowspan="2">GSTIN Of Supplier</th>
                                                    <th class="c02" colspan="3">Invoice Detail</th>
                                                    <th class="c05" rowspan="2">Rate</th>
                                                    <th class="c06" rowspan="2">Taxable Value</th>
                                                    <th class="c07" colspan="4">Amount Tax</th>
                                                    <th class="c11" rowspan="2">Place Of Supply (Name Of State)</th>
                                                    <th class="c12" rowspan="2">ITC TYPE </th>
                                                    <th class="c13" colspan="4">Amount of ITC available</th>
                                                </tr>
                                                <tr>
                                                    <th class="c02">No</th>
                                                    <th class="c03">Date</th>
                                                    <th class="c04">Value</th>
                                                    <th class="c07">Integrated tax</th>
                                                    <th class="c08">Central Tax</th>
                                                    <th class="c09">State / UTTax</th>
                                                    <th class="c10">CESS</th>
                                                    <th class="c13">Integrated tax</th>
                                                    <th class="c14">Central Tax</th>
                                                    <th class="c15">State/UTTax</th>
                                                    <th class="c16">CESS</th>
                                                </tr>
                                                <tr>
                                                    <th class="c01">1</th>
                                                    <th class="c02">2&nbsp;</th>
                                                    <th class="c03">3</th>
                                                    <th class="c04">4</th>
                                                    <th class="c05">5</th>
                                                    <th class="c06">6</th>
                                                    <th class="c07">7</th>
                                                    <th class="c08">8</th>
                                                    <th class="c09">9</th>
                                                    <th class="c10">10</th>
                                                    <th class="c11">11</th>
                                                    <th class="c12">12</th>
                                                    <th class="c13">13</th>
                                                    <th class="c14">14</th>
                                                    <th class="c15">15</th>
                                                    <th class="c16">16</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="16" class="p0 b0">
                                                        <asp:GridView runat="server" OnRowDataBound="GrdTable3_RowDataBound" DataKeyNames="ActionCode" CssClass="table table-gstr table_psm table3" ID="GrdTable3" AutoGenerateColumns="false" ShowHeader="false">
                                                            <Columns>
                                                                <asp:BoundField DataField="PurchGSTIN" ItemStyle-CssClass="c01 text-center" />
                                                                <asp:BoundField DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-left" />
                                                                <asp:BoundField DataField="CurrInvoiceDate" ItemStyle-CssClass="c03 text-center" />
                                                                <asp:BoundField DataField="CurrInvoiceValue" ItemStyle-CssClass="c04 text-right" />
                                                                <asp:BoundField DataField="Rate" ItemStyle-CssClass="c05 text-right" />
                                                                <asp:BoundField DataField="TaxableValue" ItemStyle-CssClass="c06 text-right" />
                                                                <asp:BoundField DataField="IGSTAmt" ItemStyle-CssClass="c07 text-right" />
                                                                <asp:BoundField DataField="CGSTAmt" ItemStyle-CssClass="c08 text-right" />
                                                                <asp:BoundField DataField="SGSTAmt" ItemStyle-CssClass="c09 text-right" />
                                                                <asp:BoundField DataField="CessAmt" ItemStyle-CssClass="c10 text-right" />
                                                                <asp:BoundField DataField="PosStateDesc" ItemStyle-CssClass="c11 text-left" />
                                                                <asp:BoundField DataField="ITCDescDesc" ItemStyle-CssClass="c12 text-left" />
                                                                <asp:BoundField DataField="ITCIGSTTax" ItemStyle-CssClass="c13 text-right" />
                                                                <asp:BoundField DataField="ITCCGSTTax" ItemStyle-CssClass="c14 text-right" />
                                                                <asp:BoundField DataField="ITCSGSTTax" ItemStyle-CssClass="c15 text-right" />
                                                                <asp:BoundField DataField="ITCCessTax" ItemStyle-CssClass="c16 text-right" />
                                                                <asp:BoundField DataField="ActionCode" Visible="false" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                   
                                                </tr>
                                              
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 3-->

                            <!-- START Table 4-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table4">
                                            <span class="gstr_row_title">B2BUR:</span>
                                            <span class="gstr_row_desc blue">. 4B - Inward supplies from an unregistered supplier 
                                                <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :<asp:Label runat="server" ID="lblb2burTotalInvoice"></asp:Label>
                                                            </td>
                                                            <td>Invoice Value :
                                                                <asp:Label runat="server" ID="lblb2burInvoiceValue"></asp:Label></td>
                                                            <td>Taxable Value :
                                                                <asp:Label runat="server" ID="lblb2burTaxableValue"></asp:Label>
                                                            </td>
                                                            <td>IGST :<asp:Label runat="server" ID="lblb2burIGST"></asp:Label>
                                                            </td>
                                                            <td>CGST :
                                                                <asp:Label runat="server" ID="lblb2burCGST"></asp:Label>
                                                            </td>
                                                            <td>SGST :
                                                                <asp:Label runat="server" ID="lblb2burSGST"></asp:Label>
                                                            </td>
                                                            <td>CESS :
                                                                <asp:Label runat="server" ID="lblb2burCESS"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>ITCIGST :
                                                                <asp:Label runat="server" ID="lblb2burITCIGST"></asp:Label>
                                                            </td>
                                                            <td>ITCCGST :
                                                                <asp:Label runat="server" ID="lblb2burITCCGST"></asp:Label>
                                                            </td>
                                                            <td>ITCSGST :
                                                                <asp:Label runat="server" ID="lblb2burITCSGST"></asp:Label>
                                                            </td>
                                                            <td>ITCCESS :
                                                                <asp:Label runat="server" ID="lblb2burITCCESS"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </span>
                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table4" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <table class="table table-bordered table-gstr table_psm table3">
                                            <thead>
                                                <tr>
                                                    <th class="c01" rowspan="2">Name Of Supplier</th>
                                                    <th class="c02" colspan="3">Invoice Detail</th>
                                                    <th class="c05" rowspan="2">Rate</th>
                                                    <th class="c06" rowspan="2">Taxable Value</th>
                                                    <th class="c07" colspan="4">Amount Tax</th>
                                                    <th class="c11" rowspan="2">Place Of Supply (Name Of State)</th>
                                                    <th class="c12" rowspan="2">ITC TYPE </th>
                                                    <th class="c13" colspan="4">Amount of ITC available</th>
                                                </tr>
                                                <tr>
                                                    <th class="c02">No</th>
                                                    <th class="c03">Date</th>
                                                    <th class="c04">Value</th>
                                                    <th class="c07">Integrated tax</th>
                                                    <th class="c08">Central Tax</th>
                                                    <th class="c09">State / UTTax</th>
                                                    <th class="c10">CESS</th>
                                                    <th class="c13">Integrated tax</th>
                                                    <th class="c14">Central Tax</th>
                                                    <th class="c15">State/UTTax</th>
                                                    <th class="c16">CESS</th>
                                                </tr>
                                                <tr>
                                                    <th class="c01">1</th>
                                                    <th class="c02">2&nbsp;</th>
                                                    <th class="c03">3</th>
                                                    <th class="c04">4</th>
                                                    <th class="c05">5</th>
                                                    <th class="c06">6</th>
                                                    <th class="c07">7</th>
                                                    <th class="c08">8</th>
                                                    <th class="c09">9</th>
                                                    <th class="c10">10</th>
                                                    <th class="c11">11</th>
                                                    <th class="c12">12</th>
                                                    <th class="c13">13</th>
                                                    <th class="c14">14</th>
                                                    <th class="c15">15</th>
                                                    <th class="c16">16</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td colspan="16" class="p0 b0">
                                                        <asp:GridView runat="server" OnRowDataBound="Grd4A_RowDataBound" DataKeyNames="ActionCode" CssClass="table table-gstr table_psm table3" ID="Grd4A" AutoGenerateColumns="false" ShowHeader="false">
                                                            <Columns>
                                                                <asp:BoundField DataField="SupplyName" ItemStyle-CssClass="c01 text-center" />
                                                                <asp:BoundField DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-left" />
                                                                <asp:BoundField DataField="CurrInvoiceDate" ItemStyle-CssClass="c03 text-center" />
                                                                <asp:BoundField DataField="CurrInvoiceValue" ItemStyle-CssClass="c04 text-right" />
                                                                <asp:BoundField DataField="Rate" ItemStyle-CssClass="c05 text-right" />
                                                                <asp:BoundField DataField="TaxableValue" ItemStyle-CssClass="c06 text-right" />
                                                                <asp:BoundField DataField="IGSTAmt" ItemStyle-CssClass="c07 text-right" />
                                                                <asp:BoundField DataField="CGSTAmt" ItemStyle-CssClass="c08 text-right" />
                                                                <asp:BoundField DataField="SGSTAmt" ItemStyle-CssClass="c09 text-right" />
                                                                <asp:BoundField DataField="CessAmt" ItemStyle-CssClass="c10 text-right" />
                                                                <asp:BoundField DataField="PosStateDesc" ItemStyle-CssClass="c11 text-left" />
                                                                <asp:BoundField DataField="ITCDescDesc" ItemStyle-CssClass="c12 text-left" />
                                                                <asp:BoundField DataField="ITCIGSTTax" ItemStyle-CssClass="c13 text-right" />
                                                                <asp:BoundField DataField="ITCCGSTTax" ItemStyle-CssClass="c14 text-right" />
                                                                <asp:BoundField DataField="ITCSGSTTax" ItemStyle-CssClass="c15 text-right" />
                                                                <asp:BoundField DataField="ITCCessTax" ItemStyle-CssClass="c16 text-right" />
                                                                <asp:BoundField DataField="ActionCode" Visible="false" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 4-->

                            <!-- START Table 5-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table5">
                                            <span class="gstr_row_title">IMPS:</span>
                                            <span class="gstr_row_desc blue">4C - Import of service 
                                                  <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :<asp:Label runat="server" ID="lblIMPSTotalInvoice"></asp:Label>
                                                            </td>
                                                            <td>Invoice Value :
                                                                <asp:Label runat="server" ID="lblIMPSTotalInvoiceValue"></asp:Label></td>
                                                            <td>Taxable Value :
                                                                <asp:Label runat="server" ID="lblIMPSTotalTaxableValue"></asp:Label>
                                                            </td>
                                                            <td>IGST :<asp:Label runat="server" ID="lblIMPSTotalIGST"></asp:Label>
                                                            </td>
                                                            <td>CESS :
                                                                <asp:Label runat="server" ID="lblIMPSTotalCESS"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>ITCIGST :
                                                                <asp:Label runat="server" ID="lblIMPSTotalITCIGST"></asp:Label>
                                                            </td>

                                                            <td>ITCCESS :
                                                                <asp:Label runat="server" ID="lblIMPSTotalITCCESS"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </span>
                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table5" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <table class="table table-bordered table-gstr table_psm table5" style="font-size: 12px;">
                                            <thead>
                                                <tr>
                                                    <%--<th class="c01" rowspan="2">Invoice Number of Reg Recipient</th>--%>
                                                    <th class="c02" colspan="3">Invoice Details</th>

                                                    <th class="c04" rowspan="2">Rate</th>
                                                    <th class="c05" rowspan="2">Taxable value</th>
                                                    <th class="c07" colspan="2">Amount</th>
                                                    <th class="c08" rowspan="2">Whether input / Capital goods ( incl. plant and machinery ) / Ineligible for ITC</th>
                                                    <th class="c10" colspan="2">Amount of ITC available</th>
                                                    <th class="c11" rowspan="2">Place Of Supply</th>
                                                </tr>
                                                <tr>
                                                    <th class="c01">No.</th>
                                                    <th class="c02">Date</th>
                                                    <th class="c03">Value</th>
                                                    <th class="c06">Integrated tax</th>
                                                    <th class="c07">CESS</th>
                                                    <th class="c09">Integrated tax</th>
                                                    <th class="c10">CESS</th>
                                                </tr>

                                                <tr>
                                                    <th class="c01">1</th>
                                                    <th class="c02">2</th>
                                                    <th class="c03">3</th>
                                                    <th class="c04">4</th>
                                                    <th class="c05">5</th>
                                                    <th class="c06">6</th>
                                                    <th class="c07">7</th>
                                                    <th class="c08">8</th>
                                                    <th class="c09">9</th>
                                                    <th class="c10">10</th>
                                                    <th class="c11">11</th>

                                                </tr>

                                            </thead>
                                            <tbody>

                                                <tr>
                                                    <td colspan="11" class="p0 b0">
                                                        <asp:GridView runat="server" OnRowDataBound="grd5A_RowDataBound" DataKeyNames="" CssClass="table table-gstr table_psm table5" ID="grd5A" AutoGenerateColumns="false" ShowHeader="false">
                                                            <Columns>
                                                                <asp:BoundField DataField="InvoiceNumber" ItemStyle-CssClass="c01 text-left" />
                                                                <asp:BoundField DataField="InvoiceDate" ItemStyle-CssClass="c02 text-center" />
                                                                <asp:BoundField DataField="InvoiceValue" ItemStyle-CssClass="c03 text-right" />

                                                                <asp:BoundField DataField="Rate" ItemStyle-CssClass="c05 text-right" />
                                                                <asp:BoundField DataField="TaxableAmt" ItemStyle-CssClass="c06 text-right" />
                                                                <asp:BoundField DataField="IGSTAmt" ItemStyle-CssClass="c07 text-right" />
                                                                <asp:BoundField DataField="CessAmt" ItemStyle-CssClass="c08 text-right" />
                                                                <asp:BoundField DataField="ITCDesc" ItemStyle-CssClass="c09 text-left" />
                                                                <asp:BoundField DataField="ITCIGSTAmt" ItemStyle-CssClass="c10 text-right" />
                                                                <asp:BoundField DataField="ITCCessAmt" ItemStyle-CssClass="c11 text-right" />
                                                                <asp:BoundField DataField="PosStateDesc" ItemStyle-CssClass="c04 text-left" />

                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 5-->

                            <!-- START Table 6-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table6">
                                            <span class="gstr_row_title">Impg:</span>
                                            <span class="gstr_row_desc blue">5 - Import of Inputs/Capital goods and Supplies received from SEZ



                                                <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :<asp:Label runat="server" ID="lblIMPGTotalInvoice"></asp:Label>
                                                            </td>
                                                            <td>Invoice Value :
                                                                <asp:Label runat="server" ID="lblIMPGTotalInvoiceValue"></asp:Label></td>
                                                            <td>Taxable Value :
                                                                <asp:Label runat="server" ID="lblIMPGTotalTaxableValue"></asp:Label>
                                                            </td>
                                                            <td>IGST :<asp:Label runat="server" ID="lblIMPGTotalIGST"></asp:Label>
                                                            </td>
                                                            <td>CESS :
                                                                <asp:Label runat="server" ID="lblIMPGTotalCESS"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>ITCIGST :
                                                                <asp:Label runat="server" ID="lblIMPGTotalITCIGST"></asp:Label>
                                                            </td>

                                                            <td>ITCCESS :
                                                                <asp:Label runat="server" ID="lblIMPGTotalITCCESS"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </span>
                                            </span>



                                        </a>
                                    </h4>
                                </div>
                                <div id="table6" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <asp:GridView runat="server" ID="Gridimpg" AutoGenerateColumns="False" CssClass="table table-gstr table_psm table5">
                                            <%----%>
                                            <Columns>

                                                <asp:BoundField DataField="PortCode" HeaderText="Port Code" />
                                                <asp:BoundField DataField="BillOfEntryNo" HeaderText="Bill Of Entry Number" />
                                                <asp:BoundField DataField="BillEntryDate" HeaderText="Bill Of Entry Date" />
                                                <asp:BoundField DataField="BillEntryValue" HeaderText="Bill Of Entry Value" />
                                                <asp:BoundField DataField="DocType" HeaderText="Document type" />
                                                <%--  <asp:BoundField DataField="ClientGSTIN" HeaderText="GSTIN Of SEZ Supplier" />--%>
                                                <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value" />
                                                <asp:BoundField DataField="IGSTAmt" HeaderText="Integrated Tax Paid" />
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess Paid" />
                                                <asp:BoundField DataField="ITCDesc" HeaderText="Eligibility For ITC" />
                                                <asp:BoundField DataField="ITCIGSTAmt" HeaderText="Availed ITC Integrated Tax" />
                                                <asp:BoundField DataField="ITCCessAmt" HeaderText="Availed ITC Cess" />

                                                <%--  <asp:BoundField DataField="CessAmt" HeaderText="Cess" ItemStyle-CssClass="text-right" ItemStyle-Width="07%">
                                                    <ItemStyle CssClass="c10 text-right" />
                                                </asp:BoundField>--%>
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 6-->

                            <!-- START Table 7-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table7">
                                            <span class="gstr_row_title">CDNR:</span>
                                            <span class="gstr_row_desc blue">6C - Debit/Credit Notes for supplies from registered person 

                                                 <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :
                                                                <asp:Label runat="server" ID="lblCdnrTotInvoRow"></asp:Label>
                                                            </td>
                                                            <td>Taxable Value :
                                                                <asp:Label runat="server" ID="lblCdnrTotTax"></asp:Label>
                                                            </td>
                                                            <td>Total Note/Refund Voucher Value :<asp:Label runat="server" ID="lblCdnrTotNoteRefVoucherValue"></asp:Label>
                                                            </td>
                                                            <td>Total ITC Tax :
                                                                <asp:Label runat="server" ID="lblCdnrTotITC"></asp:Label></td>
                                                        </tr>

                                                    </table>
                                                </span>
                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table7" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <asp:GridView runat="server" ID="Gridcdnr" AutoGenerateColumns="False" CssClass="table table-gstr table_psm table5">

                                            <Columns>

                                                <asp:BoundField DataField="ClientGSTIN" HeaderText="GSTIN Supplier" />
                                                <asp:BoundField DataField="NoteRefVoucherNo" HeaderText="Note Voucher No." />
                                                <asp:BoundField DataField="NoteRefVoucherDate" HeaderText="Note Voucher date" />
                                                <asp:BoundField DataField="ADVPayVoucherNo" HeaderText="Invoice Payment Voucher No." />
                                                <asp:BoundField DataField="ADVPayVoucherDate" HeaderText="Invoice Payment Voucher date" />
                                                <asp:BoundField DataField="PreGST" HeaderText="Pre GST" />
                                                <asp:BoundField DataField="DocType" HeaderText="Document" />
                                                <asp:BoundField DataField="ReasonForDrCrNote" HeaderText="Issuing document" />
                                                <asp:BoundField DataField="SupplyType" HeaderText="Supply Type" />
                                                <asp:BoundField DataField="NoteRefVoucherValue" HeaderText="Note Voucher Value" />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value" />
                                                <asp:BoundField DataField="IGSTAmt" HeaderText="IGST Amt." />
                                                <asp:BoundField DataField="CGSTAmt" HeaderText="CGST Amt." />
                                                <asp:BoundField DataField="SGSTAmt" HeaderText="SGST Amt." />
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess Amt." />
                                                <asp:BoundField DataField="ITCDesc" HeaderText="Eligibility For ITC" />
                                                <asp:BoundField DataField="ITCIGSTAmt" HeaderText="ITC IGST Amt" />
                                                <asp:BoundField DataField="ITCCGSTAmt" HeaderText="ITC CGST Amt" />
                                                <asp:BoundField DataField="ITCSGSTAmt" HeaderText="ITC SGST Amt" />
                                                <asp:BoundField DataField="ITCCessAmt" HeaderText="ITC Cess" />


                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 7-->

                            <!-- START Table 8-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table8">
                                            <span class="gstr_row_title">CDNUR:

                                            </span>
                                            <span class="gstr_row_desc blue">6C - Debit Notes/Credit Notes for Unregistered Supplier

                                                  <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :
                                                                <asp:Label runat="server" ID="lblCdnurTotInvoRow"></asp:Label>
                                                            </td>
                                                            <td>Taxable Value :
                                                                <asp:Label runat="server" ID="lblCdnurTotTax"></asp:Label>
                                                            </td>
                                                            <td>Total Note/Refund Voucher Value :<asp:Label runat="server" ID="lblCdnurTotNoteRefVoucherValue"></asp:Label>
                                                            </td>
                                                            <td>Total ITC Tax:
                                                                <asp:Label runat="server" ID="lblCdnurTotITC"></asp:Label></td>
                                                        </tr>

                                                    </table>

                                                </span></a>
                                    </h4>
                                </div>
                                <div id="table8" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <asp:GridView runat="server" ID="Gridcdnur" AutoGenerateColumns="False" CssClass="table table-gstr table_psm table5">
                                            <%----%>
                                            <Columns>

                                                <asp:BoundField DataField="NoteRefVoucherNo" HeaderText="Note/Voucher No." />
                                                <asp:BoundField DataField="NoteRefVoucherDate" HeaderText="Note/Voucher date" />
                                                <asp:BoundField DataField="ADVPayVoucherNo" HeaderText="Invoice Voucher No." />
                                                <asp:BoundField DataField="ADVPayVoucherDate" HeaderText="Invoice Voucher date" />
                                                <asp:BoundField DataField="PreGST" HeaderText="Pre GST" />
                                                <asp:BoundField DataField="DocType" HeaderText="Document Type" />
                                                <asp:BoundField DataField="ReasonForDrCrNote" HeaderText="Issuing document" />
                                                <asp:BoundField DataField="SupplyType" HeaderText="Supply Type" />

                                                <asp:BoundField DataField="NoteRefVoucherValue" HeaderText="Voucher Value" />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value" />
                                                <asp:BoundField DataField="IGSTAmt" HeaderText="IGST Amt." />
                                                <asp:BoundField DataField="CGSTAmt" HeaderText="CGST Amt" />
                                                <asp:BoundField DataField="SGSTAmt" HeaderText="SGST Amt" />
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess Amt" />
                                                <asp:BoundField DataField="ITCDesc" HeaderText="Eligibility ITC" />
                                                <asp:BoundField DataField="ITCIGSTAmt" HeaderText="ITC IGST" />
                                                <asp:BoundField DataField="ITCCGSTAmt" HeaderText="ITC CGST" />
                                                <asp:BoundField DataField="ITCSGSTAmt" HeaderText="ITC SGST" />
                                                <asp:BoundField DataField="ITCCessAmt" HeaderText="ITC Cess" />

                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 8-->

                            <!-- START Table 9-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table9">
                                            <span class="gstr_row_title">AT:</span>
                                            <span class="gstr_row_desc blue">10(I) - 10A - Advance amount paid for reverse charge supplies 
                                                  <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :
                                                                <asp:Label runat="server" ID="lblatTotRow"></asp:Label>
                                                            </td>
                                                            <td>Total Gross Adv Paid :
                                                                <asp:Label runat="server" ID="lblAtGrossAdv"></asp:Label>
                                                            </td>
                                                            <td>Total Cess:<asp:Label runat="server" ID="lblAtTotalCESS"></asp:Label>
                                                            </td>

                                                        </tr>

                                                    </table>
                                                </span>
                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table9" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <asp:GridView runat="server" ID="Gridat" AutoGenerateColumns="False" CssClass="table table-gstr table_psm table5">
                                            <%----%>
                                            <Columns>

                                                <asp:BoundField DataField="PosStateDesc" HeaderText="Place Of Supply" />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                <asp:BoundField DataField="GrossAdvPaid" HeaderText="Gross Advance Paid" />
                                                <asp:BoundField DataField="CessAmt" HeaderText="Cess Amount" />

                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 9-->

                            <!-- START Table 10-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table10">
                                            <span class="gstr_row_title">ATADJ:</span>
                                            <span class="gstr_row_desc blue">10(I) - 10B - Adjustment of Advance amount paid earilier for reverse charge supplies 


                                                 <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :
                                                                <asp:Label runat="server" ID="lblatadjTotRow"></asp:Label>
                                                            </td>
                                                            <td>Total Gross Adv Paid Adjust :
                                                                <asp:Label runat="server" ID="lblAtAdjGrossAdv"></asp:Label>
                                                            </td>
                                                            <td>Total Cess Adjust :<asp:Label runat="server" ID="lblAtadjTotalCESS"></asp:Label>
                                                            </td>

                                                        </tr>

                                                    </table>
                                                </span>
                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table10" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <asp:GridView runat="server" ID="Gridatadj" AutoGenerateColumns="False" CssClass="table table-gstr table_psm table5">
                                            <%----%>
                                            <Columns>

                                                <asp:BoundField DataField="PosStateDesc" HeaderText="Place Of Supply" />
                                                <asp:BoundField DataField="Rate" HeaderText="Rate" />
                                                <asp:BoundField DataField="GrossAdvPaidAdj" HeaderText="Gross Advance Paid to be Adjusted" />
                                                <asp:BoundField DataField="CessAdj" HeaderText="Cess Adjusted" />

                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 10-->

                            <!-- START Table 11-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table11">
                                            <span class="gstr_row_title">EXEMP:</span>
                                            <span class="gstr_row_desc blue">7 - Supplies from composition taxable person and other exempt/nil rated/non GST supplies

                                                 <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :
                                                                <asp:Label runat="server" ID="lblexempTotRow"></asp:Label>
                                                            </td>
                                                            <td>Total Composition Tax:
                                                                <asp:Label runat="server" ID="lblExempCompTax"></asp:Label>
                                                            </td>
                                                            <td>Total Nil Rated Tax:<asp:Label runat="server" ID="lblExempTotalNilRatedTax"></asp:Label>
                                                            </td>
                                                            <td>Total NonGST Tax:
                                                                <asp:Label runat="server" ID="lblExempTotalNonGSTTax"></asp:Label></td>
                                                        </tr>

                                                    </table>
                                                </span>
                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table11" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">
                                        <asp:GridView runat="server" ID="Gridexemp" AutoGenerateColumns="False" CssClass="table table-gstr table_psm table5">
                                            <%----%>
                                            <Columns>

                                                <asp:BoundField DataField="SupplyTypeDesc" HeaderText="Description" />
                                                <asp:BoundField DataField="CompositionTax" HeaderText="Composition taxable person" />
                                                <asp:BoundField DataField="NilRatedTax" HeaderText="Nil Rated Supplies" />
                                                <asp:BoundField DataField="ExemptedTax" HeaderText="Exempted (other than nil rated/non GST supply )" />
                                                <asp:BoundField DataField="NonGSTTax" HeaderText="Non-GST supplies" />

                                            </Columns>
                                        </asp:GridView>


                                    </div>
                                </div>
                            </div>
                            <!-- END Table 11-->

                            <!-- START Table 12-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table12">
                                            <span class="gstr_row_title">ITCR:</span>
                                            <span class="gstr_row_desc blue">11 - Input Tax Credit Reversal/Reclaim 

                                                 <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice :
                                                                <asp:Label runat="server" ID="lblitcrTotRow"></asp:Label>
                                                            </td>

                                                            <td>Total ITC Value:
                                                                <asp:Label runat="server" ID="lblItcrTotalITC"></asp:Label></td>
                                                        </tr>

                                                    </table>
                                                </span>
                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table12" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">


                                        <asp:GridView runat="server" ID="Griditcr" AutoGenerateColumns="False" CssClass="table table-gstr table_psm table5">
                                            <%----%>
                                            <Columns>
                                                <asp:BoundField DataField="DescForITC" HeaderText="Description for reversal of ITC" />
                                                <asp:BoundField DataField="TobeAddedDesc" HeaderText="To be added or reduced from output liability" />
                                                <asp:BoundField DataField="ITCIGSTAmt" HeaderText="ITC Integrated Tax Amount" />
                                                <asp:BoundField DataField="ITCCGSTAmt" HeaderText="ITC Central Tax Amount" />
                                                <asp:BoundField DataField="ITCSGSTAmt" HeaderText="ITC State/UT Tax Amount" />

                                                <asp:BoundField DataField="ITCCessAmt" HeaderText="ITC Cess Amount" />

                                            </Columns>
                                        </asp:GridView>


                                    </div>
                                </div>
                            </div>
                            <!-- END Table 12-->


                            <!-- START Table 13-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table13">
                                            <span class="gstr_row_title">HSN:</span>
                                            <span class="gstr_row_desc blue">13 - HSN summary of inward supplies

                                                 <br />
                                                <span class="clssumm">
                                                    <table class="table_3a_details">
                                                        <tr>
                                                            <td>Total Invoice:
                                                                <asp:Label runat="server" ID="lblhsnTotRow"></asp:Label></td>
                                                            <td>Total Quantity :
                                                                <asp:Label runat="server" ID="lblHsnTotalQuantity"></asp:Label>
                                                            </td>

                                                            <td>Total Taxable Value:
                                                                <asp:Label runat="server" ID="lblHsnTotalTaxableValue"></asp:Label></td>
                                                            <td>Total Value:
                                                                <asp:Label runat="server" ID="lblHsnTotalValue"></asp:Label></td>

                                                        </tr>

                                                    </table>
                                                </span>



                                            </span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table13" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                        <asp:GridView runat="server" ID="Gridhsn" AutoGenerateColumns="False" CssClass="table table-gstr table_psm table5">
                                            <%----%>
                                            <Columns>

                                                <asp:BoundField DataField="HSNCode" HeaderText="HSN" />
                                                <asp:BoundField DataField="HSNDesc" HeaderText="Description" />
                                                <asp:BoundField DataField="UQC" HeaderText="UQC" />
                                                <asp:BoundField DataField="TotalQuantity" HeaderText="Total Quantity" />
                                                <asp:BoundField DataField="TotalValue" HeaderText="Total Value" />

                                                <asp:BoundField DataField="TaxableValue" HeaderText="Taxable Value" />
                                                <asp:BoundField DataField="IGST" HeaderText="IGST Amt." />
                                                <asp:BoundField DataField="CGST" HeaderText="CGST Amt." />
                                                <asp:BoundField DataField="SGST" HeaderText="SGST Amt." />
                                                <asp:BoundField DataField="CESS" HeaderText="Cess Amt." />
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 13-->
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- END Page content-->
    </section>
</asp:Content>

