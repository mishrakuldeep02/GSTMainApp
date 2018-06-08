<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmTaxPayerNewOld.aspx.cs" Inherits="CA_Admin_frmTaxPayerNew" %>
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
        <div class="content-wrapper ">
           <%-- <div class="row strip_row">
              <div class="selected_client_details">
                    <div class="col-sm-5"><b><asp:Label runat="server" ID="lblFirmName" ></asp:Label></b></div>
                    <div class="col-sm-7 text-right">
                        <span class="grid_contact"><b>GSTIN : </b><asp:Label runat="server" ID="lblGSTINNo" ></asp:Label>       </span><span class="spacer_contact"></span>
                        <span class="grid_contact"><i class="fa r fa-user"></i><asp:Label runat="server" ID="lblClientName" ></asp:Label>   </span><span class="spacer_contact"></span>
                        <span class="grid_contact"><i class="fa r fa-phone"></i><asp:Label runat="server" ID="lblMobileNo" ></asp:Label></span><span class="spacer_contact"></span>
                        <span class="grid_contact"><i class="fa r fa-envelope"></i><asp:Label runat="server" ID="lblEmailId" ></asp:Label></span>
                    </div>
                </div>
                <div class="breadcrumb_row">
                    <a href="frmDashboard.aspx" class="btn btn-primary btn-xs" style="float: left; margin-right: 15px"><i class="fa r fa-arrow-circle-o-left"></i>Back</a>
                    <ol class="breadcrumb" style="float: left">
                        <li class="breadcrumb-item"><a href="frmDashboard.aspx">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="frmClientPage.aspx">Client</a></li>
                    </ol>
                </div>
            </div>--%>
          <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <asp:ScriptManager runat="server" ID="drc"></asp:ScriptManager>
            <asp:UpdatePanel runat="server" ID="updatePanel1"><ContentTemplate>
            <div class="row">
                <div class="col-md-9">
                    <div class="row">
                        <div class="panel panel_b6 panel-default">
                            <div class="panel-wrapper in">
                                <div class="panel-body pt0 pb0">
                                    <div class="row">
                                        <div class="col-xs-12 ">
                                          	<div class="row">
                                                  <div class="col-xs-12 bhoechie-tab-container">

                                                     <%-- <div class="col-lg-3 col-md-3 col-sm-2 col-xs-4 bhoechie-tab-menu">
                                                        <div class="list-group">
                                                          <a href="#" class="list-group-item active">
                                                            <h4 class="fa r fa-wpforms"></h4> GSTR 1
                                                          </a>
                                                          <a href="#" class="list-group-item">
                                                            <h4 class="fa r fa-wpforms"></h4> GSTR 1A
                                                          </a>
                                                          <a href="#" class="list-group-item">
                                                            <h4 class="fa r fa-wpforms"></h4> GSTR 2
                                                          </a>
                                                          <a href="#" class="list-group-item">
                                                            <h4 class="fa r fa-wpforms"></h4> GSTR 2A
                                                          </a>
                                                          <a href="#" class="list-group-item">
                                                            <h4 class="fa r fa-wpforms"></h4> GSTR 3
                                                          </a>
                                                        </div>
                                                      </div>--%>
