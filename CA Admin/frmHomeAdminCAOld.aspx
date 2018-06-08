<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmHomeAdminCAOld.aspx.cs" Inherits="Common_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
            
             $('.dashboard_activeme').addClass('active');
         })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <section>
        <!-- START Page content-->
        <div class="content-wrapper ">
            
            
            <div class="row">
                <div class="col-md-3 col-xs-12 pull-right">

                    <div class="row news_container">

                        <div class="panel panel_b6 panel-warning panel-demo">
                            <div class="panel-heading panel-heading_pl">
                                Notifications<a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
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
                                                <small>M/s XYZ limited has pushed file for Verification.
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
                                                <small>Varun has completed working on M/s ABC Ltd.
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
                                Important Dates<a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
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
                                                <small>Filling of GSTR-1 is due in 5 days.
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
                                News
                                       
                                <a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                    <em class="fa fa-minus"></em>
                                </a>
                                <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                    <em class="fa fa-refresh"></em>
                                </a>
                            </div>
                            <div class="panel-wrapper collapse in" aria-expanded="true">
                                <div class="list-group" style="margin: 0">
                                    <!-- START list group item-->
                                    <div class="list-group-item">
                                        <div class="media">
                                            <div class="media-body clearfix">
                                                <p class="m0">
                                                    <small>Government notified new rules for reverse charge mechanism.
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
                                                    <small>DEF State reduces tax rate on essential servcies.
                                                    </small>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END list group item-->
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-9 pull-left">
                    <div class="row">
                        <div id="accordion" class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                            <span class="gstr_row_title">GSTR 1 :</span>
                                            <span class="gstr_row_desc blue">Details of outwards supplies of goods or services</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">42</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">15</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">50</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">150</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- END 1 panel-->
                            <!-- START 1A panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1A">
                                            <span class="gstr_row_title">GSTR 1A :</span>
                                            <span class="gstr_row_desc blue">Details of auto drafted supplies of goods or services</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse1A" class="panel-collapse collapse">
                                    <div class="panel-body">
                                      <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">37</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">20</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">60</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">140</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- END 1A panel-->
                            <!-- START 2 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                                            <span class="gstr_row_title">GSTR 2 :</span>
                                            <span class="gstr_row_desc blue">Details of inward supplies of goods or services</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">35</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">22</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">40</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">160</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 2 panel-->
                            <!-- START 2A panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2A">
                                            <span class="gstr_row_title">GSTR 2A :</span>
                                            <span class="gstr_row_desc blue">Details of supplies auto drafted from GSTR-1 or GSTR-5 to recipient</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse2A" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">52</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">48</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">57</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">100</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 2A panel-->
                            <!-- START 3 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                                            <span class="gstr_row_title">GSTR 3 :</span>
                                            <span class="gstr_row_desc blue">Monthly return</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                         <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">40</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">17</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">30</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">170</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 3 panel-->
                            <!-- START 3A panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3A">
                                            <span class="gstr_row_title">GSTR 3A :</span>
                                            <span class="gstr_row_desc blue">Notice to return defaulter u/s 46</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse3A" class="panel-collapse collapse">
                                    <div class="panel-body">
                                         <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">32</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">25</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">25</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">175</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 3A panel-->
                            <!-- START 4 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
                                            <span class="gstr_row_title">GSTR 4 :</span>
                                            <span class="gstr_row_desc blue">Quarterly return for registered persons opting composition levy</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">30</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">37</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">40</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">150</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 4 panel-->
                            <!-- START 4A panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4A">
                                            <span class="gstr_row_title">GSTR 4A :</span>
                                            <span class="gstr_row_desc blue">Auto drafted details for registered persons opting composition levy</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse4A" class="panel-collapse collapse">
                                    <div class="panel-body">
                                         <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">62</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">30</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">30</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">135</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 4A panel-->
                            <!-- START 5 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">
                                            <span class="gstr_row_title">GSTR 5 :</span>
                                            <span class="gstr_row_desc blue">Return for Non Resident Taxable Persons</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse5" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">22</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">35</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">10</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">190</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 5 panel-->
                             <!-- START 5A panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5A">
                                            <span class="gstr_row_title">GSTR 5A :</span>
                                            <span class="gstr_row_desc blue">Details of supplies of online information and database access or
