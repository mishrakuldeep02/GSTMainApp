<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmMenuAllotment.aspx.cs" Inherits="CA_Admin_frmMenuAllotment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <!-- START Page content-->
        <div class="content-wrapper ">
            <h3>Menu Allotment</h3>
            <div class="row">
                <div class="col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body form-horizontal">
                            <div class="row">
                                <div class="col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <label class="col-xs-12">User Level</label>
                                        <div class="col-xs-12">
                                            <asp:DropDownList runat="server" ID="ddlUserLevel" CssClass="form-control" OnSelectedIndexChanged="ddlUserLevel_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-4">
                                    <div class="form-group">
                                        <label class="col-xs-12">CA / Article / Client</label>
                                        <div class="col-xs-12">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlClient_Ca_Arti" OnSelectedIndexChanged="ddlClient_Ca_Arti_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <label class="col-xs-12">Select Menu</label>
                                        <div class="col-xs-12">
                                            <div class="row">
                                                <script>
                                                    $(document).ready(function () {
                                                        $(".check_class input").click(function () {
                                                            $(".check_class input").not(this).prop('checked', false);
                                                        });
                                                    })
                                                </script>
                                                <style>
                                                    .menuallottable tr td {
                                                        padding: 2px 4px !important;
                                                    }

                                                    .menuallottable label {
                                                        margin-top: 3px;
                                                        font-weight: normal;
                                                        display: inline-block;
                                                        margin-left: 5px;
                                                        user-select: none;
                                                        cursor: pointer;
                                                        margin-bottom: 0px;
                                                    }

                                                    .menuallottable input[type="checkbox"] {
                                                        font-weight: normal;
                                                        display: block;
                                                        margin-left: 5px;
                                                        float: left;
                                                        margin-top: 6px;
                                                    }

                                                    .table-td-th-padding-2px tr td, .table-td-th-padding-2px tr th {
                                                        padding: 2px 2px !important;
                                                    }

                                                    .vertical-top tr td {
                                                        vertical-align: top !important;
                                                    }

                                                    .checkbox-true-bold tr td input[type="checkbox"]:checked + label {
                                                        font-weight: bold;
                                                        color: #139b58;
                                                    }

                                                    .Menucenter {
                                                        text-align: center;
                                                    }
                                                </style>
                                                <div class="col-xs-12" runat="server" id="menuPanel" visible="false">

                                                    <table class="table table-bordered table-ims table-td-th-padding-2px vertical-top checkbox-true-bold">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 40%">Main Menu</th>
                                                                <th style="width: 05%; background-color: transparent; border-color: transparent">&nbsp;</th>
                                                                <th style="width: 40%">Sub Menu</th>
                                                                <th style="width: 05%; background-color: transparent; border-color: transparent">&nbsp;</th>
                                                                <th style="width: 10%; background-color: transparent; border-color: transparent">&nbsp</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBoxList ID="chkListMainMenu" CssClass="table table-bordered menuallottable check_class" OnSelectedIndexChanged="chkListMainMenu_SelectedIndexChanged" AutoPostBack="true" runat="server" RepeatColumns="2"></asp:CheckBoxList>
                                                                </td>
                                                                <td style="border-color: transparent">&nbsp;</td>
                                                                <td>
                                                                    <asp:CheckBoxList ID="chkListSubMenu" CssClass="table table-bordered menuallottable" runat="server" RepeatColumns="2"></asp:CheckBoxList>
                                                                </td>
                                                                <td style="border-color: transparent">&nbsp;</td>
                                                                <td>
                                                                    <asp:Button Text="Add in Grid" runat="server" CssClass="btn btn-primary" ID="btnAdd" OnClick="btnAdd_Click" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="table-responsive table-responsive-ims" runat="server" id="gvPanel" visible="false">
                                        <div style="padding-right: 17px">
                                            <table class="table table-bordered table-ims table-td-th-padding-2px">
                                                <thead>
                                                    <tr>
                                                      <%--  <th style="width: 20%" class="Menucenter">Menu Id</th>--%>
                                                        <th style="width: 75%">Menu Name</th>
                                                       <%-- <th style="width: 5%">Delete</th>--%>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <style>
                                       
                                    </style>

                                    <div class="table-responsive table-responsive-ims">
                                        <div style="max-height: 150px; overflow-y: scroll">
                                            <table class="table table-bordered table-ims table-td-th-padding-2px">
                                                <asp:GridView runat="server" AutoGenerateColumns="false" ID="gvData" ShowHeader="false" Width="100%" OnRowCommand="gvData_RowCommand">
                                                    <Columns>
                                                        <asp:TemplateField Visible="false" ItemStyle-Width="20%" ItemStyle-CssClass="Menucenter">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMenuId" Text='<%#Eval("MenuId") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="75%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMenuDesc" Text='<%#Eval("MenuDesc") %>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="MenuInd" Visible="false" />

                                                        <asp:TemplateField ItemStyle-Width="5%" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="btnDelete" Text="Delete" CommandName="DeleteRow" CommandArgument='<%#Container.DataItemIndex %>' CssClass="btn btn-xs btn-danger add_btn" runat="server"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>

                                                </asp:GridView>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-xs-12 text-right">

                                    <asp:Label Text="" CssClass="text-danger" ID="lblMsg" runat="server" />
                                    <asp:Button Text="Save" runat="server" ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-success" />
                                    <asp:Button Text="Clear" runat="server" ID="brnClear" OnClick="brnClear_Click" CssClass="btn btn-info" />
                                    <asp:Button Text="Exit" runat="server" ID="btnExit" OnClick="btnExit_Click" CssClass="btn btn-danger" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</asp:Content>

