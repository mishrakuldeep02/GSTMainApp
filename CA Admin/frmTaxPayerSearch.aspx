<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmTaxPayerSearch.aspx.cs" Inherits="CA_Admin_frmTaxPayerSearch" %>
<%@ Register TagName="UserControl" TagPrefix="notification" Src="~/UserControl/wucNotification.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('.search_activeme').addClass('active');
            $('.chzn-single').addClass('hgt');
        });
    </script>
   <style type="text/css">
        .hgt
        {
            height:35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <!-- START Page content-->
        <div class="content-wrapper">
            <div class="row">
                  <div class="col-md-3 col-xs-12 pull-right">
                    <notification:UserControl runat="server" ID="wucNotification" />
              </div>
                <div class="col-md-9 pull-left col-xs-12">
                    <div class="row">

                        <!-- START 1 panel-->
                        <div class="panel panel-default panel-demo">
                            <div class="panel-heading">
                                <h4 class="panel-title">

                                    <span class="gstr_row_title">Search Client :</span>

                                </h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="gstr-nav-form gstr-client-search-nav">
                                            <asp:DropDownList onchange="HideShow()" runat="server" ID="ddlSearchType" class="form-control search_client_by grp_inpt_gstr_ddl">
                                                <asp:ListItem Value="1" Text="Client Name"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="GSTIN"></asp:ListItem>
                                                <asp:ListItem Value="3" Text="PAN No."></asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="grp_inpt_gstr_txt">
                                                <asp:DropDownList CssClass="chzn-select form-control search_client_by_placeholder grp_inpt_gstr_txt" runat="server" ID="ddlName">
                                                </asp:DropDownList>
                                                <asp:TextBox runat="server" MaxLength="15" ID="txtSearch" Style="display: none;" class="form-control search_client_by_placeholder grp_inpt_gstr_txt" placeholder="Search"></asp:TextBox>
                                            </div>
                                            <%--<input list="clients" class="form-control search_client_by_placeholder grp_inpt_gstr_txt" placeholder="Search">--%>
                                            <%--<datalist id="clients">
                                                <option value="Ankit Consultancy Pvt Ltd Indore">
                                                <option value="Jay Dev Civilcon India Private Limited Bhopal">
                                                <option value="Sushma Multitrade Pvt Ltd Mumbai">
                                                <option value="Evergreen Colours India Private Limited Indore">
                                                <option value="Kartikey Colonisers Pvt Ltd Ujjain">
                                                <option value="Krini Infratech Private Limited Dhar">
                                                <option value="Sarvottam Cropscience India Pvt Ltd Sagar">
                                            </datalist>--%>
                                            <asp:Button runat="server" ID="btnGo" OnClick="btnGo_Click" class="btn btn-primary grp_inpt_gstr_btn" Text="Go !" />
                                            <%--<a class="btn btn-primary grp_inpt_gstr_btn" href="frmClientPage.aspx">Go !</a>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive table-container">
                                    <asp:GridView runat="server" CssClass="table table-bordered table-client-search" OnRowCommand="grdSearchResult_RowCommand" ID="grdSearchResult" DataKeyNames="ClientCode,ClientCodeOdp" AutoGenerateColumns="false">
                                        <EmptyDataTemplate>
                                            <asp:Label runat="server" ID="lbl" CssClass="label label-info" Text="No Record Found."></asp:Label>
                                        </EmptyDataTemplate>
                                        <Columns>
                                            <asp:BoundField Visible="false" DataField="ClientCode" />
                                            <asp:BoundField Visible="false" DataField="ClientCodeOdp" />
                                            <asp:TemplateField HeaderText="S. No." ItemStyle-CssClass="col1" HeaderStyle-CssClass="col1">
                                                <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Client Name" DataField="ClientNameE" ItemStyle-CssClass="col2" HeaderStyle-CssClass="col2" />
                                            <asp:BoundField HeaderText="PAN No." DataField="PanNo" ItemStyle-CssClass="col3" HeaderStyle-CssClass="col3" />
                                            <asp:BoundField HeaderText="GSTIN" DataField="GSTNNo" ItemStyle-CssClass="col4" HeaderStyle-CssClass="col5" />
                                            <asp:TemplateField HeaderText="Month" ItemStyle-CssClass="col5" HeaderStyle-CssClass="col5">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" style="padding:0" ID="ddlMonth" CssClass="form-control"></asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:ButtonField HeaderText="Select" ButtonType="Button" ItemStyle-CssClass="col5" HeaderStyle-CssClass="col5" CommandName="Select" ControlStyle-CssClass="btn btn btn-primary" Text="Select" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>
                            <!-- END 1 panel-->



                            <%-- <div class="table-responsive">
                                    <asp:GridView runat="server" CssClass="table table-bordered table-client-search" OnRowCommand="grdSearchResult_RowCommand" ID="grdSearchResult" DataKeyNames="ClientCode,ClientCodeOdp" AutoGenerateColumns="false">
                                        <EmptyDataTemplate>
                                            <asp:Label runat="server" ID="lbl" CssClass="label label-info" Text="No Record Found." ></asp:Label>
                                        </EmptyDataTemplate>
                                        <Columns>                                            
                                            <asp:BoundField  Visible="false" DataField="ClientCode" />
                                            <asp:BoundField  Visible="false" DataField="ClientCodeOdp" />
                                            <asp:TemplateField HeaderText="S. No." ItemStyle-CssClass="col1" HeaderStyle-CssClass="col1"><ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate></asp:TemplateField>
                                            <asp:BoundField HeaderText="Client Name" DataField="ClientNameE"  ItemStyle-CssClass="col2"  HeaderStyle-CssClass="col2"/>
                                            <asp:BoundField HeaderText="PAN No." DataField="PanNo"  ItemStyle-CssClass="col3" HeaderStyle-CssClass="col3"/>
                                            <asp:BoundField HeaderText="GSTIN" DataField="GSTNNo"  ItemStyle-CssClass="col4" HeaderStyle-CssClass="col5"/>
                                            <asp:ButtonField HeaderText="Select" ButtonType="Button"   ItemStyle-CssClass="col5" HeaderStyle-CssClass="col5" CommandName="Select" ControlStyle-CssClass="btn btn-xs btn-primary" Text="Select" />
                                        </Columns>
                                    </asp:GridView>--%>
                        </div>
                    </div>

                </div>
            </div>
            <!-- END Page content-->
    </section>
    <script type="text/javascript">
        function HideShow() {
            if ($('#<%=ddlSearchType.ClientID%>').val() != "1") {
               $('#<%=txtSearch.ClientID%>').show();
               $('#<%=ddlName.ClientID%>').hide();
               $('#ContentPlaceHolder1_ddlName_chzn').hide();
           } else {
               $('#<%=txtSearch.ClientID%>').hide();
               // $('#<%=ddlName.ClientID%>').show();
               $('#ContentPlaceHolder1_ddlName_chzn').show();
           }
        }
        $(document).ready(function () {
            HideShow();
        });
    </script>
</asp:Content>


