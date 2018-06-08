<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmViewClient.aspx.cs" Inherits="CA_Admin_frmViewClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <div class="content-wrapper">
            <h3>View All Clients</h3>
            <div class="col-xs-12">
                <div class="row">
                    <section class="registration_page_section">
                        <!-- START Page content-->
                                                                                                                                                                                                                                   
                        <div class="row">
                            <div id="pnlRegistration" runat="server" class="col-sm-12 col-xs-12" visible="true">

                                <div class="panel panel-default">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <asp:TextBox runat="server" type="text" CssClass="myInput" ID="myInput" onkeyup="myFunction()" placeholder="Search .." />
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <asp:GridView runat="server" DataKeyNames="ClientCode,ClientCodeOdp" OnRowCommand="grdAllClients_RowCommand" class="table table-bordered" ID="grdAllClients" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No." ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Contact Person" DataField="ClientNameE" />
                                                <asp:BoundField HeaderText="Organization Name" DataField="FirmName" />
                                                <asp:BoundField HeaderText="PAN" DataField="ClientPANNo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                                <asp:BoundField HeaderText="Mobile No." DataField="ClientMobileNo1" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                                <asp:BoundField HeaderText="Email ID" DataField="EmailId" />
                                                <asp:ButtonField HeaderText="View" Text="View" CommandName="View" ControlStyle-CssClass="btn btn-primary" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                                                <asp:BoundField Visible="false" DataField="ClientCode" />
                                                <asp:BoundField Visible="false" DataField="ClientCodeOdp" />
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
        <!-- Modal -->

    </section>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">
                        <asp:Label runat="server" ID="lblClientName"></asp:Label></h4>
                </div>
                <div class="modal-body">
                    <div style="height: 200px; overflow: auto; overflow-x: hidden">
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="grdClientDetails" CssClass="table table-bordered table-client-search" AutoGenerateColumns="false">
                                <EmptyDataTemplate>
                                    <asp:Label runat="server" ID="lbl" CssClass="label label-info" Text="No Record Found."></asp:Label>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="S. No." ItemStyle-CssClass="col1" HeaderStyle-CssClass="col1">
                                        <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Trade Name" DataField="TradeName" />
                                    <asp:BoundField HeaderText="State" DataField="Statedesc" />
                                    <asp:BoundField HeaderText="City" DataField="CityDesc" />
                                    <asp:BoundField HeaderText="GSTIN" DataField="GSTNNO" />
                                    <asp:BoundField HeaderText="Aadhaar No." DataField="AadhaarNo" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <style>
        .myInput {
            background-image: url('../Content/img/searchicon.png'); /* Add a search icon to input */
            background-position: 10px 7px; /* Position the search icon */
            background-repeat: no-repeat; /* Do not repeat the icon image */
            width: 100%; /* Full-width */
            font-size: 16px; /* Increase font-size */
            padding: 5px 11px; /* Add some padding */
            padding-left: 40px;
            border: 1px solid #ddd; /* Add a grey border */
            margin-bottom: 12px; /* Add some space below the input */
        }
    </style>
    <script>
        $(document).ready(function () {
            myFunction();
        });
        function myFunction() {
            // Declare variables 
            var input, filter, table, tr, td, i;
            input = document.getElementById("<%=myInput.ClientID%>");
            filter = input.value.toUpperCase();
            table = document.getElementById("<%=grdAllClients.ClientID%>");
            tr = table.getElementsByTagName("tr");
            //tr.style.backgroundColor = 'white';

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 1; i < tr.length; i++) {
                var flage = 0;
                for (j = 0; j < tr[i].getElementsByTagName("td").length - 1; j++) {
                    td = tr[i].getElementsByTagName("td")[j];
                    if (td) {

                        td.style.backgroundColor = 'white';
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            flage++;
                            td.style.backgroundColor = 'lightgrey';
                        }
                        if (input.value == '') {
                            td.style.backgroundColor = 'white';
                        }
                    } else {
                        flage++;
                    }
                }
                if (flage == 0) {
                    tr[i].style.display = "none";
                } else {
                    tr[i].style.display = "";
                }
            }
        }
    </script>
</asp:Content>

