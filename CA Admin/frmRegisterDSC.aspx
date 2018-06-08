<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmRegisterDSC.aspx.cs" Inherits="CA_Admin_frmRegisterDSC" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
            $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
            $('.liImportExcel').show();
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="content-wrapper">

            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <asp:ScriptManager runat="server" ID="drc"></asp:ScriptManager>
            <h3 class="second_heading">Register DSC</h3>
            <div class="col-xs-12">
                <div class="row">
                    <section class="registration_page_section">
                        <!-- START Page content-->

                        <div class="row">
                            <div id="pnlRegistration" runat="server" class="col-sm-12 col-xs-12" visible="true">

                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <asp:Button ID="btnSendOtp" runat="server" OnClick="btnSendOtp_Click" Text="Connect To GSTIN" CssClass="btn btn-primary" />
                                            </div>

                                            <div class="col-sm-12" id="DivOTP" runat="server" style="display: none;">
                                                <asp:TextBox runat="server" ID="txtOtp" Text="575757" />
                                                <asp:Button ID="btnVarify" runat="server" OnClick="btnVarify_Click" Text="Verify OTP" CssClass="btn btn-primary" />
                                            </div>
                                            <div id="DivVerify" runat="server" class="col-sm-12" style="display: none; margin-top: 5px;">
                                                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegDsc_Click" Text="Register DSC" CssClass="btn btn-primary" />
                                                <asp:Button ID="btnDeRegister" runat="server" OnClick="btnDeRegister_Click" Text="DeRegister DSC" Style="margin-top: 5px;" CssClass="btn btn-primary" />

                                            </div>

                                            <div class="col-sm-12">
                                                <asp:Label ID="GSTR1Desc" runat="server"></asp:Label>
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

