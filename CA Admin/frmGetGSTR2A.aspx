<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGetGSTR2A.aspx.cs" Inherits="CA_Admin_frmGetGSTR2A" %>

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

    <style type="text/css">
.table table  tbody  tr  td a ,
.table table  tbody  tr  td  span {
position: relative;
float: left;
padding: 6px 12px;
margin-left: -1px;
line-height: 1.42857143;
color: #337ab7;
text-decoration: none;
background-color: #fff;
border: 1px solid #ddd;
}

.table table > tbody > tr > td > span {
z-index: 3;
color: #fff;
cursor: default;
background-color: #337ab7;
border-color: #337ab7;
}

.table table > tbody > tr > td:first-child > a,
.table table > tbody > tr > td:first-child > span {
margin-left: 0;
border-top-left-radius: 4px;
border-bottom-left-radius: 4px;
}

.table table > tbody > tr > td:last-child > a,
.table table > tbody > tr > td:last-child > span {
border-top-right-radius: 4px;
border-bottom-right-radius: 4px;
}

.table table > tbody > tr > td > a:hover,
.table   table > tbody > tr > td > span:hover,
.table table > tbody > tr > td > a:focus,
.table table > tbody > tr > td > span:focus {
z-index: 2;
color: #23527c;
background-color: #eee;
border-color: #ddd;
}
    </style>




    <script type="text/javascript">
        function ShowSummModal() {
            $('#GSTR2AModal').modal('show');
        }
    </script>
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

    <div id="GSTR2AModal" class="modal fade" role="dialog">
        <div class="modal-dialog  modal-xl">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    View summary
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body p0">
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
            <h3 class="second_heading">Download GSTR-2A</h3>
            <div class="row">
                <%--<div class="col-md-3 col-xs-12 pull-right">
                    <notification:UserControl runat="server" ID="wucNotification" />
                </div>--%>
                <div class="col-md-12 pull-left">
                    <div class="row">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                           <%-- <asp:UpdatePanel ID="upd1" runat="server">
                                <ContentTemplate>--%>

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

                               <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>

                        </div>
                    </div>

                    <div class="row" id="divGetLedger" runat="server" visible="false">
                        <div class="panel-group">
                            <!-- START 1 panel-->
                            <div class="panel panel-default panel-demo">
                                <div class="panel-body">
                                    <div class="row mb15">
                                        <div class="col-sm-6 col-xs-12 text-right">
                                            <style>
                                                .supplier_radio_grp {
                                                    padding-top: 8px;
                                                    float: right;
                                                }

                                                    .supplier_radio_grp input, .supplier_radio_grp label {
                                                        cursor: pointer;
                                                        display: block;
                                                        float: left;
                                                    }

                                                    .supplier_radio_grp input {
                                                        margin-left: 12px;
                                                    }
                                            </style>
                                            <div class="supplier_radio_grp">
                                                <asp:RadioButton ID="rbtn_SupplierWise" GroupName="a" OnCheckedChanged="rbtn_SupplierWise_CheckedChanged" runat="server" AutoPostBack="true" Text="Supplier Wise" />&nbsp&nbsp&nbsp&nbsp
                                                <asp:RadioButton ID="rbtn_All" runat="server" GroupName="a" OnCheckedChanged="rbtn_All_CheckedChanged" Checked="true" AutoPostBack="true" Text="All" />
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <asp:Button runat="server" ID="btnGetB2B" class="btn btn-primary" OnClick="btnGetB2B_Click" Text="Get B2B" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <asp:Panel ID="pnlGroupFilter" Visible="false" runat="server">
                                            <div class="col-sm-12" >
