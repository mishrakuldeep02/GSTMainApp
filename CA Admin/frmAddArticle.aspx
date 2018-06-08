<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmAddArticle.aspx.cs" Inherits="CA_Admin_frmAddArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="content-wrapper">
            <h3>Add New Article</h3>
            <div class="col-xs-12">
                <div class="row">
                    <section class="registration_page_section">
                        <div class="row">
                            <div id="pnlRegistration" runat="server" class="col-sm-12 col-xs-12" visible="true">
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
                                                <asp:Button runat="server" ID="btnSave" Text="Save" ValidationGroup="validate" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                                                <asp:Button runat="server" ID="btnClear" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-warning" />
                                                <asp:Button runat="server" ID="btnExit" Text="Exit" OnClick="btnExit_Click" CssClass="btn btn-danger" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

