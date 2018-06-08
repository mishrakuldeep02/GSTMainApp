<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGSTRform3B.aspx.cs" Inherits="CA_Admin_frmGSTRform3B" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<%@ Register TagName="UserControl" TagPrefix="notification" Src="~/UserControl/wucNotification.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style>
        .mr5{
            margin-top:5px;
        }
        .mr40{
            margin-top:40px;
        }
        .input-group-addon:last-child{
            background: #187a30;
            color: #fff;
        }
        .btn-primary{
            min-width: 162px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Modal -->
    <asp:HiddenField runat="server" ID="hfLogId" />
        <div id="OTPModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                
              </div>
              <div class="modal-body">
                <p><asp:Label runat="server" ID="lblOTPMessage"></asp:Label></p>
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
                <p>Submit</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
              </div>
            </div>

          </div>
        </div>
    <!-- viewsubmit -->
        <div id="viewsubmit" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">
                <p>view summary</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
              </div>
            </div>

          </div>
        </div>
    <!-- File -->
        <div id="file" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">
                <p>File</p>
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
             <h3 class="second_heading">File GSTR-3B</h3>
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
                                        <asp:Panel runat="server" visible="false" id="divOTP">
                                        <div class="input-group">
                                            <asp:TextBox class="form-control" MaxLength="6"  placeholder="Enter OTP" runat="server" ID="txtOtp"></asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="txtOtp" FilterMode="ValidChars" FilterType="Numbers" />
                                         <%--<input type="text" class="form-control" placeholder="Enter OTP" aria-describedby="basic-addon2">--%>
                                            <span class="input-group-btn" id="basic-addon2">
                                                <asp:Button runat="server" ID="btnVerify" ValidationGroup="validate" OnClick="btnVerify_Click" CssClass="btn  btn-success" Text="Verify"> </asp:Button>
                                            </span>
                                        </div>
                                    </asp:Panel>
                                        </div>
                                     <div runat="server" style="display:none;margin-top: 10px;" id="divOTPSuccess" class="col-sm-12 col-xs-12 alert alert-success" >
                                         <label class="mr5" runat="server" id="lblSuccess"></label>
                                           <asp:RegularExpressionValidator  ValidationGroup="validate" ID="RegularExpressionValidator4" runat="server" SetFocusOnError="true" ControlToValidate="txtOtp" ErrorMessage="Invalid OTP." ValidationExpression="([0-9]){6}"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator runat="server" ID="eree" ErrorMessage="Enter OTP"   ValidationGroup="validate" ControlToValidate="txtOtp" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            
                                         </div>
                                    
                                </div>
                            </div>
                            

                        </div>
                   </div>
                    <div runat="server" id="divSaveTOGSTN" visible="false" class="row">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-body">
                                    <div class="col-sm-8 col-xs-12">
                                        <asp:Button runat="server" class="btn btn-primary" Text="Save Data to GSTN" OnClick="btnSave_Click" ID="btnSave" />
                                        <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#save">Save Data to GSTN</button>--%>
                                        <div>
                                            <p></p>
                                        </div>
                                        <div class="mr40">
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewsave">View Save Data</button>
                                        </div>
                                        
                                    </div>
                                    <div class="col-sm-4 col-xs-12">
                                        <h5>Response Message</h5>
                                        <span><asp:Label runat="server" ID="lblGSTR3B" ></asp:Label></span>
                                    </div>
                                </div>
                            </div>
                         </div>
                    </div>
                    <div style="display:none;" class="row">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                
                                <div class="panel-body">
                                    <div class="col-sm-8 col-xs-12">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#submit">Submit Data to GSTN</button>
                                        <div>
                                            <p>Your Data has been Successfully Submited On GSTN Reference</p>
                                        </div>
                                        <div class="mr40">
                                           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewsubmit">View Summary</button>
                                        </div>
                                        
                                    </div>
                                    <div class="col-sm-4 col-xs-12">
                                        <h5>Response Message</h5>
                                        <span>Your Data has been Successfully Submited On GSTN Reference</span>
                                    </div>
                                </div>
                            </div>
                         </div>
                    </div>
                    <div style="display:none;" class="row">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                
                                <div class="panel-body">
                                    <div class="col-sm-8 col-xs-12">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#file">File Return</button>
                                        <div>
                                            <p>Your Data has been Successfully Submited On GSTN Reference</p>
                                        </div>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewsubmit">View Summary</button>
                                    </div>
                                    <div class="col-sm-4 col-xs-12">
                                        <h5>Response Message</h5>
                                        <span>Your Data has been Successfully Submited On GSTN Reference</span>
                                    </div>
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
        $(document).ready(function () {
            $('#<%=btnVerify.ClientID%>').click(function () {
                debugger;
                $('#<%=divOTPSuccess.ClientID%>').show();
                $('#<%=divOTPSuccess.ClientID%>').removeClass('alert-success');
                $('#<%=divOTPSuccess.ClientID%>').addClass('alert-danger');
            });
        });
    </script>
      <script>
          $(document).ready(function () {
            
            $('.liImportExcel').show();

        });
    </script>
</asp:Content>

