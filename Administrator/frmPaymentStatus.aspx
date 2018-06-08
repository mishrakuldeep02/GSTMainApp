<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmPaymentStatus.aspx.cs" Inherits="Administrator_frmPaymentStatus" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {
            if ($('#<%=rdbDateWise.ClientID%>').is(':checked')) {
                if ($('#<%=txtFromDate.ClientID%>').val().trim() == '') {
                    $('#<%=tstar.ClientID%>').html('');
                    $('#<%=fstar.ClientID%>').html('Please  Enter Form Date');
                    return false;
                }
                else if ($('#<%=txtToDate.ClientID%>').val().trim() == '') {
                    $('#<%=fstar.ClientID%>').html('');
                    $('#<%=tstar.ClientID%>').html('Please Enter To Date.');
                    return false;
                }
        }
    }
    $(function () {
        $('.datepicker_theme').datepicker();
    });
    $(document).ready(function () {

        $('#<%=rdbDateWise.ClientID%>').click(function () {
            $('#<%=txtFromDate.ClientID%>').val('');
            $('#<%=txtToDate.ClientID%>').val('');
            $('#<%=txtFromDate.ClientID%>').prop('disabled', false);
            $('#<%=txtToDate.ClientID%>').prop('disabled', false);
        });

        $('#<%=rdbAll.ClientID%>').click(function () {
            $('#<%=txtFromDate.ClientID%>').val('');
            $('#<%=txtToDate.ClientID%>').val('');
            $('#<%=txtFromDate.ClientID%>').prop('disabled', true);
            $('#<%=txtToDate.ClientID%>').prop('disabled', true);
        });
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <section>
        <div class="content-wrapper">
            <h3>Payment Status
            </h3>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="control-label col-sm-4 text-left" style="text-align: left">User Type :</label>
                                    <div class="col-sm-8">
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlUserType">
                                            <asp:ListItem Value="1" Text="BC"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Client"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="control-label col-sm-4 text-left  col-xs-12" style="text-align: left">View By :</label>
                                    <label class="col-sm-8">
                                        <div class="control-label-normal">
                                            <div class="col-sm-3 col-xs-12">
                                                <asp:RadioButton Checked="true" GroupName="Date" runat="server" ID="rdbAll" Text="All" />
                                            </div>
                                            <div class="col-sm-5  col-xs-12">
                                                <asp:RadioButton GroupName="Date" runat="server" ID="rdbDateWise" Text="Date Wise" />
                                            </div>
                                        </div>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group mb0">
                                    <label class="control-label col-sm-4 text-left" style="text-align: left">From&nbsp;Date&nbsp;:</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox runat="server" disabled="disabled" ID="txtFromDate" placeholder="DD/MM/YYYY" CssClass="form-control datepicker_theme" data-date-format="dd/mm/yyyy"></asp:TextBox>
                                        <span id="fstar" runat="server" style="color: red; position: absolute;"></span>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group mb0">
                                    <label class="control-label col-sm-4 text-left" style="text-align: left">To Date :</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox disabled="disabled" runat="server" ID="txtToDate" placeholder="DD/MM/YYYY" CssClass="datepicker_theme form-control" data-date-format="dd/mm/yyyy"></asp:TextBox>
                                        <span id="tstar" runat="server" style="color: red; position: absolute;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <asp:Button runat="server" Text="View" OnClientClick="return validate()" OnClick="Unnamed_Click" CssClass="btn btn-primary" />
                            <asp:Button runat="server" Text="Clear" OnClick="Unnamed_Click1" CssClass="btn btn-danger" />
                            <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

