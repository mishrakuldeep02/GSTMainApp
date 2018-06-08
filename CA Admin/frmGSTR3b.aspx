<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGSTR3b.aspx.cs" Inherits="CA_Admin_frmGSTR3b" %>

<%@ Register Src="~/UserControl/wucImportData.ascx" TagName="UserControlModal" TagPrefix="cc1" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>    
        .table31{width:100%;}
        .table31 .c01{width:50%}
        .table31 .c02{width:10%}
        .table31 .c03{width:10%}
        .table31 .c04{width:10%}
        .table31 .c05 {width:15%;}
        .table31 .c06 {width:5%;}
        .table32{width:100%}
        .table32 .c01{width:40%;}
        .table32 .c02{width:15%;}
        .table32 .c03{width:15%;}
        .table32 .c04{width:15%;}
        .table32 .c05{width:15%;}
        .table5{width:100%;}
            .table5 .c01 {width:60%;}
            .table5 .c02{width:20%}
            .table5 .c03{width:20%}
            .table61{width:100%;}
            .table61 .c01{width:10%}
            .table61 .c01{width:10%}
            .table61 .c03{width:45%}
            .table61 .c06{width:10%}
            .table61 .c07{width:10%}
            .table61 .c08{width:10%}
            .table61 .c09{width:5%} 
            @media (min-width:768px){
                .text-right-sm-up{text-align:right;}
            }
    </style>
    <script>
        $(document).ready(function () {
            $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
            $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
            $('.liImportExcel').show();
        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section id="gstr3b_page">
        <!-- START Page content-->
        <div class="content-wrapper">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <%--<div class="row">
            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <div class="row">
                                    <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            GSTIN: <b> 22AAAAA0000A1Z5</b>
                                        </div>
                                        <div class="col-sm-12">
                                           Legal name of the registered person:<b> Ajay Dodiya</b> 
                                        </div>

                                    </div></div>
                                        
                                    <div class="col-sm-4">
                                        
                                         <div class="row">
                                        <div class="col-sm-12 text-right-sm-up">
                                            Year:<b> 2016</b>
                                        </div>
                                        <div class="col-sm-12 text-right-sm-up">
                                           Month:<b>JULY</b>
                                        </div>

                                    </div>
                                        
                                        
                                        
                                      </div>
                                        </div>
                                  
                                    </div>
                </div>
                </div>--%>
               <h3 class="second_heading">Display GSTR-3B Data</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div id="accordion" class="panel-group">
                            <!-- START Table 3.1-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table3">
                                            <span class="gstr_row_title">3.1:</span>
                                            <span class="gstr_row_desc blue">Detail of outward supplies and inward supplies liable to reverse charge</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table3" class="panel-collapse collapse in" style="clear: both; width: 100%">
                                    <div class="panel-table">
                                        
<asp:GridView runat="server"  ShowHeaderWhenEmpty="true" OnRowCommand="grdAllGstr3b_RowCommand"  class="table table-bordered table-gstr table_psm table31" ID="grd3_1" AutoGenerateColumns="false">  
    <Columns>
        <asp:BoundField HeaderText="Nature of supplies" DataField="TableHeadDesc"  ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/>
       <asp:BoundField HeaderText="Total Taxable Value" DataField="TotalTaxValue"  ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center" />
            <asp:BoundField HeaderText="Intregated Tax" DataField="IGSTAmt"  ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>
            <asp:BoundField HeaderText="Centarl Tax" DataField="CGSTAmt"  ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>
            <asp:BoundField HeaderText="State" DataField="SGSTAmt"  ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>
            <asp:BoundField HeaderText="Cess" DataField="CessTax"  ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>     
    </Columns>
</asp:GridView>
                             <%--<table class="table table-bordered table-gstr table_psm table31">
                                            <thead>
                                                <tr>
                                                    <th class="c01">Nature of supplies</th>
                                                    <th class="c02">Total Taxable Value</th>
                                                    <th class="c03">Intregated Tax</th>
                                                    <th class="c04">Centarl Tax</th>
                                                    <th class="c05">State/UT Tax</th>
                                                    <th class="c06">Cess</th>
                                                </tr>
                                             
                                            </thead>
                                            <tbody>
                                               
                                            </tbody>
                                        </table>--%>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 3.1-->

                             <!-- START Table 3.2-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table32">
                                            <span class="gstr_row_title">3.2:</span>
                                            <span class="gstr_row_desc blue">Of the supplies shown in 3.1(a) above , details of inter-state supplies made to unregistred persons, composition taxable persons and UIN holders</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table32" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">
<asp:GridView runat="server"  ShowHeaderWhenEmpty="true"  class="table table-bordered table-gstr table_psm table32" ID="grd3_2" AutoGenerateColumns="false">
    <Columns>
    <%-- <asp:BoundField HeaderText="" />--%>
        <asp:BoundField HeaderText="Description" DataField="TableHeadDesc" />
    <asp:BoundField HeaderText="Place of supply (State/UT)" DataField="PosStateDesc"  ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/>
     <asp:BoundField HeaderText="Total Taxable value" DataField="TotalTaxValue"  ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>
    <asp:BoundField HeaderText="Amount of Intergated Tax" DataField="IGSTAmt"  ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>           
    </Columns>
</asp:GridView>
                                      <%--  <table class="table table-bordered table-gstr table_psm table32">
                                            <thead>
                                                <tr>
                                                    <th class="c01">&nbsp;</th>
                                                    <th class="c02">Place of supply <br />(State/UT)</th>
                                                    <th class="c03">Total Taxable value</th>
                                                    <th class="c04">Amount of Intergated Tax</th>
                                                    
                                                </tr>
                                             
                                            </thead>
                                            <tbody>
                                               
                                            </tbody>
                                        </table>--%>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 3.2-->

                            <!-- START Table 4-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table33">
                                            <span class="gstr_row_title">4:</span>
                                            <span class="gstr_row_desc blue">Eligible ITC</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table33" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">

                                       <table class="table table-bordered table-gstr table_psm table32">
                                            <thead>
                                                <tr>
                                                    <th class="c01">Details</th>
                                                    <th class="c02">Intregated</th>
                                                    <th class="c03">Central Tax</th>
                                                    <th class="c04">(State/UT) Tax</th>
                                                    <th class="c05">Cess</th>
                                                    
                                                </tr>
                                             
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td  colspan="5"><b>(A) ITC Available(whether in full or part)</b></td>
                                                    <%--<td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>--%>
                                                 </tr>
                                                <tr>
                                                    <td colspan="5">
                                                        <asp:GridView runat="server"  ShowHeader="false" OnRowCommand="grdAllGstr3b_RowCommand"  class="table table-bordered table-gstr table_psm table32" ID="grd4A" AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Details" DataField="TableHeadDesc"  ItemStyle-CssClass="c01 text-left" HeaderStyle-CssClass="c01 text-center" />
                                                    <asp:BoundField HeaderText="Intregated" DataField="IGSTAmt"  ItemStyle-CssClass="c02 text-right" HeaderStyle-CssClass="c02 text-center" />
                                                            <asp:BoundField HeaderText="Central" DataField="CGSTAmt"  ItemStyle-CssClass="c03 text-right"  HeaderStyle-CssClass="c03 text-center"/>
                                                            <asp:BoundField HeaderText="(State/UT) Tax" DataField="SGSTAmt" ItemStyle-CssClass="c04 text-right" HeaderStyle-CssClass="c04 text-center" />
                                                            <asp:BoundField HeaderText="Cess" DataField="CessTax"  ItemStyle-CssClass="c05 text-right"  HeaderStyle-CssClass="c05 text-center"/>         
                                                    </Columns>
                                                </asp:GridView>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td colspan="5"><b>(B) ITC Reversed</b></td>
                                                   <%-- <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>--%>
                                                     </tr>
                                                <tr>
                                                      <td colspan="5">
                                                        <asp:GridView runat="server"  ShowHeader="false" OnRowCommand="grdAllGstr3b_RowCommand"  class="table table-bordered table-gstr table_psm table32" ID="grd4B" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Details" DataField="TableHeadDesc"  ItemStyle-CssClass="c01 text-left"  HeaderStyle-CssClass="c01 text-center"/>
                                                <asp:BoundField HeaderText="Intregated" DataField="IGSTAmt"  ItemStyle-CssClass="c02 text-right" HeaderStyle-CssClass="c02 text-center" />
                                                        <asp:BoundField HeaderText="Central" DataField="CGSTAmt"  ItemStyle-CssClass="c03 text-right"  HeaderStyle-CssClass="c03 text-center"/>
                                                        <asp:BoundField HeaderText="(State/UT) Tax" DataField="SGSTAmt" ItemStyle-CssClass="c04 text-right"  HeaderStyle-CssClass="c04 text-center"/>
                                                        <asp:BoundField HeaderText="Cess" DataField="CessTax"  ItemStyle-CssClass="c05 text-right" HeaderStyle-CssClass="c05 text-center" />         
                                                </Columns>
                                            </asp:GridView>
                                                    </td>
                                                 </tr>
                                              
                                                <tr>
                                                     <td colspan="5">
                                                        <asp:GridView runat="server" ShowHeader="false" OnRowCommand="grdAllGstr3b_RowCommand"  class="table table-bordered table-gstr table_psm table32" ID="grd4C" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Details" DataField="TableHeadDesc"  ItemStyle-CssClass="c01 text-left text-bold" HeaderStyle-CssClass="c01 text-center" />
                                                <asp:BoundField HeaderText="Intregated" DataField="IGSTAmt"  ItemStyle-CssClass="c02 text-right" HeaderStyle-CssClass="c02 text-center" />
                                                        <asp:BoundField HeaderText="Central" DataField="CGSTAmt"  HeaderStyle-CssClass="c03 text-center" ItemStyle-CssClass="c03 text-right" />
                                                        <asp:BoundField HeaderText="(State/UT) Tax" DataField="SGSTAmt" HeaderStyle-CssClass="c04 text-center" ItemStyle-CssClass="c04 text-right" />
                                                        <asp:BoundField HeaderText="Cess" DataField="CessTax" HeaderStyle-CssClass="c05 text-center"  ItemStyle-CssClass="c05 text-right" />         
                                                </Columns>
                                            </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="5"><b>(D) Ineligible ITC </b></td>
                                                   <%-- <td class="c02">&nbsp;</td>
                                                    <td class="c03">&nbsp;</td>
                                                    <td class="c04">&nbsp;</td>
                                                    <td class="c05">&nbsp;</td>--%>
                                                 </tr>
                                                <tr>
                                                     <td colspan="5">
                                                        <asp:GridView runat="server"  ShowHeader="false" OnRowCommand="grdAllGstr3b_RowCommand"  class="table table-bordered table-gstr table_psm table32" ID="Grd4D" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Details" DataField="TableHeadDesc" HeaderStyle-CssClass="c01 text-center"  ItemStyle-CssClass="c01 text-left" />
                                                <asp:BoundField HeaderText="Intregated" DataField="IGSTAmt" HeaderStyle-CssClass="c02 text-center"  ItemStyle-CssClass="c02 text-right" />
                                                        <asp:BoundField HeaderText="Central" DataField="CGSTAmt" HeaderStyle-CssClass="c03 text-center"  ItemStyle-CssClass="c03 text-right" />
                                                        <asp:BoundField HeaderText="(State/UT) Tax" DataField="SGSTAmt" HeaderStyle-CssClass="c04 text-center" ItemStyle-CssClass="c04 text-right" />
                                                        <asp:BoundField HeaderText="Cess" DataField="CessTax"  ItemStyle-CssClass="c05 text-right" HeaderStyle-CssClass="c05 text-center" />         
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
                                            <span class="gstr_row_title">5:</span>
                                            <span class="gstr_row_desc blue">Values of exempt,nil-rated and non-GST inward supplies</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table5" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">
<asp:GridView runat="server"  ShowHeaderWhenEmpty="true"  class="table table-bordered table-gstr table_psm table5" ID="grd5" AutoGenerateColumns="false">
    <Columns>
    <asp:BoundField HeaderText="Nature of supplies" DataField="TableHeadDesc"  ItemStyle-CssClass="text-left" />
     <asp:BoundField HeaderText="Inter-State supplies" DataField="InterStateAmt"  ItemStyle-CssClass="text-right" />
            <asp:BoundField HeaderText="Intra State supplies" DataField="IntraStateAmt"  ItemStyle-CssClass="text-right" />           
    </Columns>
</asp:GridView>
                                        <%--<table class="table table-bordered table-gstr table_psm table5">
                                            <thead>
                                                <tr>
                                                    <th class="c01">Nature of supplies</th>
                                                    <th class="c02">Inter-State supplies</th>
                                                    <th class="c03">Intra State supplies</th>
                                                </tr>
                                             
                                            </thead>
                                            <tbody>
                                               
                                            </tbody>
                                        </table>--%>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 5-->

                             <!-- START Table 6.1-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table61">
                                            <span class="gstr_row_title">6.1:</span>
                                            <span class="gstr_row_desc blue">Payment of tax</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table61" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">
<asp:GridView runat="server"  ShowHeaderWhenEmpty="true"  class="table table-bordered table-gstr table_psm table61" ID="grd6_1" AutoGenerateColumns="false">
    <Columns>
    <asp:BoundField HeaderText="Description" DataField="PayDesc" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center" />
     <asp:BoundField HeaderText="Tax payable" DataField="TaxPayable" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/>
            <asp:BoundField HeaderText="IGST (ITC)" DataField="ITCIGST" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/> 
        <asp:BoundField HeaderText="CGST (ITC)" DataField="ITCCGST" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/> 
        <asp:BoundField HeaderText="SGST (ITC)" DataField="ITCSGST" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/> 
        <asp:BoundField HeaderText="Cess (ITC)" DataField="ITCCESS" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/> 
            <asp:BoundField HeaderText="Tax paid TDS/TCS" DataField="TDSTCS" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/>           
            <asp:BoundField HeaderText="Tax/Cess Paid in cash" DataField="TaxCessPaidCash" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/>           
            <asp:BoundField HeaderText="Interest" DataField="Interest" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/>           
            <asp:BoundField HeaderText="Late Free" DataField="LateFee" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/>                                
    </Columns>
</asp:GridView>
                                        <%--<table class="table table-bordered table-gstr table_psm table61">
                                            <thead>
                                                <tr>
                                                    <th class="c01" rowspan="2">Description</th>
                                                    <th class="c02" rowspan="2">Tax payable</th>
                                                    <th class="c03" colspan="4">Paid Through ITC</th>
                                                    <th class="c06" rowspan="2">Tax paid TDS/TCS</th>
                                                    <th class="c07" rowspan="2">Tax/Cess Paid in cash</th>
                                                    <th class="c08" rowspan="2">Interest</th>
                                                    <th class="c09" rowspan="2">Late Free</th>
                                                   
                                                </tr>
                                                 <tr>
                                                    <th class="">Integrated Tax</th>
                                                    <th class="">Central Tax</th>
                                                    <th class="">State/UT Tax</th>
                                                    <th class="">Cess</th>
                                                </tr>
                                             
                                            </thead>
                                            <tbody>
                                               
                                            </tbody>
                                        </table>--%>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 6.1-->

                            <!-- START Table 6.2-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading" style="padding-bottom: 14px">
                                    <a href="#" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>

                                    <%-- <a href="#" class="btn btn-info pull-right btn-xs" style="margin-left: 10px;"><i class="fa r fa-pencil"></i>Modify</a>--%>
                                    <%--<a href="#" class="btn btn-warning pull-right btn-xs" data-toggle="modal" data-target="#inputModal"><i class="fa r fa-download"></i>Import Data</a>--%>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#table62">
                                            <span class="gstr_row_title">6.2:</span>
                                            <span class="gstr_row_desc blue">TDS/TCS Credit</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="table62" class="panel-collapse collapse" style="clear: both; width: 100%">
                                    <div class="panel-table">
<asp:GridView runat="server"  ShowHeaderWhenEmpty="true"  class="table table-bordered table-gstr table_psm table6" ID="grd6_2" AutoGenerateColumns="false">
    <Columns>
     <asp:BoundField HeaderText="" />
    <asp:BoundField HeaderText="Details" DataField="TableHeadDesc" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center"/>
     <asp:BoundField HeaderText="Integrated Tax" DataField="IGSTAmt" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>
            <asp:BoundField HeaderText="Central" DataField="CGSTAmt" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/> 
            <asp:BoundField HeaderText="State UT" DataField="SGSTAmt" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>                                                  
    </Columns>
</asp:GridView>
                                       <%-- <table class="table table-bordered table-gstr table_psm table6">
                                            <thead>
                                                <tr>
                                                    <th class="c01" rowspan="2">Details</th>
                                                    <th class="c02" rowspan="2">Integrated Tax</th>
                                                    <th class="c03" colspan="4">Central Tax</th>
                                                    <th class="c06" rowspan="2">State UT/Tax</th>
                                                   
                                                </tr>
                                               
                                             
                                            </thead>
                                            <tbody>
                                               
                                            </tbody>
                                        </table>--%>

                                    </div>
                                </div>
                            </div>
                            <!-- END Table 6.2-->
                        </div>
                    </div>
                </div>

            </div>


        </div>
        <!-- END Page content-->
    </section>

</asp:Content>

