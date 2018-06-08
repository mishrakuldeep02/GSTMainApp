<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucNotification.ascx.cs" Inherits="UserControl_wucNotification" %>
<style>
    .pad{
       padding-left: 7%;
    }
</style>
<div class="panel panel_b6 panel-warning panel-demo">
    <div class="panel-heading panel-heading_pl">
        Notifications <a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
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
                  <small><b>Dates for GST Returns for July, 2017</b><br />
                            <ul class="pad" style="list-style-type: lower-alpha;">
                              


<li>GSTR 1 - 10th October, 2017</li>
<li>GSTR 2 - 31st October, 2017</li>
<li>GSTR 3 - 10th November, 2017</li>
<li>GSTR 4 (for composition dealers) - 18th October, 2017</li>
<li>GSTR 6 - 13th October, 2017</li>
<%--<b>August</b>
<li>GSTR-1- 5th October </li>
<li>GSTR-2- 10th October</li>
<li>GSTR-3- 15th October</li>--%>
                            </ul>

                       </small>      
                    </p>
                </div>
            </div>
        </div>
        <!-- END list group item-->
        <!-- START list group item-->
        <%--<div class="list-group-item">
                                        <div class="media">
                                            <div class="media-body clearfix">
                                                <p class="m0">
                                                    <small>Data for GSTR-3 Pending
                                                    </small>
                                                </p>
                                            </div>
                                        </div>
                                    </div>--%>
        <!-- END list group item-->
    </div>
    <!-- END list group-->
    <!-- START panel footer-->
    <!-- END panel-footer-->
</div>

<div class="panel panel_b6 panel-warning panel-demo">
    <div class="panel-heading panel-heading_pl">
        News <a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
            <em class="fa fa-minus"></em>
        </a>
        <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
            <em class="fa fa-refresh"></em>
        </a>
    </div>
    <!-- START list group-->
    <div class="panel-body">
    <small><b>Changes in TRAN 1</b>  
        <ul class="pad" style="list-style-type: lower-alpha;">
            <li>
                TRAN 1 due date is extended by 1 month i.e by 31st Oct
            </li>
            <li>
                TRAN 1 can be revised once
            </li>

        </ul></small>  
       
       <%-- <ul style="padding: 2%">
            <li><a target="_blank" href="http://timesofindia.indiatimes.com/business/india-business/gst-could-help-banks-enhance-credit-monitoring/articleshow/60218321.cms">GST could help banks enhance credit monitoring</a> </p>
            </li>
        </ul>--%>
    </div>
    <!-- END list group-->
    <!-- START panel footer-->
    <!-- END panel-footer-->
</div>

<div class="panel panel_b6 panel-warning panel-demo">
    <div class="panel-heading panel-heading_pl">
        Alert
                                       
                                <a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                    <em class="fa fa-minus"></em>
                                </a>
    </div>
    <div class="panel-wrapper collapse in" aria-expanded="true">
        <ul>
            <li>GSTR-3B for the month of AUGUST-2017 is due on 20th September 2017.
            </li>
        </ul>
        <%-- <div class="panel-body text-center">
                                        <a href="#!" class="btn btn-info btn-xs">Send SMS</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#!" class="btn btn-info btn-xs">Send Email</a>
                                    </div>--%>
    </div>
</div>

<div class="panel panel_b6 panel-warning panel-demo liImportExcel" style="display:none;">
    <div class="panel-heading panel-heading_pl">
        Send Sms & Email 
                                       
                                <a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                    <em class="fa fa-minus"></em>
                                </a>
    </div>
    <div class="panel-wrapper collapse in" aria-expanded="true">

        <div class="panel-body text-center">
            <a href="#!SMS" class="btn btn-info btn-sm" data-toggle="modal" data-target="#sendMsg" style="margin-right: 2px; margin-bottom: 2px;"><i class="fa r fa-comment"></i>Send SMS</a>

            <a href="#!Email" class="btn btn-info btn-sm" data-toggle="modal" data-target="#sendEmail"><i class="fa r fa-envelope"></i>Send Email</a>
        </div>
    </div>
</div>
