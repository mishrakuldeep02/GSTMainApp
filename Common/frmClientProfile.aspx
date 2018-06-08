<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="frmClientProfile.aspx.cs" Inherits="Common_frmClientProfile" %>
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
    <title>GST Saathi Admin : Tax Payers / End User Registration</title>
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
                    <h3 class="reg_page_heading">Complete Your Profile</h3>
                </div>
            </nav>

            <section class="registration_page_section">
                <!-- START Page content-->

                <div class="content-wrapper">

                    <div class="row">
                        <div id="pnlRegistration" runat="server" class="col-sm-10 col-xs-12 col-sm-offset-1" visible="true">
                            <div class="row">
                                <div class="col-xs-12">
                                   
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <span class="gstr_row_title">Registration No. :</span>
                                        <asp:Label runat="server" ID="lblRegNo" CssClass="registration_no_big" Text="GSTXX001"></asp:Label>
                                    </h4>
                                </div>
                                <div class="panel-body panel-divider-p0">
                                    <div class="form-horizontal">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Name :</label>
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
                                                        <asp:TextBox runat="server" ID="txtCategory" CssClass="form-control" Enabled="false"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">PAN No :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" ID="txtPanNo" CssClass="form-control" Enabled="false"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Mobile No. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" ID="txtMobileNo" CssClass="form-control" Enabled="false"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Email Id. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" ID="txtEmailId" CssClass="form-control" Enabled="false"></asp:TextBox>

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
                                        
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Business Type :</label>
                                                    <div class="col-lg-12">
                                                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlBussinessType">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Business Nature :</label>
                                                    <div class="col-lg-12">
                                                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlBussinessNature">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Designation :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" MaxLength="45" placeholder="Designation" ID="txtDesignation" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator  CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="req" ControlToValidate="txtDesignation" ErrorMessage="Enter Designation" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Landline No. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" MaxLength="11" placeholder="LandLine No." ID="txtLandLineNo" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate"  runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtLandLineNo" ErrorMessage="Enter Landline No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator CssClass="text-danger"  ValidationGroup="validate" ID="RegularExpressionValidator1" runat="server" SetFocusOnError="true"      ControlToValidate="txtLandLineNo" ErrorMessage="Enter Correct Landline No."     ValidationExpression="[0-9]{11}"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Aadhaar No. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Aadhaar No." MaxLength="12" ID="txtAadhaarNo" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtAadhaarNo" ErrorMessage="Enter Aadhaar No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator CssClass="text-danger"  ValidationGroup="validate" ID="RegularExpressionValidator2" runat="server" SetFocusOnError="true"      ControlToValidate="txtAadhaarNo" ErrorMessage="Enter Correct AadhaarNo."     ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Complete Address :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server"  placeholder="Type" TextMode="MultiLine" MaxLength="500" ID="txtFullAddress" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:ScriptManager runat="server"></asp:ScriptManager>
                                        <asp:UpdatePanel runat="server" ID="upatpanel" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">State :</label>
                                                            <div class="col-lg-12">
                                                                <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" CssClass="chzn-select form-control" runat="server" ID="ddlState">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
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
                                                                <asp:TextBox runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="XXXXXX" MaxLength="6" ID="txtPinCode" CssClass="form-control"></asp:TextBox>
                                                               <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtPinCode"  ErrorMessage="Enter Pin Code."  SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                               <asp:RegularExpressionValidator CssClass="text-danger"  ValidationGroup="validate" ID="RegularExpressionValidator3" runat="server" SetFocusOnError="true"      ControlToValidate="txtPinCode" ErrorMessage="Enter Correct Pin Code."     ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
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
                                        <span class="gstr_row_title">Alternate Contact Details :</span>
                                    </h4>
                                </div>
                                <div class="panel-body panel-divider-p0">
                                    <div class="form-horizontal">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Contact Person :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Alternate Contact Person" MaxLength="100" ID="txtAlternatePerson" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtAlternatePerson" ErrorMessage="Enter Alternate Contact Person." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="sss" runat="server" TargetControlID="txtAlternatePerson" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Mobile No. :</label>
                                                    <div class="col-lg-12">
                                                        <!--onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" >-->
                                                        <asp:TextBox runat="server" AutoCompleteType="Disabled" placeholder="Alternate Mobile No" MaxLength="10" ID="txtAlternateMobile" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtAlternateMobile" ErrorMessage="Enter Alternate Mobile No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator CssClass="text-danger"  ValidationGroup="validate" ID="RegularExpressionValidator5" runat="server" SetFocusOnError="true" ControlToValidate="txtAlternateMobile" ErrorMessage="Enter Correct Mobile No." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"  TargetControlID="txtAlternateMobile" FilterMode="ValidChars" FilterType="Numbers" />


                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Email Id :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Alternate EmailId" MaxLength="50" ID="TextBox1" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator6" ControlToValidate="TextBox1" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true"  ValidationGroup="validate" ControlToValidate="TextBox1" CssClass="text-danger" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                                                        <asp:TextBox runat="server" placeholder="Bank Name" MaxLength="50" ID="txtBankName" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtBankName" ErrorMessage="Enter Bank Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtBankName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Branch Name :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="Branch Name" MaxLength="50" ID="txtBranchName" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtBranchName" ErrorMessage="Enter Branch Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtBranchName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label class="col-lg-12">IFSC Code :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="IFSC Code" MaxLength="11" ID="IFSCCode" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator  CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator9" ControlToValidate="IFSCCode" ErrorMessage="Enter IFSC Code." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="IFSCCode" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers"  />
                                                         <%--<asp:RegularExpressionValidator CssClass="text-danger"  ValidationGroup="validate" ID="RegularExpressionValidator4" runat="server" SetFocusOnError="true"      ControlToValidate="txtAlternateMobile" ErrorMessage="Enter IFSC Code."     ValidationExpression="^[0-9a-zA-Z ]+${11}"></asp:RegularExpressionValidator>--%>
                                                        <asp:RegularExpressionValidator ID="RegExp1" ValidationGroup="validate" runat="server" ErrorMessage="Invalid IFSC Code" ControlToValidate="IFSCCode"  SetFocusOnError="true" CssClass="text-danger"   ValidationExpression="^[a-zA-Z0-9\s]{11}$" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label class="col-lg-12">A/C No. :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="A/C No." MaxLength="20" ID="txtAccountNo" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger"  ValidationGroup="validate" runat="server" ID="RequiredFieldValidator10" ControlToValidate="txtAccountNo" ErrorMessage="Enter Account No." SetFocusOnError="true"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Work As  :</label>
                                                    <div class="col-lg-12">
                                                        <div class="col-lg-4">
                                                            <asp:RadioButton onchange="Hideshow()" runat="server" ID="rdbDirectly" Text="Directly" Checked="true" GroupName="Work" />
                                                        </div>
                                                        <div class="col-lg-8">
                                                            <asp:RadioButton onchange="Hideshow()" runat="server" ID="rdbUnderCA" Text="Under CA/Consultant" GroupName="Work" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="display: none;" id="divCANo">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Enter CA/Consultant No.:</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox runat="server" placeholder="CA/Consultant No." ID="txtCANo" MaxLength="8" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-lg-12">Enter GSTIN :</label>
                                                    <div class="col-lg-12">
                                                        <asp:TextBox Style='text-transform: uppercase' onfocusout="this.value=this.value.toUpperCase()" placeholder="GSTIN" runat="server" ID="txtGSTINNo" MaxLength="15" CssClass="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator11" ControlToValidate="txtGSTINNo" ErrorMessage="Enter GSTIN" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtGSTINNo" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers" />
                                                        <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator9" runat="server" SetFocusOnError="true" ControlToValidate="txtGSTINNo" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="panel-footer text-right">
                                    <%--OnClientClick="return validate()"--%> 
                                    <div class="row">
                                        <div class="col-lg-8">
                                         <asp:Panel runat="server" Style="display: none;" ID="pnlError" class="pull-left">
                                        <div class="">
                                           <%-- <i class="fa r fa-info-circle"></i>--%>
                                            <asp:Label CssClass="error_msg text-danger" runat="server" ID="lblMsg"></asp:Label>
                                        </div>
                                    </asp:Panel>
                                   </div>
                                        <div class="col-lg-4">
                                    <asp:Button runat="server" ID="btnSave"  ValidationGroup="validate" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                    <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-warning" OnClick="btnClear_Click" />
                                    <asp:Button runat="server" ID="btnExit" Text="Exit" CssClass="btn btn-danger" OnClick="btnClear_Click" />
                                         </div></div>
                                </div>
                                <div class="row">
                                    <asp:ValidationSummary CssClass="error_msg text text-danger"  ValidationGroup="validate" runat="server" ID="validationSummary"  />
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
    <script type="text/javascript">
        window.onload = function () {
            Hideshow();
        }
        function Hideshow() {
            if ($('#<%=rdbDirectly.ClientID%>').is(':checked')) {
                $('#divCANo').hide();
            } else {
                $('#divCANo').show();
            }
        }

       <%-- function validatesssss() {
            if ($('#<%=txtName.ClientID%>').val().trim() == '') {
                $('#<%=txtName.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Please Enter Name.');
                $('#<%=pnlError.ClientID%>').show();
                return false;
            } else if ($('#<%=txtEmailId.ClientID%>').val().trim() == '') {
                $('#<%=txtEmailId.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Please Enter EmailId.');
                $('#<%=pnlError.ClientID%>').show();
                return false;
            }
            else if ($('#<%=txtMobileNo.ClientID%>').val().trim() == '') {
                $('#<%=txtMobileNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Please Enter MobileNo.');
                $('#<%=pnlError.ClientID%>').show();
                return false;
            } else if ($('#<%=txtMobileNo.ClientID%>').val().length != 10) {
                $('#<%=txtMobileNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Please Enter Correct MobileNo.'); $('#<%=pnlError.ClientID%>').show();

                return false;
            }
            else if ($('#<%=txtPanNo.ClientID%>').val().trim() == '') {
                $('#<%=txtMobileNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Please Enter Pan No.'); $('#<%=pnlError.ClientID%>').show();
                return false;
            }
            else if ($('#<%=txtPanNo.ClientID%>').val().length != 10) {
                $('#<%=txtMobileNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Please Enter Correct Pan No.'); $('#<%=pnlError.ClientID%>').show();
                return false;
            }

            else if ($('#<%=txtGSTINNo.ClientID%>').val().trim() == '') {
                $('#<%=txtGSTINNo.ClientID%>').focus();
                 $('#<%=lblMsg.ClientID%>').html('Please Enter GSTIN NO.'); $('#<%=pnlError.ClientID%>').show();
                 return false;
             } else if ($('#<%=txtGSTINNo.ClientID%>').val().trim().length != 15) {
                 $('#<%=txtGSTINNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Please Enter Correct GSTIN NO.'); $('#<%=pnlError.ClientID%>').show();
                return false;
             } else if ($('#<%=txtGSTINNo.ClientID%>').val().trim().substring(0, 2) != $('#<%=ddlState.ClientID%>').val().trim().length == 1 ? '0' + $('#<%=ddlState.ClientID%>').val().trim() : $('#<%=ddlState.ClientID%>').val().trim()) {
                $('#<%=txtGSTINNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Your GSTIN Number Does Not Contains Your Selected State.'); $('#<%=pnlError.ClientID%>').show();
                return false;
            }
            else if ($('#<%=txtGSTINNo.ClientID%>').val().trim().substring(2, 12) != $('#<%=txtPanNo.ClientID%>').val().trim()) {
                $('#<%=txtGSTINNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Your GSTIN Number Does Not Contains Your Pan No.'); $('#<%=pnlError.ClientID%>').show();
                return false;
            }
   
        }--%>
    </script>
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
        $(document).ready(function () {
          
            $('#<%=btnSave.ClientID%>').click(function () {
                debugger;
                var GSTIN = $('#<%=txtGSTINNo.ClientID%>').val().trim();
                if ($('#<%=txtGSTINNo.ClientID%>').val().trim() == '') {
                    $('#<%=txtGSTINNo.ClientID%>').focus();
                     $('#<%=lblMsg.ClientID%>').html('Please Enter GSTIN'); $('#<%=pnlError.ClientID%>').show();
                     return false;
                } else if (GSTIN.length != 15) {
                     $('#<%=txtGSTINNo.ClientID%>').focus();
                 $('#<%=lblMsg.ClientID%>').html('Please Enter Correct GSTIN'); $('#<%=pnlError.ClientID%>').show();
                 return false;
                } else if (parseInt( GSTIN.substring(0, 2)) !=  parseInt($('#<%=ddlState.ClientID%>').val().toString())) {
                 $('#<%=txtGSTINNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Your GSTIN Does Not Contains Your Selected State.'); $('#<%=pnlError.ClientID%>').show();
                return false;
            }
                else if (GSTIN.trim().substring(2, 12) != $('#<%=txtPanNo.ClientID%>').val().trim()) {
                $('#<%=txtGSTINNo.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Your GSTIN Does Not Contains Your Pan No.'); $('#<%=pnlError.ClientID%>').show();
                return false;
            }
                if ($('#<%=rdbUnderCA.ClientID%>').is(':checked')) {
                    if ($('#<%=txtCANo.ClientID%>').val().trim() == '') {
                         $('#<%=txtCANo.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Please Enter CA Code.'); $('#<%=pnlError.ClientID%>').show();
                    return false;
                }
            }
            });
        });

    </script>
</body>
</html>