<%--                                                <asp:GridView ID="GridGroupFilter" CssClass="table table-bordered "  OnRowCommand="GridGroupFilter_RowCommand" OnPageIndexChanging="GridGroupFilter_PageIndexChanging" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false">--%>
                                                                                                <asp:GridView ID="GridGroupFilter" CssClass="table table-striped table-bordered table-hover "  OnRowCommand="GridGroupFilter_RowCommand" OnPageIndexChanging="GridGroupFilter_PageIndexChanging" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false">

                                                    <Columns>

                                                        <asp:TemplateField HeaderText="S.No.">
                                                            <ItemTemplate>
                                                                <%#Container.DataItemIndex+1 %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Purchase GSTIN">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="linkGrupGSTIN" runat="server" Text='<%#Eval("PurchGSTIN")%>' CommandName="GSTINDetail" CommandArgument='<%#Eval("PurchGSTIN")%>'> </asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <%--  <asp:BoundField HeaderText="Purchase GSTIN" DataField="PurchGSTIN" />--%>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </asp:Panel>



                                        <asp:Panel ID="pnlUniqe" Visible="false" runat="server">
                                            <div class="col-sm-12">
                                                <div class="table-responsive">
                                                    <div style="max-height: 419px">
                                                        <asp:GridView ID="GridUniqeGstin" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover ">
                                                            <Columns>

                                                                <asp:TemplateField HeaderText="SrNo.">
                                                                    <ItemTemplate>
                                                                        <%#Container.DataItemIndex+1 %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField HeaderText="Purchase GSTIN" DataField="PurchGSTIN" />
                                                                <asp:BoundField HeaderText="Invoice Number" DataField="CurrInvoiceNo" />
                                                                <asp:BoundField HeaderText="Invoice Date" DataField="CurrinvoiceDt" />
                                                                <asp:BoundField HeaderText="Invoice Value" DataField="CurrInvoiceValue" />
                                                                <asp:BoundField HeaderText="Taxable Value" DataField="TaxableValue" />
                                                                <asp:BoundField HeaderText="IGST" DataField="IGSTAmt" />
                                                                <asp:BoundField HeaderText="CGST" DataField="CGSTAmt" />
                                                                <asp:BoundField HeaderText="SGST" DataField="SGSTAmt" />
                                                                <asp:BoundField HeaderText="Cess" DataField="CessAmt" />
                                                                <asp:BoundField HeaderText="POS" DataField="Statedesc" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>


                                    <asp:Panel ID="PnlAlldata" Visible="false" runat="server">
                                        <div style="margin-left: -15px; margin-right: -15px">
                                            <script>
                                                $(document).ready(function () {

                                                    var target = $("#target")[0]; // <== Getting raw element
                                                    $("#source").scroll(function () {
                                                        target.scrollLeft = this.scrollLeft;
                                                    });
                                                    var source = $("#source")[0]; // <== Getting raw element
                                                    $("#target").scroll(function () {
                                                        source.scrollLeft = this.scrollLeft;
                                                    });

                                                });
                                            </script>
                                            <style>
                                                .mb15 {
                                                    margin-bottom: 15px;
                                                }

                                                .gstrb2b {
                                                }

                                                    .gstrb2b tr th {
                                                        word-break: break-all;
                                                        font-size: 12px;
                                                        padding: 8px 2px !important;
                                                    }

                                                    .gstrb2b tr td {
                                                        word-break: break-all;
                                                        font-size: 12px;
                                                        padding: 4px 1px !important;
                                                    }
                                            </style>
                                            <div style="max-height: 36px; overflow: hidden; width: 100%; padding-right: 17px">
                                                <div id="target" style="overflow-x: scroll;">
                                                    <table class="table table-bordered gstrb2b" style="width: 1024px">
                                                        <tr>
                                                            <th style="width: 04%;">S.No.</th>
                                                            <th style="width: 12%;">Purchase GSTIN</th>
                                                            <th style="width: 12%;">Invoice Number</th>
                                                            <th style="width: 09%;">Invoice Date</th>
                                                            <th style="width: 09%;">Invoice Value</th>
                                                            <th style="width: 09%;">Taxable Value</th>
                                                            <th style="width: 09%;">IGST</th>
                                                            <th style="width: 08%;">CGST</th>
                                                            <th style="width: 08%;">SGST</th>
                                                            <th style="width: 08%;">Cess</th>
                                                            <th style="width: 11%;">POS</th>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <div id="source" style="max-height: 400px; overflow: auto;">
                                                <asp:GridView runat="server" class="table table-bordered gstrb2b table-striped table-hover" ID="grdGSTR2AData" AutoGenerateColumns="false" ShowHeader="false" Style="width: 1024px">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="04%" HeaderText="SrNo.">
                                                            <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField ItemStyle-Width="12%" HeaderText="Purchase GSTIN" DataField="PurchGSTIN" />
                                                        <asp:BoundField ItemStyle-Width="12%" HeaderText="Invoice Number" DataField="CurrInvoiceNo" />
                                                        <asp:BoundField ItemStyle-Width="09%" ItemStyle-CssClass="text-center" HeaderText="Invoice Date" DataField="CurrinvoiceDt" />
                                                        <asp:BoundField ItemStyle-Width="09%" ItemStyle-CssClass="text-right" HeaderText="Invoice Value" DataField="CurrInvoiceValue" />
                                                        <asp:BoundField ItemStyle-Width="09%" ItemStyle-CssClass="text-right" HeaderText="Taxable Value" DataField="TaxableValue" />
                                                        <asp:BoundField ItemStyle-Width="09%" ItemStyle-CssClass="text-right" HeaderText="IGST" DataField="IGSTAmt" />
                                                        <asp:BoundField ItemStyle-Width="08%" ItemStyle-CssClass="text-right" HeaderText="CGST" DataField="CGSTAmt" />
                                                        <asp:BoundField ItemStyle-Width="08%" ItemStyle-CssClass="text-right" HeaderText="SGST" DataField="SGSTAmt" />
                                                        <asp:BoundField ItemStyle-Width="08%" ItemStyle-CssClass="text-right" HeaderText="Cess" DataField="CessAmt" />
                                                        <asp:BoundField ItemStyle-Width="11%" HeaderText="POS" DataField="Statedesc" />

                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </asp:Panel>

                                    <br />
                                    <br />
                                    <%--<asp:Button runat="server" ID="btnRegisterDSC" class="btn btn-primary" OnClick="btnRegisterDSC_Click" Text="Register DSC" />--%>

                                    <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#viewsave">Get Summary</button>--%>
                                    <br />
                                    <asp:Label runat="server" ID="lblGSTR2AStatus"></asp:Label>
                                </div>
                            </div>
                        </div>



                    </div>

                </div>

            </div>
        </div>
        <%--  </ContentTemplate>
          </asp:UpdatePanel>--%>


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
            $('#<%=btnGetB2B.ClientID%>').click(function () { $('.loading').addClass('active'); });
            $('#<%=btnConnectTOGSTIN.ClientID%>').click(function () {
                $('.loading').addClass('active');
            });
            $('.liImportExcel').show();
            $('#<%=btnVerify.ClientID%>').click(function () {
                SHowProgress();
            });
        });
    </script>

</asp:Content>

