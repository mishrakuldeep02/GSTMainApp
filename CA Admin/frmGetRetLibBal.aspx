<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGetRetLibBal.aspx.cs" Inherits="CA_Admin_frmGetRetLibBal" %>
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
    <section>
        <!-- START Page content-->
        <div class="content-wrapper ">

            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <h3 class="second_heading">Register DSC</h3>
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
                                    <div runat="server" style="display: none; margin-top: 10px; margin-bottom: 0" id="divOTPSuccess" class="col-sm-12 col-xs-12 alert alert-success success">
                                        <%--<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>--%>
                                        <label class="mr5" runat="server" id="lblSuccess"></label>
                                         <%--<asp:Label runat="server" ID="lblRemaining" Visible="false"></asp:Label>--%>
                                          <div class="clock-box">
                                            <p class="lblclock">Remaining Time : </p>
                                            <div class="clock-col asd-hrs">00</div>
                                            <div class="clock-divider">:</div>
                                            <div class="clock-col asd-mns">00</div>
                                            <div class="clock-divider">:</div>
                                            <div class="clock-col asd-scs">00</div>
                                        </div>
                                        <asp:RegularExpressionValidator ValidationGroup="validate" ID="RegularExpressionValidator4" runat="server" SetFocusOnError="true" ControlToValidate="txtOtp" ErrorMessage="Invalid OTP." ValidationExpression="([0-9]){6}"></asp:RegularExpressionValidator>
                                        <%--<asp:RequiredFieldValidator runat="server" ID="eree" ErrorMessage="Enter OTP" ValidationGroup="validate" ControlToValidate="txtOtp" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                          
                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                 
                    <div class="row" id="divGetLedger" runat="server" visible="false">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-body">
                                    <div class="col-sm-3 col-xs-12">
                                        <div class="">
                                            <asp:Button runat="server" ID="btngetRetlib" class="btn btn-primary" OnClick="btngetRetlib_Click" Text="Get RetLiab Balance" />
                                            <br />
                                            <br />
                                            <%--<asp:Button runat="server" ID="btnRegisterDSC" class="btn btn-primary" OnClick="btnRegisterDSC_Click" Text="Register DSC" />--%>

                                            <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewsave">Get Summary</button>--%>
                                            <br />
                                            <asp:Label runat="server" ID="lblLedgerStatus"></asp:Label>
                                        </div>


                                    </div>
                                    <div></div>

                                </div>
                            </div>
                        </div>



                    </div>
                  
                </div>

            </div>
        </div>
        <!-- END Page content-->

    </section>
    <script type="text/javascript">
        function SHowProgress() {
            if (validate() == false) {
                return false;

            } else {
                //   $('#ProgressModal').modal({ backdrop: 'static', keyboard: false });
                $('.loading').addClass('active');
            }
        }
        function validate() {
            debugger;
            if ($('#<%=txtOtp.ClientID%>').val() == '') {
                $.jAlert({ //this is the normal usage
                    'title': 'Error',
                    'content': 'Enter OTP',
                    'theme': 'blue',
                    'size': 'xsm'
                });
                //alert('Enter OTP');
                $('#<%=txtOtp.ClientID%>').focus();
                return false;
            }
        }
        $(document).ready(function () {

            $('#<%=btngetRetlib.ClientID%>').click(function () { $('.loading').addClass('active'); });

            $('#<%=btnConnectTOGSTIN.ClientID%>').click(function () {

                $('.loading').addClass('active');
            });

            $('#<%=btnVerify.ClientID%>').click(function () {

                SHowProgress();
            });
        });
    </script>
   
    <script>
        $(document).ready(function () {

            $('.liImportExcel').show();

        });
    </script>
</asp:Content>

