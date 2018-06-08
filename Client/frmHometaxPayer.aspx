<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmHometaxPayer.aspx.cs" Inherits="Client_frmHometaxPayer" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="content-wrapper">
            <h3 class="text-center">Registered GSTIN</h3>
            <div class="col-sm-7 col-sm-offset-2">
            <div class="panel panel-default">
                <div>
                    <div class="table-responsive">
                        <asp:GridView OnRowCommand="grdRegisteredGSTIN_RowCommand" AutoGenerateColumns="false" CssClass="table table-bordered" runat="server" ID="grdRegisteredGSTIN">
                            <Columns>
                                <asp:TemplateField HeaderText="S. No."  HeaderStyle-CssClass="inverse_head">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="Label1" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="GSTIN" DataField="GSTNNO"  HeaderStyle-CssClass="inverse_head"/>
                                 <asp:TemplateField HeaderText="Month" ItemStyle-CssClass="col5" HeaderStyle-CssClass="col5">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" style="padding:0" ID="ddlMonth" CssClass="form-control"></asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                <asp:ButtonField HeaderText="Select" ButtonType="Button" CommandName="Selecting" Text="Select" ControlStyle-CssClass="btn btn-primary"  HeaderStyle-CssClass="inverse_head"/>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
                </div>
        </div>



    </section>
</asp:Content>

