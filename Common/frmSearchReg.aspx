<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmSearchReg.aspx.cs" Inherits="Common_frmSearchReg" %>

<!DOCTYPE html>
<html lang="en" class="no-ie">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="favicon.png" />
    <title>GST Saathi Admin : Registration</title>
    <link rel="stylesheet" href="../Content/css/admin_style.css">
</head>

<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <nav role="navigation" class="navbar navbar-default navbar-top navbar-fixed-top">
                <div class="navbar-header">
                    <a href="#" class="navbar-brand">
                        <div class="brand-logo">
                            <img src="../Content/img/logo.png" alt="App Logo" class="img-responsive">
                        </div>
                        <div class="brand-logo-collapsed">
                            <img src="../Content/img/logo-single.png" alt="App Logo" class="img-responsive">
                        </div>
                    </a>
                </div>
                <div class="nav-wrapper">
                </div>
            </nav>

            <section class="registration_page_section">
                <!-- START Page content-->
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-sm-6 col-xs-12 col-sm-offset-3 token_panel">
                            <div class="panel panel-default">
                                <div class="panel-body panel-divider-p0">
                                    <div class="form-horizontal">
                                        <div class="row">
                                             <h4 class="col-sm-6 col-sm-offset-3 mb20px">
                                               Enter Registration No :
                                            </h4>
                                            <div class="col-sm-6 col-sm-offset-3">
                                                <div class="form-group">                                          
                                                    <div class="col-lg-12">
                                                        <div class="input-group">
                                                            <asp:TextBox runat="server" ID="txtRegNo" placeholder="Registration No." class="form-control"></asp:TextBox>
                                                            <%--<input type="text" placeholder="Access Token / Registration No." class="form-control">--%>
                                                            <span class="input-group-btn">
                                                                <asp:LinkButton CssClass="btn btn-primary" OnClick="Unnamed_Click" Text="Go!" runat="server"></asp:LinkButton>
                                                            </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <asp:Panel runat="server" Visible="false" ID="pnlError" class="col-sm-6 col-sm-offset-3">
                                                <div class="alert alert-danger">                                          
                                                    <i class="fa r fa-info-circle"></i> 
                                                    <asp:Label CssClass="error_msg" runat="server" ID="lblMsg"></asp:Label>
                                                </div>
                                            </asp:Panel>
                                        </div>

                                    </div>
                                </div>
                            </div>
                          
                        </div>
                        
                        

                    </div>



                </div>
                <!-- END Page content-->

            </section>
        </div>
    </form>
    <script src="../Content/js/jquery.min.js"></script>
    <script src="../Content/js/bootstrap.min.js"></script>
    <script src="../Content/js/app.js"></script>
    <script src="../Content/js/index.js"></script>
</body>
</html>
