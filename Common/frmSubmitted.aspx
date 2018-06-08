<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmSubmitted.aspx.cs" Inherits="Common_frmSubmitted" %>

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
    
    <script src="../Content/js/jquery.min.js"></script>
    <script src="../Content/js/bootstrap.min.js"></script>
    <script src="../Content/js/app.js"></script>
    <script src="../Content/js/index.js"></script>
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
            
     <div class="container">
        <div class="row">
           
                <div class="container">

                    <div class="row">
                        <div class="">
                            <div class="" style="margin-top:100px;font-size:16px;">

                                <h3>Submitted Succesfully</h3>
                                
                                <div class="panel panel-success">
                                <asp:Label Text="" ForeColor="Green" ID="lblMessage" runat="server" />
                                </div>
                           
                            </div>

                        </div>
                    </div>

                </div>
           
        </div>
    </div>   
            </div>
        </form>
        </body>
    </html>
