<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucAdminCA.ascx.cs" Inherits="UserControl_wucAdminCA" %>


<div class="item user-block">
    <div class="user-block-info">
        <span class="user-block-name item-text"><span>Welcome  </span>
            <asp:Label runat="server" ID="lblUserName"></asp:Label>
        </span>
        <span class="user-block-role">( Admin CA )</span>
    </div>
</div>



<nav class="nav">
    <ul class="nav2 nav-list main-nav2">
        <li class="list-item-1 no-submenu navsctooltip"><a href="../CA%20Admin/frmHomeAdminCA.aspx" class="li-heading"><i class="fa r fa-home nav2-fa"></i><span class="nav2-text">Dashboard</span></a></li>
        <li class="list-item-1 no-submenu navsctooltip"><a href="../CA%20Admin/frmTaxPayerSearch.aspx" class="li-heading"><i class="fa r fa-search nav2-fa"></i><span class="nav2-text">Search Client</span></a></li>


        <li class="list-item-1 has-submenu-nav2 navsctooltip">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#clientmanagement">
                <i class="fa fa-user r nav2-fa"></i><span class="nav2-text">Client Management <i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse" id="clientmanagement">
                <li class="list-item-2"><a href="../CA%20Admin/frmAddClient.aspx" title="Add New Client"><span>Add New Client</span></a></li>
                <li class="list-item-2"><a href="../CA%20Admin/frmViewClient.aspx" title="View All Clients"><span>View All Clients</span></a></li>

            </ul>
        </li>

        <li class="list-item-1 has-submenu-nav2 navsctooltip">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#teammanagement">
                <i class="fa fa-users r nav2-fa"></i><span class="nav2-text">Team Management <i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse" id="teammanagement">
                <li class="list-item-2"><a href="../CA%20Admin/frmAddCA.aspx" title="Add New CA"><span>Add New CA</span></a></li>
                <li class="list-item-2"><a href="../CA%20Admin/frmAddArticle.aspx" title="View All Clients"><span>Add New Article</span></a></li>
                <li class="list-item-2"><a href="../CA%20Admin/frmCaAllotmentToClient.aspx" title="Client Allotment"><span>Client Allotment</span></a></li>
                <li class="list-item-2"><a href="../CA%20Admin/frmViewCA.aspx" title="Client Allotment"><span>View All CA</span></a></li>
                <li class="list-item-2"><a href="../CA%20Admin/frmMenuAllotment.aspx" title="User Rights"><span>User Rights</span></a></li>

            </ul>
        </li>
        <li class="list-item-1 has-submenu-nav2 navsctooltip liImportExcel" style="display: none;">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#GSTR1">
                <i class="fa  fa-file-text-o r nav2-fa"></i><span class="nav2-text">GSTR1<i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse scroll_gst" id="GSTR1">

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
            <ul class="nav2 nav-list collapse scroll_gst" id="GSTR2">
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../Client/frmImportPurchaseData.aspx" title="Import Purchase Data"><span>Import Purchase Data</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/FrmImportExcelGSTR2Purchase.aspx" title="Import GOV Excel"><span>Import GOV Excel</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmDisplayPurchData.aspx"><span>Display Purchase Data</span></a></li>
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

            </ul>

        </li>
        <li class="list-item-1 has-submenu-nav2 navsctooltip liImportExcel" style="display: none;">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#GSTR3">
                <i class="fa  fa-file-text-o r nav2-fa"></i><span class="nav2-text">GSTR-3B<i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse" id="GSTR3">
                <%--<li class="list-item-2 liImportExcel1" style="display:none"><a href="../CA%20Admin/frmExcelImport.aspx"  title="Import Sales Data"><span>Import Sales Data</span></a></li>
                <li class="list-item-2 liImportExcel1" style="display: none;"><a href="../Client/frmImportPurchaseData.aspx"  title="Import Purchase Data"><span>Import Purchase Data</span></a></li>--%>
                <%--<li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmImportGSTR3B.aspx" title="Import GSTR3B data"><span>Import GSTR-3B data</span></a></li>--%>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmGSTR3b.aspx" title="Display 3B Data"><span>Display GSTR-3B Data</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../Files/GSTR3BDataFormat.xlsm" title="Download Excel Template"><span>Download Excel Template</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmGSTRform3B.aspx" title="File GSTR-3B"><span>File GSTR-3B</span></a></li>
            </ul>
        </li>
        <li class="list-item-1 has-submenu-nav2 navsctooltip liImportExcel" style="display: none;">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#Ledger">
                <i class="fa fa-newspaper-o  nav2-fa"></i><span class="nav2-text">Ledger<i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse" id="Ledger">
                <%--<li class="list-item-2 liImportExcel1" style="display:none"><a href="../CA%20Admin/frmExcelImport.aspx"  title="Import Sales Data"><span>Import Sales Data</span></a></li>
                <li class="list-item-2 liImportExcel1" style="display: none;"><a href="../Client/frmImportPurchaseData.aspx"  title="Import Purchase Data"><span>Import Purchase Data</span></a></li>--%>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmLegderCashDet.aspx" title="Get Cash Ledger Details"><span>Get Cash Ledger Details</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmGetITCLedger.aspx" title="Get ITC Ledger Details"><span>Get ITC Ledger Details</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmGetLibLedger.aspx" title="Get Liability Ledger Details For Return Liability"><span>Get Liability Ledger Details For Return Liability</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmGetRetLibBal.aspx" title="Get RetLiab Balance"><span>Get RetLiab Balance</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="../CA%20Admin/frmCashITCBal.aspx" title="Get Cash ITC Balance"><span>Get Cash ITC Balance</span></a></li>
            </ul>
        </li>
        <li class="list-item-1 has-submenu-nav2 navsctooltip liImportExcel" style="display: none;">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#Payment">
                <i class="fa fa-cc-visa  nav2-fa"></i><span class="nav2-text">Payment<i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse" id="Payment">
                <%--<li class="list-item-2 liImportExcel1" style="display:none"><a href="../CA%20Admin/frmExcelImport.aspx"  title="Import Sales Data"><span>Import Sales Data</span></a></li>
                <li class="list-item-2 liImportExcel1" style="display: none;"><a href="../Client/frmImportPurchaseData.aspx"  title="Import Purchase Data"><span>Import Purchase Data</span></a></li>--%>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="#" title="Get Challan History"><span>Get Challan History</span></a></li>
                <li class="list-item-2 liImportExcel" style="display: none;"><a href="#" title="Get Challan Summary"><span>Get Challan Summary</span></a></li>

            </ul>
        </li>
        <%--<li class="list-item-1 no-submenu liImportExcel navsctooltip" ><a href="../CA%20Admin/FrmGSTRLedger.aspx" class="li-heading"><i class="fa fa-newspaper-o  nav2-fa"></i> <span class="nav2-text"> Ledger</span></a></li>
          <li class="list-item-1 no-submenu liImportExcel navsctooltip" ><a href="../CA%20Admin/FrmGSTRPayment.aspx" class="li-heading"><i class="fa fa-cc-visa  nav2-fa"></i> <span class="nav2-text"> Payment</span></a></li>--%>
        <li class="list-item-1 no-submenu liImportExcel navsctooltip" style="display: none;"><a href="../CA%20Admin/frmRegisterDSCProd.aspx" class="li-heading"><i class="fa fa-registered  nav2-fa"></i><span class="nav2-text">Register DSC</span></a></li>
        <li class="list-item-1 no-submenu liImportExcel navsctooltip" style="display: none;"><a href="../CA%20Admin/frmTrueCopyDSC.aspx" class="li-heading"><i class="fa fa-registered  nav2-fa"></i><span class="nav2-text">DSC/E-Sign Integration</span></a></li>

        <li class="list-item-1 no-submenu liImportExcel navsctooltip" style="display: none; background-color: lightgray;"><a href="#" class="li-heading"><i class="fa r fa-file-excel-o  nav2-fa"></i><span class="nav2-text">Excel Mapping</span></a></li>
        <li class="list-item-1 no-submenu liImportExcel navsctooltip"><a href="../CA%20Admin/frmChangePassword.aspx" class="li-heading"><i class="fa r fa-key  nav2-fa"></i><span class="nav2-text">Change Password</span></a></li>
        <li style="display: none;" class="list-item-1 no-submenu liImportExcel navsctooltip"><a href="../CA%20Admin/frmDeleteData.aspx" class="li-heading"><i class="fa r fa-trash-o  nav2-fa"></i><span class="nav2-text">Delete Data</span></a></li>
       
        <li class="list-item-1 has-submenu-nav2 navsctooltip liImportExcel">
            <a class="accordion-heading li-heading" data-toggle="collapse" data-target="#help">
                <i class="fa r fa-info-circle nav2-fa"></i><span class="nav2-text">Help<i class="car fa fa-caret-down pull-right"></i></span></a>
            <ul class="nav2 nav-list collapse" id="help">
                <li class="list-item-2"><a href="../Files/GSTR 1 Filing Portal-Help.pdf" target="_blank"><span>GSTR 1</span></a></li>
                <li class="list-item-2"><a href="../Files/GST Return Filing Portal-Help.pdf" target="_blank"><span>GSTR 3B</span></a></li>
            </ul>
        </li>
           
    </ul>
