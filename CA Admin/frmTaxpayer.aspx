<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmTaxpayer.aspx.cs" Inherits="CA_Admin_frmTaxpayer" %>
<%@ Register  TagName="UserControl"  TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
             $('.btn_back_url').attr('href', 'frmTaxPayerSearch.aspx');
             $('.gstr_sitemap').append('<li class="breadcrumb-item active">Client</li>');
             $('.liImportExcel').show();
         });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <section>
        <!-- START Page content-->
        <div class="content-wrapper ">
           <%-- <div class="row strip_row">
              <div class="selected_client_details">
                    <div class="col-sm-5"><b><asp:Label runat="server" ID="lblFirmName" ></asp:Label></b></div>
                    <div class="col-sm-7 text-right">
                        <span class="grid_contact"><b>GSTIN : </b><asp:Label runat="server" ID="lblGSTINNo" ></asp:Label>       </span><span class="spacer_contact"></span>
                        <span class="grid_contact"><i class="fa r fa-user"></i><asp:Label runat="server" ID="lblClientName" ></asp:Label>   </span><span class="spacer_contact"></span>
                        <span class="grid_contact"><i class="fa r fa-phone"></i><asp:Label runat="server" ID="lblMobileNo" ></asp:Label></span><span class="spacer_contact"></span>
                        <span class="grid_contact"><i class="fa r fa-envelope"></i><asp:Label runat="server" ID="lblEmailId" ></asp:Label></span>
                    </div>
                </div>
                <div class="breadcrumb_row">
                    <a href="frmDashboard.aspx" class="btn btn-primary btn-xs" style="float: left; margin-right: 15px"><i class="fa r fa-arrow-circle-o-left"></i>Back</a>
                    <ol class="breadcrumb" style="float: left">
                        <li class="breadcrumb-item"><a href="frmDashboard.aspx">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="frmClientPage.aspx">Client</a></li>
                    </ol>
                </div>
            </div>--%>
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <div class="row">
                <div class="col-md-9">
                    <div class="row">
                        <div class="panel panel_b6 panel-default">
                            <div class="panel-wrapper in">
                                <div class="panel-body pt0">
                                    <div class="row">
                                       
                                        <div class="table-responsive">
                                            <table class="table table-hover table-gstr-rows">
                                                <thead>
                                                    <tr>
                                                        <th class="col1">Returns</th>
                                                        <th class="col2">Status of Data</th>
                                                        <th class="col3">Current Status of Job Assigned</th>
                                                        <th class="col4">Upload</th>
                                                        <th class="col5">Job Assigned to</th>
                                                        <th class="col6">Submit Return</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="col1"><a href="frmGSTR1.aspx">GSTR 1</a></td>
                                                        <td class="col2"><span class="text-success">Data Uploaded</span></td>
                                                        <td class="col3">Uploaded</td>
                                                        <td class="col4"><a href="#!" class="btn  btn-xs btn-info disabled">Import Data</a></td>
                                                        <td class="col5">Satish Verma</td>
                                                        <td class="col6"><a class="btn btn-primary pull-right text-white btn-xs" href="#!">Submit Return</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col1"><a href="#!">GSTR 1A</a></td>
                                                        <td class="col2"><span class="text-warning">Data Pending</span></td>
                                                        <td class="col3">Pending</td>
                                                        <td class="col4"><a href="#!" class="btn  btn-xs btn-info">Import Data</a></td>
                                                        <td class="col5">-</td>
                                                        <td class="col6"><a class="btn btn-primary pull-right text-white btn-xs" href="#!">Submit Return</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col1"><a href="frmGSTR2.aspx">GSTR 2</a></td>
                                                        <td class="col2"><span class="text-warning">Data Pending</span></td>
                                                        <td class="col3">Pending</td>
                                                        <td class="col4"><a href="#!" class="btn  btn-xs btn-info">Import Data</a></td>
                                                        <td class="col5">Satish Verma</td>
                                                        <td class="col6"><a class="btn btn-primary pull-right text-white btn-xs" href="#!">Submit Return</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col1"><a href="frmGenerateMismatch.aspx">GSTR 2A</a></td>
                                                        <td class="col2"><span class="text-danger">Data Matched Mismatch Generated</span></td>
                                                        <td class="col3">Pending</td>
                                                        <td class="col4"><a href="#!" class="btn  btn-xs btn-info">Import Data</a></td>
                                                        <td class="col5">Satish Verma</td>
                                                        <td class="col6"><a class="btn btn-primary pull-right text-white btn-xs" href="#!">Submit Return</a></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="col1"><a href="#!">GSTR 3</a></td>
                                                        <td class="col2"><span class="text-warning">Pending</span></td>
                                                        <td class="col3">Pending</td>
                                                        <td class="col4"><a href="#!" class="btn  btn-xs btn-info">Import Data</a></td>
                                                        <td class="col5">Satish Verma</td>
                                                        <td class="col6"><a class="btn btn-primary pull-right text-white btn-xs" href="#!">Submit Return</a></td>
                                                    </tr>

                                                </tbody>

                                            </table>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-3">

                    <div class="panel panel_b6 panel-warning panel-demo">
                        <div class="panel-heading panel-heading_pl">
                            Alerts<a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                <em class="fa fa-minus"></em>
                            </a>
                            <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                <em class="fa fa-refresh"></em>
                            </a>
                        </div>
                        <!-- START list group-->
                        <div class="list-group" style="margin: 0">
                            <!-- START list group item-->
                            <div class="list-group-item">
                                <div class="media">
                                    <div class="media-body clearfix">
                                        <p class="m0">
                                            <small>Mismatch Generated in GSTR-2A
                                            </small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END list group item-->
                            <!-- START list group item-->
                            <div class="list-group-item">
                                <div class="media">
                                    <div class="media-body clearfix">
                                        <p class="m0">
                                            <small>Data for GSTR-3 Pending
                                            </small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END list group item-->
                        </div>
                        <!-- END list group-->
                        <!-- START panel footer-->
                        <!-- END panel-footer-->
                    </div>

                    <div class="panel panel_b6 panel-warning panel-demo">
                        <div class="panel-heading panel-heading_pl">
                            Old Pendancy<a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                <em class="fa fa-minus"></em>
                            </a>
                            <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                <em class="fa fa-refresh"></em>
                            </a>
                        </div>
                        <!-- START list group-->
                        <div class="panel-body">
                            <p style="color: #3a3a3a">No Old Pendancy </p>
                        </div>
                        <!-- END list group-->
                        <!-- START panel footer-->
                        <!-- END panel-footer-->
                    </div>

                    <div class="panel panel_b6 panel-warning panel-demo">
                        <div class="panel-heading panel-heading_pl">
                            Send Reminder
                                       
                                <a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                    <em class="fa fa-minus"></em>
                                </a>
                        </div>
                        <div class="panel-wrapper collapse in" aria-expanded="true">
                            <div class="panel-body text-center">
                                <a href="#!" class="btn btn-info btn-xs">Send SMS</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#!" class="btn btn-info btn-xs">Send Email</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- END Page content-->
    </section>
     
</asp:Content>