<%-- <div class="col-lg-3 col-md-3 col-sm-2 col-xs-4 bhoechie-tab-menu" style="overflow:scroll">--%>
 <div class="col-lg-3 col-md-3 col-sm-2 col-xs-4 bhoechie-tab-menu">
 <asp:GridView runat="server"   DataKeyNames="RecordNo" OnRowCommand="grdAllGstrName_RowCommand"  class="table table-bordered" ID="grdAllGstrName" AutoGenerateColumns="false">
     <Columns>
         <asp:TemplateField HeaderText="GSTR Name" ItemStyle-CssClass="text-left">
         <ItemTemplate>
             <%--<a href="#" class="list-group-item active">
               <h4 class="fa r fa-wpforms"></h4> <%#Eval("GSTRName") %>
               </a>--%>                  
                <asp:LinkButton  class="list-group-item" runat="server" Text='<%#Eval("GSTRName") %>' ID="lblGSTRName"   CommandArgument='<%#Container.DataItemIndex%>'></asp:LinkButton>    
                <asp:LinkButton  class="list-group-item" runat="server" Text='<%#Eval("RecordNo") %>' ID="LinkButton1"   CommandArgument='<%#Container.DataItemIndex%>' Visible="false"></asp:LinkButton>    
        
              </ItemTemplate>
         </asp:TemplateField>
          <asp:BoundField HeaderText="" Visible="false" DataField="RecordNo" />
     </Columns>
 </asp:GridView>
        </div>
           <div class="col-lg-9 col-md-9 col-sm-10 col-xs-8 bhoechie-tab">
                <asp:GridView runat="server"  class="table table-bordered" ID="GridView1" AutoGenerateColumns="true">

                </asp:GridView>
      
     
               </div>                                         
                                                      
                                                       <%-- <div class="col-lg-9 col-md-9 col-sm-10 col-xs-8 bhoechie-tab">                                                          
                                                          <div class="bhoechie-tab-content active">
                                                             <a href="#" class="btn btn-success">GSTR 1 Upload</a>
                                                             <a href="#" class="btn btn-info">GSTR 1 Import</a>
                                                             <a href="#" class="btn btn-danger">GSTR 1 Submit</a>
                                                          </div>
                                                          
                                                          <div class="bhoechie-tab-content">
                                                             <a href="#" class="btn btn-success">GSTR 1A Upload</a>
                                                             <a href="#" class="btn btn-info">GSTR 1A Import</a>
                                                             <a href="#" class="btn btn-danger">GSTR 1A Submit</a>
                                                          </div>
                                              
                                                          
                                                          <div class="bhoechie-tab-content">
                                                             <a href="#" class="btn btn-success">GSTR 2 Upload</a>
                                                             <a href="#" class="btn btn-info">GSTR 2 Import</a>
                                                             <a href="#" class="btn btn-danger">GSTR 2 Submit</a>
                                                          </div>
                                                          <div class="bhoechie-tab-content">
                                                             <a href="#" class="btn btn-success">GSTR 2A Upload</a>
                                                             <a href="#" class="btn btn-info">GSTR 2A Import</a>
                                                             <a href="#" class="btn btn-danger">GSTR 2A Submit</a>
                                                          </div>
                                                          <div class="bhoechie-tab-content">
                                                             <a href="#" class="btn btn-success">GSTR 3 Upload</a>
                                                             <a href="#" class="btn btn-info">GSTR 3 Import</a>
                                                             <a href="#" class="btn btn-danger">GSTR 3 Submit</a>
                                                          </div>
                                                      </div>--%>
                                                  </div>
                                            </div>
                                          </div>
                                      

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-3">

                    <div class="panel panel_b6 panel-warning panel-demo">
                        <div class="panel-heading panel-heading_pl">
                            Alerts<a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                <em class="fa fa-minus"></em>
                            </a>
                            <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                <em class="fa fa-refresh"></em>
                            </a>
                        </div>
                        <!-- START list group-->
                        <div class="list-group" style="margin: 0">
                            <!-- START list group item-->
                            <div class="list-group-item">
                                <div class="media">
                                    <div class="media-body clearfix">
                                        <p class="m0">
                                            <small>Mismatch Generated in GSTR-2A
                                            </small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END list group item-->
                            <!-- START list group item-->
                            <div class="list-group-item">
                                <div class="media">
                                    <div class="media-body clearfix">
                                        <p class="m0">
                                            <small>Data for GSTR-3 Pending
                                            </small>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END list group item-->
                        </div>
                        <!-- END list group-->
                        <!-- START panel footer-->
                        <!-- END panel-footer-->
                    </div>

                    <div class="panel panel_b6 panel-warning panel-demo">
                        <div class="panel-heading panel-heading_pl">
                            Old Pendancy<a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                <em class="fa fa-minus"></em>
                            </a>
                            <a href="javascript:void(0);" data-perform="panel-refresh" data-spinner="traditional" title="" class="pull-right" data-original-title="Refresh Panel">
                                <em class="fa fa-refresh"></em>
                            </a>
                        </div>
                        <!-- START list group-->
                        <div class="panel-body">
                            <p style="color: #3a3a3a">No Old Pendancy </p>
                        </div>
                        <!-- END list group-->
                        <!-- START panel footer-->
                        <!-- END panel-footer-->
                    </div>

                    <div class="panel panel_b6 panel-warning panel-demo">
                        <div class="panel-heading panel-heading_pl">
                            Send Reminder
                                       
                                <a href="javascript:void(0);" data-perform="panel-collapse" title="" class="pull-right" data-original-title="Collapse Panel">
                                    <em class="fa fa-minus"></em>
                                </a>
                        </div>
                        <div class="panel-wrapper collapse in" aria-expanded="true">
                            <div class="panel-body text-center">
                                <a href="#!" class="btn btn-info btn-xs">Send SMS</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#!" class="btn btn-info btn-xs">Send Email</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div></ContentTemplate></asp:UpdatePanel>
        </div>
        <!-- END Page content-->
    </section>

</asp:Content>

