<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmTrueCopyDSC.aspx.cs" Inherits="CA_Admin_frmTrueCopyDSC" %>

<%@ Register TagName="UserControl" TagPrefix="notification" Src="~/UserControl/wucNotification.ascx" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <style>
        .mr5 {
            margin-top: 5px;
        }

        .mr40 {
            margin-top: 40px;
        }

        .input-group-addon:last-child {
            background: #187a30;
            color: #fff;
        }

        .btn-primary {
            min-width: 162px;
        }
    </style>
    <style>
        .success {
            background: #dff0d8;
            color: #3c763d;
        }

        .denger {
            background: #f2dede;
            color: #a94442;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField runat="server" ID="hfLogId" />
    <div id="OTPModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                </div>
                <div class="modal-body">
                    <p>
                        <asp:Label runat="server" ID="lblOTPMessage"></asp:Label>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div>

        </div>
    </div>
    <!-- save -->
    <div id="save" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Save</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div>

        </div>
    </div>
    <!-- viewsave -->
    <div id="viewsave" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div>

        </div>
    </div>
    <!-- submit -->
    <div id="submit" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Your data will be submitted to GSTN. You will not be able to make any changes after this. Are you sure?.</p>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnSubmit" class="btn btn-primary" OnClick="btnSubmit_Click" Text="Submit TO GSTN" />

                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>

        </div>
    </div>

    <div id="FileGSTR1" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Your data will be Filed to GSTN. You will not be able to make any changes after this. Are you sure?.</p>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnFiled" class="btn btn-primary" OnClick="btnFiled_Click" Text="File TO GSTN" />

                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>

        </div>
    </div>
    <!-- viewsubmit -->
    <div id="viewsubmit" class="modal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    Signed Data
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Height="300" ID="txtSummary" Enabled="false"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div>

        </div>
    </div>
    <!-- File -->
    <div id="file" class="modal" role="dialog">
        <div class="modal-dialog modal-dialog-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <b>Errors Invoice</b>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body p0">
                    <div class="table-responsive">
                        <asp:GridView runat="server" ID="grd" CssClass="table table-bordered mb0" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderText="Invoice No" DataField="InvoiceNo" />
                                <asp:BoundField HeaderText="Invoice Date" DataField="InvoiceDates" />
                                <asp:BoundField HeaderText="Invoice Value" DataField="InvoiceValue" />
                                <asp:BoundField HeaderText="Taxable Value" DataField="TaxableValue" />
                                <asp:BoundField HeaderText="Rate" DataField="Rate" />
                                <asp:BoundField HeaderText="IGST" DataField="IGSTAmt" />
                                <asp:BoundField HeaderText="CGST" DataField="CGSTAmt" />
                                <asp:BoundField HeaderText="SGST" DataField="SGSTAmt" />
                                <asp:BoundField HeaderText="RecordNo" DataField="RecordNo" />
                                <asp:BoundField HeaderText="Error MSG" DataField="ErrorMsg" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div>

        </div>
    </div>
    <section>

        <!-- START Page content-->
        <div class="content-wrapper ">

            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <h3 class="second_heading">DSC/E-Sign Integration</h3>
            <div class="row">
                <div class="col-md-3 col-xs-12 pull-right">
                    <notification:UserControl runat="server" ID="wucNotification" />
                </div>
                <div class="col-md-9 pull-left">
                    <div class="row">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-body">
                                    <div class="col-sm-8 col-xs-12">
                                        <asp:Button runat="server" OnClick="btnConnectTOGSTIN_Click" class="btn btn-primary" ID="btnConnectTOGSTIN" Text="Connect to GSTN" />
                                        <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Connect to GSTN</button>--%>
                                    </div>
                                    <asp:ScriptManager runat="server" ID="scr"></asp:ScriptManager>
                                    <div class="col-sm-4 col-xs-12">
                                        <asp:Panel runat="server" Visible="false" ID="divOTP">
                                            <div class="input-group">
                                                <asp:TextBox class="form-control" MaxLength="6" placeholder="Enter OTP" runat="server" ID="txtOtp"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtOtp" FilterMode="ValidChars" FilterType="Numbers" />
                                                <%--<input type="text" class="form-control" placeholder="Enter OTP" aria-describedby="basic-addon2">--%>
                                                <span class="input-group-btn" id="basic-addon2">
                                                    <asp:Button runat="server" ID="btnVerify" ValidationGroup="validate" OnClick="btnVerify_Click" CssClass="btn  btn-success" Text="Verify"></asp:Button>
                                                </span>
                                            </div>
                                        </asp:Panel>
                                    </div>

                                    <div runat="server" style="display: none; margin-top: 10px; margin-bottom: 0" id="divOTPSuccess" class="col-sm-12 col-xs-12 alert alert-success success">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <label class="mr5" runat="server" id="lblSuccess"></label>
                                        <asp:RegularExpressionValidator ValidationGroup="validate" ID="RegularExpressionValidator4" runat="server" SetFocusOnError="true" ControlToValidate="txtOtp" ErrorMessage="Invalid OTP." ValidationExpression="([0-9]){6}"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator runat="server" ID="eree" ErrorMessage="Enter OTP" ValidationGroup="validate" ControlToValidate="txtOtp" SetFocusOnError="true"></asp:RequiredFieldValidator>

                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                    <%-- <div runat="server" id="divSaveTOGSTN" visible="false" class="row">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-body">
                                    <div class="col-md-3 col-xs-12">
                                        <asp:Button runat="server" class="btn btn-primary" Text="Save Data to GSTN" OnClick="btnSave_Click" ID="btnSave" />
                                    </div>

                                    <div class="col-md-6 col-xs-12">

                                        <p class="mb0  font13">Upload Status : <span class="text-bold">
                                            <asp:Label runat="server" ID="lblUploadStatus"></asp:Label></span> </p>

                                        <p class="mb0  font13">Refrence ID :
                                            <asp:Label runat="server" ID="lblreferenceId" CssClass="text-bold"></asp:Label></p>
                                    </div>
                                    <div class="col-md-3 col-xs-12">

                                        <asp:Button runat="server" Visible="false" CssClass="btn btn-success pull-right" ID="btnRefresh" OnClick="btnRefresh_Click" Text="Refresh" />


                                    </div>

                                    <div class="col-sm-12">
                                        <div class="table-responsive">
                                            <table runat="server" visible="false" id="tblInvoice" class="table table-bordered table-sm table-th-sm mrt3px">
                                                <tr>
                                                    <th style="width: 30%">Total Invoices
                                                    </th>
                                                    <th style="width: 30%">Total Uploaded 
                                                    </th>
                                                    <th style="width: 30%">Error Uploaded
                                                    </th>
                                                    <th style="width: 10%; text-align: center">View
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span>
                                                            <asp:Label runat="server" Text="" ID="lblTotalInvoices"></asp:Label></span>

                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label runat="server" ID="lblUploaded"></asp:Label></span>

                                                    </td>
                                                    <td>
                                                        <span>
                                                            <asp:Label runat="server" ID="lblErrorInvoice"></asp:Label></span>

                                                    </td>
                                                    <td class="text-center">
                                                        <asp:Button runat="server" Text="View" ID="btnView" CssClass="btn btn-info btn-xs" OnClick="btnView_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>--%>
                    <div class="row" id="divSummary" runat="server" visible="false">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="col-sm-3 col-xs-12">
                                            <div class="">
                                                <asp:Button runat="server" ID="btnGetSummary" class="btn btn-primary" OnClick="btnGetSummary_Click" Text="Get Summary" />
                                                <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewsave">Get Summary</button>--%>
                                                <br />
                                                <br />

                                            </div>


                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <asp:Button runat="server" ID="btnEsign" class="btn btn-primary" OnClick="btnEsign_Click" Text="E-Sign" />
                                            <br />
                                            <br />

                                            <asp:Button runat="server" ID="btnDSC" class="btn btn-primary" OnClick="btnDSC_Click" Text="DSC" />
                                            <br />
                                            <br />

                                            <asp:Button runat="server" ID="btnCheckApproval" class="btn btn-primary" OnClick="btnCheckApproval_Click" Text="Check Approval" />
                                            <br />
                                            <br />

                                            <asp:Button runat="server" ID="btnDownloadSign" class="btn btn-primary" OnClick="btnDownloadSign_Click" Text="Download Sign Data" />
                                            <br />
                                            <br />

                                        </div>
                                        <div class="col-md-6">
                                            <iframe id="ifmAuth" runat="server" style="display: none; width: 100%; height: 300px;"></iframe>
                                            <br />
                                            <br />
                                            <asp:Panel Visible="false" id="divsuccessmsg" runat="server" class="alert alert-success">
                                                <asp:Label runat="server" ID="lblSummMessage"></asp:Label>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--   <div runat="server" visible="false" id="divSubmit" class="row">
                        <div class="panel-group">
                           
                            <div class="panel panel-default panel-demo">

                                <div class="panel-body">
                                    <div class="col-sm-8 col-xs-12">

                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#submit">Submit Data to GSTN</button>
                                        <div>
                                            <p>
                                                <asp:Label runat="server" ID="lblSubmitMsg"></asp:Label></p>
                                        </div>
                                        <div class="mr40">
                                        </div>

                                    </div>
                                    <div class="col-sm-4 col-xs-12">
                                        <h5>Response Message</h5>
                                        <span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div runat="server" visible="false" id="pnlFile" class="row">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">

                                <div class="panel-body">
                                    <div class="col-sm-8 col-xs-12">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#FileGSTR1">File Return</button>
                                        <div>
                                            <p></p>
                                        </div>
                                        <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewsubmit">View Summary</button>--%>
                <%-- </div>
                                    <div class="col-sm-4 col-xs-12">
                                        <h5>Response Message</h5>
                                        <span>
                                            <asp:Label runat="server" ID="lblFileMessage"></asp:Label></span>
                                        <br />
                                        <span>
                                            <asp:Label runat="server" ID="lblAckNo"></asp:Label></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>--%>
                <!-- END Page content-->
    </section>
    <script type="text/javascript">
        $(document).ready(function () {

            $('#<%=btnVerify.ClientID%>').click(function () {

                //debugger;
                $('#<%=divOTPSuccess.ClientID%>').show();
                $('#<%=divOTPSuccess.ClientID%>').removeClass('alert-success');
                $('#<%=divOTPSuccess.ClientID%>').addClass('alert-danger denger');
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('.close').click(function () {
                $('#<%=divOTPSuccess.ClientID%>').hide();
            });
            $('.liImportExcel').show();

        });
    </script>
</asp:Content>

