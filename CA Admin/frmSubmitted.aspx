<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmSubmitted.aspx.cs" Inherits="CA_Admin_frmSubmitted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="content-wrapper">
            <h3>Success</h3>
            <div class="col-xs-12">
                <div class="row">
                    <section class="registration_page_section">
                        <!-- START Page content-->
                        <div class="row" >
                            <div id="pnlRegistration" runat="server" class="col-sm-12 col-xs-12" visible="true">
                                
                                <div class="panel panel-default"  style="padding: 2%;">
                                    <div >
                                        <h3>Submitted Succesfully</h3>
                                    </div>
                                    <div >
                                        <asp:Label Text="" CssClass="text-success" ForeColor="Green" ID="lblMessage" runat="server" />
                                        <asp:HiddenField runat="server" ID="hfBack" />
                                        <asp:LinkButton runat="server" ID="lnkBack" Text="Back" OnClick="lnkBack_Click"></asp:LinkButton>
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

