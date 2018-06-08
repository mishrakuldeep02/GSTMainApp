<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="FrmAddGSTIN.aspx.cs" Inherits="Client_FrmAddGSTIN" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    <script src="../Content/js/jquery.min.js"></script>
    <script src="../Content/js/bootstrap.min.js"></script>
    <script src="../Content/js/app.js"></script>
    <script src="../Content/js/index.js"></script>
    <link href="../Content/css/chosen.css" rel="stylesheet" />
    <script src="../Scripts/chosen.jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=btnSave.ClientID%>').click(function () {
                $('#<%=lblMsg.ClientID%>').html('');
                $('#<%=pnlError.ClientID%>').hide();
                var GSTIN = $('#<%=txtGSTINNO.ClientID%>').val().trim();
                <%--if ($('#<%=txtGSTINNO.ClientID%>').val().trim() == '') {
                    $('#<%=txtGSTINNO.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Please Enter GSTIN'); $('#<%=pnlError.ClientID%>').show();
                    return false;
                } else if ($('#<%=txtGSTINNO.ClientID%>').val().trim().length != 15) {
                    $('#<%=txtGSTINNO.ClientID%>').focus();
                     $('#<%=lblMsg.ClientID%>').html('Please Enter Correct GSTIN'); $('#<%=pnlError.ClientID%>').show();
                     return false;
                } else--%>
                if (parseInt(GSTIN.substring(0, 2)) != parseInt($('#<%=ddlState.ClientID%>').val().toString())) {
                    $('#<%=txtGSTINNO.ClientID%>').focus();
                        $('#<%=lblMsg.ClientID%>').html('Your GSTIN Does Not Contains Your Selected State.'); $('#<%=pnlError.ClientID%>').show();
                        return false;
                    }

                <%--                else if ($('#<%=txtcontactPersonName.ClientID%>').val().trim() == '') {
                    $('#<%=txtcontactPersonName.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Please Enter Contact Person.');
                    $('#<%=pnlError.ClientID%>').show();
                    return false;
                }
                else if ($('#<%=txtaddress.ClientID%>').val().trim() == '') {
                    $('#<%=txtaddress.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Please Enter Contact Person.');
                    $('#<%=pnlError.ClientID%>').show();
                    return false;
                }

                else if ($('#<%=ddlState.ClientID%>').val() == '0') {
                    $('#<%=lblMsg.ClientID%>').html('Please Select State');
                    $('#<%=ddlState.ClientID%>').focus();
                    $('#<%=pnlError.ClientID%>').show();
                    return false;
                }

                else if ($('#<%=ddlCity.ClientID%>').val() == '0') {
                    $('#<%=lblMsg.ClientID%>').html('Please Select City');
                    $('#<%=ddlCity.ClientID%>').focus();
                    $('#<%=pnlError.ClientID%>').show();
                    return false;
                }

                else if ($('#<%=txtpincode.ClientID%>').val().trim() == '') {
                    $('#<%=txtpincode.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Please Enter Mobile No.');
                    $('#<%=pnlError.ClientID%>').show();
                    return false;
                }

                else if ($('#<%=txtmobileno.ClientID%>').val().trim() == '') {
                    $('#<%=txtmobileno.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Please Enter Mobile No.');
                    $('#<%=pnlError.ClientID%>').show();
                    return false;
                }

                else if ($('#<%=txtEmailid.ClientID%>').val().trim() == '') {
                    $('#<%=txtEmailid.ClientID%>').focus();
                    $('#<%=lblMsg.ClientID%>').html('Please Enter Email ID.');
                    $('#<%=pnlError.ClientID%>').show();
                    return false;
                }--%>
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="content-wrapper">
            <div class="panel panel-default">

                <asp:ScriptManager runat="server" ID="scr"></asp:ScriptManager>

                <div class="panel-heading">
                    <h4 class="panel-title">
                        <span class="gstr_row_title">ADD GSTIN :</span>
                        <asp:Label runat="server" ID="lblRegNo" CssClass="registration_no_big" Text=""></asp:Label>
                    </h4>
                </div>
                <div class="panel-body panel-divider-p0">
                    <div class="form-horizontal">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-lg-12">GSTIN</label>
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" Style='text-transform: uppercase' onfocusout="this.value=this.value.toUpperCase()" placeholder="GSTIN" MaxLength="15" ID="txtGSTINNO" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtGSTINNO" ErrorMessage="Enter GSTIN" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="sss" runat="server" TargetControlID="txtGSTINNO" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Numbers" />
                                        <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator9" runat="server" SetFocusOnError="true" ControlToValidate="txtGSTINNo" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>

                                    </div>
                                </div>
                            </div>
                            <%-- <div class="col-sm-6">
                        <div class="form-group">
                            <label class="col-lg-12">PAN No :</label>
                            <div class="col-lg-12">
                                <asp:TextBox runat="server" placeholder="PAN NO" MaxLength="10" ID="txtpanno" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>--%>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-lg-12">Contact Person :</label>
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtcontactPersonName" MaxLength="50" placeholder="Contact Person Name" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtcontactPersonName" ErrorMessage="Enter Name" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtcontactPersonName" FilterMode="ValidChars" FilterType="LowercaseLetters,UppercaseLetters,Custom" ValidChars=" " />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">


                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-lg-12">Mobile No:</label>
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtmobileno" MaxLength="10" placeholder="Mobile No" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtmobileno" ErrorMessage="Enter Mobile No" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator5" runat="server" SetFocusOnError="true" ControlToValidate="txtmobileno" ErrorMessage="Enter Correct Mobile No." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtmobileno" FilterMode="ValidChars" FilterType="Numbers" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-lg-12">Email ID :</label>
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtEmailid" MaxLength="50" placeholder="Email ID" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtEmailid" ErrorMessage="Enter Email ID." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Enter Valid Email ID" SetFocusOnError="true" ValidationGroup="validate" ControlToValidate="txtEmailid" CssClass="text-danger" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <%--   onkeyup="keyUP(this)"--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-lg-12">Complete Address :</label>
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtaddress" MaxLength="150" placeholder="Complete Address" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
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


                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-lg-12">City :</label>
                                    <div class="col-lg-12">
                                        <asp:DropDownList CssClass="chzn-select form-control" runat="server" ID="ddlCity">
                                        </asp:DropDownList>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-lg-12">Pin Code</label>
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" MaxLength="6" ID="txtpincode" placeholder="Pin Code" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="text-danger" ValidationGroup="validate" runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtPinCode" ErrorMessage="Enter Pin Code." SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator CssClass="text-danger" ValidationGroup="validate" ID="RegularExpressionValidator3" runat="server" SetFocusOnError="true" ControlToValidate="txtPinCode" ErrorMessage="Enter Correct Pin Code." ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="txtPinCode" FilterMode="ValidChars" FilterType="Numbers" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-sm-6">
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
                            <div runat="server" style="text-align: left; display: none" id="pnlError">
                                <ul class="text-danger">
                                    <li>
                                        <div class="text-left">
                                            <asp:Label CssClass="error_msg " runat="server" ID="lblMsg"></asp:Label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <asp:ValidationSummary CssClass="error_msg text text-danger text-left" ValidationGroup="validate" runat="server" ID="validationSummary" />

                        </div>
                        <div class="col-sm-6">
                            <asp:Button runat="server" ValidationGroup="validate" ID="btnSave" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                            <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-warning" OnClick="btnClear_Click" />
                            <asp:Button runat="server" ID="btnExit" Text="Exit" CssClass="btn btn-danger" OnClick="btnExit_Click" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>

