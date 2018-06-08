<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmClientDashboard.aspx.cs" Inherits="CA_Admin_frmClientDashboard" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
        .fnt10{font-size:11px;}
        th{text-align:center !important;}
        thead{ background-color:#0d4f86; color:#fff; font-size:13px;}
        .client_dash{width:100%;text-align:center;}
        .client_dash .client_dash_col1{width:20%;}
        .client_dash .client_dash_col2{width:20%;}
        .client_dash .client_dash_col3{width:20%;}
        .client_dash .client_dash_col4{width:20%;}
        .client_dash .client_dash_col5{width:20%;}
       
       
        .client_dash_t2{width:50%;text-align:center;}
        .client_dash_t2_col1{width:50%;}
        .client_dash_t2_col2{width:50%;}

        .client_dash_t3{width:100%;text-align:center;}
        .client_dash_t3_col1{width:10%;}
        client_dash_t3_col2{width:10%;}
        client_dash_t3_col3{width:10%;}
        client_dash_t3_col4{width:10%;}
        client_dash_t3_col5{width:10%;}
        client_dash_t3_col6{width:10%;}

    </style>
      <script>
          $(document).ready(function () {
              $('.btn_back_url').attr('href', 'frmTaxPayer.aspx');
              $('.gstr_sitemap').append('<li class="breadcrumb-item active"><a href="frmTaxpayer.aspx">Client</a></li><li class="breadcrumb-item active">GSTR-2A</li>');
              $('.liImportExcel').show();
          });

    </script>
</asp:Content>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
         <%--<cc1:UserControl runat="server" ID="UserControl1" />--%>
        <div class="content-wrapper">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />

            <h3 class="second_heading">Client Dashboard</h3>

             <div class="panel panel-default">
                  <div class="panel-heading">

                        <h4 class="panel-title">
                            <span class="gstr_row_title">GSTR1</span>
                            <span class="gstr_row_desc"></span>
                        </h4>
                    </div>
                <div class="panel-table">

                    <table class="table-bordered client_dash">
                        <thead>
                            <tr>
                                <th class="client_dash_col1">Activity</th>
                                <th class="client_dash_col2">Important Data(Sales Data)<br /><span class="fnt10">Last Date:</span></th>
                                <th class="client_dash_col3">Upload Invoice <br /><span  class="fnt10">Last Date:</span></th>
                                <th class="client_dash_col4">Submit Invoice Lock Data<br /><span  class="fnt10">Last Date:</span></th>
                                <th class="client_dash_col5">Return File<br /><span  class="fnt10">Last Date:</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="client_dash_col1">Status</td>
                                <td class="client_dash_col2">&nbsp;</td>
                                <td class="client_dash_col3">&nbsp;</td>
                                <td class="client_dash_col4">&nbsp;</td>
                                <td class="client_dash_col5">&nbsp;</td>

                            </tr>
                            
                        </tbody>
                    </table>
                    
                </div>
            </div>

             <div class="panel panel-default ">
                  <div class="panel-heading">

                        <h4 class="panel-title">
                            <span class="gstr_row_title">GSTR2A</span>
                            <span class="gstr_row_desc"></span>
                        </h4>
                    </div>
                <div class="panel-table">
                    <table class="client_dash_t2 table-bordered" >
                        <thead>
                            <tr>
                                <th class="client_dash_t2_col1 ">Activity</th>
                                <th class="client_dash_t2_col2">Download 2A Data<br /><span class="fnt10">Date:__To__</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td  class="client_dash_t2_col1 ">Status</td>
                                <td  class="client_dash_t2_col2 ">&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>
            </div>

             <div class="panel panel-default">
                  <div class="panel-heading">

                        <h4 class="panel-title" >
                            <span class="gstr_row_title">GSTR2</span>
                            <span class="gstr_row_desc"></span>
                        </h4>
                    </div>
                <div class="panel-table">

                    <table class="client_dash_t3 table-bordered">
                        <thead>
                            <tr>
                                <th  class="client_dash_t3_col1">Activity</th>
                                <th  class="client_dash_t3_col2">Important Data(Purchase Date)<br /><span class="fnt10">Last Date:</span></th>
                                <th  class="client_dash_t3_col3">Genrate Mismatch<br /><span  class="fnt10">Last Date:</span></th>
                                <th  class="client_dash_t3_col4">Reconcil Data<br /><span  class="fnt10">Last Date:</span></th>
                                <th  class="client_dash_t3_col5">Return File<br /><span  class="fnt10">Last Date:</span></th>
                                <th  class="client_dash_t3_col6">Submite Data</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="client_dash_t3_col1">Status</td>
                                <td class="client_dash_t3_col2">&nbsp;</td>
                                <td class="client_dash_t3_col3">&nbsp;</td>
                                <td class="client_dash_t3_col4">&nbsp;</td>
                                <td class="client_dash_t3_col5">&nbsp;</td>
                                <td class="client_dash_t3_col6">&nbsp;</td>

                            </tr>
                            
                        </tbody>
                    </table>
                    
                </div>
            </div>
        </div>

    </section>


</asp:Content>

