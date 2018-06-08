<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmAddClient.aspx.cs" Inherits="CA_Admin_frmAddClient" %>

<%@ Register Src="~/UserControl/wucImportData.ascx" TagName="UserControlModal" TagPrefix="cc1" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .lblstar
        {
            font-weight:600;
            color:red;
            position:absolute;
            padding-left:4px;
        }
    </style>
    <script>
        $(document).ready(function () {



            if ($("#<%=rpyes.ClientID%>").is(':checked')) {
                $("#<%=txtResDateFrom.ClientID %>").removeAttr('disabled');
                $("#<%=txtResDateTo.ClientID %>").removeAttr('disabled');
                // $("#<%=txtResDateFrom.ClientID %>").focus();
            }
            else {
                $("#<%=txtResDateFrom.ClientID %>").attr('disabled', 'disabled');
                $("#<%=txtResDateTo.ClientID %>").attr('disabled', 'disabled');
            }

            if ($("#<%=coyes.ClientID%>").is(':checked')) {
                $("#<%=txtCoDate.ClientID %>").removeAttr('disabled');
                // $("#<%=txtCoDate.ClientID %>").focus();
            }
            else {
                $("#<%=txtCoDate.ClientID %>").attr('disabled', 'disabled');
            }


            $("input[name$=co]").change(function () {
                if (this.value == 'coyes') {
                    $("#<%=txtCoDate.ClientID %>").removeAttr('disabled');
                    // $("#<%=txtCoDate.ClientID %>").focus();
                }
                else if (this.value == 'cono') {
                    $("#<%=txtCoDate.ClientID %>").attr('disabled', 'disabled');
                }
            });
            $("input[name$=rp]").change(function () {
                if (this.value == 'rpyes') {
                    $("#<%=txtResDateFrom.ClientID %>").removeAttr('disabled');
                    $("#<%=txtResDateTo.ClientID %>").removeAttr('disabled');
                    // $("#<%=txtResDateFrom.ClientID %>").focus();
                }
                else if (this.value == 'rpno') {
                    $("#<%=txtResDateFrom.ClientID %>").attr('disabled', 'disabled');
                    $("#<%=txtResDateTo.ClientID %>").attr('disabled', 'disabled');
                }
            });
        })
    </script>
    <script>
        $(document).ready(function () {
            
            $('#<%=btnSave.ClientID%>').click(function () {
                
                $('#<%=lblErrorMsg.ClientID%>').html('');
                $('#errorul').hide();
                if ($('#<%=coyes.ClientID%>').is(':checked') && $('#<%=txtCoDate.ClientID%>').val().trim() == '')
                {
                    $('#errorul').show();
                    $('#<%=lblErrorMsg.ClientID%>').html('Enter Composition Date.');
                    $('#<%=txtCoDate.ClientID%>').focus();
                    return false;
                } else if ($('#<%=rpyes.ClientID%>').is(':checked') && $('#<%=txtResDateFrom.ClientID%>').val().trim() == '') {
                    $('#errorul').show();
                    $('#<%=lblErrorMsg.ClientID%>').html('Enter From Date.');
                    $('#<%=txtResDateFrom.ClientID%>').focus();
                    return false;
                } else if ($('#<%=rpyes.ClientID%>').is(':checked') && $('#<%=txtResDateTo.ClientID%>').val().trim() == '') {
                    $('#errorul').show();
                    $('#<%=lblErrorMsg.ClientID%>').html('Enter To Date.');
                    $('#<%=txtResDateTo.ClientID%>').focus();
                    return false;
                }
            });
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
                                    <%-- <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <span class="gstr_row_title">Organization Details</span>
                                        </h4>
                                    </div>--%>
                                    <div class="panel-body panel-divider-p0">
                                        <div class="form-horizontal">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Organization Name :<span class="lblstar">*</span></label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" placeholder="Organisation Name" MaxLength="75" ID="txtOrganisationName" CssClass="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator12" ControlToValidate="txtOrganisationName" ErrorMessage="Enter Organisation Name." SetFocusOnError="true"></asp:RequiredFieldValidator>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                         <label class="col-lg-12">PAN No :<span class="lblstar">*</span></label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox placeholder="PAN No." Style='text-transform: uppercase' onfocusout="this.value=this.value.toUpperCase()" runat="server" ID="txtPanNo" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator14" ControlToValidate="txtPanNo" ErrorMessage="Enter PAN No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="validate" ID="RegularExpressionValidator4" runat="server" SetFocusOnError="true" ControlToValidate="txtPanNo" ErrorMessage="Enter Correct PAN No." ValidationExpression="([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}"></asp:RegularExpressionValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtPanNo" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Complete Address :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" placeholder="Type" TextMode="MultiLine" Rows="1" MaxLength="500" ID="txtFullAddress" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <asp:ScriptManager runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel runat="server" ID="updatepanel1">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                                 <label class="col-lg-12">State :<span class="lblstar">*</span></label>
                                                                <div class="col-lg-12">
                                                                    <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" CssClass="chzn-select form-control" runat="server" ID="ddlState">
                                                                    </asp:DropDownList>
                                                            <asp:CompareValidator CssClass="text-danger validation_error" SetFocusOnError="true" ErrorMessage="Select State" runat="server" ID="comparevalidator3" ValidationGroup="validate" ControlToValidate="ddlState" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                               <label class="col-lg-12">City : <%--<span class="lblstar">*</span>--%> </label>
                                                                <div class="col-lg-12">
                                                                    <asp:DropDownList CssClass="chzn-select form-control" runat="server" ID="ddlCity">
                                                                    </asp:DropDownList>
                                                            <%--<asp:CompareValidator CssClass="text-danger validation_error" SetFocusOnError="true" ErrorMessage="Select City" runat="server" ID="comparevalidator4" ValidationGroup="validate" ControlToValidate="ddlCity" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>--%>
                                                            <asp:CompareValidator CssClass="text-danger validation_error" SetFocusOnError="true" ErrorMessage="Select City" runat="server" ID="comparevalidator5" ValidationGroup="validate" ControlToValidate="ddlCity" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                               <label class="col-lg-12 control-label text-left-imp">Pin Code : <%--<span class="lblstar">*</span>--%> </label>
                                                                <div class="col-lg-12">
                                                                    <asp:TextBox runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="XXXXXX" MaxLength="6" ID="txtPinCode" CssClass="form-control"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtPinCode" ErrorMessage="Enter Pin Code." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="validate" ID="RegularExpressionValidator3" runat="server" SetFocusOnError="true" ControlToValidate="txtPinCode" ErrorMessage="Enter Correct Pin Code." ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <%-- <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <span class="gstr_row_title">Contact Details</span>
                                        </h4>
                                    </div>--%>
                                    <div class="panel-body panel-divider-p0">
                                        <div class="form-horizontal">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Primary Contact Person : <span class="lblstar">*</span></label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" placeholder="Name" ID="txtName" MaxLength="45" CssClass="form-control clscapital"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator11" ControlToValidate="txtName" ErrorMessage="Enter Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Mobile No. : <span class="lblstar">*</span></label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" placeholder="Mobile No." ID="txtMobileNo" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator15" ControlToValidate="txtMobileNo" ErrorMessage="Enter Alternate Mobile No." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="validate" ID="RegularExpressionValidator7" runat="server" SetFocusOnError="true" ControlToValidate="txtMobileNo" ErrorMessage="Enter Correct Mobile No." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" TargetControlID="txtMobileNo" FilterMode="ValidChars" FilterType="Numbers" />

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                         <label class="col-lg-12">Email Id. :<%--<span class="lblstar">*</span>--%></label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox MaxLength="50" placeholder="Email ID" runat="server" ID="txtEmailId" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator16" ControlToValidate="txtEmailId" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true" ValidationGroup="validate" ControlToValidate="txtEmailId" CssClass="text-danger validation_error" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Designation :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" MaxLength="45" placeholder="Designation" ID="txtDesignation" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="req" ControlToValidate="txtDesignation" ErrorMessage="Enter Designation" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Aadhaar No. :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Aadhaar No." MaxLength="12" ID="txtAadhaarNo" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtAadhaarNo" ErrorMessage="Enter Aadhaar No." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="validate" ID="RegularExpressionValidator2" runat="server" SetFocusOnError="true" ControlToValidate="txtAadhaarNo" ErrorMessage="Enter Correct AadhaarNo." ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>


                                        </div>
                                    </div>
                                    <%-- <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <span class="gstr_row_title">Alternate Contact Details :</span>
                                        </h4>
                                    </div>--%>
                                    <div class="panel-body panel-divider-p0">
                                        <div class="form-horizontal">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Alternate Contact Person :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" placeholder="Alternate Contact Person" MaxLength="100" ID="txtAlternatePerson" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtAlternatePerson" ErrorMessage="Enter Alternate Contact Person." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="sss" runat="server" TargetControlID="txtAlternatePerson" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Alternate Mobile No. :</label>
                                                        <div class="col-lg-12">
                                                            <!--onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" >-->
                                                            <asp:TextBox runat="server" AutoCompleteType="Disabled" placeholder="Alternate Mobile No" MaxLength="10" ID="txtAlternateMobile" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtAlternateMobile" ErrorMessage="Enter Alternate Mobile No." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="validate" ID="RegularExpressionValidator5" runat="server" SetFocusOnError="true" ControlToValidate="txtAlternateMobile" ErrorMessage="Enter Correct Mobile No." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtAlternateMobile" FilterMode="ValidChars" FilterType="Numbers" />


                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Alternate Email Id :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" placeholder="Alternate EmailId" MaxLength="50" ID="TextBox1" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator6" ControlToValidate="TextBox1" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true" ValidationGroup="validate" ControlToValidate="TextBox1" CssClass="text-danger validation_error" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <%--    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <span class="gstr_row_title">Turnover Details :</span>
                                        </h4>
                                    </div>--%>
                                    <div class="panel-body  panel-divider-p0">
                                        <div class="form-horizontal">
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-xs-12">Turnover Last Financial Year :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox ID="txtAggrTurnOver" runat="server" MaxLength="15" CssClass="form-control" placeholder="Amount" />
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAggrTurnOver" FilterMode="ValidChars" FilterType="Numbers" />
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtAggrTurnOver" ErrorMessage="Enter Turn Over" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-xs-12">Turnover April-2017 to June-2017 :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox ID="txtAggrTurnOverAprJun" runat="server" CssClass="form-control" placeholder="Amount" />
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtAggrTurnOverAprJun" FilterMode="ValidChars" FilterType="Numbers" />
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtAggrTurnOverAprJun" ErrorMessage="Enter Turn Over Apr-Jun" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">

                                                        <label class="col-xs-12 label-w-radio">
                                                            Composition Opted : 
                                                            <asp:RadioButton Text="Yes" GroupName="co" ID="coyes" runat="server" />
                                                            <asp:RadioButton Text="No" GroupName="co" ID="cono" runat="server" Checked="true" />
                                                        </label>

                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" data-date-maxViewMode="4" data-date-autoclose="true" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtCoDate" placeholder="DD/MM/YYYY (Applicable from)" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-xs-12">
                                                            Whether Non Resident Taxable Person : 
                                                              
                                                        </label>
                                                        <div class="col-lg-12 label-w-radio">

                                                            <asp:RadioButton Text="Yes" GroupName="rp" ID="rpyes" runat="server" />
                                                            <asp:RadioButton Text="No" GroupName="rp" ID="rpno" runat="server" Checked="true" />
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-xs-12">From Date :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtResDateFrom" placeholder="DD/MM/YYYY" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label class="col-xs-12">To Date :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtResDateTo" placeholder="DD/MM/YYYY" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <span class="gstr_row_title">ADD GSTIN :</span>
                                            <asp:Label runat="server" ID="lblRegNo" CssClass="registration_no_big" Text=""></asp:Label>
                                        </h4>
                                    </div>
                                    <div class="panel-body panel-divider-p0">
                                        <div class="form-horizontal">
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                      <label class="col-lg-12">GSTIN : <span class="lblstar">*</span>  </label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" Style='text-transform: uppercase' onfocusout="this.value=this.value.toUpperCase()" placeholder="GSTIN" MaxLength="15" ID="txtGSTINNO" CssClass="form-control"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator17" ControlToValidate="txtGSTINNO" ErrorMessage="Enter GSTIN" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtGSTINNO" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers" />
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator10" runat="server" SetFocusOnError="true" ControlToValidate="txtGSTINNo" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>
                                                                <asp:Label CssClass="text-danger " runat="server" ID="lblMsg"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                         <label class="col-lg-12">Trade Name :<span class="lblstar">*</span></label><div class="col-xs-12">
                                                            <asp:TextBox runat="server" MaxLength="100" ID="txtTradeName" CssClass="form-control" placeholder="Trade Name"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator8" ControlToValidate="txtTradeName" ErrorMessage="Enter Trade Name." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            <%--<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtTradeName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />--%>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Date of Registration :</label><div class="col-xs-12">
                                                            <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtDateOfReg" placeholder="Date of Registration"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator9" ControlToValidate="txtDateOfReg" ErrorMessage="Enter Trade Name." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">GST Username : <span class="lblstar">*</span></label><div class="col-xs-12">
                                                            <asp:TextBox ID="txtGSTUSerName" MaxLength="40" runat="server" CssClass="form-control" placeholder="GST Username"></asp:TextBox>
                                                            <asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtGSTUSerName" ErrorMessage="Enter GST UserName." SetFocusOnError="true"></asp:RequiredFieldValidator>

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Complete Address :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtaddress" Rows="1" MaxLength="150" placeholder="Complete Address" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel2" ><ContentTemplate>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                         <label class="col-lg-12">State :<%--<span class="lblstar">*</span>--%></label>
                                                        <div class="col-lg-12">
                                                            <asp:DropDownList AutoPostBack="true" CssClass="chzn-select form-control" runat="server" ID="ddlstate1" OnSelectedIndexChanged="ddlstate1_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <%--<asp:CompareValidator CssClass="text-danger validation_error" SetFocusOnError="true" ErrorMessage="Select State" runat="server" ID="comparevalidator1" ValidationGroup="ValidateGSTIN" ControlToValidate="ddlstate1" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>--%>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                         <label class="col-lg-12">City :<%--<span class="lblstar">*</span>--%></label>
                                                        <div class="col-lg-12">
                                                            <asp:DropDownList CssClass="chzn-select form-control" runat="server" ID="ddlcity1">
                                                            </asp:DropDownList>
                                                            <%--<asp:CompareValidator CssClass="text-danger validation_error" SetFocusOnError="true" ErrorMessage="Select City" runat="server" ID="comparevalidator2" ValidationGroup="ValidateGSTIN" ControlToValidate="ddlcity1" ValueToCompare="0" Operator="NotEqual"></asp:CompareValidator>--%>
                                                            <asp:CompareValidator CssClass="text-danger validation_error" SetFocusOnError="true" ErrorMessage="Select City" runat="server" ID="comparevalidator6" ValidationGroup="ValidateGSTIN" ControlToValidate="ddlcity1" ValueToCompare="-1" Operator="NotEqual"></asp:CompareValidator>

                                                        </div>
                                                    </div>

                                                </div>
</ContentTemplate></asp:UpdatePanel>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                         <label class="col-lg-12">Pin Code :<%--<span class="lblstar">*</span>--%></label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" MaxLength="6" ID="txtPinCode1" placeholder="Pin Code" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator19" ControlToValidate="txtPinCode1" ErrorMessage="Enter Pin Code." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator11" runat="server" SetFocusOnError="true" ControlToValidate="txtPinCode1" ErrorMessage="Enter Correct Pin Code." ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtPinCode1" FilterMode="ValidChars" FilterType="Numbers" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                         <label class="col-lg-12">Authorized Signatory :<%--<span class="lblstar">*</span>--%></label><div class="col-xs-12">
                                                            <asp:TextBox runat="server" MaxLength="40" CssClass="form-control" ID="txtAuthorisedSign" placeholder="Authorized Signatory"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator10" ControlToValidate="txtAuthorisedSign" ErrorMessage="Enter Authorised Signatory." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Designation :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" ID="txtDesignation1" MaxLength="50" placeholder="Designation" CssClass="form-control"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Mobile No:</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" ID="txtmobileno1" MaxLength="10" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator20" ControlToValidate="txtmobileno1" ErrorMessage="Enter Mobile No" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator12" runat="server" SetFocusOnError="true" ControlToValidate="txtmobileno" ErrorMessage="Enter Correct Mobile No." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="txtmobileno1" FilterMode="ValidChars" FilterType="Numbers" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Email ID :</label>
                                                        <div class="col-lg-12">
                                                            <asp:TextBox runat="server" ID="txtEmailId1" MaxLength="50" placeholder="Email ID" CssClass="form-control"></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator21" ControlToValidate="txtEmailId1" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true" ValidationGroup="ValidateGSTIN" ControlToValidate="txtEmailId1" CssClass="text-danger validation_error" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                            <%--   onkeyup="keyUP(this)"--%>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                       <label class="col-lg-12">Aadhaar No. :  <%--<span class="lblstar">*</span>--%></label><div class="col-xs-12">
                                                            <asp:TextBox runat="server" MaxLength="12" ID="txtAadhaarNo1" CssClass="form-control" placeholder="Aadhaar No."></asp:TextBox>
                                                            <%--<asp:RequiredFieldValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" runat="server" ID="RequiredFieldValidator13" ControlToValidate="txtAadhaarNo1" ErrorMessage="Enter Aadhaar No." SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator1" runat="server" SetFocusOnError="true" ControlToValidate="txtAadhaarNo1" ErrorMessage="Enter Correct AadhaarNo." ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtAadhaarNo1" FilterMode="ValidChars" FilterType="Numbers" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Registered as ISD :</label><div class="col-xs-12">
                                                            <asp:RadioButton ID="rdbISDYes" Text="Yes" GroupName="isd" runat="server" />
                                                            <asp:RadioButton ID="rdbISDNo" Text="No" GroupName="isd" runat="server" Checked="true" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Registered as TDS:</label><div class="col-xs-12">
                                                            <asp:RadioButton ID="rdbTDSYes" Text="Yes" GroupName="tds" runat="server" />
                                                            <asp:RadioButton ID="rdbTDSNo" Text="No" GroupName="tds" runat="server" Checked="true" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label class="col-lg-12">Whether e-Commerce Opertor :</label><div class="col-xs-12">
                                                            <asp:RadioButton ID="rdbTCSYes" Text="Yes" GroupName="ecom" runat="server" />
                                                            <asp:RadioButton ID="rdbTCSNo" Text="No" GroupName="ecom" runat="server" Checked="true" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer text-right">
                                        <div class="row">
                                            <div class="col-sm-6">

                                                <div class="col-xs-12" style="display: none">
                                                    <asp:Panel runat="server" Style="display: none;" class="pull-left">
                                                        <div class="alert alert-danger" style="margin-bottom: 0; margin-top: -4px">
                                                            <i class="fa r fa-info-circle"></i>

                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div runat="server" style="text-align: left; display: none" id="Div1">
                                                    <ul class="text-danger">
                                                        <li>
                                                            <div class="text-left">
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <asp:ValidationSummary CssClass="error_msg text text-danger text-left" ValidationGroup="ValidateGSTIN" runat="server" ID="validationSummary2" />

                                            </div>
                                            <div class="col-sm-6">
                                                <asp:Button runat="server" ValidationGroup="ValidateGSTIN" ID="btnAdd" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                                                <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-warning" OnClick="btnClear_Click" />

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="table-responsive">
                                        <asp:GridView runat="server" ID="grdGSTIN" OnRowCommand="grdGSTIN_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-sm">
                                            <Columns>
                                                <asp:BoundField HeaderText="GSTIN" DataField="GSTNNO" />
                                                <asp:BoundField HeaderText="Trade Name" DataField="TradeName" />
                                                <asp:BoundField HeaderText="Date of Registration" DataField="DateOfReg" />
                                                <asp:BoundField HeaderText="Complete Address" DataField="ContactAddress" />
                                                <asp:BoundField HeaderText="GST Username" DataField="GSTUserName" />
                                                <asp:BoundField HeaderText="Authorized Signatory" DataField="AuthorisedSignetory" />
                                                <asp:BoundField HeaderText="Designation" DataField="Designation" />
                                                <asp:BoundField HeaderText="Mobile No." DataField="ContactMobileNo" />
                                                <asp:BoundField HeaderText="Email" DataField="ContactEmailid" />
                                                <asp:BoundField HeaderText="AadhaarNo" DataField="AadhaarNo" />
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <i style="position:absolute;margin-top:4px;margin-left:4px;color:white" class='fa r fa-trash-o'></i><asp:Button style="padding-left:20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                      <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <%--                                        <table class="table table-bordered table-sm">
                                            <thead>
                                                <tr>
                                                    <th>GSTIN</th>
                                                    <th>Trade Name</th>
                                                    <th>Date of Registration</th>
                                                    <th>Complete Address</th>
                                                    <th>GST Username</th>
                                                    <th>Authorized Signatory</th>
                                                    <th>Name</th>
                                                    <th>Designation</th>
                                                    <th>Mobile No.</th>
                                                    <th>Email</th>
                                                    <th>Aadhaar No.</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>23XXXXX1234X1Z1</td>
                                                    <td>Example example</td>
                                                    <td>22/08/2016</td>
                                                    <td>Indore</td>
                                                    <td>GSTUSER678</td>
                                                    <td>Example example</td>
                                                    <td>Amit Yadav</td>
                                                    <td>Developer</td>
                                                    <td>9179856895</td>
                                                    <td>amit@gmail.com </td>
                                                    <td>986745968475</td>
                                                    <td><a href="#" class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</a></td>
                                                </tr>
                                            </tbody>
                                        </table>--%>
                                    </div>
                                    <div class="panel-footer text-center">
                                        <div class="row">
                                            <asp:Button Text="Save" ID="btnSave" ValidationGroup="validate" OnClick="Unnamed_Click" CssClass="btn btn-success" runat="server" />
                                            <asp:Button Text="Clear" OnClick="Unnamed_Click1" CssClass="btn btn-warning" runat="server" />
                                            <asp:Button Text="Exit" ID="btnExit" OnClick="btnExit_Click" CssClass="btn btn-danger" runat="server" />
                                        </div>
                                    </div>
                                    <asp:Label runat="server" style="margin-left:5px;" ID="lbl" CssClass="text-danger"></asp:Label>
                                    <ul class="text-danger"id="errorul" style="display:none;">
                                        <li>
                                    <asp:Label runat="server" ID="lblErrorMsg" CssClass="text-danger"></asp:Label>
                                     </li>   </ul>
                                    <asp:ValidationSummary CssClass="error_msg text text-danger text-left" ValidationGroup="validate" runat="server" ID="validationSummary1" />

                                </div>
                            </div>

                        </div>

                      <%--  </ContentTemplate>
                            <triggers>
                                <asp:PostBackTrigger ControlID="btnSave" />
                            </triggers>
                        </asp:UpdatePanel>--%>
                        <!-- END Page content-->

                    </section>
                </div>
            </div>
        </div>
    </section>
    <script>
        $(function () {
            $('.datepicker_theme').datepicker(
                { yearRange:'1999:2012', }
                );
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
function GetPopup() {
    debugger;
    $('#ContentPlaceHolder1_ddlCity_chzn').focus();
}
$(document).ready(function () {

    $('#<%=btnAdd.ClientID%>').click(function () {
        $('#<%=lblMsg.ClientID%>').html('');
        debugger;
        var GSTIN = $('#<%=txtGSTINNO.ClientID%>').val().trim();
        <%--if ($('#<%=txtGSTINNO.ClientID%>').val().trim() == '') {
            $('#<%=txtGSTINNO.ClientID%>').focus();
            $('#<%=lblMsg.ClientID%>').html('Please Enter GSTIN');
            return false;
        } else if (GSTIN.length != 15) {
            $('#<%=txtGSTINNO.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Please Enter Correct GSTIN');
                    return false;
        } else--%>
        if (GSTIN != '') {
             if (GSTIN.trim().substring(2, 12) != $('#<%=txtPanNo.ClientID%>').val().trim()) {
                $('#<%=txtGSTINNO.ClientID%>').focus();
                $('#<%=lblMsg.ClientID%>').html('Your GSTIN Does Not Contains Your Pan No.');
                return false;
            }
        }

    });
});
    </script>
</asp:Content>

