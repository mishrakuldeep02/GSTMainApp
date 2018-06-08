<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGovernmentExcel.aspx.cs" Inherits="CA_Admin_frmGovernmentExcel" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
        <!-- START Page content-->
        <div class="content-wrapper ">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
               <h3 class="second_heading">Download GSTR-1 Government Excel</h3>
             <div class="row">
                <div class="col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Download GSTR-1 Government Excel</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                        <asp:Button runat="server" ID="btnGenerateExcel" CssClass="btn btn-success" OnClick="btnGenerateExcel_Click" Text="Generate Excel" />
                                </div>
                            </div>
                        </div>
                    </div>
</div>            </div>
        </section>
      <script>
          $(document).ready(function () {
              $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
              $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
              $('.liImportExcel').show();
          });

    </script>
</asp:Content>

