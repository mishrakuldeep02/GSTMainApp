<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGSTR2A_old.aspx.cs" Inherits="CA_Admin_frmGSTR2A" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
             $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
             $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
             $('.liImportExcel').show();
         });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <section>
        <!-- START Page content-->
        <div class="content-wrapper ">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <div class="row">
                <div class="panel panel-default panel-demo">
                    <div class="panel-heading">

                        <h4 class="panel-title">

                            <span class="gstr_row_title">Mismatch Summary:</span>
                            <span class="gstr_row_desc"></span>

                        </h4>
                    </div>
                    <div class="panel-wrapper">
                        <div class="panel-body" style="padding-top: 1px">

                            <a href="#" class="text-danger">1. Invoices Not Available in Purchase Data : 25</a><br />
                            <a href="#" class="text-success">2. Invoices Extra in Purchase Data : 0</a><br />
                            <a href="#!" class="text-danger show_records_table">3. Invoices Records Mismatched : 3</a>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row records_table hidden">
                <div class="panel panel-default panel-demo">
                    <div class="panel-heading">

                        <h4 class="panel-title" style="width: 60%; float: left">
                            <span class="gstr_row_title">Mismatched Data</span>
                            <span class="gstr_row_desc"></span>
                        </h4>
                        <div class="filter_box" style="width: 40%; float: right">
                            <label style="width: 300px; text-align: right"><i class="fa r fa-filter"></i>Filter Data as per Mismatch in : </label>
                            <select class="form-control" style="width: 100px; margin-left: 5px; padding: 0; height: 26px; margin-bottom: 5px; margin-top: -2px; float: right">
                                <option>GSTIN</option>
                                <option>Invoice</option>
                                <option>IGST</option>
                                <option>CGST</option>
                                <option>SGST</option>
                                <option>POS</option>
                            </select>
                        </div>

                    </div>
                    <div class="panel-body panel-table" style="float: none; padding: 0; width: 100%">



                        <table class="table table-gstr table-gstr-striped table-gstr-noborder table_psm table-mm">
                            <thead>
                                <tr>
                                    <th rowspan="2">GSTIN/UIN</th>
                                    <th colspan="3">Invoice</th>
                                    <th rowspan="2">Rate</th>
                                    <th rowspan="2">Taxable&nbsp;Value</th>
                                    <th colspan="4">Amount in INR.</th>
                                    <th rowspan="2">POS</th>
                                    <th rowspan="2">Action</th>
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
                                    <th class="c12">(11)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="dark">
                                    <td class="c01">23AAAPO5542D1K5</td>
                                    <td class="c02">06</td>
                                    <td class="c03">10/04/2017</td>
                                    <td class="c04">55440</td>
                                    <td class="c05 r">-</td>
                                    <td class="c06 r txt-mismatch">8500.00</td>
                                    <td class="c07 r">0.00</td>
                                    <td class="c08 r">510.00</td>
                                    <td class="c09 r">510.00</td>
                                    <td class="c10 r">-</td>
                                    <td class="c11 r">-</td>
                                    <td class="c12 r vt" rowspan="2">
                                        <div class="dropdown pull-right">
                                            <button class="btn btn-primary btn-xs dropdown-toggle" type="button" data-toggle="dropdown">
                                                Action
                                                 <i class="fa fa-angle-left"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu dropdown-menu-gstr-mm">
                                                <li><a href="#">My Data is Correct</a></li>
                                                <li><a href="#">Accept Vendor's Data</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="dark">
                                    <td class="c01">23AAAPO5542D1K5</td>
                                    <td class="c02">06</td>
                                    <td class="c03">10/04/2017</td>
                                    <td class="c04">55440</td>
                                    <td class="c05 r">-</td>
                                    <td class="c06 r txt-mismatch">8520.00</td>
                                    <td class="c07 r">0.00</td>
                                    <td class="c08 r">510.00</td>
                                    <td class="c09 r">510.00</td>
                                    <td class="c10 r">-</td>
                                    <td class="c11 r">-</td>
                                </tr>
                                <tr class="light">
                                    <td class="c01">23AAAPO5542D1K5</td>
                                    <td class="c02">14</td>
                                    <td class="c03">12/07/2017</td>
                                    <td class="c04">55150</td>
                                    <td class="c05 r">-</td>
                                    <td class="c06 r">42500.00</td>
                                    <td class="c07 r">0.00</td>
                                    <td class="c08 r txt-mismatch">3825.00</td>
                                    <td class="c09 r">3835.00</td>
                                    <td class="c10 r">-</td>
                                    <td class="c11 r">-</td>
                                    <td class="c12 r vt" rowspan="2">
                                        <div class="dropdown pull-right">
                                            <button class="btn btn-primary btn-xs dropdown-toggle" type="button" data-toggle="dropdown">
                                                Action
                                                 <i class="fa fa-angle-left"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu dropdown-menu-gstr-mm">
                                                <li><a href="#">My Data is Correct</a></li>
                                                <li><a href="#">Accept Vendor's Data</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="light">
                                    <td class="c01">23AAAPO5542D1K5</td>
                                    <td class="c02">14</td>
                                    <td class="c03">12/07/2017</td>
                                    <td class="c04">55150</td>
                                    <td class="c05 r">-</td>
                                    <td class="c06 r">42500.00</td>
                                    <td class="c07 r">0.00</td>
                                    <td class="c08 r txt-mismatch">3825.00</td>
                                    <td class="c09 r">3825.00</td>
                                    <td class="c10 r">-</td>
                                    <td class="c11 r">-</td>
                                </tr>
                                <tr class="dark">
                                    <td class="c01">23AAAPO5542D1K5</td>
                                    <td class="c02">18</td>
                                    <td class="c03">14/07/2017</td>
                                    <td class="c04">65897</td>
                                    <td class="c05 r">-</td>
                                    <td class="c06 r">17700.00</td>
                                    <td class="c07 r txt-mismatch">2710.00</td>
                                    <td class="c08 r">0.00</td>
                                    <td class="c09 r">0.00</td>
                                    <td class="c10 r">-</td>
                                    <td class="c11 r">-</td>
                                    <td class="c12 r vt" rowspan="2">
                                        <div class="dropdown pull-right">
                                            <button class="btn btn-primary btn-xs dropdown-toggle" type="button" data-toggle="dropdown">
                                                Action
                                                 <i class="fa fa-angle-left"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu dropdown-menu-gstr-mm">
                                                <li><a href="#">My Data is Correct</a></li>
                                                <li><a href="#">Accept Vendor's Data</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="dark">
                                    <td class="c01">23AAAPO5542D1K5</td>
                                    <td class="c02">18</td>
                                    <td class="c03">14/07/2017</td>
                                    <td class="c04">65897</td>
                                    <td class="c05 r">-</td>
                                    <td class="c06 r">17700.00</td>
                                    <td class="c07 r txt-mismatch">2700.00</td>
                                    <td class="c08 r">0.00</td>
                                    <td class="c09 r">0.00</td>
                                    <td class="c10 r">-</td>
                                    <td class="c11 r">-</td>
                                </tr>
                            </tbody>

                        </table>
                    </div>

                </div>
            </div>
        </div>
        <!-- END Page content-->
    </section>
</asp:Content>

