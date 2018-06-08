<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmChangePassword.aspx.cs" Inherits="CA_Admin_frmChangePassword" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .btn-min-changepassword {
            min-width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <%--  <script type="text/javascript">
        $(document).ready(function () {
            $("#div1").hide();
            $("#div2").hide();
            $("#gtopt").click(function () {
                $("#div1").show();
                $("#div2").show();
            });
        });
</script>--%>
<%--    <script type="text/javascript">
        window.onload = function () {
            var x = document.getElementById('Lbl_ErrorMsg').innerText;
            if (x == "OTP Successfully Sent") {
                $("#div1").show();
            }
        }</script>--%>
    <section>
        <div class="content-wrapper">
            <%--<cc1:UserControl runat="server" ID="wucTaxPayerStrip" />--%>
            <h3 class="second_heading">Change Password</h3>
            <div class="row">
                <div class="col-sm-offset-2 col-sm-8 form-horizontal" id="Div2">

                    <div class="panel panel-default">
                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Old Password :</label>
                                <div class="col-sm-5">
                                    <asp:TextBox runat="server" TextMode="Password"  CssClass="form-control" placeholder="Enter Old Password" ID="Text_OldOtp"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:LinkButton Text="Generate OTP" runat="server" CssClass="btn btn-primary btn-min-changepassword" OnClick="GenerateOtp_Click"/>
                                </div>
                            </div>
                              </div>
                    </div>
   <div id="DivOtp" class="panel panel-default"  runat="server">
    <%--   <div id="CostTable" style="visibility:hidden" runat="server">--%>
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Enter OTP :</label>
                                <div class="col-sm-5">
                                    <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter OTP" ID="Txt_VerifyOtp"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:LinkButton Text="Verify OTP" runat="server" CssClass="btn btn-info  btn-min-changepassword" OnClick="VerifyOtp_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                         <div id="DivPw" class="panel panel-default" runat="server">
                        <div class="panel-body">      
                            
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Enter New Password :</label>
                                <div class="col-sm-5">
                                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter New Password" ID="Txt_EnewPW"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Re-Enter New Password&nbsp;:</label>
                                <div class="col-sm-5">
                                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" placeholder="Re-Enter New Password" ID="Txt_RNewPW"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-5 ">
                                    <asp:LinkButton Text="Change Password" runat="server" CssClass="btn btn-success" OnClick="Changepassword_Click" />
                                    <asp:LinkButton Text="Cancel" runat="server" CssClass="btn btn-danger" OnClick="Cancel_Click"/>
                                </div>
                            </div>                                  
                        </div>                     
                    </div>
                    <div>
                          <asp:Label runat="server" ForeColor="Red" ID="Lbl_ErrorMsg" Visible="False">please Select Old password</asp:Label>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
</asp:Content>