retrieval services by a person located outside India made to non-taxable
persons in India</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse5A" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">22</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">35</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">10</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">190</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 5A panel-->
                            <!-- START 6 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">
                                            <span class="gstr_row_title">GSTR 6 :</span>
                                            <span class="gstr_row_desc blue">Return for input service distributors</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse6" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">62</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">55</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">10</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">130</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 6 panel-->
                            <!-- START 6A panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6A">
                                            <span class="gstr_row_title">GSTR 6A :</span>
                                            <span class="gstr_row_desc blue">Details of supplies auto drafted from GSTR-1 or GSTR-5 to ISD.</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse6A" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">32</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">05</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">100</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">120</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 6A panel-->
                            <!-- START 7 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">
                                            <span class="gstr_row_title">GSTR 7 :</span>
                                            <span class="gstr_row_desc blue">Return for Tax Deduction at Source</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse7" class="panel-collapse collapse">
                                    <div class="panel-body">
                                       <div class="row">
                                            <div class="col-sm-3">
                                                <div class="panel widget mh175">
                                                    <div class="panel-body bg-danger text-center">
                                                        <div class="text-lg m0">72</div>
                                                        <p>Pending for Approval / Working Pending</p>
                                                        <div class="mb-lg"></div>
                                                        <em class="fa fa-clock-o"></em>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="panel widget mh175">
                                                    <div class="panel-body bg-primary text-center">
                                                        <div class="text-lg m0">35</div>
                                                        <p>Error identified in Client Data</p>
                                                        <div class="mb-lg"></div>
                                                        <em class="fa fa-gear"></em>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="panel widget mh175">
                                                    <div class="panel-body bg-info text-center">
                                                        <div class="text-lg m0">20</div>
                                                        <p>No Activity <br/>done by Client</p>
                                                        <div class="mb-lg"></div>
                                                        <em class="fa fa-list text-alpha"></em>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="panel widget mh175">
                                                    <div class="panel-body bg-purple text-center">
                                                        <div class="text-lg m0">130</div>
                                                        <p>
                                                            Returns
                                                    <br />
                                                            Uploaded
                                                        </p>
                                                        <div class="mb-lg"></div>
                                                        <em class="fa fa-upload"></em>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <!-- END 7 panel-->
                            <!-- START 7A panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse7A">
                                            <span class="gstr_row_title">GSTR 7A :</span>
                                            <span class="gstr_row_desc blue">Tax Deduction at Source Certificate</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse7A" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">82</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">25</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">60</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">90</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 7A panel-->
                            <!-- START 8 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">
                                            <span class="gstr_row_title">GSTR 8 :</span>
                                            <span class="gstr_row_desc blue">Statement for Tax Collection at Source</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse8" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-danger text-center">
                                                            <div class="text-lg m0">52</div>
                                                            <p>Pending for Approval / Working Pending</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-clock-o"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-primary text-center">
                                                            <div class="text-lg m0">35</div>
                                                            <p>Error identified in Client Data</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-gear"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-info text-center">
                                                            <div class="text-lg m0">10</div>
                                                            <p>No Activity <br/>done by Client</p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-list text-alpha"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-3">
                                                <a href="#!" class="a_div">
                                                    <div class="panel widget mh175">
                                                        <div class="panel-body bg-purple text-center">
                                                            <div class="text-lg m0">160</div>
                                                            <p>
                                                                Returns
                                                    <br />
                                                                Uploaded
                                                            </p>
                                                            <div class="mb-lg"></div>
                                                            <em class="fa fa-upload"></em>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 8 panel-->
                            <!-- START 11 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse11">
                                            <span class="gstr_row_title">GSTR 11 :</span>
                                            <span class="gstr_row_desc blue">Inward supplies statement for persons having Unique Identification Number (UIN)</span>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse11" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="panel widget mh175">
                                                    <div class="panel-body bg-danger text-center">
                                                        <div class="text-lg m0">12</div>
                                                        <p>Pending for Approval / Working Pending</p>
                                                        <div class="mb-lg"></div>
                                                        <em class="fa fa-clock-o"></em>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="panel widget mh175">
                                                    <div class="panel-body bg-primary text-center">
                                                        <div class="text-lg m0">45</div>
                                                        <p>Error identified in Client Data</p>
                                                        <div class="mb-lg"></div>
                                                        <em class="fa fa-gear"></em>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="panel widget mh175">
                                                    <div class="panel-body bg-info text-center">
                                                        <div class="text-lg m0">28</div>
                                                        <p>No Activity <br/>done by Client</p>
                                                        <div class="mb-lg"></div>
                                                        <em class="fa fa-list text-alpha"></em>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="panel widget mh175">
                                                    <div class="panel-body bg-purple text-center">
                                                        <div class="text-lg m0">172</div>
                                                        <p>
                                                            Returns
                                                    <br />
                                                            Uploaded
                                                        </p>
                                                        <div class="mb-lg"></div>
                                                        <em class="fa fa-upload"></em>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END 11 panel-->

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- END Page content-->

    </section>
</asp:Content>