</nav>



<%--<div class="item user-block">
    <div class="user-block-info">
        <span class="user-block-name item-text"><span>Welcome  </span> <asp:Label runat="server" ID="lblUserName"></asp:Label>  </span>
        <span class="user-block-role">
           ( Admin CA )</span>
    </div>
</div>
<ul class="nav">
    <li class="dashboard_activeme">
        <a href="../CA Admin/frmHomeAdminCA.aspx" title="Dashboard" data-toggle="" class="no-submenu">
            <em class="fa fa-home"></em>
            <span class="item-text">Dashboard </span>
        </a>
    </li>
    <li class="search_activeme">
        <a href="../CA Admin/frmTaxPayerSearch.aspx" title="Search Client">
            <em class="fa fa-search"></em>
            <span class="item-text">Search Client</span>
        </a>
    </li>
    <li class="client_activeme">
        <a href="#" title="Client Management" data-toggle="collapse-next" class="has-submenu">
            <em class="fa fa-user"></em>
            <span class="item-text">Client Management  </span>
            <em  class="fa fa-chevron-down" data-toggle="fa fa-chevron-up"></em>
        </a>
        <ul class="nav collapse">
            <li>
                <a href="../CA Admin/frmAddClient.aspx">
                    <em class="fa fa-user-plus"></em>
                    <span class="item-text">Add New Client </span>
                </a>
            </li>
            <li>
                <a href="../CA Admin/frmViewClient.aspx">
                    <em class="fa fa-list"></em>
                    <span class="item-text">View All Clients</span>
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#" title="Team Management" data-toggle="collapse-next" class="has-submenu">
            <em class="fa fa-users"></em>
            <span class="item-text">Team Management </span>
        </a>
         <ul class="nav collapse">
            <li>
                <a href="../CA Admin/frmAddCA.aspx">
                    <em class="fa fa-user-plus"></em>
                    <span class="item-text">Add New CA </span>
                </a>
            </li>
            <li>
                <a href="../CA Admin/frmAddArticle.aspx">
                    <em class="fa fa-user-plus"></em>
                    <span class="item-text">Add New Article </span>
                </a>
            </li>
              <li>
                <a href="../CA Admin/frmCaAllotmentToClient.aspx">
                    <em class="fa fa-pencil-square-o"></em>
                    <span class="item-text"> Client Allotment</span>
                </a>
            </li>
        </ul>
    </li>
    <li id="liImportExcel" class="liImportExcel" style="display: none">
        <a href="../CA Admin/frmExcelImport.aspx" title="Import Data" class="no-submenu">
            <em class="fa fa-download"></em>
            <span class="item-text">Import Data</span>
        </a>
    </li>
     <li id="" class="liImportExcel" style="display: none">
        <a href="../Client/frmImportPurchaseData.aspx" title="Import Data" class="no-submenu">
            <em class="fa fa-download"></em>
            <span class="item-text">Import Purchase Data</span>
        </a>
    </li>
    <li class="client_activeme liImportExcel" style="display: none">
        <a href="../CA%20Admin/FrmExcelMapping.aspx" title="Excel Mapping" class="no-submenu">
            <em class="fa fa-user"></em>
            <span class="item-text">Excel Mapping  </span>
        </a>
    </li>
    <li class="client_activeme liImportExcel" style="display: none">
        <a href="../CA Admin/frmGSTR1Upload.aspx" title="Upload GSTR1" class="no-submenu">
            <em class="fa fa-user"></em>
            <span class="item-text">Upload GSTR1  </span>
        </a>
    </li>
</ul>
--%>
