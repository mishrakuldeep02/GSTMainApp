<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmCaAllotmentToClient.aspx.cs" Inherits="CA_Admin_frmCaAllotmentToClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
        <div class="content-wrapper">
            <h3>Client Allotment</h3>
            <div class="col-xs-12">
                <div class="row">
                    <section class="registration_page_section">
                        <!-- START Page content-->
                            <div class="row">
                                <div id="pnlRegistration" runat="server" class="col-sm-12 col-xs-12" visible="true">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <asp:Panel runat="server" Visible="false" ID="pnlError" class="col-sm-6 col-sm-offset-3">
                                                <div class="">                                          
                                                    <i class="fa r fa-info-circle"></i> 
                                                    <asp:Label CssClass="error_msg" runat="server" ID="lblMsg"></asp:Label>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="table-responsive">
                                            <asp:GridView runat="server" OnRowDataBound="grdAllClients_RowDataBound" DataKeyNames="ClientCode,ClientCodeOdp,AllotmentInd,AllotmentCACode,OdpGSTNo" OnRowCommand="grdAllClients_RowCommand" class="table table-bordered" ID="grdAllClients" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Client Name">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%#Eval("ClientNameE") %>' ID="lblClientName"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Firm Name" DataField="FirmName" />
                                                    <asp:BoundField HeaderText="PAN" DataField="ClientPANNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center"/>
                                                    <asp:TemplateField HeaderText="GSTIN">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%#Eval("GSTNNO") %>' ID="lblGSTIN"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CA List"  HeaderStyle-CssClass="text-center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList runat="server" ID="ddlCA" CssClass="form-control"></asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="" Visible="false" DataField="ClientCode" />
                                                    <asp:BoundField HeaderText="" Visible="false" DataField="ClientCodeOdp" />
                                                    <asp:BoundField HeaderText="" Visible="false" DataField="AllotmentInd" />
                                                    <asp:BoundField HeaderText="" Visible="false" DataField="AllotmentCACode" />
                                                    <asp:BoundField HeaderText="" Visible="false" DataField="OdpGSTNo" />
                                                    <asp:ButtonField HeaderText="Allot" Text="Allot" CommandName="Allot" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                                </Columns>
                                            </asp:GridView>
                                         <%--   <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>S.No.</th>
                                                        <th>Client Name</th>
                                                        <th>Firm Name</th>
                                                        <th>PAN</th>
                                                        <th>Mobile No.</th>
                                                        <th>Email ID</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>01</td>
                                                        <td>Client Name</td>
                                                        <td>Firm Name</td>
                                                        <td>PAN</td>
                                                        <td>Mobile No.</td>
                                                        <td>Email ID</td>
                                                    </tr>
                                                </tbody>
                                            </table>--%>
                                        </div>
                                    </div>
                                </div>

                            </div>
                      
                        <!-- END Page content-->

                    </section>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

