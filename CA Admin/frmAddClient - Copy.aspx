<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmAddClient - Copy.aspx.cs" Inherits="CA_Admin_frmAddClient" %>

<%@ Register Src="~/UserControl/wucImportData.ascx" TagName="UserControlModal" TagPrefix="cc1" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
        });
      
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="modal fade" id="ProgressModal" role="dialog">
        <div class="modal-dialog  modal-sm" style="width: 228px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Processing Please Wait.</h4>
                </div>
                <div class="modal-body">
                    <img style="width: 100%; height: 100px;" src="../Content/img/loader4.gif" />
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <section>
        <div class="content-wrapper">
             <h3>Add New Client</h3>
            <div class="col-xs-12">
                <div class="row">
                    <section class="registration_page_section">
                        <!-- START Page content-->
                          <div class="row">
                                <div id="pnlRegistration" runat="server" class="col-sm-12 col-xs-12" visible="true">
                                    <div class="row">
                                        <div class="col-xs-12">
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                       
                                        <div class="panel-body panel-divider-p0">
                                            <div class="form-horizontal">
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Name :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" placeholder="Name" ID="txtName" MaxLength="75" CssClass="form-control clscapital"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator11" ControlToValidate="txtName" ErrorMessage="Enter Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Organization Name :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" placeholder="Organisation Name" MaxLength="75" ID="txtOrganisationName" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator12" ControlToValidate="txtOrganisationName" ErrorMessage="Enter Organisation Name." SetFocusOnError="true"></asp:RequiredFieldValidator>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--  <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Category :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" ID="txtCategory" CssClass="form-control" ></asp:TextBox>

                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Enter GSTIN :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox Style='text-transform: uppercase' onfocusout="this.value=this.value.toUpperCase()" placeholder="GSTIN" runat="server" ID="txtGSTINNo" MaxLength="15" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator13" ControlToValidate="txtGSTINNo" ErrorMessage="Enter GSTIN." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtGSTINNo" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers" />
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator9" runat="server" SetFocusOnError="true" ControlToValidate="txtGSTINNo" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">PAN No :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox placeholder="PAN No." Style='text-transform: uppercase' onfocusout="this.value=this.value.toUpperCase()" runat="server" ID="txtPanNo" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator14" ControlToValidate="txtPanNo" ErrorMessage="Enter PAN No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator4" runat="server" SetFocusOnError="true" ControlToValidate="txtPanNo" ErrorMessage="Enter Correct PAN No." ValidationExpression="([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}"></asp:RegularExpressionValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtPanNo" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Mobile No. :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" placeholder="Mobile No." ID="txtMobileNo" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator15" ControlToValidate="txtMobileNo" ErrorMessage="Enter Alternate Mobile No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator7" runat="server" SetFocusOnError="true" ControlToValidate="txtMobileNo" ErrorMessage="Enter Correct Mobile No." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtMobileNo" FilterMode="ValidChars" FilterType="Numbers" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Email Id. :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox MaxLength="50" placeholder="Email ID" runat="server" ID="txtEmailId" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator16" ControlToValidate="txtEmailId" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true" ValidationGroup="validate" ControlToValidate="txtEmailId" CssClass="text-danger" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="req" ControlToValidate="txtDesignation" ErrorMessage="Enter Designation" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtLandLineNo" ErrorMessage="Enter Landline No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator1" runat="server" SetFocusOnError="true" ControlToValidate="txtLandLineNo" ErrorMessage="Enter Correct Landline No." ValidationExpression="[0-9]{11}"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Aadhaar No. :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Aadhaar No." MaxLength="12" ID="txtAadhaarNo" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtAadhaarNo" ErrorMessage="Enter Aadhaar No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator2" runat="server" SetFocusOnError="true" ControlToValidate="txtAadhaarNo" ErrorMessage="Enter Correct AadhaarNo." ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Complete Address :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" placeholder="Type" TextMode="MultiLine" MaxLength="500" ID="txtFullAddress" CssClass="form-control"></asp:TextBox>
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
                                                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtPinCode" ErrorMessage="Enter Pin Code." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                        <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator3" runat="server" SetFocusOnError="true" ControlToValidate="txtPinCode" ErrorMessage="Enter Correct Pin Code." ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
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
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtAlternatePerson" ErrorMessage="Enter Alternate Contact Person." SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtAlternateMobile" ErrorMessage="Enter Alternate Mobile No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator5" runat="server" SetFocusOnError="true" ControlToValidate="txtAlternateMobile" ErrorMessage="Enter Correct Mobile No." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtAlternateMobile" FilterMode="ValidChars" FilterType="Numbers" />


                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Email Id :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" placeholder="Alternate EmailId" MaxLength="50" ID="TextBox1" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator6" ControlToValidate="TextBox1" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true" ValidationGroup="validate" ControlToValidate="TextBox1" CssClass="text-danger" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtBankName" ErrorMessage="Enter Bank Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtBankName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">Branch Name :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" placeholder="Branch Name" MaxLength="50" ID="txtBranchName" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtBranchName" ErrorMessage="Enter Branch Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtBranchName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">IFSC Code :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox Style='text-transform: uppercase' onfocusout="this.value=this.value.toUpperCase()" runat="server" placeholder="IFSC Code" MaxLength="11" ID="IFSCCode" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator9" ControlToValidate="IFSCCode" ErrorMessage="Enter IFSC Code." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="IFSCCode" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers" />
                                                                <%--<asp:RegularExpressionValidator CssClass="text-danger"  ValidationGroup="validate" ID="RegularExpressionValidator4" runat="server" SetFocusOnError="true"      ControlToValidate="txtAlternateMobile" ErrorMessage="Enter IFSC Code."     ValidationExpression="^[0-9a-zA-Z ]+${11}"></asp:RegularExpressionValidator>--%>
                                                                <asp:RegularExpressionValidator ID="RegExp1" ValidationGroup="validate" runat="server" ErrorMessage="Invalid IFSC Code" ControlToValidate="IFSCCode" SetFocusOnError="true" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\s]{11}$" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label class="col-lg-12">A/C No. :</label>
                                                            <div class="col-lg-12">
                                                                <asp:TextBox runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="A/C No." MaxLength="20" ID="txtAccountNo" CssClass="form-control"></asp:TextBox>
                                                                <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator10" ControlToValidate="txtAccountNo" ErrorMessage="Enter Account No." SetFocusOnError="true"></asp:RequiredFieldValidator>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="display:none;">
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
                                                    <asp:Button runat="server" ID="btnSave" ValidationGroup="validate" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                                    <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-warning" OnClick="btnClear_Click" />
                                                    <asp:Button runat="server" ID="btnExit" Text="Exit" CssClass="btn btn-danger" OnClick="btnClear_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <asp:ValidationSummary CssClass="error_msg text text-danger" ValidationGroup="validate" runat="server" ID="validationSummary" />
                                        </div>

                                    </div>
                                </div>

                            </div>
                        
                        <!-- END Page content-->

                    </section>
                </div>
            </div>
        </div>
    </section>
    <script>
        $(document).ready(function () {
            $('#liImportExcel').show();
        });
    </script>
    <script type="text/javascript">
        function SHowProgress() {
            if (validate() == false) {
                return false;

            } else
                $('#ProgressModal').modal({ backdrop: 'static', keyboard: false });
        }
        function OpenModal() {

        }
        function cl() {
            debugger;
            $('#wucImportData_lblImported').html('0');
            $('#wucImportData_lblTotalRecords').html('0');
            $('#wucImportData_lblMessage').html('');
            $('#wucImportData_Panel').hide();
        }
        function validate() {
            if ($('#wucImportData_ddlMonthYear').val() == '0') {
                alert("Please Select Month-Year.");
                $('#wucImportData_ddlMonthYear').focus();
                return false;
            }
        }

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
            $('#<%=lblMsg.ClientID%>').html('');
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
                } else if (parseInt(GSTIN.substring(0, 2)) != parseInt($('#<%=ddlState.ClientID%>').val().toString())) {
                    $('#<%=txtGSTINNo.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Your GSTIN Does Not Contains Your Selected State.'); $('#<%=pnlError.ClientID%>').show();
                    return false;
                }
                else if (GSTIN.trim().substring(2, 12) != $('#<%=txtPanNo.ClientID%>').val().trim()) {
                    $('#<%=txtGSTINNo.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Your GSTIN Does Not Contains Your Pan No.'); $('#<%=pnlError.ClientID%>').show();
                    return false;
                }
                
            });
        });
    </script>
</asp:Content>

