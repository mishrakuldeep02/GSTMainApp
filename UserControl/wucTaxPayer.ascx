<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucTaxPayer.ascx.cs" Inherits="UserControl_wucTaxPayer" %>
                  
                    <div class="item user-block">
                        <div class="user-block-info">
                            <span class="user-block-name item-text">Welcome Tax Payer</span>
                            <span class="user-block-role"><asp:Label runat="server" ID="lblUserName"></asp:Label></span>
                        </div>
                    </div>
<nav class="nav">
    <ul class="nav2 nav-list main-nav2">
                        <li>
                            <a href="../Client/frmHometaxPayer.aspx" title="Dashboard" data-toggle="" class="no-submenu">
                                <em class="fa fa-home"></em>
                                <span class="item-text">Home</span>
                            </a>
                        </li>
                        <li>
                            <a href="../Client/FrmAddGSTIN.aspx" title="Clients" class="no-submenu">
                                <em class="fa fa-user"></em>
                                <span class="item-text">Add GSTIN</span>
                            </a>
                        </li>
                       <%-- <li>
                            <a href="#" title="Team" class="no-submenu">
                                <em class="fa fa-users"></em>
                                <span class="item-text">Team Management</span>
                            </a>
                        </li>--%>
                           <li class="list-item-1 has-submenu-nav2 navsctooltip liImportExcel" style="display: none;">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#GSTR1">
                <i class="fa  fa-file-text-o r nav2-fa"></i><span class="nav2-text">GSTR1<i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse" id="GSTR1">

                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmExcelImport.aspx" title="Import Sales Data"><span>Import Sales Data</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGetGSTR1Data.aspx" title="Get GSTR-1 Data"><span>Get GSTR-1 Data</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmImportTallySalesData.aspx" title="Import Sales Data"><span>Import Tally Excel</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmB2B.aspx" title="GSTR-1 Entry"><span>GSTR-1 Entry</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGSTR1.aspx" title="Diplay GSTR1"><span>Display GSTR-1</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/FrmGSTR1Summary.aspx" title=" GSTR-1 Summary"><span>GSTR-1 Summary</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGSTR1File.aspx" title="File GSTR-1"><span>File GSTR-1</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGovernmentExcel.aspx" title="Download GSTR-1 Government Excel"><span>Download GSTR-1 Government Excel</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frm_Rpt_GSTR1.aspx" title="GSTR-1 Report"><span>GSTR-1 Report</span></a></li>



            </ul>
        </li>
        <li class="list-item-1 has-submenu-nav2 navsctooltip liImportExcel" style="display: none;">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#GSTR2">
                <i class="fa  fa-file-text-o r nav2-fa"></i><span class="nav2-text">GSTR2<i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse" id="GSTR2">
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../Client/frmImportPurchaseData.aspx" title="Import Purchase Data"><span>Import Purchase Data</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/FrmImportExcelGSTR2Purchase.aspx" title="Import GOV Excel"><span>Import GOV Excel</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmDisplayPurchaseData.aspx"><span>Display Purchase Data</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmGetGSTR2A.aspx"><span>Download GSTR-2A Data</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGstr2ImportJson.aspx" title="GSTR-2 Import Json"><span>GSTR-2 Import Json</span></a></li>

                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGSTR2AAction.aspx" title="Display GSTR-2A"><span>Display GSTR-2A</span></a></li>

                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmGenerateMismatch.aspx"><span>Generate Mismatch</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGSTR2Summary_design.aspx" title="Display GSTR-2 Final"><span>Display GSTR-2 Final</span></a></li>

<%--                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGSTR2.aspx" title="Diplay GSTR2"><span>Display GSTR-2</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frm_Rpt_GSTR2.aspx" title="GSTR-2 Report"><span>GSTR-2 Report</span></a></li>--%>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/FrmGSTR2Summary.aspx" title=" GSTR-2 Summary"><span>GSTR-2 Summary</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGSTR2File.aspx" title="Diplay GSTR2"><span>File GSTR-2</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmActionTakenReport.aspx" title="Action Taken Report"><span>Action Taken Report</span></a></li>

<%--                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGstr2ImportJson.aspx" title="GSTR-2 Import Json"><span>GSTR-2 Import Json</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGSTR2Summary_design.aspx" title="GSTR-2 Action"><span>GSTR-2 Action</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none"><a href="../CA%20Admin/frmGSTR2AAction.aspx" title="GSTR-2A Action"><span>GSTR-2A Action</span></a></li>--%>


            </ul>

        </li>
                    </ul>
    </nav>
             
        