﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmImportGSTR3B.aspx.cs" Inherits="CA_Admin_frmImportGSTR3B" %>
<%@ Register TagName="UserControl" TagPrefix="notification" Src="~/UserControl/wucNotification.ascx" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        $(document).ready(function () {
            $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
            $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
            $('.liImportExcel').show();
        });

    </script>
    <style>
        #radio_a_container a {
            width: 100%;
            margin-bottom: 5px;
        }
    </style>
    <!-- Modal -->
    <div class="modal fade" id="ProgressModal1" role="dialog">
        <div class="modal-dialog  modal-md" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Payload</h5>
                </div>
                <div class="modal-body">
                   <asp:TextBox runat="server" CssClass="form-control" ID="txtPayload" ReadOnly="true" TextMode="MultiLine" Height="300"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <section>
        <div class="content-wrapper ">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <h3 class="second_heading">Import GSTR3B Data</h3>
            <div class="row">
             <div class="col-md-3 col-xs-12 pull-right">
                    <notification:UserControl runat="server" ID="wucNotification" />
              </div>
            <div class="col-sm-9 col-xs-12">
                <div class="col-lg-3">
                </div>
                <div class="col-md-12 pull-left col-xs-12">
                    <div class="row">
                        <div class="panel panel-default panel-demo">
                            <div class="panel-heading">
                                <h4 class="panel-title">Import GSTR3B Data :
                                </h4>
                            </div>
                            <div class="panel-body">
                                <div class="alert alert-danger" runat="server" id="Panel" visible="false">
                                    <asp:Label runat="server" ID="lblMessage"></asp:Label>
                                    <asp:LinkButton runat="server" ID="lnkbtn1" style="display:none;" Text="View Payload" OnClick="lnkbtn_Click"></asp:LinkButton>
                                </div>
                                <asp:LinkButton runat="server" ID="lnkbtn" Visible="false" Style="float: right;" PostBackUrl="~/Client/FrmTaxPayerDashboard.aspx" Text="Go To Dashboard"></asp:LinkButton>
                                <div class="row">
                                    <div class="col-sm-4 col-xs-12" id="radio_a_container">
                                        <a href="#" class="btn abtn btn-primary hr1 hidden" disabled>
                                            <asp:RadioButton runat="server" ID="rdbEntryGrid" GroupName="Type" class="radio-gstr pull-right" />
                                            Make Entry in Grid</a>
                                        <br />
                                        <a href="#" class="btn abtn btn-primary">
                                            <asp:RadioButton runat="server" ID="rdbExcelOswal" GroupName="Type" Checked="true" class="radio-gstr pull-right" />
                                            Excel (GST Saathi)</a>
                                        <br />
                                        <a href="#" class="btn abtn btn-primary hidden">
                                            <asp:RadioButton runat="server" ID="rdbExcelYours" GroupName="Type" class="radio-gstr pull-right" />
                                            Excel (Custom)</a>
                                        <br />
                                        <a href="#" class="btn abtn btn-primary hr3 hidden" disabled>
                                            <asp:RadioButton runat="server" ID="rdbTally" GroupName="Type" class="radio-gstr pull-right" />

                                            Tally</a>
                                        <br />
                                        <a href="#" class="btn abtn btn-primary hr4 hidden" disabled>
                                            <asp:RadioButton runat="server" ID="rdbBusy" GroupName="Type" class="radio-gstr pull-right" />
                                            Busy</a>
                                        <br />
                                        <a href="#" class="btn abtn btn-primary hr5 hidden" disabled>
                                            <asp:RadioButton runat="server" ID="rdbSAP" GroupName="Type" class="radio-gstr pull-right" />
                                            SAP-ERP</a>
                                        <br />
                                        <a href="#" class="btn abtn btn-primary hr6 hidden" disabled>
                                            <asp:RadioButton runat="server" ID="rdbText" GroupName="Type" class="radio-gstr pull-right" />
                                            Text</a>
                                        <br />
                                        <a href="#" class="btn abtn btn-primary hr7 hidden" disabled>
                                            <asp:RadioButton runat="server" ID="rdbCSV" GroupName="Type" class="radio-gstr pull-right" />
                                            CSV</a>
                                    </div>

                                    <div class="col-sm-8 col-xs-12">
                                        <div class="form-group">
                                            <div class="row">
                                                <label class="col-lg-4 text-left">Month /Year :</label>
                                                   <asp:Label runat="server" ID="lblMonthYear" CssClass="col-lg-8 control-label text-left" style="text-align: left;"  Font-Bold="true"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="hidden">
                                                    <label for="sales" disabled="disabled">
                                                        <asp:RadioButton runat="server" Text="Sales Data" ID="rdbSale" class="radio-gstr pull-right" GroupName="SalePur" />
                                                    </label>
                                                    <label for="purchase" style="margin-left: 15px">
                                                        <asp:RadioButton runat="server" ID="rdbPurchase" Text="Purchase Data" Checked="true" class="radio-gstr pull-right" GroupName="SalePur" /></label>
                                                </div>
                                                <label class="col-lg-4 text-left">Select Excel :</label>
                                                <div class="col-lg-8">
                                                    <div class="input-group">
                                                        <asp:FileUpload accept=".xlsm,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" runat="server" ID="fuExcelImport" class="form-control" />
                                                        <span class="input-group-btn">
                                                            <asp:Button runat="server" OnClientClick="return SHowProgress()" CssClass="btn btn-primary" ID="btnUpload" Text="Upload" OnClick="btnUpload_Click" />
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 text-center">
                                                <span>Total Records :</span>
                                                <br />
                                                <asp:Label Style="font-size: 20px" runat="server" Text="0" ID="lblTotalRecords"></asp:Label>
                                            </div>
                                            <div class="col-xs-6 text-center">
                                                <span class="text">Records Imported :</span>
                                                <br />
                                                <asp:Label Style="font-size: 20px" runat="server" Text="0" ID="lblImported"></asp:Label>
                                            </div>
                                        </div>

                                    </div>
                                    <a href="../Files/GSTR3BDataFormat.xlsm" class="pull-right" style="position: absolute; bottom: 28px; left: 15px"><i class="fa r fa-download"></i>Download Template</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </section>
    <script>
        $(document).ready(function () {
            $('.liImportExcel').show();
        });
    </script>
    <script type="text/javascript">
        function SHowProgress() {
            if (validate() == false) {
                return false;

            } else {
                $('.loading').addClass('active');
                //   $('#ProgressModal').modal({ backdrop: 'static', keyboard: false });
            }
        }
        function OpenModal() {

        }
        function cl() {
            debugger;
            $('#wucImportData_lblImported').html('0');
            $('#wucImportData_lblTotalRecords').html('0');
            $('#wucImportData_lblMessage').html('');
            $('#wucImportData_Panel').hide();
        }
        function validate() {
            if ($('#wucImportData_ddlMonthYear').val() == '0') {
                alert("Please Select Month-Year.");
                $('#wucImportData_ddlMonthYear').focus();
                return false;
            }
        }
    </script>


</asp:Content>
