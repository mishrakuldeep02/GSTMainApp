<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmDeleteData.aspx.cs" Inherits="CA_Admin_frmDeleteData" %>
<%@ Register  TagName="UserControl"  TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script>
          $(document).ready(function () {
              $('.btn_back_url').attr('href', 'frmTaxPayerSearch.aspx');
              $('.gstr_sitemap').append('<li class="breadcrumb-item active">Client</li>');
              $('.liImportExcel').show();
          });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section>
        <!-- START Page content-->
        <div class="content-wrapper" id="gstr1_page">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
           <div class="row">
                <div class="col-md-9">
                    <div class="row">
                        <div class="panel panel_b6 panel-default">
                            <div class="panel-wrapper in">
                                <div class="panel-body pt0 pb0">
                                    <div class="row">
                                        <div class="col-xs-12 ">
                                            <h3>Delete Data</h3>
                                          	<div class="row form-group">
                        <asp:Label runat="server" ID="lblMsg" CssClass="text-danger"></asp:Label>
                    </div>
                    
                    <div class="row form-group">
                        <div class="col-lg-2">
                            <label>
                                GSTR1
                            </label>
                        </div>
                        <div class="col-lg-3">
                            <asp:Button runat="server" Text="Delete" CssClass="btn btn-primary" ID="btnGSTR1Delete" OnClick="btnGSTR1Delete_Click" />
                        </div>
                        </div>
                  
                <div class="row form-group">
                        <div class="col-lg-2">
                            <label>
                                GSTR2
                            </label>
                        </div>
                        <div class="col-lg-3">
                            <asp:Button runat="server" Text="Delete" CssClass="btn btn-success" ID="btnSGTR2Delete" OnClick="btnSGTR2Delete_Click" />
                        </div>
                        </div>
                   <div class="row form-group">
                        <div class="col-lg-2">
                            <label>
                                GSTR2A
                            </label>
                        </div>
                        <div class="col-lg-3">
                            <asp:Button runat="server" Text="Delete" CssClass="btn btn-info" ID="btnGSTR2A" OnClick="btnGSTR2A_Click" />
                        </div>
                        </div>
                                             <div class="row form-group">
                        <div class="col-lg-2">
                            <label>
                                GSTR3B
                            </label>
                        </div>
                        <div class="col-lg-3">
                            <asp:Button runat="server" Text="Delete" CssClass="btn btn-warning" ID="btnGST3B" OnClick="btnGST3B_Click" />
                        </div>
                        </div>
                    </div>
                </div>
                                        </div>
                    </div>
                </div>
                          </div>
                </div> </div>
            </div>
         </section>
</asp:Content>

