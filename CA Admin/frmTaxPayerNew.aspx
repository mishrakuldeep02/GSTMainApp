<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmTaxPayerNew.aspx.cs" Inherits="CA_Admin_frmTaxPayerNew" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<%@ Register TagName="UserControl" TagPrefix="notification" Src="~/UserControl/wucNotification.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('.btn_back_url').attr('href', 'frmTaxPayerSearch.aspx');
            $('.gstr_sitemap').append('<li class="breadcrumb-item active">Client</li>');
            $('.liImportExcel').show();
        });
        $(document).ready(function () {
            $("div.bhoechie-tab-menu>div.list-group>a").click(function (e) {
                e.preventDefault();
                $(this).siblings('a.active').removeClass("active");
                $(this).addClass("active");
                var index = $(this).index();
                $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
                $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
            });
        });


        $(document).ready(function () {
            //Initialize tooltips
            $('.nav-tabs > li a[title]').tooltip();

            //Wizard
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

                var $target = $(e.target);

                if ($target.parent().hasClass('disabled')) {
                    return false;
                }
            });

            $(".next-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

            });
            $(".prev-step").click(function (e) {

                var $active = $('.wizard .nav-tabs li.active');
                prevTab($active);

            });
        });

        function nextTab(elem) {
            $(elem).next().find('a[data-toggle="tab"]').click();
        }
        function prevTab(elem) {
            $(elem).prev().find('a[data-toggle="tab"]').click();
        }


        //according menu

        $(document).ready(function () {
            //Add Inactive Class To All Accordion Headers
            $('.accordion-header').toggleClass('inactive-header');

            //Set The Accordion Content Width
            var contentwidth = $('.accordion-header').width();
            $('.accordion-content').css({});

            //Open The First Accordion Section When Page Loads
            $('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
            $('.accordion-content').first().slideDown().toggleClass('open-content');

            // The Accordion Effect
            $('.accordion-header').click(function () {
                if ($(this).is('.inactive-header')) {
                    $('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
                    $(this).toggleClass('active-header').toggleClass('inactive-header');
                    $(this).next().slideToggle().toggleClass('open-content');
                }

                else {
                    $(this).toggleClass('active-header').toggleClass('inactive-header');
                    $(this).next().slideToggle().toggleClass('open-content');
                }
            });

            return false;
        });
    </script>
    <style>
        .wizard {
            margin: 0px auto;
            background: #fff;
        }

            .wizard .nav-tabs {
                position: relative;
                margin: 0px auto;
                margin-bottom: 0;
                border-bottom-color: #e0e0e0;
                border: none;
            }

            .wizard > div.wizard-inner {
                position: relative;
            }

        .connecting-line {
            height: 2px;
            background: #F44336;
            position: absolute;
            width: 80%;
            margin: 0 auto;
            left: 0;
            right: 0;
            top: 42%;
            z-index: 1;
        }
        .connecting-line .step {
            height: 2px;
            background: #F44336;
            width: 33%;
            float:left
        }
        .connecting-line .step.active {          
            background: #4CAF50;
        }
        .wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
            color: #555555;
            cursor: default;
            border: 0;
            border-bottom-color: transparent;
        }

        span.round-tab {
            width: 70px;
            height: 70px;
            line-height: 70px;
            display: inline-block;
            border-radius: 100px;
            background: #fff;
            border: 2px solid #F44336;
            z-index: 2;
            position: absolute;
            left: 0;
            text-align: center;
            font-size: 25px;
        }

            span.round-tab i {
                color: #F44336;
            }

        .wizard li.active span.round-tab {
            background: #fff;
            border: 2px solid #4CAF50;
        }

            .wizard li.active span.round-tab i {
                color: #4CAF50;
            }

        span.round-tab:hover {
            color: #333;
            border: 2px solid #333;
        }

        .wizard .nav-tabs > li {
            width: 25%;
        }

        .wizard li:after {
            content: " ";
            position: absolute;
            left: 46%;
            opacity: 0;
            margin: 0 auto;
            bottom: 0px;
            border: 5px solid transparent;
            border-bottom-color: #5bc0de;
            transition: 0.1s ease-in-out;
        }

        /*.wizard li.active:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 1;
    margin: 0 auto;
    bottom: 0px;
    border: 10px solid transparent;
    border-bottom-color: #5bc0de;
}*/

        .wizard .nav-tabs > li a {
            width: 70px;
            height: 70px;
            margin: 20px auto;
            border-radius: 100%;
            padding: 0;
        }

            .wizard .nav-tabs > li a:hover {
                background: transparent;
            }

        .wizard .tab-pane {
            position: relative;
            padding-top: 50px;
        }

        .wizard h3 {
            margin-top: 0;
        }

        .step1 .row {
            margin-bottom: 10px;
        }

        .step_21 {
            border: 1px solid #eee;
            border-radius: 5px;
            padding: 10px;
        }

        .step33 {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding-left: 10px;
            margin-bottom: 10px;
        }

        .dropselectsec {
            width: 68%;
            padding: 6px 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            color: #333;
            margin-left: 10px;
            outline: none;
            font-weight: normal;
        }

        .dropselectsec1 {
            width: 74%;
            padding: 6px 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            color: #333;
            margin-left: 10px;
            outline: none;
            font-weight: normal;
        }

        .mar_ned {
            margin-bottom: 10px;
        }

        .wdth {
            width: 25%;
        }

        .birthdrop {
            padding: 6px 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            color: #333;
            margin-left: 10px;
            width: 16%;
            outline: 0;
            font-weight: normal;
        }


        /* according menu */
        #accordion-container {
            font-size: 13px;
        }

        .accordion-header {
            font-size: 13px;
            background: #ebebeb;
            margin: 5px 0 0;
            padding: 7px 20px;
            cursor: pointer;
            color: #fff;
            font-weight: 400;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }

        .unselect_img {
            width: 18px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .active-header {
            -moz-border-radius: 5px 5px 0 0;
            -webkit-border-radius: 5px 5px 0 0;
            border-radius: 5px 5px 0 0;
            background: #F53B27;
        }

            .active-header:after {
                content: "\f068";
                font-family: 'FontAwesome';
                float: right;
                margin: 5px;
                font-weight: 400;
            }

        .inactive-header {
            background: #333;
        }

            .inactive-header:after {
                content: "\f067";
                font-family: 'FontAwesome';
                float: right;
                margin: 4px 5px;
                font-weight: 400;
            }

        .accordion-content {
            display: none;
            padding: 20px;
            background: #fff;
            border: 1px solid #ccc;
            border-top: 0;
            -moz-border-radius: 0 0 5px 5px;
            -webkit-border-radius: 0 0 5px 5px;
            border-radius: 0 0 5px 5px;
        }

            .accordion-content a {
                text-decoration: none;
                color: #333;
            }

            .accordion-content td {
                border-bottom: 1px solid #dcdcdc;
            }



        @media( max-width : 585px ) {

            .wizard {
                width: 90%;
                height: auto !important;
            }

            span.round-tab {
                font-size: 16px;
                width: 50px;
                height: 50px;
                line-height: 50px;
            }

            .wizard .nav-tabs > li a {
                width: 50px;
                height: 50px;
                line-height: 50px;
            }

            .wizard li.active:after {
                content: " ";
                position: absolute;
                left: 35%;
            }
        }




        /*Start Wizard*/

        .bootstrapWizard {
            display: block;
            list-style: none;
            padding: 0;
            position: relative;
            width: 100%;
        }

            .bootstrapWizard a:hover, .bootstrapWizard a:active, .bootstrapWizard a:focus {
                text-decoration: none;
            }

            .bootstrapWizard li {
                display: block;
                float: left;
                width: 25%;
                text-align: center;
                padding-left: 0;
            }

                .bootstrapWizard li:before {
                    border-top: 3px solid #55606E;
                    content: "";
                    display: block;
                    font-size: 0;
                    overflow: hidden;
                    position: relative;
                    top: 11px;
                    right: 1px;
                    width: 100%;
                    z-index: 1;
                }

                .bootstrapWizard li:first-child:before {
                    left: 50%;
                    max-width: 50%;
                }

                .bootstrapWizard li:last-child:before {
                    max-width: 50%;
                    width: 50%;
                }

                .bootstrapWizard li.complete .step {
                    background: #0aa66e;
                    padding: 1px 6px;
                    border: 3px solid #55606E;
                }

                .bootstrapWizard li .step i {
                    font-size: 10px;
                    font-weight: 400;
                    position: relative;
                    top: -1.5px;
                }

                .bootstrapWizard li .step {
                    background: #B2B5B9;
                    color: #fff;
                    display: inline;
                    font-size: 15px;
                    font-weight: 700;
                    line-height: 12px;
                    padding: 7px 13px;
                    border: 3px solid transparent;
                    border-radius: 50%;
                    line-height: normal;
                    position: relative;
                    text-align: center;
                    z-index: 2;
                    transition: all .1s linear 0s;
                }

                .bootstrapWizard li.active .step, .bootstrapWizard li.active.complete .step {
                    background: #0091d9;
                    color: #fff;
                    font-weight: 700;
                    padding: 7px 13px;
                    font-size: 15px;
                    border-radius: 50%;
                    border: 3px solid #55606E;
                }

                .bootstrapWizard li.complete .title, .bootstrapWizard li.active .title {
                    color: #2B3D53;
                }

                .bootstrapWizard li .title {
                    color: #bfbfbf;
                    display: block;
                    font-size: 13px;
                    line-height: 15px;
                    max-width: 100%;
                    position: relative;
                    table-layout: fixed;
                    text-align: center;
                    top: 20px;
                    word-wrap: break-word;
                    z-index: 104;
                }

        .wizard-actions {
            display: block;
            list-style: none;
            padding: 0;
            position: relative;
            width: 100%;
        }

            .wizard-actions li {
                display: inline;
            }

        .tab-content.transparent {
            background-color: transparent;
        }

        /*End Wizard*/
        .tbbg {
            padding: 0 !important;
            border-radius: 0 !important;
            border: none !important;
        }

            .tbbg a.list-group-item.active::after {
                content: '';
                position: absolute;
                left: 100%;
                top: 50%;
                margin-top: -13px;
                border-left: 0;
                border-bottom: 13px solid transparent;
                border-top: 13px solid transparent;
                border-left: 10px solid #1c75bf;
            }

        .brdno {
            border-radius: 0 !important;
        }

        .fontless {
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
            <asp:ScriptManager runat="server" ID="drc"></asp:ScriptManager>

            <div class="row">
                <div class="col-md-9">
                    <div class="row">
                        <div class="panel panel_b6 panel-default">
                            <div class="panel-wrapper in">
                                <div class="panel-body pt0 pb0">
                                    <div class="row">
                                        <div class="col-xs-12 ">
                                            <div class="row">
                                                <asp:UpdatePanel runat="server" ID="updatePanel1">
                                                    <ContentTemplate>
                                                        <div class="col-xs-12 bhoechie-tab-container">
                                                            <div class="col-xs-12 bhoechie-tab-container">
                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 bhoechie-tab-menu">
                                                                    <div class="list-group">
                                                                        <asp:GridView class="table table-bordered" OnRowCommand="grdAllGstrName_RowCommand" ShowHeader="false" DataKeyNames="RecordNo" AutoGenerateColumns="false" runat="server" ID="grdAllGstrName">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-CssClass="tbbg">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton class="list-group-item text-center brdno" runat="server" ID="lnkbtn" CommandArgument='<%#Container.DataItemIndex%>'><%#Eval("GSTRName") %> </asp:LinkButton>
                                                                                        <asp:LinkButton class="list-group-item" runat="server" Text='<%#Eval("RecordNo") %>' ID="LinkButton1" CommandArgument='<%#Container.DataItemIndex%>' Visible="false"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                        <%-- <a href="#" class="list-group-item active text-center">
                                                                    <h4 class="fa fa-home"></h4><br/>Flight
                                                                </a>
                                                                <a href="#" class="list-group-item text-center">
                                                                    <h4 class="fa fa-home"></h4><br/>Train
                                                                </a>
                                                                <a href="#" class="list-group-item text-center">
                                                                    <h4 class="fa fa-home"></h4><br/>Hotel
                                                                </a>
                                                                <a href="#" class="list-group-item text-center">
                                                                    <h4 class="fa fa-home"></h4><br/>Restaurant
                                                                </a>
                                                                <a href="#" class="list-group-item text-center">
                                                                    <h4 class="fa fa-home"></h4><br/>Credit Card
                                                                </a>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 bhoechie-tab">
                                                                    <!-- flight section -->
                                                                    <div class="bhoechie-tab-content active">
                                                                        <!--- wizard start ---->
                                                                        <div class="wizard">
                                                                            <div class="wizard-inner">
                                                                                <div class="connecting-line">
                                                                                    <div class="step" runat="server" id="step1"></div>
                                                                                    <div class="step" runat="server" id="step2"></div>
                                                                                    <div class="step" runat="server" id="step3"></div>
                                                                                </div>
                                                                                <ul class="nav nav-tabs text-center" role="tablist">

                                                                                    <li runat="server" id="li3bGenerated" role="presentation">
                                                                                        <a>
                                                                                            <span class="round-tab">
                                                                                                <i class="fa fa-cogs"></i>

                                                                                            </span>
                                                                                        </a><span class="text-center fontless">Data Completed</span>                                                                                     </li>
                                                                                    </li>
                                                                                    <li runat="server" id="liSaved" role="presentation">
                                                                                        <a>
                                                                                            <span class="round-tab">
                                                                                                <i class="fa fa-floppy-o"></i>
                                                                                            </span>
                                                                                        </a><span class="text-center fontless">Data Saved to GSTN</span>
                                                                                    </li>
                                                                                    <li runat="server" id="liSubmit"  role="presentation">
                                                                                        <a>
                                                                                            <span class="round-tab">
                                                                                                <i class="fa fa-lock"></i>
                                                                                            </span>
                                                                                        </a><span class="text-center fontless">Data Submitted to GSTN</span>
                                                                                    </li>

                                                                                    <li runat="server" id="liFiled" role="presentation">
                                                                                        <a>
                                                                                            <span class="round-tab">
                                                                                                <i class="fa fa-file"></i>
                                                                                            </span>
                                                                                        </a><span class="text-center fontless">Data Filed to GSTN</span>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                        <!-- wizard End --->
                                                                    </div>
                                                                    <!-- train section -->
                                                                    <div class="bhoechie-tab-content" style="margin-top: 100px">
                                                                        <div class="progress">
                                                                            <div class="progress-bar" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                                                                            <div class="progress-bar bg-success" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                                                            <div class="progress-bar bg-info" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- hotel search -->
                                                                    <div class="bhoechie-tab-content">
                                                                        <div id="wizard-1">
                                                                            <div id="bootstrap-wizard-1" class="col-sm-12">
                                                                                <div class="form-bootstrapWizard">
                                                                                    <ul class="bootstrapWizard form-wizard">
                                                                                        <li class="active" data-target="#step1">
                                                                                            <a href="#tab1" data-toggle="tab" class="active"><span class="step">1</span> <span class="title">Basic information</span> </a>
                                                                                        </li>
                                                                                        <li data-target="#step2" class="">
                                                                                            <a href="#tab2" data-toggle="tab"><span class="step">2</span> <span class="title">Billing information</span> </a>
                                                                                        </li>
                                                                                        <li data-target="#step3" class="">
                                                                                            <a href="#tab3" data-toggle="tab"><span class="step">3</span> <span class="title">Domain Setup</span> </a>
                                                                                        </li>
                                                                                        <li data-target="#step4">
                                                                                            <a href="#tab4" data-toggle="tab"><span class="step">4</span> <span class="title">Save Form</span> </a>
                                                                                        </li>
                                                                                    </ul>
                                                                                    <div class="clearfix"></div>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="bhoechie-tab-content">
                                                                        <center>
                                                                        <h1 class="glyphicon glyphicon-cutlery" style="font-size:12em;color:#55518a"></h1>
                                                                        <h2 style="margin-top: 0;color:#55518a">Cooming Soon</h2>
                                                                        <h3 style="margin-top: 0;color:#55518a">Restaurant Diirectory</h3>
                                                                    </center>
                                                                    </div>
                                                                    <div class="bhoechie-tab-content">
                                                                        <center>
                                                                        <h1 class="glyphicon glyphicon-credit-card" style="font-size:12em;color:#55518a"></h1>
                                                                        <h2 style="margin-top: 0;color:#55518a">Cooming Soon</h2>
                                                                        <h3 style="margin-top: 0;color:#55518a">Credit Card</h3>
                                                                    </center>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-3">

                    <notification:UserControl runat="server" ID="wucNotification" />

                </div>
            </div>

        </div>
        <!-- END Page content-->
    </section>

</asp:Content>

