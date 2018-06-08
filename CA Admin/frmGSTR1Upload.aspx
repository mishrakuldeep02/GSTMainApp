<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGSTR1Upload.aspx.cs" Inherits="CA_Admin_frmGSTR1Upload" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
      <div class="content-wrapper ">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
          <h3 class="second_heading">Upload GSTR1 Data</h3>
            <div class="col-sm-12 col-xs-12">
                <div class="col-lg-3">
               </div>
                <div class="col-md-12 pull-left col-xs-12">
                    <div class="row">
                        <div class="panel panel-default panel-demo">
                            <div class="panel-heading">
                                <h4 class="panel-title">Upload GSTR1 Data :
                                </h4>
                            </div>
                            <div class="panel-body">
                                    <div class="form-horizontal">
                                        <div class="">
                                       <div class="row form-group" >
                                            
                                                <div class="col-lg-4">
                                                <asp:Button runat="server" ID="btnGenerateOtp" Text="Generate OTP" CssClass="btn btn-primary btn-md" OnClick="btnGenerateOtp_Click" />
                                                    <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-warning" OnClick="btnClear_Click" />
                                                    </div>
                                                <div class="col-lg-4">
                                                    <asp:Label runat="server" ID="lblmsg" CssClass="text-success"></asp:Label>
                                                </div>
                                            </div>
                                        
                                        <div class="row form-group">
                                            <label class="col-lg-2">Enter OTP :</label>
                                            <div class="col-lg-4"><asp:TextBox disabled="disabled" runat="server" ID="txtOtp" MaxLength="10" CssClass="form-control"></asp:TextBox></div>
                                            <div class="col-lg-2">
                                                <asp:Button runat="server" OnClientClick="return validate()" disabled="disabled" ID="btnVerify" OnClick="btnVerify_Click" CssClass="btn btn-info" Text="Verify OTP" />
                                            </div>
                                            <div class="col-lg-4">
                                                    <asp:Label runat="server" ID="lblVerifyMsg" CssClass="text-success"></asp:Label>

                                            </div>
                                        </div>
                                            
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               
            </div>
        </div>
       </section>
     <script>
         $(document).ready(function () {
             $('.liImportExcel').show();
         });
         function validate()
         {
             if($('#<%=txtOtp.ClientID%>').val().trim()=='')
             {
                 $('#<%=txtOtp.ClientID%>').focus();
                 $('#<%=lblVerifyMsg.ClientID%>').html('Enter OTP');
                 return false;
             }
         }
    </script>
</asp:Content>

