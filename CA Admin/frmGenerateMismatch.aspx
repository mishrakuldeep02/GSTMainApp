<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGenerateMismatch.aspx.cs" Inherits="CA_Admin_frmGenerateMismatch" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('body').addClass('aside-collapsed');
            $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
            $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
            $('.liImportExcel').show();
            $('.loading').removeClass('active');
        });
        function ProgressBar()
        {
            $('.loading').addClass('active');
        }
        function LoadScript()
        {
            $(document).ready(function () {
                $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
                $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
                $('.liImportExcel').show();
                $('.loading').removeClass('active');
            });
            function ProgressBar() {
                $('.loading').addClass('active');
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server" ID="sss"></asp:ScriptManager>

    <section>
        <asp:UpdatePanel runat="server" ID="upda">
            <ContentTemplate>
               <script type="text/javascript">
                   Sys.Application.add_load(LoadScript)
                                                </script>
                <div class="content-wrapper">
                    <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
                    <h3 class="second_heading">Generate Mismatch</h3>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Generate GSTR2 Mismatch</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 text-left-sm margin-top-5px-xs">
                                            <a runat="server" id="btnGSTR2A" href="#" class="btn btn-success">GSTR2A <i runat="server" id="iGSTR2a" class="fa fa-check"></i></a>
                                            <a href="#" runat="server" id="btnPurchaseData" class="btn btn-success">Purchase Data  <i runat="server" id="iPurchase" class="fa fa-check"></i></a>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <asp:Button class="btn btn-primary pull-right" OnClick="btnGenerateMismatch_Click" OnClientClick="ProgressBar();" runat="server" ID="btnGenerateMismatch" Text="Generate Mismatch" />
                                            <%--<a href="#" class="btn btn-primary">Generate Mismatch</a>--%>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <asp:Label CssClass="text-success  pull-right" runat="server" ID="lblMsg"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div id="pnlMismatch" visible="false" runat="server">
                                <div class="panel panel-default">
                                    <div class="panel-heading hidden">
                                        <h3 class="panel-title">Generate GSTR2 Mismatch</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-4 text-bold">
                                                <label>(B2B) Total Invoice In Purchase Data :</label>
                                            </div>
                                            <div class="col-xs-5 col-sm-8">
                                                <asp:Label runat="server" ID="lblTotalInvoicePurchaseData"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-4 text-bold">
                                                <label>(B2B) Total Invoice In GSTR2A Data :</label>
                                            </div>
                                            <div class="col-xs-5 col-sm-8">
                                                <asp:Label runat="server" ID="lblGSTR2AData"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-4 text-bold">
                                                <label for="f1" class="pointer selection-off">
                                                    <asp:RadioButton AutoPostBack="true" OnCheckedChanged="chkReconcile_CheckedChanged" GroupName="Summary" Checked="true" Style="cursor: pointer;" Text="(B2B) Reconcile Records (Full Matching) :" runat="server" ID="chkReconcile" />
                                                </label>
                                            </div>
                                            <div class="col-xs-5 col-sm-8">
                                                <asp:Label runat="server"  CssClass="text-danger" ID="lblReconcileData"></asp:Label>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-4 text-bold">
                                                <label for="f4" class="pointer selection-off">
                                                    <asp:RadioButton AutoPostBack="true" OnCheckedChanged="chkMismatchInvoice_CheckedChanged" GroupName="Summary" Text="(B2B) Mismatch Invoice :" Style="cursor: pointer;" runat="server" ID="chkMismatchInvoice" />
                                                </label>
                                            </div>
                                            <div class="col-xs-5 col-sm-8">
                                                <asp:Label runat="server" ID="lblMismatchInvoice"></asp:Label>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-4 text-bold">
                                                <label for="f4" class="pointer selection-off">
                                                    <asp:RadioButton AutoPostBack="true" OnCheckedChanged="rdbProbably_CheckedChanged" GroupName="Summary" Text="(B2B) Probably Matched Invoice :" Style="cursor: pointer;" runat="server" ID="rdbProbably" />
                                                </label>
                                            </div>
                                            <div class="col-xs-5 col-sm-8">
                                                <asp:Label runat="server" ID="lblProbablyCount"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-4 text-bold">
                                                <label for="f2" class="pointer selection-off">
                                                    <asp:RadioButton AutoPostBack="true" OnCheckedChanged="chkAdditionalIn2A_CheckedChanged" GroupName="Summary" Text="(B2B) Additional in 2A DATA :" Style="cursor: pointer;" runat="server" ID="chkAdditionalIn2A" />
                                                </label>
                                            </div>
                                            <div class="col-xs-5 col-sm-8">
                                                <asp:Label runat="server" ID="lblAddtional2AData"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-4 text-bold">
                                                <label for="f3" class="pointer selection-off">
                                                    <asp:RadioButton AutoPostBack="true" OnCheckedChanged="chkAdditionalPurchase_CheckedChanged" GroupName="Summary" Text="(B2B) Additional in Purchase DATA :" Style="cursor: pointer;" runat="server" ID="chkAdditionalPurchase" />
                                                </label>
                                            </div>
                                            <div class="col-xs-5 col-sm-8">
                                                <asp:Label runat="server" ID="lblAddtionalInPurchaseData"></asp:Label>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-xs-7 col-sm-4 text-bold">
                                                <label for="f4" class="pointer selection-off">
                                                    <asp:RadioButton AutoPostBack="true" OnCheckedChanged="rdbb2bur_CheckedChanged" GroupName="Summary" Text="B2B Unregistered Supplies :" Style="cursor: pointer;" runat="server" ID="rdbb2bur" />
                                                </label>
                                            </div>
                                            <div class="col-xs-5 col-sm-8">
                                                <asp:Label runat="server" ID="lblb2bur"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 text-right">
                                                <asp:Button runat="server" ID="btnShowMismatch" Text="Show Mismatch" CssClass="btn btn-info pull-right" OnClientClick="ProgressBar();" OnClick="btnShowMismatch_Click" />
                                                <asp:DropDownList runat="server" ID="ddlMismatchType" CssClass="form-control" Style="width: 150px; float: right; margin-right: 5px; height: 35px; padding: 2px 3px; font-size: 14px"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div runat="server" id="pnlgrid" visible="true">
                                    <div class="panel panel-default panel-demo">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-md-8">
                                            <h3 class="panel-title">
                                                <asp:Label runat="server" Text="Reconcile Records (Full Matching) :" ID="lblMismatchType"></asp:Label>
                                            </h3>
</div>
                                                <div class="col-md-2" visible="false" runat="server" id="divSelectAll">
                                                    <asp:CheckBox onchange="ProgressBar();" AutoPostBack="true" Text="Select All" OnCheckedChanged="chkSelectAll_CheckedChanged" runat="server" ID="chkSelectAll" />
                                                </div>
                                                   <div runat="server" visible="false" class="col-md-2" id="divButton">
                                                       <asp:Button runat="server" OnClientClick="ProgressBar();" ID="btnAccept" Text="Accept" CssClass="btn btn-success" OnClick="btnAccept_Click" />
                                                       </div>
                                                </div>
                                            <%--<h4 class="panel-title hidden" style="width: 60%; float: left">
                                                <span class="gstr_row_title">Mismatched Data</span>
                                                <span class="gstr_row_desc"></span>
                                            </h4>--%>
                                            <br />
                                            <asp:Label runat="server" ID="lblActinLabel" CssClass="text-success"></asp:Label>
                                            <div class="filter_box hidden" style="width: 40%; float: right">
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
                                            <div class="table-noresponsive">
                                                <style>
                                                    .table-word-wrap tr td , .table-word-wrap tr th {
                                                        word-break:break-all;
                                                    }
                                                </style>
                                                <table class="table table-gstr table-gstr-striped table-gstr-noborder table_psm table-mm table-word-wrap">
                                                    <thead>
                                                        <tr>
                                                            <th rowspan="2">Data Type</th>
                                                            <th rowspan="2">GSTIN/UIN</th>
                                                            <th colspan="3">Invoice</th>
                                                            <th rowspan="2">Rate</th>
                                                            <th rowspan="2">Taxable&nbsp;Value</th>
                                                            <th colspan="4">Amount in INR.</th>
                                                            <th colspan="4">ITC</th>
                                                            <th rowspan="2">POS</th>
                                                            <th rowspan="2">Action</th>
                                                        </tr>
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Date</th>
                                                            <th>Value</th>
                                                            <th>IGST</th>
                                                            <th>CGST</th>
                                                            <th>SGST</th>
                                                            <th>Cess</th>
                                                            <th>IGST</th>
                                                            <th>CGST</th>
                                                            <th>SGST</th>
                                                            <th>Cess</th>
                                                        </tr>
                                                        <tr>
                                                            <th style="width:5%">(1)</th>
                                                            <th style="width:7%">(2)</th>
                                                            <th style="width:5%">(3)</th>
                                                            <th style="width:5%">(4)</th>
                                                            <th style="width:5%">(5)</th>
                                                            <th style="width:3%">(6)</th>
                                                            <th style="width:5%">(7)</th>
                                                            <th style="width:5%">(8)</th>
                                                            <th style="width:5%">(9)</th>
                                                            <th style="width:5%">(10)</th>
                                                            <th style="width:5%">(11)</th>
                                                            <th style="width:5%">(12)</th>
                                                            <th style="width:5%">(13)</th>
                                                            <th style="width:5%">(14)</th>
                                                            <th style="width:5%">(15)</th>
                                                            <th style="width:5%">(16)</th>
                                                            <th style="width:6%">(17)</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="dark">
                                                            <td colspan="17" class="p0 b0">
                                                                <asp:GridView runat="server" OnRowCommand="grdMismatch_RowCommand" OnRowDataBound="grdMismatch_RowDataBound" DataKeyNames="CurrInvoNoInd,CurrInvoDateInd,CurrInvoValueInd,RateInd,TaxableValInd,IGSTTaxInd,CGSTTaxInd,SGSTTaxInd,CessTaxInd,RecordNo,RowNo,CountInvoice" ShowHeader="False" ID="grdMismatch" AutoGenerateColumns="False" CssClass="table">
                                                                    <%----%>
                                                                    <Columns>
                                                                        <asp:BoundField DataField="DataType" ItemStyle-CssClass="text-center" HeaderText="Data Type">
                                                                            <ItemStyle CssClass="text-center" Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField>
                                                                           
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPurchGSTIN" runat="server" Text='<%# Bind("SippGSTIN") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="text-center"  Width="7%"/>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField>

                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("CurrInvoNo") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="text-center"  Width="5%"/>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="CurrInvoDate1" ItemStyle-CssClass="text-center">
                                                                            <ItemStyle CssClass="text-center"  Width="5%" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CurrInvoValue" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"/>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Rate" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="3%"/>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="TaxableVal" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"/>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="IGSTTax" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"/>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CGSTTax" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"/>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="SGSTTax" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"/>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CessTax" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"/>
                                                                        </asp:BoundField>
                                                                      

                                                                        <asp:BoundField DataField="RecordNo" ItemStyle-CssClass="text-center" Visible="False">
                                                                            <ItemStyle CssClass="text-center"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false" DataField="SippGSTINInd" ItemStyle-CssClass="text-center">
                                                                            <ItemStyle CssClass="text-center"  Width="5%"/>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CurrInvoNoInd" ItemStyle-CssClass="text-center" Visible="False">
                                                                            <ItemStyle CssClass="text-center"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false" DataField="CurrInvoDateInd" ItemStyle-CssClass="text-center">
                                                                            <ItemStyle CssClass="text-center"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false" DataField="CurrInvoValueInd" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false" DataField="RateInd" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false" DataField="TaxableValInd" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false" DataField="IGSTTaxInd" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false" DataField="CGSTTaxInd" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false" DataField="SGSTTaxInd" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField Visible="false"  DataField="CessTaxInd" ItemStyle-CssClass="text-right" >
                                                                             

                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                         <asp:BoundField  DataField="ITCIGSTTax" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                         <asp:BoundField  DataField="ITCCGSTTax" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                         <asp:BoundField  DataField="ITCSGSTTax" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                         <asp:BoundField  DataField="ITCCessTax" ItemStyle-CssClass="text-right">
                                                                            <ItemStyle CssClass="text-right"  Width="5%"></ItemStyle>
                                                                        </asp:BoundField>
                                                                          <asp:BoundField DataField="POS" ItemStyle-CssClass="text-center">

                                                                            <ItemStyle CssClass="text-center"  Width="5%"/>
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="CountInvoice" Visible="false" />
                                                                        <asp:BoundField DataField="RowNo" Visible="false" />

                                                                        <asp:TemplateField ItemStyle-CssClass="" >
                                                                            <ItemTemplate>
                                                                                <asp:Panel  Visible="false" runat="server" ID="pnlRecocile">
                                                                                    <div class="checkbox c-checkbox pull-left mt0">
                                                                                        <label>
                                                                                            <asp:CheckBox runat="server" ID="chkSelect" />
                                                                                            <span class="fa fa-check"></span>
                                                                                        </label>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                                <asp:Panel runat="server" ID="pnlAdditional">
                                                                                    <div class="dropdown">

                                                                                        <button class="btn btn-primary btn-xs dropdown-toggle" type="button" data-toggle="dropdown">
                                                                                            Action
                                                                 <i class="fa fa-angle-left"></i>
                                                                                        </button>
                                                                                        <ul class="dropdown-menu dropdown-menu dropdown-menu-gstr-mm">
                                                                                            <asp:Panel Visible="false" runat="server" ID="pnlPurchase">
                                                                                                <li>
                                                                                                    <asp:Button OnClientClick="ProgressBar();" runat="server" ID="btnCorrect" CssClass="btn btn-info form-control" CommandName="Correct" Text="Add To GSTR-2" CommandArgument='<%#Container.DataItemIndex %>' /></li>
                                                                                                <li>
                                                                                                    <%--<asp:Button runat="server" ID="btnIncorrect" CssClass="btn btn-success form-control" CommandName="InCorrect" Text="Error In Purchase Data" CommandArgument='<%#Container.DataItemIndex %>' />--%></a></li>
                                                                                            </asp:Panel>
                                                                                             <asp:Panel Visible="false" runat="server" ID="pnlProbable">
                                                                                                <li>
                                                                                                    <asp:Button OnClientClick="ProgressBar();" runat="server" ID="btnAccept" CssClass="btn btn-info form-control" CommandName="ProbableAccept" Text="Accept Data From 2A" CommandArgument='<%#Container.DataItemIndex %>' /></li>
                                                                                                <li>
                                                                                                    <%--<asp:Button runat="server" ID="btnIncorrect" CssClass="btn btn-success form-control" CommandName="InCorrect" Text="Error In Purchase Data" CommandArgument='<%#Container.DataItemIndex %>' />--%></a></li>
                                                                                            </asp:Panel>
                                                                                            <asp:Panel Visible="false" runat="server" ID="pnl2A">
                                                                                                <li>
                                                                                                    <asp:Button OnClientClick="ProgressBar();" runat="server" ID="btnAccpet" CssClass="btn btn-info form-control" CommandName="Accept" Text="Accept Data In 2A" CommandArgument='<%#Container.DataItemIndex %>' /></li>
                                                                                                <li>
                                                                                                    <asp:Button OnClientClick="ProgressBar();" runat="server" ID="btnReject" CssClass="btn btn-success form-control" CommandName="Reject" Text="Reject Data In 2A" CommandArgument='<%#Container.DataItemIndex %>' /></a></li>
                                                                                                <li>
                                                                                                    <asp:Button OnClientClick="ProgressBar();" runat="server" ID="btnPending" CssClass="btn btn-warning form-control" CommandName="Pending" Text="Pending" CommandArgument='<%#Container.DataItemIndex %>' /></a></li>

                                                                                            </asp:Panel>
                                                                                            <asp:Panel runat="server" Visible="false" ID="pnlMismatch">
                                                                                                <li>
                                                                                                    <asp:Button OnClientClick="ProgressBar();" runat="server" ID="Button1" CssClass="btn btn-info form-control" CommandName="MisAccept" Text="Accept Data In 2A" CommandArgument='<%#Container.DataItemIndex %>' /></li>
                                                                                                <li>
                                                                                                    <asp:Button OnClientClick="ProgressBar();" runat="server" ID="Button2" CssClass="btn btn-success form-control" CommandName="Modify" Text="Modify 2A Data With My Data" CommandArgument='<%#Container.DataItemIndex %>' /></a></li>
                                                                                            </asp:Panel>
                                                                                        </ul>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </ItemTemplate>

                                                                            <ItemStyle CssClass=""  Width="6%"></ItemStyle>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                        <%--<tr class="dark">
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
                                                    <li><a href="javascript:void(0);">My Data is Correct</a></li>
                                                    <li><a href="javascript:void(0);">Accept Vendor's Data</a></li>
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
                                                    <li><a href="javascript:void(0);">My Data is Correct</a></li>
                                                    <li><a href="javascript:void(0);">Accept Vendor's Data</a></li>
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
                                                    <li><a href="javascript:void(0);">My Data is Correct</a></li>
                                                    <li><a href="javascript:void(0);">Accept Vendor's Data</a></li>
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
                                    </tr>--%>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </section>

</asp:Content>

