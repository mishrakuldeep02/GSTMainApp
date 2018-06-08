<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmLogin.aspx.cs" Inherits="Common_frmLogin" %>

<!DOCTYPE html>
<html lang="en" class="no-ie">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="favicon.png" />
    <title>GST Saathi Admin</title>
    <link rel="stylesheet" href="Content/css/admin_style.css">
</head>
<body>
    <form runat="server">
        <div class="row row-table page-wrapper">
               <nav role="navigation" class="navbar navbar-default navbar-top navbar-fixed-top" style="position:fixed">
                <div class="navbar-header">
                    <a href="#" class="navbar-brand">
                        <div class="brand-logo">
                            <img src="Content/img/logo.png" alt="App Logo" class="img-responsive" />
                        </div>
                        <div class="brand-logo-collapsed">
                            <img src="Content/img/logo-single.png" alt="App Logo" class="img-responsive" />
                        </div>
                    </a>
                </div>
                <div class="nav-wrapper">
                    <ul class="nav navbar-nav">
                        <!--<li>
                            <a href="#" data-toggle-state="aside-collapsed"  class="hidden-xs ham-nav2">
                                <em class="fa fa-navicon"></em>
                            </a>
                        </li>-->
                    </ul>
                    <div class="col-sm-8 oswalhead text-center">
                        <%--<asp:Label ID="lblOrgName" runat="server" />--%>
                        <label class="lbtext">GST Return Filing Portal</label>
                         <label class="lbtext">GST Return Filing Portal</label>
                    </div>
                    <ul class="nav navbar-nav">
                      <!--  <li>
                            <a href="#" data-toggle-state="aside-collapsed aside-toggled" class="visible-xs">
                                <em class="fa fa-navicon"></em>
                            </a>
                        </li>-->
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                       <!-- <li>
                            <a href="../Logout.aspx" id="logout" title="Logout" class="text-center">
                                <em class="fa fa-power-off" style="margin-top: -7px; display: block; font-size: 16px; margin-bottom: -39px;"></em>
                                <span style="display: block; margin-top: 38px; font-size: 11px; text-align: center; margin-bottom: -25px;">Logout</span>
                            </a>
                        </li>-->
                    </ul>
                </div>
            </nav>
            <div class="col-lg-3 col-md-6 col-sm-8 col-xs-12 align-middle">
                <div class="panel panel-dark panel-flat">
                    <div class="panel-heading text-center">
                        <a href="#">
                            <img src="Content/img/login-logo.png" alt="Image" class="block-center img-rounded gstr-login-logo">
                        </a>
                    </div>
                    <div class="panel-body">
                        <div class="alert alert-danger" runat="server" style="display: none" id="pnlAlert">
                            <asp:Label runat="server" ID="lblErrorMsg"></asp:Label>
                        </div>
                        <div class="mb-lg">
                            <div class="text-right mb-sm ">
                                <a href="frmRequestForDemo.aspx">Registration Form</a>
                            </div>
                            <div class="form-group has-feedback">
                                <asp:TextBox runat="server" ID="txtLoginId" placeholder="Enter email" class="form-control"></asp:TextBox>
                                <span class="fa fa-envelope form-control-feedback text-muted"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <asp:TextBox runat="server" ID="txtPassWord" placeholder="Password" class="form-control" TextMode="Password"></asp:TextBox>
                                <span class="fa fa-lock form-control-feedback text-muted"></span>
                            </div>
                            <div class="clearfix">
                                <div class="checkbox c-checkbox pull-left mt0">
                                    <label>
                                        <asp:CheckBox runat="server" ID="chkRememberMe" />
                                        <%--<input type="checkbox" value="">--%>
                                        <span class="fa fa-check"></span>Remember Me</label>
                                </div>
                                <div class="pull-right">
                                    <%--<a href="#" class="text-muted">Forgot your password?</a>--%>
                                </div>
                            </div>
                            <asp:Button runat="server" OnClientClick="return validate()" class="btn btn-block btn-primary" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
    <script src="Content/js/jquery.min.js"></script>
    <script src="Content/js/bootstrap.min.js"></script>
    <script src="Content/js/app.js"></script>
    <script src="Content/js/index.js"></script>
    <script type="text/javascript">
        function validate() {
            if ($('#<%=txtLoginId.ClientID%>').val().trim() == '') {
                $('#<%=txtLoginId.ClientID%>').focus();
                $('#<%=lblErrorMsg.ClientID%>').html('Please Enter Login Id.');
                $('#pnlAlert').show();
                return false;
            } else if ($('#<%=txtPassWord.ClientID%>').val().trim() == '') {
                $('#<%=txtPassWord.ClientID%>').focus();
                $('#<%=lblErrorMsg.ClientID%>').html('Please Enter Password.');
                $('#pnlAlert').show();
                return false;
            }
    }
    </script>

</body>
</html>
