﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="FrmReportViewer.aspx.cs" Inherits="FrmReportViewer" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function PrintApplicationSuccess()
        {
            var panel = document.getElementById("ctl00_ContentPlaceHolder1_ReportViewer1_ctl09");

            var printWindow = window.open('', '', 'height=700,width=800');

            printWindow.document.write('<style>@page{size:portrait;}</style><html><head>');
            printWindow.document.write('</head><body>');

            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }

    </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server" />
    <section>
   <%-- <style>
        #ContentPlaceHolder1_pnlPrintDraftPatta table tr td {
            height: initial;
            width: initial;
            padding: initial;
            border: 0;
        }

        #ContentPlaceHolder1_pnlPrintDraftPatta table {
            border: 0;
        }

        #ctl00_ContentPlaceHolder1_ReportViewer1_ctl09 {
            overflow-x: hidden !Important;
            border-bottom: 1px solid #ddd;
            padding-right: 5px;
        }

        @media (max-width:768px) {
            #ctl00_ContentPlaceHolder1_ReportViewer1_ctl09 {
                overflow-x: auto !Important;
                border-bottom: 1px solid #ddd;
            }
        }

        .font-awesome-font {
            font-family: FontAwesome,'Source sans pro',sans-serif;
        }
    </style>--%>
    <div class="content-wrapper">
        <div class="panel panel-default" style="margin-bottom: -2px; border: 0; padding: 2px">
            <div class="panel-table">
                <asp:Panel runat="server" ID="pnlPrintDraftPatta" Visible="false">                    
                    <rsweb:ReportViewer Height="500px" ShowParameterPrompts="false" Width="100%" ID="ReportViewer1" runat="server"></rsweb:ReportViewer>                    
                </asp:Panel>
            </div>
            <div class="panel-body text-center">
                <asp:Button Text="&#xf02f; Print" ID="print" runat="server" CssClass="font-awesome-font btn btn-info" OnClientClick="return PrintApplicationSuccess();" Visible="false" />
                <asp:Button Text=" Exit" ID="btnExit" runat="server" OnClick="btnExit_Click" CssClass="font-awesome-font btn btn-danger" />
            </div>
        </div>
    </div></section>
</asp:Content>
