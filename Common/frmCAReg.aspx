<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmCAReg.aspx.cs" Inherits="Common_frmCAReg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html lang="en" class="no-ie">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" href="favicon.png" />
    <title>GST Saathi Admin : Registration for Chartered Accountant</title>
    <link rel="stylesheet" href="../Content/css/admin_style.css">
    <script type="text/javascript">
        function blockSpecialChar(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
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
                <div class="nav-wrapper text-center">
                    <h3 class="reg_page_heading">Complete Your Profile</h3>
                </div>
            </nav>
            <section class="registration_page_section">
                <div class="content-wrapper">
                    <div class="row">
                        <div id="pnlRegistration" runat="server" class="col-sm-10 col-xs-12 col-sm-offset-1" visible="true">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <span class="gstr_row_title">Registration No. :</span>
                                        <asp:Label runat="server" ID="lblRegNo" CssClass="registration_no_big" Style="font-family: 'Times New Roman'; color: black;" Text=""></asp:Label>
                                    </h4>
                                </div>
                                <div class="panel-body panel-divider-p0">
                                    <div class="form-horizontal">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Primary Contact Name :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Name" ID="txtName" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Organization Name :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Organisation Name" ID="txtOrganisationName" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Category :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" ID="txtCategory" placeholder="Category" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">PAN No :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" ID="txtPanNo" placeholder="PAN No" CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Mobile No. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" ID="txtMobileNo" placeholder="Mobile No." CssClass="form-control" Enabled="false"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Email Id. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" ID="txtEmailId" placeholder="Email Id." CssClass="form-control" Enabled="false"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <span class="gstr_row_title">Fill Other Details</span>
                                    </h4>
                                </div>
                                <div class="panel-body panel-divider-p0">
                                    <div class="form-horizontal">
                                        <asp:UpdatePanel runat="server" ID="upatpanel" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Organization Type :</label>
                                                            <div class="col-lg-12">
                                                                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlConsultantType">
                                                                    <asp:ListItem Value="00">Select</asp:ListItem>
                                                                    <asp:ListItem Value="01">ABC</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Designation :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" MaxLength="50" placeholder="Designation" onkeypress="return blockSpecialChar(event)" ID="txtDesignation" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="req" ControlToValidate="txtDesignation" ErrorMessage="Enter Designation" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Landline No. :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server"  onkeypress="return blockSpecialChar(event)" MaxLength="11" placeholder="LandLineNo" ID="txtLandLineNo" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtLandLineNo" ErrorMessage="Enter Landline No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator1" runat="server" SetFocusOnError="true" ControlToValidate="txtLandLineNo" ErrorMessage="Enter Correct Landline No." ValidationExpression="[0-9]{11}"></asp:RegularExpressionValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtLandLineNo" FilterMode="ValidChars" FilterType="Numbers"  />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Aadhaar No.: <span id="aadharstar" runat="server" style="color: red; display: none;">*</span></label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server"  onkeypress="return blockSpecialChar(event)" placeholder="Aadhaar No." MaxLength="12" ID="txtAadhaarNo" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtAadhaarNo" ErrorMessage="Enter Aadhaar No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator2" runat="server" SetFocusOnError="true" ControlToValidate="txtAadhaarNo" ErrorMessage="Enter Correct AadhaarNo." ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>
                                                                 <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtAadhaarNo" FilterMode="ValidChars" FilterType="Numbers"  />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Compltete Address :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" placeholder="Address" MaxLength="500" TextMode="MultiLine" ID="txtFullAddress" onkeypress="return blockSpecialChar(event)" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">State :</label>
                                                            <div class="col-lg-12">
                                                                <asp:DropDownList AutoPostBack="true" CssClass="chzn-select form-control" runat="server" ID="ddlState" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">City :</label>
                                                            <div class="col-lg-12">
                                                                <asp:DropDownList CssClass="chzn-select form-control" runat="server" ID="ddlCity">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12 control-label text-left-imp">Pin Code :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server"  onkeypress="return blockSpecialChar(event)" placeholder="XXXXXX" MaxLength="6" ID="txtPinCode" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtPinCode" ErrorMessage="Enter Pin Code." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator3" runat="server" SetFocusOnError="true" ControlToValidate="txtPinCode" ErrorMessage="Enter Correct Pin Code." ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                                                                 <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtPinCode" FilterMode="ValidChars" FilterType="Numbers"  />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <span class="gstr_row_title">Contact Details :</span>
                                    </h4>
                                </div>
                                <div class="panel-body panel-divider-p0">
                                    <div class="form-horizontal">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Contact Name :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Contact Name" onkeypress="return blockSpecialChar(event)" MaxLength="100" ID="txtAlternatePerson" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtAlternatePerson" ErrorMessage="Enter Contact Person." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                          <ajaxToolkit:FilteredTextBoxExtender ID="sss" runat="server" TargetControlID="txtAlternatePerson" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Mobile No. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server"  onkeypress="return blockSpecialChar(event)" placeholder="Mobile No" MaxLength="10" ID="txtAlternateMobile" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtAlternateMobile" ErrorMessage="Enter Mobile No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator5" runat="server" SetFocusOnError="true" ControlToValidate="txtAlternateMobile" ErrorMessage="Enter Correct Mobile No." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                         <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtAlternateMobile" FilterMode="ValidChars" FilterType="Numbers"  />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Email Id. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Email Id" MaxLength="50" ID="txtAlternateEmailId" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtAlternateEmailId" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true" ValidationGroup="validate" ControlToValidate="txtAlternateEmailId" CssClass="text-danger" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <span class="gstr_row_title">Bank Details :</span>
                                    </h4>
                                </div>
                                <div class="panel-body">
                                    <div class="form-horizontal">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Bank Name :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Bank Name" MaxLength="50" ID="txtBankName" onkeypress="return blockSpecialChar(event)" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtBankName" ErrorMessage="Enter Bank Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                         <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtBankName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Branch Name :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Branch Name" MaxLength="50" ID="txtBranchName" onkeypress="return blockSpecialChar(event)" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtBranchName" ErrorMessage="Enter Branch Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                         <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtBranchName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label class="col-lg-12">IFSC Code :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server"  placeholder="IFSC Code" MaxLength="11" ID="IFSCCode" onkeypress="return blockSpecialChar(event)" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator9" ControlToValidate="IFSCCode" ErrorMessage="Enter IFSC Code." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegExp1" ValidationGroup="validate" runat="server" ErrorMessage="Invalid IFSC Code" ControlToValidate="IFSCCode" SetFocusOnError="true" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\s]{11}$" />
                                                          <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="IFSCCode" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers"  />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label class="col-lg-12">A/C No. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" onkeypress="return blockSpecialChar(event)" placeholder="A/C No." MaxLength="20" ID="txtAccountNo" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator10" ControlToValidate="txtAccountNo" ErrorMessage="Enter Account No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                          <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtAccountNo" FilterMode="ValidChars" FilterType="Numbers"  />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer text-right">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <asp:Panel runat="server" Style="display: none" ID="pnlError" class="pull-left">
                                                <div class="alert alert-danger" style="margin-bottom: 0; margin-top: -4px">
                                                    <i class="fa r fa-info-circle"></i>
                                                    <asp:Label CssClass="error_msg" runat="server" ID="lblMsg"></asp:Label>
                                                </div>
                                            </asp:Panel>
                                            <div style="text-align: left">
                                                <asp:ValidationSummary CssClass="error_msg text text-danger" ValidationGroup="validate" runat="server" ID="validationSummary" />
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <%--OnClientClick="return validate()"--%>
                                            <asp:Button runat="server" ID="btnSave" Text="Save" ValidationGroup="validate" OnClick="btnSave_Click1" CssClass="btn btn-primary" />
                                            <asp:Button runat="server" ID="btnClear" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-warning" />
                                            <asp:Button runat="server" ID="btnExit" Text="Exit" OnClick="btnExit_Click" CssClass="btn btn-danger" />
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
    <link href="../Content/css/chosen.css" rel="stylesheet" />
    <script src="../Scripts/chosen.jquery.js"></script>

    <style>
        a img {
            border: none;
        }

        ol li {
            list-style: decimal outside;
        }

        div#container {
            width: 780px;
            margin: 0 auto;
            padding: 1em 0;
        }

        div.side-by-side {
            width: 100%;
            margin-bottom: 1em;
        }

            div.side-by-side > div {
                float: left;
                width: 50%;
            }

                div.side-by-side > div > em {
                    margin-bottom: 10px;
                    display: block;
                }

        .clearfix:after {
            content: "\0020";
            display: block;
            height: 0;
            clear: both;
            overflow: hidden;
            visibility: hidden;
        }
    </style>
    <script type="text/javascript">
        $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true });

        $('.chzn-search input[type="text"]').addClass('form-control');
        $('.chzn-single').addClass('form-control');

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true });
                    $('.chzn-search input[type="text"]').addClass('form-control');
                    $('.chzn-single').addClass('form-control');
                }
            });
        }
    </script>
</body>
</html>
