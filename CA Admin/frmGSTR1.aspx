<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGSTR1.aspx.cs" Inherits="CA_Admin_frmGSTR1" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Modal -->
    <div id="inputModal" class="modal " role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="max-width: 550px; margin: 0 auto;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" style="height: 20px; color: #fff; background-color: red; opacity: 1; width: 20px; border-radius: 100%; padding: 0; line-height: 20px; text-align: center; font-weight: normal;">&times;</button>
                    <h4 class="modal-title">Import Data</h4>
                </div>
                <style>
                    .radio-gstr {
                        display: inline-block;
                        margin-left: 8px !important;
                    }
                </style>
                <div class="modal-body btn-popup">


                    <div class="row">
                        <div class="col-sm-4 col-xs-12" id="radio_a_container">

                            <a href="#" class="btn abtn btn-primary hr1">
                                <input type="radio" class="radio-gstr pull-right" id="r1" name="type_upload">
                                Make Entry in Grid</a>
                            <br />
                            <a href="#" class="btn abtn btn-primary hr2">
                                <input type="radio" class="radio-gstr pull-right" id="r2" name="type_upload" checked>
                                Excel</a>
                            <br />
                            <a href="#" class="btn abtn btn-primary hr3">
                                <input type="radio" class="radio-gstr pull-right" id="r3" name="type_upload">
                                Tally</a>
                            <br />
                            <a href="#" class="btn abtn btn-primary hr4">
                                <input type="radio" class="radio-gstr pull-right" id="r4" name="type_upload">
                                Busy</a>
                            <br />
                            <a href="#" class="btn abtn btn-primary hr5">
                                <input type="radio" class="radio-gstr pull-right" id="r5" name="type_upload">
                                SAP-ERP</a>
                            <br />
                            <a href="#" class="btn abtn btn-primary hr6">
                                <input type="radio" class="radio-gstr pull-right" id="r6" name="type_upload">
                                Text</a>
                            <br />
                            <a href="#" class="btn abtn btn-primary hr7">
                                <input type="radio" class="radio-gstr pull-right" id="r7" name="type_upload">
                                CSV</a>
                        </div>
                        <div class="col-sm-8 col-xs-12">
                            <div class="form-group" style="margin-top: 80px">
                                <div class="input-group">

                                    <input type="file" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">Upload</button>
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 text-center">
                                    <span>Total Records :
                                        <br />
                                        <span style="font-size: 20px">120</span></span>
                                </div>
                                <div class="col-xs-6 text-center">
                                    <span class="text">Records Imported :
                                        <br />
                                        <span style="font-size: 20px">120</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Done</button>
                </div>
            </div>
        </div>
    </div>
    <section>
        <!-- START Page content-->
        <div class="content-wrapper" id="gstr1_page">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <h3 class="second_heading">Display GSTR-1</h3>
            <div id="dvExceldata" runat="server" visible="false">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div id="accordion" class="panel-group">
                                <!-- START Table 4-->
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>

                                        <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                        <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#table4">
                                                <span class="gstr_row_title">Table 4:</span>
                                                <span class="gstr_row_desc blue">Taxable outward supplies made to registered persons (including UIN-holders) other than supplies covered by Table 6</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table4" class="panel-collapse collapse in" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table4">
                                                <thead>
                                                    <tr>
                                                        <th rowspan="2">GSTIN/UIN</th>
                                                        <th colspan="3">Invoice</th>
                                                        <th rowspan="2">Rate</th>
                                                        <th rowspan="2">Taxable&nbsp;Value</th>
                                                        <th colspan="4">Amount in INR.</th>
                                                        <th rowspan="2">POS</th>
                                                    </tr>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Date</th>
                                                        <th>Value</th>
                                                        <th>Integrated Tax</th>
                                                        <th>Central Tax</th>
                                                        <th>State / UT Tax</th>
                                                        <th>Cess</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                        <th class="c07">(7)</th>
                                                        <th class="c08">(8)</th>
                                                        <th class="c09">(9)</th>
                                                        <th class="c10">(10)</th>
                                                        <th class="c11">(11)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="sub_th">
                                                        <td colspan="11">4A. Supplies other than those :- (i) attracting reverse charge and (ii) supplies made through e-commerce operator</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdGSTR14A" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="ClientGSTIN" DataField="ClientGSTIN" ItemStyle-CssClass="c01" />
                                                                    <asp:BoundField HeaderText="InvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="InvoiceDate" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="InvoiceValue" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-center" />
                                                                    <asp:BoundField HeaderText="TaxableValue" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c07 r text-right" />
                                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 r text-right" />
                                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c09 r text-right" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c10 text-center" />
                                                                    <asp:BoundField HeaderText="POS" DataField="PosStateDesc" ItemStyle-CssClass="c11  text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11"></td>
                                                    </tr>
                                                    <%-- <tr>
                                                    <td class="c01" rowspan="2">23AAAPO5542D1K5</td>
                                                    <td class="c02" rowspan="2">08</td>
                                                    <td class="c03" rowspan="2">10/07/2017</td>
                                                    <td class="c04" rowspan="2">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>
                                                    <td class="c07 r">0.00</td>
                                                    <td class="c08 r">3825.00</td>
                                                    <td class="c09 r">3825.00</td>
                                                    <td class="c10 r">-</td>
                                                    <td class="c11 r">MP</td>
                                                </tr>

                                                <tr>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">17700</td>
                                                    <td class="c07 r">2700.00</td>
                                                    <td class="c08 r">0.00</td>
                                                    <td class="c09 r">0.00</td>
                                                    <td class="c10 r">-</td>
                                                    <td class="c11 r">MP</td>
                                                </tr>--%>
                                                    <tr class="sub_th">
                                                        <td colspan="11">4B. Supplies attracting tax on reverse charge basis :</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdGSTR4B" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="ClientGSTIN" DataField="ClientGSTIN" ItemStyle-CssClass="c01" />
                                                                    <asp:BoundField HeaderText="InvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="InvoiceDate" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="InvoiceValue" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-center" />
                                                                    <asp:BoundField HeaderText="TaxableValue" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c07 r text-right" />
                                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 r text-right" />
                                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c09 r text-right" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c10 text-center" />
                                                                    <asp:BoundField HeaderText="POS" DataField="PosStateDesc" ItemStyle-CssClass="c11  text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11"></td>
                                                    </tr>
                                                    <%-- <tr>
                                                    <td class="c01" rowspan="2">23AAAPO1242P1Z4</td>
                                                    <td class="c02" rowspan="2">14</td>
                                                    <td class="c03" rowspan="2">10/07/2017</td>
                                                    <td class="c04" rowspan="2">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">17700</td>
                                                    <td class="c07 r">0.00</td>
                                                    <td class="c08 r">0.00</td>
                                                    <td class="c09 r">0.00</td>
                                                    <td class="c10 r">-</td>
                                                    <td class="c11 r">MP</td>
                                                </tr>
                                                <tr>
                                                    <td class="c05 r">&nbsp;</td>
                                                    <td class="c06 r">&nbsp;</td>
                                                    <td class="c07 r">&nbsp;</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                    <td class="c09 r">&nbsp;</td>
                                                    <td class="c10 r">&nbsp;</td>
                                                    <td class="c11 r">&nbsp;</td>
                                                </tr>--%>
                                                    <tr class="sub_th">
                                                        <td colspan="11">4C. Supplies made through e-commerce operator attracting TCS (operator wise, rate wise) : </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5">GSTIN of e-commerce operator</td>
                                                        <td colspan="6">48ADXDQ5698S5F8</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdGSTR14C" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="ClientGSTIN" DataField="ClientGSTIN" ItemStyle-CssClass="c01" />
                                                                    <asp:BoundField HeaderText="InvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="InvoiceDate" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="InvoiceValue" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-center" />
                                                                    <asp:BoundField HeaderText="TaxableValue" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c07 r text-right" />
                                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 r text-right" />
                                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c09 r text-right" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c10 text-center" />
                                                                    <asp:BoundField HeaderText="POS" DataField="PosStateDesc" ItemStyle-CssClass="c11  text-center" />
                                                                </Columns>
                                                            </asp:GridView>

                                                        </td>
                                                    </tr>
                                                    <%--<tr>
                                                    <td class="c01" rowspan="2">23AAAPO5542D1K5</td>
                                                    <td class="c02" rowspan="2">06</td>
                                                    <td class="c03" rowspan="2">10/07/2017</td>
                                                    <td class="c04" rowspan="2">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>
                                                    <td class="c07 r">0.00</td>
                                                    <td class="c08 r">510.00</td>
                                                    <td class="c09 r">510.00&nbsp;</td>
                                                    <td class="c10 r">-</td>
                                                    <td class="c11 r">MP</td>
                                                </tr>
                                                <tr>
                                                    <td class="c05 r">&nbsp;</td>
                                                    <td class="c06 r">&nbsp;</td>
                                                    <td class="c07 r">&nbsp;</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                    <td class="c09 r">&nbsp;</td>
                                                    <td class="c10 r">&nbsp;</td>
                                                    <td class="c11 r">&nbsp;</td>
                                                </tr>--%>
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
                                                <span class="gstr_row_title">Table 5:</span>
                                                <span class="gstr_row_desc blue">Taxable outward inter-State supplies to un-registered persons where the invoice value is more than Rs 2.5 lakh </span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table5" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table5">
                                                <thead>
                                                    <tr>
                                                        <th rowspan="2">POS</th>
                                                        <th colspan="3">Invoice</th>
                                                        <th rowspan="2">Rate</th>
                                                        <th rowspan="2">Taxable&nbsp;Value</th>
                                                        <th colspan="2">Amount in INR.</th>
                                                    </tr>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Date</th>
                                                        <th>Value</th>
                                                        <th>Integrated Tax</th>
                                                        <th>Cess</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                        <th class="c07">(7)</th>
                                                        <th class="c08">(8)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="sub_th">
                                                        <td colspan="8">5A. Outward supplies (other than supplies made through e-commerce operator, rate wise)</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdGSTR15A" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="POS" DataField="PosStateDesc" ItemStyle-CssClass="c01  text-center" />
                                                                    <%--<asp:BoundField HeaderText="ClientGSTIN" DataField="ClientGSTIN" ItemStyle-CssClass="c01" />--%>
                                                                    <asp:BoundField HeaderText="InvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="InvoiceDate" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="InvoiceValue" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-center" />
                                                                    <asp:BoundField HeaderText="TaxableValue" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c07 r text-right" />
                                                                    <%--<asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 r text-right" />--%>
                                                                    <%--<asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c09 r text-right" />--%>
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c08 text-center" />

                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <%-- <tr>
                                                    <td class="c01" rowspan="2">MP</td>
                                                    <td class="c02" rowspan="2">08</td>
                                                    <td class="c03" rowspan="2">10/07/2017</td>
                                                    <td class="c04" rowspan="2">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>
                                                    <td class="c07 r">0.00</td>
                                                    <td class="c08 r">-</td>
                                                </tr>

                                                <tr>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">17700</td>
                                                    <td class="c07 r">2700.00</td>
                                                    <td class="c08 r">-</td>
                                                </tr>--%>
                                                    <tr class="sub_th">
                                                        <td colspan="8">5B. Supplies made through e-commerce operator attracting TCS (operator wise, rate wise) : </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5">GSTIN of e-commerce operator</td>
                                                        <td colspan="3">48ADXDQ5698S5F8</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdGSTR15B" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="POS" DataField="PosStateDesc" ItemStyle-CssClass="c01  text-center" />
                                                                    <%--<asp:BoundField HeaderText="ClientGSTIN" DataField="ClientGSTIN" ItemStyle-CssClass="c01" />--%>
                                                                    <asp:BoundField HeaderText="InvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="InvoiceDate" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="InvoiceValue" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-center" />
                                                                    <asp:BoundField HeaderText="TaxableValue" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c07 r text-right" />
                                                                    <%--<asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 r text-right" />--%>
                                                                    <%--<asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c09 r text-right" />--%>
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c08 text-center" />

                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <%-- <tr>
                                                    <td class="c01" rowspan="2">MP</td>
                                                    <td class="c02" rowspan="2">06</td>
                                                    <td class="c03" rowspan="2">10/07/2017</td>
                                                    <td class="c04" rowspan="2">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>
                                                    <td class="c07 r">0.00</td>
                                                    <td class="c08 r">-</td>
                                                </tr>
                                                <tr>
                                                    <td class="c05 r">&nbsp;</td>
                                                    <td class="c06 r">&nbsp;</td>
                                                    <td class="c07 r">&nbsp;</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                </tr>--%>
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
                                                <span class="gstr_row_title">Table 6:</span>
                                                <span class="gstr_row_desc blue">Zero rated supplies and Deemed Exports  </span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table6" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table6">
                                                <thead>
                                                    <tr>
                                                        <th rowspan="2">GSTIN of recipient</th>
                                                        <th colspan="3">Invoice Details</th>
                                                        <th colspan="2">Shipping bill/ Bill of export</th>
                                                        <th colspan="3">Integrated Tax</th>
                                                    </tr>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Date</th>
                                                        <th>Value</th>
                                                        <th>No.</th>
                                                        <th>Date</th>
                                                        <th>Rate</th>
                                                        <th>Taxable Value</th>
                                                        <th>Amount</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                        <th class="c07">(7)</th>
                                                        <th class="c08">(8)</th>
                                                        <th class="c09">(9)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="sub_th">
                                                        <td colspan="9">6A. Exports</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdGSTR16A" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="BillGSTIN" DataField="BillGSTIN" ItemStyle-CssClass="c01  text-center" />
                                                                    <%--<asp:BoundField HeaderText="ClientGSTIN" DataField="ClientGSTIN" ItemStyle-CssClass="c01" />--%>
                                                                    <asp:BoundField HeaderText="InvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="InvoiceDate" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="InvoiceValue" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04 r" />
                                                                    <asp:BoundField HeaderText="ShippExBillNo" DataField="ShippExBillNo" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="ShippExBilldate" DataField="ShippExBilldate" ItemStyle-CssClass="c06  text-center" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c07  text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c08 r" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c09 r" />
                                                                    <%--<asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c08 text-center" />--%>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <%--<tr>
                                                    <td class="c01" rowspan="2">23AAAPO5542D1K5</td>
                                                    <td class="c02" rowspan="2">08</td>
                                                    <td class="c03" rowspan="2">10/07/2017</td>
                                                    <td class="c04" rowspan="2">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>
                                                    <td class="c07 r">0.00</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                    <td class="c09 r">-</td>
                                                </tr>

                                                <tr>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">17700</td>
                                                    <td class="c07 r">2700.00</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                    <td class="c09 r">-</td>
                                                </tr>--%>
                                                    <tr class="sub_th">
                                                        <td colspan="9">6B. Supplies made to SEZ unit or SEZ Developer </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdGSTR16B" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="BillGSTIN" DataField="BillGSTIN" ItemStyle-CssClass="c01  text-center" />
                                                                    <%--<asp:BoundField HeaderText="ClientGSTIN" DataField="ClientGSTIN" ItemStyle-CssClass="c01" />--%>
                                                                    <asp:BoundField HeaderText="InvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="InvoiceDate" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="InvoiceValue" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04 r" />
                                                                    <asp:BoundField HeaderText="ShippExBillNo" DataField="ShippExBillNo" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="ShippExBilldate" DataField="ShippExBilldate" ItemStyle-CssClass="c06  text-center" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c07  text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c08 r" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c09 r" />
                                                                    <%--<asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c08 text-center" />--%>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <%-- <tr>
                                                    <td class="c01" rowspan="2">23AAAPO5542D1K5</td>
                                                    <td class="c02" rowspan="2">06</td>
                                                    <td class="c03" rowspan="2">10/07/2017</td>
                                                    <td class="c04" rowspan="2">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>
                                                    <td class="c07 r">0.00</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                    <td class="c09 r">-</td>
                                                </tr>
                                                <tr>
                                                    <td class="c05 r">&nbsp;</td>
                                                    <td class="c06 r">&nbsp;</td>
                                                    <td class="c07 r">&nbsp;</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                    <td class="c09 r">&nbsp;</td>
                                                </tr>--%>
                                                    <tr class="sub_th">
                                                        <td colspan="9" class="p0 b0">6C. Deemed exports </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="11">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdGSTR16C" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="BillGSTIN" DataField="BillGSTIN" ItemStyle-CssClass="c01  text-center" />
                                                                    <%--<asp:BoundField HeaderText="ClientGSTIN" DataField="ClientGSTIN" ItemStyle-CssClass="c01" />--%>
                                                                    <asp:BoundField HeaderText="InvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="InvoiceDate" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="InvoiceValue" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04 r" />
                                                                    <asp:BoundField HeaderText="ShippExBillNo" DataField="ShippExBillNo" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="ShippExBilldate" DataField="ShippExBilldate" ItemStyle-CssClass="c06  text-center" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c07  text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c08 r" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c09 r" />
                                                                    <%--<asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c08 text-center" />--%>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <%--  <tr>
                                                    <td class="c01" rowspan="2">23AAAPO5542D1K5</td>
                                                    <td class="c02" rowspan="2">06</td>
                                                    <td class="c03" rowspan="2">10/07/2017</td>
                                                    <td class="c04" rowspan="2">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>
                                                    <td class="c07 r">0.00</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                    <td class="c09 r">-</td>
                                                </tr>
                                                <tr>
                                                    <td class="c05 r">&nbsp;</td>
                                                    <td class="c06 r">&nbsp;</td>
                                                    <td class="c07 r">&nbsp;</td>
                                                    <td class="c08 r">&nbsp;</td>
                                                    <td class="c09 r">&nbsp;</td>
                                                </tr>--%>
                                                </tbody>
                                            </table>

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
                                                <span class="gstr_row_title">Table 7:</span>
                                                <span class="gstr_row_desc blue">Taxable supplies (Net of debit notes and credit notes) to unregistered persons other than the supplies covered in Table 5</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table7" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table7">
                                                <thead>
                                                    <tr>
                                                        <th class="c01" rowspan="2">Rate of tax</th>
                                                        <th class="c02" rowspan="2">Total Taxable value</th>
                                                        <th colspan="4">Amount</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c03">Integrated</th>
                                                        <th class="c04">Central Tax</th>
                                                        <th class="c05">State Tax/UT Tax</th>
                                                        <th class="c06">Cess</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="sub_th">
                                                        <td colspan="6">7A Intra-State supplies</td>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="6">7A(1) Consolidated rate wise outward supplies [including supplies made through e-commerce operator attracting TCS]</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table7" runat="server" ShowHeader="false" ID="grd7A1" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c05 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%--                                                    <td class="c01">23AAAPO5542D1K5</td>
                                                    <td class="c02">06</td>
                                                    <td class="c03">10/07/2017</td>
                                                    <td class="c04">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>--%>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="6">7A(2) Out of supplies mentioned at 7A(1), value of supplies made through e-Commerce Operators attracting TCS (operator wise, rate wise)</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">GSTIN of e-commerce operator</td>
                                                        <td colspan="4">23AAAPO5542D1K5</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table7" runat="server" ShowHeader="false" ID="grd7A2" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c05 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%-- <td class="c01">23AAAPO5542D1K5</td>
                                                    <td class="c02">06</td>
                                                    <td class="c03">10/07/2017</td>
                                                    <td class="c04">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>--%>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="6">7B. Inter-State Supplies where invoice value is upto Rs 2.5 Lakh [Rate wise]</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="sub_th">7B (1). Place of Supply (Name of State) </td>
                                                        <td colspan="4">23AAAPO5542D1K5</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table7" runat="server" ShowHeader="false" ID="grd7B1" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c05 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%--<td class="c01">23AAAPO5542D1K5</td>
                                                    <td class="c02">06</td>
                                                    <td class="c03">10/07/2017</td>
                                                    <td class="c04">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>--%>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="6">7B (2). Out of the supplies mentioned in 7B (1), the supplies made through e-Commerce Operators (operator wise, rate wise)</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">GSTIN of e-commerce operator</td>
                                                        <td colspan="4">23AAAPO5542D1K5</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table7" runat="server" ShowHeader="false" ID="grd7B2" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c05 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%-- <td class="c01">23AAAPO5542D1K5</td>
                                                    <td class="c02">06</td>
                                                    <td class="c03">10/07/2017</td>
                                                    <td class="c04">50150</td>
                                                    <td class="c05 r">-</td>
                                                    <td class="c06 r">42500</td>--%>
                                                    </tr>
                                                </tbody>
                                            </table>

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
                                                <span class="gstr_row_title">Table 8:</span>
                                                <span class="gstr_row_desc blue">Nil rated, exempted and non GST outward supplies</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table8" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table8">
                                                <thead>

                                                    <tr>
                                                        <th class="c01">Description</th>
                                                        <th class="c02">Nil Rated Supplies</th>
                                                        <th class="c03">Exempted (Other than Nil rated/non-GST supply)</th>
                                                        <th class="c04">Non-GST supplies</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="4" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table8" runat="server" ShowHeader="false" ID="grd8" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Description" DataField="Description" ItemStyle-CssClass="c01" />
                                                                    <asp:BoundField HeaderText="NillRatedAmt" DataField="NillRatedAmt" ItemStyle-CssClass="c02 r" />
                                                                    <asp:BoundField HeaderText="ExemptedAmt" DataField="ExemptedAmt" ItemStyle-CssClass="c03 r" />
                                                                    <asp:BoundField HeaderText="NonGSTAmt" DataField="NonGSTAmt" ItemStyle-CssClass="c04 r" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <%--    <tr>
                                                    <td class="c01">8A. Inter-State supplies to registered persons</td>
                                                    <td class="c02"></td>
                                                    <td class="c03"></td>
                                                    <td class="c04"></td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">8B. Intra- State supplies to registered persons</td>
                                                    <td class="c02"></td>
                                                    <td class="c03"></td>
                                                    <td class="c04"></td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">8C. Inter-State supplies to unregistered persons</td>
                                                    <td class="c02"></td>
                                                    <td class="c03"></td>
                                                    <td class="c04"></td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">8D. Intra-State supplies to unregistered persons</td>
                                                    <td class="c02"></td>
                                                    <td class="c03"></td>
                                                    <td class="c04"></td>
                                                </tr>--%>
                                                </tbody>
                                            </table>

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
                                                <span class="gstr_row_title">Table 9:</span>
                                                <span class="gstr_row_desc blue">Amendments to taxable outward supply details furnished in returns for earlier tax periods in Table 4, 5 and 6 [including debit notes, credit notes, refund vouchers issued during current period and amendments thereof]</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table9" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table9">
                                                <thead>

                                                    <tr>
                                                        <th colspan="3">Details of original document</th>
                                                        <th colspan="6">Revised details of document or details of original Debit/Credit Notes or refund vouchers</th>
                                                        <th rowspan="3">Rate</th>
                                                        <th rowspan="3">Taxable Value</th>
                                                        <th colspan="4">Amount</th>
                                                        <th rowspan="3">POS</th>
                                                    </tr>
                                                    <tr>
                                                        <th rowspan="2">GSTIN</th>
                                                        <th rowspan="2">Inv. No</th>
                                                        <th rowspan="2">Inv. Date</th>
                                                        <th rowspan="2">GSTIN</th>
                                                        <th colspan="2">Invoice</th>
                                                        <th colspan="2">Shipping bill</th>
                                                        <th rowspan="2">Value</th>
                                                        <th rowspan="2">Integrated Tax</th>
                                                        <th rowspan="2">Central Tax</th>
                                                        <th rowspan="2">State / UT Tax</th>
                                                        <th rowspan="2">Cess</th>
                                                    </tr>
                                                    <tr>
                                                        <th>No.</th>
                                                        <th>Date</th>
                                                        <th>No.</th>
                                                        <th>Date</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                        <th class="c07">(7)</th>
                                                        <th class="c08">(8)</th>
                                                        <th class="c09">(9)</th>
                                                        <th class="c10">(10)</th>
                                                        <th class="c11">(11)</th>
                                                        <th class="c12">(12)</th>
                                                        <th class="c13">(13)</th>
                                                        <th class="c14">(14)</th>
                                                        <th class="c15">(15)</th>
                                                        <th class="c16">(16)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="sub_th">
                                                        <td colspan="16">9A. If the invoice/Shipping bill details furnished earlier were incorrect </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="16" class="p0 b0">

                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table9" runat="server" ShowHeader="false" ID="grd9A" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="GSTIN" DataField="AmdGSTIN" ItemStyle-CssClass="c01" />
                                                                    <asp:BoundField HeaderText="AmdInvoiceNo" DataField="AmdInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="AmdInvoiceDate" DataField="AmdInvoiceDate" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="BillGSTIN" DataField="BillGSTIN" ItemStyle-CssClass="c04  text-right" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c05 r text-center" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceDT" DataField="CurrInvoiceDT" ItemStyle-CssClass="c06 r text-right" />
                                                                    <asp:BoundField HeaderText="ShippExBillNo" DataField="ShippExBillNo" ItemStyle-CssClass="c07 r text-right" />
                                                                    <asp:BoundField HeaderText="ShippExBilldate" DataField="ShippExBilldate" ItemStyle-CssClass="c08 r text-right" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceVal" DataField="CurrInvoiceVal" ItemStyle-CssClass="c09 r text-right" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c10 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c11  text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c12  text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c13  text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c14  text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c15  text-center" />
                                                                    <asp:BoundField HeaderText="PosStateDesc" DataField="PosStateDesc" ItemStyle-CssClass="c16 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <%--<td class="c01">23AAAPO5542D1K5</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">23AAAPO5542D1K5</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                    <td class="c08">&nbsp;</td>
                                                    <td class="c09">&nbsp;</td>
                                                    <td class="c10">&nbsp;</td>
                                                    <td class="c11">&nbsp;</td>
                                                    <td class="c12">&nbsp;</td>
                                                    <td class="c13">&nbsp;</td>
                                                    <td class="c14">&nbsp;</td>
                                                    <td class="c15">&nbsp;</td>
                                                    <td class="c16">&nbsp;</td>--%>

                                                    <tr class="sub_th">
                                                        <td colspan="16">9B. Debit Notes/Credit Notes/Refund voucher [original] </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="16" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table9" runat="server" ShowHeader="false" ID="grd9B" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="AmdGSTIN" DataField="AmdGSTIN" ItemStyle-CssClass="c01" />
                                                                    <asp:BoundField HeaderText="AmdInvoiceNo" DataField="AmdInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="AmdInvoiceDate" DataField="AmdInvoiceDate" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="BillGSTIN" DataField="BillGSTIN" ItemStyle-CssClass="c04  text-right" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c05 r text-center" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceDT" DataField="CurrInvoiceDT" ItemStyle-CssClass="c06 r text-right" />
                                                                    <asp:BoundField HeaderText="ShippExBillNo" DataField="ShippExBillNo" ItemStyle-CssClass="c07 r text-right" />
                                                                    <asp:BoundField HeaderText="ShippExBilldate" DataField="ShippExBilldate" ItemStyle-CssClass="c08 r text-right" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceVal" DataField="CurrInvoiceVal" ItemStyle-CssClass="c09 r text-right" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c10 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c11  text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c12  text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c13  text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c14  text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c15  text-center" />
                                                                    <asp:BoundField HeaderText="PosStateDesc" DataField="PosStateDesc" ItemStyle-CssClass="c16 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>

                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="16">9C. Debit Notes/Credit Notes/Refund voucher [amendments thereof]  </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="16" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table9" runat="server" ShowHeader="false" ID="grd9C" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="AmdGSTIN" DataField="AmdGSTIN" ItemStyle-CssClass="c01" />
                                                                    <asp:BoundField HeaderText="AmdInvoiceNo" DataField="AmdInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="AmdInvoiceDate" DataField="AmdInvoiceDate" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="BillGSTIN" DataField="BillGSTIN" ItemStyle-CssClass="c04  text-right" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceNo" DataField="CurrInvoiceNo" ItemStyle-CssClass="c05 r text-center" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceDT" DataField="CurrInvoiceDT" ItemStyle-CssClass="c06 r text-right" />
                                                                    <asp:BoundField HeaderText="ShippExBillNo" DataField="ShippExBillNo" ItemStyle-CssClass="c07 r text-right" />
                                                                    <asp:BoundField HeaderText="ShippExBilldate" DataField="ShippExBilldate" ItemStyle-CssClass="c08 r text-right" />
                                                                    <asp:BoundField HeaderText="CurrInvoiceVal" DataField="CurrInvoiceVal" ItemStyle-CssClass="c09 r text-right" />
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c10 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c11  text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c12  text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c13  text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c14  text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c15  text-center" />
                                                                    <asp:BoundField HeaderText="PosStateDesc" DataField="PosStateDesc" ItemStyle-CssClass="c16 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%-- <td class="c01">23AAAPO5542D1K5</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">23AAAPO5542D1K5</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                    <td class="c08">&nbsp;</td>
                                                    <td class="c09">&nbsp;</td>
                                                    <td class="c10">&nbsp;</td>
                                                    <td class="c11">&nbsp;</td>
                                                    <td class="c12">&nbsp;</td>
                                                    <td class="c13">&nbsp;</td>
                                                    <td class="c14">&nbsp;</td>
                                                    <td class="c15">&nbsp;</td>
                                                    <td class="c16">&nbsp;</td>--%>
                                                    </tr>

                                                </tbody>
                                            </table>

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
                                                <span class="gstr_row_title">Table 10:</span>
                                                <span class="gstr_row_desc blue">Amendments to taxable outward supplies to unregistered persons furnished in returns for earlier tax periods in Table 7</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table10" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table10">
                                                <thead>
                                                    <tr>
                                                        <th class="c01" rowspan="2">Rate of tax</th>
                                                        <th class="c02" rowspan="2">Total Taxable value</th>
                                                        <th colspan="4">Amount</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c03">Integrated</th>
                                                        <th class="c04">Central Tax</th>
                                                        <th class="c05">State Tax/UT Tax</th>
                                                        <th class="c06">Cess</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="sub_th">
                                                        <td colspan="2">Tax period for which the details are being revised</td>
                                                        <td colspan="4">July</td>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="6">10A. Intra-State Supplies [including supplies made through e-commerce operator attracting TCS] [Rate wise]</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table7" runat="server" ShowHeader="false" ID="Grd10A" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c05 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%-- <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>--%>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="6">10A (1). Out of supplies mentioned at 10A, value of supplies made through e-Commerce Operators attracting TCS (operator wise, rate wise)</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">GSTIN of e-commerce operator</td>
                                                        <td colspan="4">23AAAPO5542D1K5</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table7" runat="server" ShowHeader="false" ID="Grd10A1" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c05 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%-- <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>--%>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="6">10B. Inter-State Supplies [including supplies made through e-commerce operator attracting TCS] [Rate wise]</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Place of Supply (Name of State)</td>
                                                        <td colspan="4">MP</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table7" runat="server" ShowHeader="false" ID="Grd10B" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c05 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%-- <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>--%>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="6">10B (1). Out of supplies mentioned at 10B, value of supplies made through e-Commerce Operators attracting TCS (operator wise, rate wise)</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">GSTIN of e-commerce operator</td>
                                                        <td colspan="4">23AAAPO5542D1K5</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="6" class="p0 b0">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table7" runat="server" ShowHeader="false" ID="Grd10B1" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField HeaderText="Taxableval" DataField="Taxableval" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="IGSTTax" DataField="IGSTTax" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField HeaderText="CGSTTax" DataField="CGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField HeaderText="SGSTTax" DataField="SGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c05 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%--  <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>--%>
                                                    </tr>
                                                </tbody>
                                            </table>

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
                                                <span class="gstr_row_title">Table 11:</span>
                                                <span class="gstr_row_desc blue">Consolidate Statement of Advances Recieved/Advance adjusted in the current tax period/ Amendments od information furnished in earlier period</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table11" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table11">
                                                <thead>
                                                    <tr>
                                                        <th class="c01" rowspan="2">Rate</th>
                                                        <th class="c02" rowspan="2">Gross Advance Received/adjusted</th>
                                                        <th class="c03" rowspan="2">Place of supply (Name of State)</th>
                                                        <th colspan="4">Amount</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c04">Integrated</th>
                                                        <th class="c05">Central Tax</th>
                                                        <th class="c06">State Tax/UT Tax</th>
                                                        <th class="c07">Cess</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                        <th class="c07">(7)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="sub_th big">
                                                        <td colspan="7">(i) Information for the current tax period</td>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="7">11A. Advance amount received in the tax period for which invoice has not been issued (tax amount to be added to output tax liability)</td>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="7">11A (1). Intra-State supplies (Rate Wise)</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="7" class="p0 b0">
                                                            <asp:GridView runat="server" ShowHeader="false" ID="grd11A1" CssClass="table table-bordered table-gstr table_psm table11" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField DataField="GrossAdvAdj" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField DataField="PosName" ItemStyle-CssClass="c03 l" />
                                                                    <asp:BoundField DataField="IGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField DataField="CGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField DataField="SGSTTax" ItemStyle-CssClass="c06 text-center" />
                                                                    <asp:BoundField DataField="CessTax" ItemStyle-CssClass="c07 text-center" />

                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%--                                                    <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>--%>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="7">11A (2). Inter-State Supplies (Rate Wise)</td>
                                                    </tr>
                                                    <tr>

                                                        <td colspan="7" class="p0 b0">
                                                            <asp:GridView runat="server" ShowHeader="false" ID="grd11A2" CssClass="table table-bordered table-gstr table_psm table11" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField DataField="GrossAdvAdj" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField DataField="PosName" ItemStyle-CssClass="c03 l" />
                                                                    <asp:BoundField DataField="IGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField DataField="CGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField DataField="SGSTTax" ItemStyle-CssClass="c06 text-center" />
                                                                    <asp:BoundField DataField="CessTax" ItemStyle-CssClass="c07 text-center" />

                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%-- <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>--%>
                                                    </tr>

                                                    <tr class="sub_th">
                                                        <td colspan="7">11B. Advance amount received in earlier tax period and adjusted against the supplies being shown in this tax period in Table Nos. 4, 5, 6 and 7</td>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="7">11B (1). Intra-State Supplies (Rate Wise)</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="7" class="p0 b0">
                                                            <asp:GridView runat="server" ShowHeader="false" ID="grd11B1" CssClass="table table-bordered table-gstr table_psm table11" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField DataField="GrossAdvAdj" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField DataField="PosName" ItemStyle-CssClass="c03 l" />
                                                                    <asp:BoundField DataField="IGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField DataField="CGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField DataField="SGSTTax" ItemStyle-CssClass="c06 text-center" />
                                                                    <asp:BoundField DataField="CessTax" ItemStyle-CssClass="c07 text-center" />

                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%--                                                    <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>--%>
                                                    </tr>
                                                    <tr class="sub_th">
                                                        <td colspan="7">11B (2). Inter-State Supplies (Rate Wise)</td>
                                                    </tr>
                                                    <tr>

                                                        <td colspan="7" class="p0 b0">
                                                            <asp:GridView runat="server" ShowHeader="false" ID="grd11B2" CssClass="table table-bordered table-gstr table_psm table11" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Rate" ItemStyle-CssClass="c01 text-center" />
                                                                    <asp:BoundField DataField="GrossAdvAdj" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField DataField="PosName" ItemStyle-CssClass="c03 l" />
                                                                    <asp:BoundField DataField="IGSTTax" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField DataField="CGSTTax" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField DataField="SGSTTax" ItemStyle-CssClass="c06 text-center" />
                                                                    <asp:BoundField DataField="CessTax" ItemStyle-CssClass="c07 text-center" />

                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%--                                                    <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>--%>
                                                    </tr>
                                                    <tr class="sub_th big">
                                                        <td colspan="7">(ii)  Amendment of information furnished in Table No. 11[1] in GSTR-1 statement for earlier tax periods [Furnish revised information]</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="c01">Month</td>
                                                        <td class="c02"></td>
                                                        <td colspan="4">Amendment relating to information furnished in S.No.(select)</td>
                                                        <td class="c07">11A(1)11A(2)11B(1)11B(2)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="c01">&nbsp;</td>
                                                        <td class="c02">&nbsp;</td>
                                                        <td class="c03">&nbsp;</td>
                                                        <td class="c04">&nbsp;</td>
                                                        <td class="c05">&nbsp;</td>
                                                        <td class="c06">&nbsp;</td>
                                                        <td class="c07">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>

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
                                                <span class="gstr_row_title">Table 12:</span>
                                                <span class="gstr_row_desc blue">Taxable outward supplies made to registered persons (including UIN-holders) other than supplies covered by Table 6</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table12" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table12">
                                                <thead>
                                                    <tr>
                                                        <th class="c01" rowspan="2">Sr. No</th>
                                                        <th class="c02" rowspan="2">HSN</th>
                                                        <th class="c03" rowspan="2">Description (Optional if HSN is provided)</th>
                                                        <th class="c04" rowspan="2">UQC</th>
                                                        <th class="c05" rowspan="2">Total Quantity</th>
                                                        <th class="c06" rowspan="2">Total value</th>
                                                        <th class="c07" rowspan="2">Total Taxable Value</th>
                                                        <th colspan="4">Amount</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c08">Integrated Tax</th>
                                                        <th class="c09">Central Tax</th>
                                                        <th class="c10">State/UT Tax</th>
                                                        <th class="c11">Cess</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                        <th class="c07">(7)</th>
                                                        <th class="c08">(8)</th>
                                                        <th class="c09">(9)</th>
                                                        <th class="c10">(10)</th>
                                                        <th class="c11">(11)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="11">
                                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm table4" runat="server" ShowHeader="false" ID="grdHSNSumm" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="SrNo" DataField="SrNo" ItemStyle-CssClass="c01  text-center" />

                                                                    <asp:BoundField HeaderText="HSNNO" DataField="HSNNO" ItemStyle-CssClass="c02 text-center" />
                                                                    <asp:BoundField HeaderText="HSNDesc" DataField="HSNDesc" ItemStyle-CssClass="c03" />
                                                                    <asp:BoundField HeaderText="UQC" DataField="UQC" ItemStyle-CssClass="c04 r" />
                                                                    <asp:BoundField HeaderText="TotalQuantity" DataField="TotalQuantity" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField HeaderText="TotalValue" DataField="TotalValue" ItemStyle-CssClass="c06  text-center" />
                                                                    <asp:BoundField HeaderText="TotalTaxValue" DataField="TotalTaxValue" ItemStyle-CssClass="c07  text-center" />
                                                                    <asp:BoundField HeaderText="IGSTAmt" DataField="IGSTAmt" ItemStyle-CssClass="c08 r" />
                                                                    <asp:BoundField HeaderText="CGSTAmt" DataField="CGSTAmt" ItemStyle-CssClass="c09 r" />
                                                                    <asp:BoundField HeaderText="SGSTAmt" DataField="SGSTAmt" ItemStyle-CssClass="c010 r" />
                                                                    <asp:BoundField HeaderText="Cess" DataField="Cess" ItemStyle-CssClass="c11 r" />

                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%--  <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                    <td class="c08">&nbsp;</td>
                                                    <td class="c09">&nbsp;</td>
                                                    <td class="c10">&nbsp;</td>
                                                    <td class="c11">&nbsp;</td>--%>
                                                    </tr>
                                                    <%-- <tr>
                                                    <td class="c01">&nbsp;</td>
                                                    <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                    <td class="c08">&nbsp;</td>
                                                    <td class="c09">&nbsp;</td>
                                                    <td class="c10">&nbsp;</td>
                                                    <td class="c11">&nbsp;</td>

                                                </tr>--%>
                                                </tbody>

                                            </table>

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
                                                <span class="gstr_row_title">Table 13:</span>
                                                <span class="gstr_row_desc blue">Documents issued during the tax period</span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="table13" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <table class="table table-bordered table-gstr table_psm table13">
                                                <thead>
                                                    <tr>
                                                        <th class="c01" rowspan="2">Sr. No.</th>
                                                        <th class="c02" rowspan="2">Nature of document</th>
                                                        <th class="c03" colspan="2">Sr. No.</th>
                                                        <th class="c05" rowspan="2">Total number</th>
                                                        <th class="c06" rowspan="2">Cancelled</th>
                                                        <th class="c07" rowspan="2">Net issued</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c03">From</th>
                                                        <th class="c04">To</th>
                                                    </tr>
                                                    <tr>
                                                        <th class="c01">(1)</th>
                                                        <th class="c02">(2)</th>
                                                        <th class="c03">(3)</th>
                                                        <th class="c04">(4)</th>
                                                        <th class="c05">(5)</th>
                                                        <th class="c06">(6)</th>
                                                        <th class="c07">(7)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="p0 b0" colspan="7">
                                                            <asp:GridView runat="server" ShowHeader="false" ID="grd13" CssClass="table table-bordered table-gstr table_psm table11" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField ItemStyle-CssClass="c01 text-center">
                                                                        <ItemTemplate>
                                                                            <%#Container.DataItemIndex+1 %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="NatureOfDocDesc" ItemStyle-CssClass="c02 l" />
                                                                    <asp:BoundField DataField="SrNoFrom" ItemStyle-CssClass="c03 text-center" />
                                                                    <asp:BoundField DataField="SrNoTo" ItemStyle-CssClass="c04 text-center" />
                                                                    <asp:BoundField DataField="TotalNumber" ItemStyle-CssClass="c05 text-center" />
                                                                    <asp:BoundField DataField="Cancelled" ItemStyle-CssClass="c06 text-center" />
                                                                    <asp:BoundField DataField="NetIssued" ItemStyle-CssClass="c07 text-center" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </td>
                                                        <%--<td class="c01">1</td>
                                                    <td class="c02">Invoices for outward supply</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>--%>
                                                    </tr>
                                                    <%--<tr>
                                                    <td class="c01">2</td>
                                                    <td class="c02">Invoices for inward supply from unregistered person</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">3</td>
                                                    <td class="c02">Revised Invoice</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">4</td>
                                                    <td class="c02">Debit Note</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">5</td>
                                                    <td class="c02">Credit Note</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">6</td>
                                                    <td class="c02">Receipt voucher</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">7</td>
                                                    <td class="c02">Payment Voucher</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">8</td>
                                                    <td class="c02">Refund voucher</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">9</td>
                                                    <td class="c02">Delivery Challan for job work</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">10</td>
                                                    <td class="c02">Delivery Challan for supply on approval</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td class="c01">11</td>
                                                    <td class="c02">Delivery Challan in case of liquid gas</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="c01">12</td>
                                                    <td class="c02">Delivery Challan in cases other than by way of supply (excluding at S no. 9 to 11) </td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>
                                                    <td class="c06">&nbsp;</td>
                                                    <td class="c07">&nbsp;</td>

                                                </tr>--%>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                                <!-- END Table 13-->
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div id="dvTallydata" runat="server" visible="True">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div id="accordion1" class="panel-group">
                                <!-- START Table b2b-->
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT1">
                                                <span class="gstr_row_title">Table 1 :</span>
                                                <span class="gstr_row_desc blue">b2b</span>
                                                &nbsp;&nbsp; Total Invoice : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2bTinvoice" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total IGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2bTIGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp; Total CGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2bTCGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total SGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2bTSGST" runat="server" Text="0"></asp:Label></span>

                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT1" class="panel-collapse collapse in" style="clear: both; width: 100%">
                                        <div class="panel-table">
                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT1" runat="server" ShowHeader="true" ID="grdb2bdata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="GSTIN/UIN of Recipient" DataField="BillGSTIN" ItemStyle-CssClass="c01  text-center" />
                                                    <asp:BoundField HeaderText="Invoice Number" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                    <asp:BoundField HeaderText="Invoice Date" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03 text-left" />
                                                    <asp:BoundField HeaderText="Invoice Value" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                    <asp:BoundField HeaderText="Place Of Supply" DataField="PosStateDesc" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Reverse Charge" DataField="Reversecharge" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Invoice Type" DataField="Invoicetypedesc" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="E-Commerce GSTIN" DataField="Ecommgstin" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-right" />
                                                    <asp:BoundField HeaderText="Taxable Value" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                    <asp:BoundField HeaderText="Cess Amount" DataField="Cess" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c08 text-right" />

                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                                <!-- END Table b2b-->
                                <!-- START Table b2cl-->
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT2">
                                                <span class="gstr_row_title">Table 2 :</span>
                                                <span class="gstr_row_desc blue">b2cl</span>
                                                 &nbsp;&nbsp; Total Invoice : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2clTinvoice" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total IGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2clTIGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp; Total CGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2clTCGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total SGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2clTSGST" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT2" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT2" runat="server" ShowHeader="true" ID="grdb2cldata"
                                                AutoGenerateColumns="false">
                                                <Columns>

                                                    <asp:BoundField HeaderText="Invoice Number" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                    <asp:BoundField HeaderText="Invoice Date" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03 text-center" />
                                                    <asp:BoundField HeaderText="Invoice Value" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                    <asp:BoundField HeaderText="Place Of Supply" DataField="PosStateDesc" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="E-Commerce GSTIN" DataField="Ecommgstin" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-right" />
                                                    <asp:BoundField HeaderText="Taxable Value" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                    <asp:BoundField HeaderText="Cess Amount" DataField="Cess" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c08 text-right" />

                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                                <!-- END Table b2c1-->
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT3">
                                                <span class="gstr_row_title">Table 3 :</span>
                                                <span class="gstr_row_desc blue">b2cs</span>
                                                  
                                                &nbsp;&nbsp;Total IGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2csTIGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp; Total CGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2csTCGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total SGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblb2csTSGST" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT3" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grdb2csdata"
                                                AutoGenerateColumns="false">
                                                <Columns>

                                                    <asp:BoundField HeaderText="Place Of Supply" DataField="PosStateDesc" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-right" />
                                                    <asp:BoundField HeaderText="Taxable Value" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                    <asp:BoundField HeaderText="Cess Amount" DataField="Cess" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="E-Commerce GSTIN" DataField="Ecommgstin" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c08 text-right" />

                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT4">
                                                <span class="gstr_row_title">Table 4 :</span>
                                                <span class="gstr_row_desc blue">Cdnr</span>
                                                  &nbsp;&nbsp; Total Invoice : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblcdnrTinvoice" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total IGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblcdnrTIGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp; Total CGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblcdnrTCGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total SGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblcdnrTSGST" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT4" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grddcnrdata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="GSTIN/UIN of Recipient" DataField="BillGSTIN" ItemStyle-CssClass="c01  text-center" />
                                                    <asp:BoundField HeaderText="Invoice/Advance Receipt Number" DataField="AmdInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                    <asp:BoundField HeaderText="Invoice/Advance Receipt date" DataField="AmdInvoiceDate" ItemStyle-CssClass="c03 text-left" />
                                                    <asp:BoundField HeaderText="Note/Refund Voucher Number" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                    <asp:BoundField HeaderText="Note/Refund Voucher date" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03 text-left" />
                                                    <asp:BoundField HeaderText="Document Type" DataField="doctypedesc" ItemStyle-CssClass="c07  text-center" />
                                                    <asp:BoundField HeaderText="Reason For Issuing document" DataField="ResDCNoteDesc" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Place Of Supply" DataField="PosStateDesc" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Note/Refund Voucher Value" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-right" />
                                                    <asp:BoundField HeaderText="Taxable Value" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                    <asp:BoundField HeaderText="Cess Amount" DataField="Cess" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c08 text-right" />

                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT5">
                                                <span class="gstr_row_title">Table 5 :</span>
                                                <span class="gstr_row_desc blue">Cdnur</span>
                                                  &nbsp;&nbsp; Total Invoice : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblcdnurTinvoice" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total IGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblcdnurTIGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp; Total CGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblcdnurTCGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total SGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblcdnurTSGST" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT5" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grdcdnurdata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="UR Type" DataField="URTypeDesc" ItemStyle-CssClass="c01  text-center" />
                                                    <asp:BoundField HeaderText="Invoice/Advance Receipt Number" DataField="AmdInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                    <asp:BoundField HeaderText="Invoice/Advance Receipt date" DataField="AmdInvoiceDate" ItemStyle-CssClass="c03 text-left" />
                                                    <asp:BoundField HeaderText="Note/Refund Voucher Number" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                    <asp:BoundField HeaderText="Note/Refund Voucher date" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03 text-left" />
                                                    <asp:BoundField HeaderText="Document Type" DataField="doctypedesc" ItemStyle-CssClass="c07  text-center" />
                                                    <asp:BoundField HeaderText="Reason For Issuing document" DataField="ResDCNoteDesc" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Place Of Supply" DataField="PosStateDesc" ItemStyle-CssClass="c07  text-left" />
                                                    <asp:BoundField HeaderText="Note/Refund Voucher Value" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-right" />
                                                    <asp:BoundField HeaderText="Taxable Value" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                    <asp:BoundField HeaderText="Cess Amount" DataField="Cess" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT6">
                                                <span class="gstr_row_title">Table 6 :</span>
                                                <span class="gstr_row_desc blue">exp</span>
                                                &nbsp;&nbsp; Total Invoice : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblexpTinvoice" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total IGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblexpTIGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp; Total CGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblexpTCGST" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total SGST : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblexpTSGST" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT6" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grdexpdata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Export Type" DataField="ExpTypeDesc" ItemStyle-CssClass="c01  text-center" />
                                                    <asp:BoundField HeaderText="Invoice Number" DataField="CurrInvoiceNo" ItemStyle-CssClass="c02 text-center" />
                                                    <asp:BoundField HeaderText="Invoice date" DataField="CurrInvoiceDT" ItemStyle-CssClass="c03 text-left" />
                                                    <asp:BoundField HeaderText="Invoice Value" DataField="CurrInvoiceVal" ItemStyle-CssClass="c04  text-right" />
                                                    <asp:BoundField HeaderText="Port Code" DataField="PortCode" ItemStyle-CssClass="c07  text-center" />
                                                    <asp:BoundField HeaderText="Shipping Bill Number" DataField="ShippExBillNo" ItemStyle-CssClass="c07  text-center" />
                                                    <asp:BoundField HeaderText="Shipping Bill Date" DataField="ShippExBilldate" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c05 r text-right" />
                                                    <asp:BoundField HeaderText="Taxable Value" DataField="Taxableval" ItemStyle-CssClass="c06 r text-right" />
                                                    <asp:BoundField HeaderText="IGST" DataField="IGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="CGST" DataField="CGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                    <asp:BoundField HeaderText="SGST" DataField="SGSTTax" ItemStyle-CssClass="c08 text-right" />
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                                <%--start at--%>
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT7">
                                                <span class="gstr_row_title">Table 7 :</span>
                                                <span class="gstr_row_desc blue">at</span>
                                               
                                                &nbsp;&nbsp; Total Gross Advance Received : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblatTGrossReceived" runat="server"></asp:Label></span>
                                            
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT7" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grdatdata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Place Of Supply" DataField="PosName" ItemStyle-CssClass="c01  text-left" />
                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c03 text-right" />
                                                    <asp:BoundField HeaderText="Gross Advance Received" DataField="GrossAdvAdj" ItemStyle-CssClass="c02 text-right" />

                                                    <asp:BoundField HeaderText="cess Amount" DataField="CessTax" ItemStyle-CssClass="c04  text-right" />


                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                                <%-- end at--%>
                                <%--start atadj--%>
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT8">
                                                <span class="gstr_row_title">Table 8 :</span>
                                                <span class="gstr_row_desc blue">atadj</span>
                                                  &nbsp;&nbsp; Total Gross Advance Adjusted : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblatadjTGrossAdjusted" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT8" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grdatadjdata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Place Of Supply" DataField="PosName" ItemStyle-CssClass="c01  text-left" />
                                                    <asp:BoundField HeaderText="Rate" DataField="Rate" ItemStyle-CssClass="c03 text-right" />
                                                    <asp:BoundField HeaderText="Gross Advance Received" DataField="GrossAdvAdj" ItemStyle-CssClass="c02 text-right" />

                                                    <asp:BoundField HeaderText="cess Amount" DataField="CessTax" ItemStyle-CssClass="c04  text-right" />


                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                                <%-- end at--%>
                                <%--start exemp--%>
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT9">
                                                <span class="gstr_row_title">Table 9 :</span>
                                                <span class="gstr_row_desc blue">exemp</span>
                                                   &nbsp;&nbsp; Total Nil Rated Supplies : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblexempTNilRated" runat="server" Text="0"></asp:Label></span>
                                                 &nbsp;&nbsp;Total Exempted : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblexempTExempted" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total Non-GST supplies : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblexempTNonGst" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT9" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grdexempdata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Description" DataField="TableNameDesc" ItemStyle-CssClass="c01  text-center" />
                                                    <asp:BoundField HeaderText="Nil Rated Supplies" DataField="NillInvoiceAmt" ItemStyle-CssClass="c03 text-right" />
                                                    <asp:BoundField HeaderText="Exempted (other than nil rated/non GST supply )" DataField="ExmInvoiceAmt" ItemStyle-CssClass="c02 text-right" />
                                                    <asp:BoundField HeaderText="Non-GST supplies" DataField="NonGSTInvoiceAmt" ItemStyle-CssClass="c04  text-right" />


                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                                <%-- end exemp--%>

                                <%--start HSN--%>
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT10">
                                                <span class="gstr_row_title">Table 10 :</span>
                                                <span class="gstr_row_desc blue">HSN</span>
                                                   &nbsp;&nbsp; Total Value : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblhsnTvalue" runat="server" Text="0"></asp:Label></span>
                                                 &nbsp;&nbsp;Total Integrated Tax : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblhsnTIntegratedTaxAmount" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total Central Tax : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblhsnTCentralTaxAmount" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total State/UT Tax : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lblhsnTStateTaxAmount" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT10" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grdhsndata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="HSN" DataField="HSNNo" ItemStyle-CssClass="c01  text-center" />
                                                    <asp:BoundField HeaderText="Description" DataField="HSNDesc" ItemStyle-CssClass="c03 text-left" />
                                                    <asp:BoundField HeaderText="UQC" DataField="UQC" ItemStyle-CssClass="c02 text-left" />
                                                    <asp:BoundField HeaderText="Total Quantity" DataField="TotalQuantity" ItemStyle-CssClass="c04  text-center" />
                                                    <asp:BoundField HeaderText="Total Value" DataField="TotalValue" ItemStyle-CssClass="c02 text-right" />
                                                    <asp:BoundField HeaderText="Taxable Value" DataField="TotalTaxValue" ItemStyle-CssClass="c04  text-right" />
                                                    <asp:BoundField HeaderText="Integrated Tax Amount" DataField="IGSTAmt" ItemStyle-CssClass="c02 text-right" />
                                                    <asp:BoundField HeaderText="Central Tax Amount" DataField="CGSTAmt" ItemStyle-CssClass="c04  text-right" />
                                                    <asp:BoundField HeaderText="State/UT Tax Amount" DataField="SGSTAmt" ItemStyle-CssClass="c02 text-right" />
                                                    <asp:BoundField HeaderText="Cess Amount" DataField="Cess" ItemStyle-CssClass="c04  text-right" />


                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                                <%-- end hsn--%>

                                <%--start docs--%>
                                <div class="panel panel-default panel-demo">
                                    <div class="panel-heading" style="padding-bottom: 14px">
                                        <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                            <em class="fa fa-refresh"></em>
                                        </a>


                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion1" href="#tableT11">
                                                <span class="gstr_row_title">Table 11 :</span>
                                                <span class="gstr_row_desc blue">docs</span>
                                                  &nbsp;&nbsp;Total Number : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lbldocsTotalNumber" runat="server" Text="0"></asp:Label></span>
                                                &nbsp;&nbsp;Total Cancelled : <span class="gstr_row_desc blue">
                                                    <asp:Label ID="lbldocsTotalCancelled" runat="server" Text="0"></asp:Label></span>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="tableT11" class="panel-collapse collapse" style="clear: both; width: 100%">
                                        <div class="panel-table">

                                            <asp:GridView CssClass="table table-bordered table-gstr table_psm tableT3" runat="server" ShowHeader="true" ID="grddocsdata"
                                                AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Nature  of Document" DataField="NatureOfDocDesc" ItemStyle-CssClass="c01  text-center" />
                                                    <asp:BoundField HeaderText="Sr. No. From" DataField="SrNoFrom" ItemStyle-CssClass="c03 text-center" />
                                                    <asp:BoundField HeaderText="Sr. No. To" DataField="SrNoTo" ItemStyle-CssClass="c02 text-center" />
                                                    <asp:BoundField HeaderText="Total Number" DataField="TotalNumber" ItemStyle-CssClass="c04  text-right" />
                                                    <asp:BoundField HeaderText="Cancelled" DataField="Cancelled" ItemStyle-CssClass="c02 text-right" />
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>
                                <%-- end docs--%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Page content-->
    </section>
    <script>
        $(document).ready(function () {

            $('.liImportExcel').show();
        });
    </script>
</asp:Content>

