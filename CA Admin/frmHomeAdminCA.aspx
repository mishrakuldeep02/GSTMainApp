<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmHomeAdminCA.aspx.cs" Inherits="Common_Default" %>
<%@ Register TagName="UserControl" TagPrefix="notification" Src="~/UserControl/wucNotification.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {

            $('.dashboard_activeme').addClass('active');
        })
    </script>
    <style>
        .ca_to-no {
            margin-bottom: 15px;
        }

            .ca_to-no span {
                color: #ff902b;
            }

        .radial-bar-lg {
            width: 100px;
            height: 100px;
            font-size: 22px;
            margin: 0 auto;
            display: block;
        }

        .ca_chart-p {
            text-align: center;
            margin-top: 15px;
        }

        .pie-title-center {
            /*display: inline-block;*/
            position: relative;
            text-align: center;
        }

        .pie-value {
            display: block;
            position: absolute;
            font-size: 14px;
            height: 40px;
            top: 50%;
            left: 0;
            right: 0;
            margin-top: -20px;
            line-height: 40px;
        }

        .pie-value1 {
            display: block;
            position: absolute;
            font-size: 14px;
            height: 40px;
            top: 50%;
            left: 0;
            right: 0;
            margin-top: -20px;
            line-height: 40px;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            $('.demo-pie-1').pieChart({
                barColor: '#f05050',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 16,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('.demo-pie-2').pieChart({
                barColor: '#ff902b',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 16,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('.demo-pie-3').pieChart({
                barColor: '#23b7e5',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 16,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('.demo-pie-4').pieChart({
                barColor: '#27c24c',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 16,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });
        });

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section>
        <!-- START Page content-->
        <div class="content-wrapper ">


            <div class="row">
                <div class="col-md-3 col-xs-12 pull-right">
                    <notification:UserControl runat="server" ID="wucNotification" />
              </div>
                <%--<div class="col-md-3 col-xs-12 pull-right">

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
                </div>--%>
                <div class="col-md-9 col-xs-12 pull-left">
                    <div class="row">
                        <div id="accordion" class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">

                                <div class="panel-heading">
                                    <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                        <em class="fa fa-refresh"></em>
                                    </a>
                                    <asp:DropDownList runat="server" ID="ddlGSTR" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlGSTR_SelectedIndexChanged" Style="width: 120px; float: left; padding: 4px 10px; font-size: 13px; height: 27px; margin-top: -5px;margin-right:-60px"></asp:DropDownList>
                                      <asp:DropDownList runat="server" ID="ddlMonthYear" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlMonthYear_SelectedIndexChanged" Style="width: 120px; float: right; padding: 4px 10px; font-size: 13px; height: 27px; margin-top: -5px;margin-right:10px"></asp:DropDownList>
                                    <h4 class="panel-title text-center">
                                        <a data-toggle="collapse" data-parent="#accordion">
                                            <span runat="server" id="lblGstrName" class="gstr_row_title">GSTR 3B</span>
                                        </a>
                                    </h4>
                                   
                                </div>
                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <h4 class="ca_to-no">Total No. of Clients : <span>
                                                <asp:Label runat="server" ID="lblTotalRecords"></asp:Label></span></h4>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6 col-md-3">
                                            <%--<div data-label="20" class="radial-bar radial-bar-20 radial-bar-lg radial-bar-danger"></div>
                                            --%>
                                            <div id="divCompleted" runat="server" class="pie-title-center demo-pie-1" data-percent="0"><span class="pie-value1" runat="server" id="lblCompleted"></span></div>
                                            <p class="ca_chart-p">Data Completed</p>
                                        </div>
                                        <div class="col-xs-6 col-md-3">
                                            <%--<div data-label="35" class="radial-bar radial-bar-35 radial-bar-lg radial-bar-warning"></div>
                                            --%>
                                            <div runat="server"  id="divSaved" class="pie-title-center demo-pie-2" data-percent="0"><span runat="server" id="lblSaved" class="pie-value1"></span></div>
                                            <p class="ca_chart-p">Data Saved to GSTN</p>
                                        </div>
                                        <div class="col-xs-6 col-md-3">
                                            <%-- <div data-label="50" class="radial-bar radial-bar-50 radial-bar-lg radial-bar-info"></div>
                                            --%>
                                            <div id="divSubmit" runat="server" class="pie-title-center  demo-pie-3" data-percent="0"><span runat="server" id="lblSubmit" class="pie-value1"></span></div>
                                            <p class="ca_chart-p">Data Submitted to GSTN</p>
                                        </div>
                                        <div class="col-xs-6 col-md-3">
                                            <%--<div data-label="100" class="radial-bar radial-bar-100 radial-bar-lg radial-bar-success"></div>
                                            --%>
                                            <div id="divFiled" runat="server" class="pie-title-center  demo-pie-4" data-percent="0"><span runat="server" id="lblFiled" class="pie-value1"></span></div>
                                            <p class="ca_chart-p">Data Filed to GSTN</p>

                                        </div>
                                    </div>


                                </div>


                            </div>
                        </div>
                        <!-- END 1 panel-->
                        <!-- START 1A panel-->
                        <div class="panel panel-default mt-lg">
                            <div class="panel-body text-center">
                                <span style="font-size: 30px; font-weight: 600;" >Help - How to use this portal ?</span>
                                <br />
                                <a href="../Files/GSTR 1 Filing Portal-Help.pdf" target="_blank" style="font-size:27px;margin-right:20px">GSTR 1</a> 
                                <a href="../Files/GST Return Filing Portal-Help.pdf" target="_blank" style="font-size:27px">GSTR 3B</a>
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
    </a>
</asp:Content>

