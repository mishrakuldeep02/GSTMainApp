<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmB2B.aspx.cs" Inherits="CA_Admin_frmB2B" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Src="~/UserControl/wucImportData.ascx" TagName="UserControlModal" TagPrefix="cc1" %>
<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .btn-asp-fa {
            font-family: FontAwesome,Roboto,Arial,sans-serif;
        }
        /*  bhoechie tab */
        div.b2b-bhoechie-tab-container {
            z-index: 10;
            background-color: #ffffff;
            padding: 0 !important;
            border-radius: 0px;
            -moz-border-radius: 0px;
            background-clip: padding-box;
            opacity: 0.97;
            filter: alpha(opacity=97);
        }

        div.b2b-bhoechie-tab-menu {
            padding-right: 0;
            padding-left: 0;
            padding-bottom: 0;
        }

            div.b2b-bhoechie-tab-menu div.list-group {
                margin-bottom: 0;
            }

            div.b2b-bhoechie-tab-menu div .list-group-item {
                border-right-color: #dbdbdb;
            }

            div.b2b-bhoechie-tab-menu div.list-group > a {
                margin-bottom: 0;
                text-align: left;
                font-weight: 600;
                border-radius: 0;
                color: #000;
            }




                div.b2b-bhoechie-tab-menu div.list-group > a.active,
                div.b2b-bhoechie-tab-menu div.list-group > a.active .glyphicon,
                div.b2b-bhoechie-tab-menu div.list-group > a.active .fa {
                    background-color: #1c75bf;
                    color: #ffffff;
                }

                div.b2b-bhoechie-tab-menu div.list-group > a:first-child {
                    border-top: 0;
                }

                div.b2b-bhoechie-tab-menu div.list-group > a:last-child {
                    border-bottom: 0;
                }

                div.b2b-bhoechie-tab-menu div.list-group > a.active:after {
                    content: '';
                    position: absolute;
                    left: 100%;
                    top: 50%;
                    margin-top: -13px;
                    border-left: 0;
                    border-bottom: 13px solid transparent;
                    border-top: 13px solid transparent;
                    border-left: 10px solid #1c75bf;
                }

        div.b2b-bhoechie-tab-content {
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 00px;
            padding-bottom: 15px;
        }

            div.b2b-bhoechie-tab-content h4 {
                margin-top: 10px;
                margin-bottom: 15px;
            }

        div.b2b-bhoechie-tab div.b2b-bhoechie-tab-content:not(.active) {
            display: none;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("div.b2b-bhoechie-tab-menu>div.list-group>a").click(function (e) {
                e.preventDefault();
                $(this).siblings('a.active').removeClass("active");
                $(this).addClass("active");
                var index = $(this).index();
                $("div.b2b-bhoechie-tab>div.b2b-bhoechie-tab-content").removeClass("active");
                $("div.b2b-bhoechie-tab>div.b2b-bhoechie-tab-content").eq(index).addClass("active");
            });
        });
    </script>
    <script>

        $(document).ready(function () {

            $('#<%=btnAdd.ClientID%>').click(function () {

                $('#<%=lblErrorMsg.ClientID%>').html('');
                $('#errorul').hide();
                if ($('#<%=txtInvoiceDate.ClientID%>').is(':checked') && $('#<%=txtInvoiceDate.ClientID%>').val().trim() == '') {
                    $('#errorul').show();
                    $('#<%=lblErrorMsg.ClientID%>').html('Enter Composition Date.');
                    $('#<%=txtInvoiceDate.ClientID%>').focus();
                    return false;
                }
            });
        })

    </script>
    <script>
        function upperCaseF(a) {
            setTimeout(function () {
                a.value = a.value.toUpperCase();
            }, 1);
        }
    </script>
    <script type="text/javascript">
        function LoadAllScript() {
            LoadBasic();

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section>
        <!-- START Page content-->


        <div class="content-wrapper ">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <asp:ScriptManager ID="scr" runat="server"></asp:ScriptManager>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default" style="margin-bottom: 0">
                        <div class="panel-body" style="padding: 0">
                            <div class="b2b-bhoechie-tab-container">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 b2b-bhoechie-tab-menu">
                                    <div class="list-group">
                                        <a href="#" class="list-group-item text-center active"><i class="fa r fa-hand-o-right"></i>B2B</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>B2CL</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>B2CS</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>CDNR</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>CDNUR</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>EXP</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>AT</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>ATADJ</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>EXEMP</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>HSN</a>
                                        <a href="#" class="list-group-item text-center"><i class="fa r fa-hand-o-right"></i>DOCS</a>
                                    </div>
                                </div>


                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 b2b-bhoechie-tab">

                                    <div class="b2b-bhoechie-tab-content active">
                                        <h4 class="text-center">GSTR-1 Entry</h4>

                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>


                                                <div class="form-horizontal">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    GSTIN : 
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtGstin" runat="server" MaxLength="15" onkeydown="upperCaseF(this)" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtGstin" />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator10" runat="server" SetFocusOnError="true" ControlToValidate="txtGstin" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice No. :
                                                            <asp:RequiredFieldValidator ID="rq1" runat="server" ControlToValidate="txtInvoiceNo" ErrorMessage="*" ValidationGroup="a" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtInvoiceNo" MaxLength="16" onkeydown="upperCaseF(this)" runat="server" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters" ValidChars="/-" TargetControlID="txtInvoiceNo" />

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice Date :  
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInvoiceDate" ErrorMessage="*" ValidationGroup="a" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtInvoiceDate" placeholder="Date of Invoice"></asp:TextBox>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice Value : 
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInvoiceValue" ErrorMessage="*" ValidationGroup="a" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtInvoiceValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtInvoiceValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtInvoiceValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="a" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Place of Supply : 
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlPlaceSupply" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />

                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Reverse Charge : 
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlReverseCharge" runat="server" CssClass="form-control">

                                                                        <asp:ListItem Value="0" Text="No" />
                                                                        <asp:ListItem Value="1" Text="Yes" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice Type
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlB2bInvoiceType" runat="server" CssClass="form-control">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    E-Commerce GSTIN : 
                                                                </label>
                                                                <div class="col-xs-12">


                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator44" runat="server" SetFocusOnError="true" ControlToValidate="txtEcommerceGstin" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>

                                                                    <asp:TextBox ID="txtEcommerceGstin" runat="server" MaxLength="15" onkeydown="upperCaseF(this)" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtEcommerceGstin" />
                                                                </div>


                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Tax Rate : 
                                                           
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:DropDownList ID="ddltxtTaxRate" runat="server" CssClass="form-control">
                                                                    </asp:DropDownList>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Taxable Value : 
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTaxableValue" ErrorMessage="*" ValidationGroup="a" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtTaxableValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtTaxableValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTaxableValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="a" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Cess Amount : 
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCessAmount" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtCessAmount" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="revRate" runat="server" ControlToValidate="txtCessAmount" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="a" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                            <asp:Label runat="server" ID="lblErrorMsg" CssClass="text-danger"></asp:Label>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Button ID="btnAdd" Text="&#xf067; Add" ValidationGroup="a" runat="server" OnClick="btnAdd_Click" CssClass="btn btn-primary btn-asp-fa" />

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">


                                                                <asp:GridView runat="server" ID="grdB2B" AutoGenerateColumns="false" OnRowCommand="grdB2B_RowCommand" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="GSTIN" ItemStyle-HorizontalAlign="Center" DataField="GSTIN/UIN of Recipient" />
                                                                        <asp:BoundField HeaderText="Invoice No." ItemStyle-HorizontalAlign="Center" DataField="Invoice Number" />
                                                                        <asp:BoundField HeaderText="Invoice Date" ItemStyle-HorizontalAlign="Center" DataField="Invoice date" />
                                                                        <asp:BoundField HeaderText="Invoice Value" ItemStyle-HorizontalAlign="Center" DataField="Invoice Value" />
                                                                        <asp:BoundField Visible="false" HeaderText="Place of Supply Code" DataField="PlaceOfSupplyCode" />
                                                                        <asp:BoundField HeaderText="Place of Supply" DataField="Place Of Supply" />
                                                                        <asp:BoundField HeaderText="Reverse Charge" ItemStyle-HorizontalAlign="Center" DataField="Reverse Charge" />
                                                                        <asp:BoundField HeaderText="Invoice Type" ItemStyle-HorizontalAlign="Center" DataField="Invoice Type" />

                                                                        <asp:BoundField HeaderText="Tax Rate." ItemStyle-HorizontalAlign="Center" DataField="Rate" />
                                                                        <asp:BoundField HeaderText="Taxable Value" ItemStyle-HorizontalAlign="Center" DataField="Taxable Value" />
                                                                        <asp:BoundField HeaderText="IGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemIGSTValue" />
                                                                        <asp:BoundField HeaderText="CGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemCGSTValue" />
                                                                        <asp:BoundField HeaderText="SGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemSGSTValue" />
                                                                        <asp:BoundField HeaderText="E-Commerce GSTIN" ItemStyle-HorizontalAlign="Center" DataField="E-Commerce GSTIN" />
                                                                        <asp:BoundField HeaderText="Cess Value" ItemStyle-HorizontalAlign="Center" DataField="Cess Amount" />

                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text='Delete' />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">B2CL Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="upd">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>
                                                <div class="form-horizontal">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice Number 
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtB2clInvoiceNo" ErrorMessage="*" ValidationGroup="b" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtB2clInvoiceNo" MaxLength="16" onkeydown="upperCaseF(this)" runat="server" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters" ValidChars="/-" TargetControlID="txtB2clInvoiceNo" />

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice date
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtB2clInvoiceDate" ErrorMessage="*" ValidationGroup="b" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtB2clInvoiceDate" placeholder="Date of Invoice"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice Value : 
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtB2clInvoiceValue" ErrorMessage="*" ValidationGroup="b" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtB2clInvoiceValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" TargetControlID="txtB2clInvoiceValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtB2clInvoiceValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="b" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Place Of Supply
                                                            
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlB2clPlaceOfSupply" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />
                                                                    </asp:DropDownList>

                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Rate
                                                             
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddltxtB2clRate" runat="server" CssClass="form-control">
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Taxable Value
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtB2clTaxableValue" ErrorMessage="*" ValidationGroup="b" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtB2clTaxableValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="txtB2clTaxableValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtB2clTaxableValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="b" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>

                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Cess Amount
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtB2clCessAmount" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" TargetControlID="txtB2clCessAmount" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtB2clCessAmount" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="b" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    E-Commerce GSTIN
                                                            
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtB2clEcommerceGstin" runat="server" MaxLength="15" onkeydown="upperCaseF(this)" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" FilterType="Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtB2clEcommerceGstin" />

                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator2" runat="server" SetFocusOnError="true" ControlToValidate="txtB2clEcommerceGstin" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Button Text=" &#xf067; Add" ID="btnB2clAdd" ValidationGroup="b" runat="server" OnClick="btnB2clAdd_Click" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>
                                                                <asp:Label ID="lblB2clErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">


                                                                <asp:GridView runat="server" ID="GridB2cl" AutoGenerateColumns="false" OnRowCommand="GridB2cl_RowCommand" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>

                                                                        <asp:BoundField HeaderText="Invoice No." ItemStyle-HorizontalAlign="Center" DataField="Invoice Number" />
                                                                        <asp:BoundField HeaderText="Invoice Date" ItemStyle-HorizontalAlign="Center" DataField="Invoice date" />
                                                                        <asp:BoundField HeaderText="Invoice Value" ItemStyle-HorizontalAlign="Center" DataField="Invoice Value" />
                                                                        <asp:BoundField Visible="false" HeaderText="Place of Supply Code" DataField="PlaceOfSupplyCode" />
                                                                        <asp:BoundField HeaderText="Place of Supply" DataField="Place Of Supply" />
                                                                        <asp:BoundField HeaderText="Rate" ItemStyle-HorizontalAlign="Center" DataField="Rate" />
                                                                        <asp:BoundField HeaderText="Taxable Value" ItemStyle-HorizontalAlign="Center" DataField="Taxable Value" />
                                                                        <asp:BoundField HeaderText="IGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemIGSTValue" />
                                                                        <asp:BoundField HeaderText="CGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemCGSTValue" />
                                                                        <asp:BoundField HeaderText="SGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemSGSTValue" />
                                                                        <asp:BoundField HeaderText="Cess Value" ItemStyle-HorizontalAlign="Center" DataField="Cess Amount" />
                                                                        <asp:BoundField HeaderText="E-Commerce GSTIN" ItemStyle-HorizontalAlign="Center" DataField="E-Commerce GSTIN" />

                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">B2CS Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>

                                                <div class="form-horizontal">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Type
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlB2csType" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="O" />
                                                                        <asp:ListItem Value="1" Text="OE" />

                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Place Of Supply                                                     
                                                            
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlB2csPlaceOfSupply" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Rate
                                                           
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddltxtB2csRate" runat="server" CssClass="form-control">
                                                                    </asp:DropDownList>


                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Taxable Value
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtB2csTaxableValue" ErrorMessage="*" ValidationGroup="c" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtB2csTaxableValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" TargetControlID="txtB2csTaxableValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtB2csTaxableValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="a" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>

                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Cess Amount
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtB2csCessAmount" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" TargetControlID="txtB2csCessAmount" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtB2csCessAmount" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="c" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    E-Commerce GSTIN
                                                            
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtB2csEcommerceGstin" runat="server" MaxLength="15" onkeydown="upperCaseF(this)" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" runat="server" FilterType="Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtB2csEcommerceGstin" />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator5" runat="server" SetFocusOnError="true" ControlToValidate="txtB2csEcommerceGstin" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <div class="col-xs-12 text-left">
                                                                    <asp:Button Text="&#xf067; Add" ID="btnB2csAdd" OnClick="btnB2csAdd_Click" runat="server" ValidationGroup="c" CssClass="btn btn-primary btn-asp-fa" />

                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <div class="col-xs-12 text-right">

                                                                    <asp:Label ID="lblB2csErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">
                                                                <%-- <table class="table table-bordered text-sm">
                                                            <tr>
                                                                <th>Type</th>
                                                                <th>Place of Supply</th>
                                                                <th>Rate</th>
                                                                <th>Taxable Value</th>
                                                                <th>Cess Amount</th>
                                                                <th>E-Commerce GSTIN</th>
                                                                <th>Delete</th>
                                                            </tr>
                                                            <tr>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>
                                                                    <asp:Button Text="&#xf1f8; Del" runat="server" CssClass="btn btn-xs btn-sxs btn-danger  btn-asp-fa" /></td>
                                                            </tr>


                                                        </table>--%>
                                                                <asp:GridView runat="server" ID="GridB2cs" AutoGenerateColumns="false" OnRowCommand="GridB2cs_RowCommand" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>


                                                                        <asp:BoundField HeaderText="Type" ItemStyle-HorizontalAlign="Center" DataField="Type" />
                                                                        <asp:BoundField Visible="false" HeaderText="Place of Supply Code" DataField="PlaceOfSupplyCode" />
                                                                        <asp:BoundField HeaderText="Place of Supply" DataField="Place Of Supply" />
                                                                        <asp:BoundField HeaderText="Rate" ItemStyle-HorizontalAlign="Center" DataField="Rate" />
                                                                        <asp:BoundField HeaderText="Taxable Value" ItemStyle-HorizontalAlign="Center" DataField="Taxable Value" />
                                                                        <asp:BoundField HeaderText="IGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemIGSTValue" />
                                                                        <asp:BoundField HeaderText="CGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemCGSTValue" />
                                                                        <asp:BoundField HeaderText="SGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemSGSTValue" />
                                                                        <asp:BoundField HeaderText="Cess Amount" ItemStyle-HorizontalAlign="Center" DataField="Cess Amount" />
                                                                        <asp:BoundField HeaderText="E-Commerce GSTIN" ItemStyle-HorizontalAlign="Center" DataField="E-Commerce GSTIN" />


                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">CDNR Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>
                                                <div class="form-horizontal">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    GSTIN/UIN of Recipient
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnrGstin" runat="server" MaxLength="15" onkeydown="upperCaseF(this)" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" runat="server" FilterType="Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtCdnrGstin" />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator12" runat="server" SetFocusOnError="true" ControlToValidate="txtCdnrGstin" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice/Advance Receipt Number
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCdnrInvoiceNo" ErrorMessage="*" ValidationGroup="d" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnrInvoiceNo" MaxLength="16" onkeydown="upperCaseF(this)" runat="server" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server" FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters" ValidChars="/-" TargetControlID="txtCdnrInvoiceNo" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice/Advance Receipt date
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCdnrInvoiceDate" ErrorMessage="*" ValidationGroup="d" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtCdnrInvoiceDate" placeholder="Invoice/Advance Receipt date"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Note/Refund Voucher Number
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtCdnrVoucherNo" ErrorMessage="*" ValidationGroup="d" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnrVoucherNo" runat="server" MaxLength="5" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender20" runat="server" TargetControlID="txtCdnrVoucherNo" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator13" runat="server" ControlToValidate="txtCdnrVoucherNo" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="d" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Note/Refund Voucher date
                                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtCdnrVoucherDate" ErrorMessage="*" ValidationGroup="d" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtCdnrVoucherDate" placeholder="Note/Refund Voucher date"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Document Type
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlCdnrDocType" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />
                                                                        <asp:ListItem Value="1" Text="C" />
                                                                        <asp:ListItem Value="2" Text="D" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Reason For Issuing document
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddltxtCdnrReasonForIssueDoc" runat="server" CssClass="form-control chzn-select">
                                                                    </asp:DropDownList>


                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Place Of Supply
                                                          
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlCdnrPlaceOfSupply" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Note/Refund Voucher Value
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtCdnrVoucherValue" ErrorMessage="*" ValidationGroup="d" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnrVoucherValue" runat="server" MaxLength="5" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender21" runat="server" TargetControlID="txtCdnrVoucherValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator14" runat="server" ControlToValidate="txtCdnrVoucherValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="d" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Rate
                                                            
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:DropDownList ID="ddltxtCdnrRate" runat="server" CssClass="form-control">
                                                                    </asp:DropDownList>

                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Taxable Value
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtCdnrTaxableValue" ErrorMessage="*" ValidationGroup="d" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnrTaxableValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender23" runat="server" TargetControlID="txtCdnrTaxableValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator16" runat="server" ControlToValidate="txtCdnrTaxableValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="d" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Cess Amount
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnrCessAmount" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender25" runat="server" TargetControlID="txtCdnrCessAmount" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator18" runat="server" ControlToValidate="txtCdnrCessAmount" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="d" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Pre GST
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <%--<asp:TextBox ID="" runat="server" MaxLength="15" onkeydown="upperCaseF(this)" CssClass="form-control" />--%>
                                                                    <asp:DropDownList ID="ddlCdnrPreGst" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="No" />
                                                                        <asp:ListItem Value="1" Text="Yes" />
                                                                    </asp:DropDownList>
                                                                    <%--  <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server" FilterType="Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtCdnrPreGst" />
                                                            <asp:RegularExpressionValidator CssClass="text-danger validation_error" ValidationGroup="ValidateGSTIN" ID="RegularExpressionValidator15" runat="server" SetFocusOnError="true" ControlToValidate="txtCdnrPreGst" ErrorMessage="Enter Correct GSTIN" ValidationExpression="([0-9]){2}([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}([a-zA-Z0-9]){1}([Z-Zz-z]){1}([a-zA-Z0-9]){1}"></asp:RegularExpressionValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Button Text="&#xf067; Add" runat="server" ValidationGroup="d" ID="btnCdnrAdd" OnClick="btnCdnrAdd_Click" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Label ID="lblCdnrErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                                                                </div>

                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">


                                                                <asp:GridView runat="server" ID="GridCdnr" OnRowCommand="GridCdnr_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="GSTIN/UIN of Recipient" ItemStyle-HorizontalAlign="Center" DataField="GSTIN/UIN of Recipient" />
                                                                        <asp:BoundField HeaderText="Invoice/Advance Receipt Number" ItemStyle-HorizontalAlign="Center" DataField="Invoice/Advance Receipt Number" />
                                                                        <asp:BoundField HeaderText="Invoice/Advance Receipt date" ItemStyle-HorizontalAlign="Center" DataField="Invoice/Advance Receipt date" />
                                                                        <asp:BoundField HeaderText="Note/Refund Voucher Number" ItemStyle-HorizontalAlign="Center" DataField="Note/Refund Voucher Number" />
                                                                        <asp:BoundField HeaderText="PlaceOfSupplyCode" Visible="false" ItemStyle-HorizontalAlign="Center" DataField="PlaceOfSupplyCode" />
                                                                        <asp:BoundField HeaderText="Place Of Supply" ItemStyle-HorizontalAlign="Center" DataField="Place Of Supply" />
                                                                        <asp:BoundField HeaderText="Note/Refund Voucher date" ItemStyle-HorizontalAlign="Center" DataField="Note/Refund Voucher date" />
                                                                        <asp:BoundField HeaderText="Document Type" ItemStyle-HorizontalAlign="Center" DataField="Document Type" />
                                                                        <asp:BoundField HeaderText="Reason For Issuing document" ItemStyle-HorizontalAlign="Center" DataField="Reason For Issuing document" />
                                                                        <asp:BoundField HeaderText="Note/Refund Voucher Value" ItemStyle-HorizontalAlign="Center" DataField="Note/Refund Voucher Value" />
                                                                        <asp:BoundField HeaderText="Rate" ItemStyle-HorizontalAlign="Center" DataField="Rate" />
                                                                        <asp:BoundField HeaderText="Taxable Value" ItemStyle-HorizontalAlign="Center" DataField="Taxable Value" />
                                                                        <asp:BoundField HeaderText="IGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemIGSTValue" />
                                                                        <asp:BoundField HeaderText="CGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemCGSTValue" />
                                                                        <asp:BoundField HeaderText="SGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemSGSTValue" />
                                                                        <asp:BoundField HeaderText="Cess Value" ItemStyle-HorizontalAlign="Center" DataField="Cess Amount" />
                                                                        <asp:BoundField HeaderText="Pre GST" ItemStyle-HorizontalAlign="Center" DataField="Pre GST" />


                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">CDNUR Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>

                                                <div class="form-horizontal">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    UR Type
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlCdnurUrType" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />
                                                                        <%-- <asp:ListItem Value="1" Text="B2CL" />
                                                                        <asp:ListItem Value="2" Text="EXPWP" />
                                                                        <asp:ListItem Value="3" Text="EXPWOP" />--%>
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Note/Refund Voucher Number
                                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtCdnurVoucherNo" ErrorMessage="*" ValidationGroup="e" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnurVoucherNo" runat="server" MaxLength="5" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender26" runat="server" TargetControlID="txtCdnurVoucherNo" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator15" runat="server" ControlToValidate="txtCdnurVoucherNo" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="e" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Note/Refund Voucher date
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtCdnurVoucherDate" ErrorMessage="*" ValidationGroup="e" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtCdnurVoucherDate" placeholder="Note/Refund Voucher date"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Document Type
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlCdnurDocType" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />
                                                                        <asp:ListItem Value="1" Text="C" />
                                                                        <asp:ListItem Value="2" Text="D" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice/Advance Receipt Number
                                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtCdnurInvoiceNo" ErrorMessage="*" ValidationGroup="e" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnurInvoiceNo" MaxLength="16" onkeydown="upperCaseF(this)" runat="server" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" runat="server" FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters" ValidChars="/-" TargetControlID="txtCdnurInvoiceNo" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice/Advance Receipt date
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtCdnurInvoiceDate" ErrorMessage="*" ValidationGroup="e" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtCdnurInvoiceDate" placeholder="Invoice/Advance Receipt date"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Reason For Issuing document
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:DropDownList ID="ddlCdnurReasonForIssueDoc" runat="server" CssClass="form-control chzn-select">
                                                                    </asp:DropDownList>


                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Place Of Supply
                                                           
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlCdnurPlaceOfSupply" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Note/Refund Voucher Value
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtCdnurVoucherValue" ErrorMessage="*" ValidationGroup="e" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnurVoucherValue" runat="server" MaxLength="5" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender27" runat="server" TargetControlID="txtCdnurVoucherValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator19" runat="server" ControlToValidate="txtCdnurVoucherValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="e" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Rate
                                                            
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:DropDownList ID="ddltxtCdnurRate" runat="server" CssClass="form-control chzn-select">
                                                                    </asp:DropDownList>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Taxable Value
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtCdnurTaxableValue" ErrorMessage="*" ValidationGroup="e" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnurTaxableValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender29" runat="server" TargetControlID="txtCdnurTaxableValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator21" runat="server" ControlToValidate="txtCdnurTaxableValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="e" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Cess Amount
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtCdnurCessAmount" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender30" runat="server" TargetControlID="txtCdnurCessAmount" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator22" runat="server" ControlToValidate="txtCdnurCessAmount" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="e" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Pre GST
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlCdnurPreGst" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="No" />
                                                                        <asp:ListItem Value="1" Text="Yes" />
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Button Text="&#xf067; Add" ID="btnCdnurAdd" OnClick="btnCdnurAdd_Click" runat="server" ValidationGroup="e" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Label ID="lblCdnurErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">


                                                                <asp:GridView runat="server" ID="GridCdnur" OnRowCommand="GridCdnur_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="UR Type" ItemStyle-HorizontalAlign="Center" DataField="UR Type" />
                                                                        <asp:BoundField HeaderText="Invoice/Advance Receipt Number" ItemStyle-HorizontalAlign="Center" DataField="Invoice/Advance Receipt Number" />
                                                                        <asp:BoundField HeaderText="Invoice/Advance Receipt date" ItemStyle-HorizontalAlign="Center" DataField="Invoice/Advance Receipt date" />
                                                                        <asp:BoundField HeaderText="Note/Refund Voucher Number" ItemStyle-HorizontalAlign="Center" DataField="Note/Refund Voucher Number" />
                                                                        <asp:BoundField HeaderText="PlaceOfSupplyCode" Visible="false" ItemStyle-HorizontalAlign="Center" DataField="PlaceOfSupplyCode" />
                                                                        <asp:BoundField HeaderText="Place Of Supply" ItemStyle-HorizontalAlign="Center" DataField="Place Of Supply" />
                                                                        <asp:BoundField HeaderText="Note/Refund Voucher date" ItemStyle-HorizontalAlign="Center" DataField="Note/Refund Voucher date" />
                                                                        <asp:BoundField HeaderText="Document Type" ItemStyle-HorizontalAlign="Center" DataField="Document Type" />
                                                                        <asp:BoundField HeaderText="Reason For Issuing document" ItemStyle-HorizontalAlign="Center" DataField="Reason For Issuing document" />
                                                                        <asp:BoundField HeaderText="Note/Refund Voucher Value" ItemStyle-HorizontalAlign="Center" DataField="Note/Refund Voucher Value" />
                                                                        <asp:BoundField HeaderText="Rate" ItemStyle-HorizontalAlign="Center" DataField="Rate" />
                                                                        <asp:BoundField HeaderText="Taxable Value" ItemStyle-HorizontalAlign="Center" DataField="Taxable Value" />
                                                                        <asp:BoundField HeaderText="IGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemIGSTValue" />
                                                                        <asp:BoundField HeaderText="CGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemCGSTValue" />
                                                                        <asp:BoundField HeaderText="SGST Value" ItemStyle-HorizontalAlign="Center" DataField="ItemSGSTValue" />
                                                                        <asp:BoundField HeaderText="Cess Value" ItemStyle-HorizontalAlign="Center" DataField="Cess Amount" />
                                                                        <asp:BoundField HeaderText="Pre GST" ItemStyle-HorizontalAlign="Center" DataField="Pre GST" />

                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">EXP Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>
                                                <div class="form-horizontal">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Export Type
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlExpExportType" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />


                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice Number
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtExpInvoiceNo" ErrorMessage="*" ValidationGroup="f" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtExpInvoiceNo" MaxLength="16" onkeydown="upperCaseF(this)" runat="server" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server" FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters" ValidChars="/-" TargetControlID="txtExpInvoiceNo" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice date
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtExpInvoiceDate" ErrorMessage="*" ValidationGroup="f" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtExpInvoiceDate" placeholder="Date of Invoice"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Invoice Value
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtExpInvoiceValue" ErrorMessage="*" ValidationGroup="f" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtExpInvoiceValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server" TargetControlID="txtExpInvoiceValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator23" runat="server" ControlToValidate="txtExpInvoiceValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="f" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Port Code
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtExpPortCode" ErrorMessage="*" ValidationGroup="f" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtExpPortCode" MaxLength="16" onkeydown="upperCaseF(this)" runat="server" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender33" runat="server" FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters" ValidChars="/-" TargetControlID="txtExpPortCode" />
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Shipping Bill Number
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtExpShippingBillNo" ErrorMessage="*" ValidationGroup="f" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtExpShippingBillNo" MaxLength="16" onkeydown="upperCaseF(this)" runat="server" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender36" runat="server" FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters" ValidChars="/-" TargetControlID="txtExpShippingBillNo" />

                                                                </div>
                                                            </div>
                                                        </div>



                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Shipping Bill Date
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtExpShippingBillDate" ErrorMessage="*" ValidationGroup="f" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox runat="server" data-date-format="dd/mm/yyyy" CssClass="form-control datepicker_theme" ID="txtExpShippingBillDate" placeholder="Date of Invoice"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Rate
                                                             
                                                                </label>
                                                                <div class="col-xs-12">


                                                                    <asp:DropDownList ID="ddltxtExpRate" runat="server" CssClass="form-control chzn-select">
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Taxable Value
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtExpTaxableValue" ErrorMessage="*" ValidationGroup="f" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtExpTaxableValue" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender35" runat="server" TargetControlID="txtExpTaxableValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator25" runat="server" ControlToValidate="txtExpTaxableValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="f" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Button Text="&#xf067; Add" ID="btnExpAdd" ValidationGroup="f" OnClick="btnExpAdd_Click" runat="server" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Label Text="" ID="lblExpErrorMsg" runat="server" ForeColor="Red" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">

                                                                <asp:GridView runat="server" ID="GridExp" AutoGenerateColumns="false" OnRowCommand="GridExp_RowCommand" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>


                                                                        <asp:BoundField HeaderText="Export Type" ItemStyle-HorizontalAlign="Center" DataField="Export Type" />
                                                                        <asp:BoundField HeaderText="Invoice Number" ItemStyle-HorizontalAlign="Center" DataField="Invoice Number" />
                                                                        <asp:BoundField HeaderText="Invoice date" ItemStyle-HorizontalAlign="Center" DataField="Invoice date" />
                                                                        <asp:BoundField HeaderText="Invoice Value" ItemStyle-HorizontalAlign="Center" DataField="Invoice Value" />
                                                                        <asp:BoundField HeaderText="Port Code" ItemStyle-HorizontalAlign="Center" DataField="Port Code" />
                                                                        <asp:BoundField HeaderText="Shipping Bill Number" ItemStyle-HorizontalAlign="Center" DataField="Shipping Bill Number" />
                                                                        <asp:BoundField HeaderText="Shipping Bill Date" ItemStyle-HorizontalAlign="Center" DataField="Shipping Bill Date" />
                                                                        <asp:BoundField HeaderText="Rate" ItemStyle-HorizontalAlign="Center" DataField="Rate" />
                                                                        <asp:BoundField HeaderText="Taxable Value" ItemStyle-HorizontalAlign="Center" DataField="Taxable Value" />
                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">AT Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>
                                                <div class="form-horizontal">

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Place Of Supply
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlAtPlaceOfSupply" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />

                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Rate
                                                          
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:DropDownList ID="ddltxtAtRate" runat="server" CssClass="form-control chzn-select">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Gross Advance Received
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtAtGrossAdvReceived" ErrorMessage="*" ValidationGroup="g" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtAtGrossAdvReceived" runat="server" MaxLength="5" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender38" runat="server" TargetControlID="txtAtGrossAdvReceived" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator27" runat="server" ControlToValidate="txtAtGrossAdvReceived" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="g" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Cess Amount
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtAtCessAmount" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender39" runat="server" TargetControlID="txtAtCessAmount" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator28" runat="server" ControlToValidate="txtAtCessAmount" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="g" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Button Text="&#xf067; Add" ID="btnAtAdd" OnClick="btnAtAdd_Click" runat="server" ValidationGroup="g" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Label Text="" ID="lblAtErrorMsg" runat="server" ForeColor="Red" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">
                                                                <%--<table class="table table-bordered text-sm">
                                                            <tr>
                                                                <th>Place Of Supply</th>
                                                                <th>Rate</th>
                                                                <th>Gross Advance Received</th>
                                                                <th>Cess Amount</th>

                                                                <th>Delete</th>
                                                            </tr>
                                                            <tr>
                                                                <td>23XXXXX1234X2Z1</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>
                                                                    <asp:Button Text="&#xf1f8; Del" runat="server" CssClass="btn btn-xs btn-sxs btn-danger  btn-asp-fa" /></td>
                                                            </tr>


                                                        </table>--%>
                                                                <asp:GridView runat="server" ID="GridAt" OnRowCommand="GridAt_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>



                                                                        <asp:BoundField Visible="false" HeaderText="Place of Supply Code" DataField="PlaceOfSupplyCode" />
                                                                        <asp:BoundField HeaderText="Place of Supply" DataField="Place Of Supply" />
                                                                        <asp:BoundField HeaderText="Rate" ItemStyle-HorizontalAlign="Center" DataField="Rate" />
                                                                        <asp:BoundField HeaderText="Gross Advance Received" ItemStyle-HorizontalAlign="Center" DataField="Gross Advance Received" />
                                                                        <asp:BoundField HeaderText="Cess Value" ItemStyle-HorizontalAlign="Center" DataField="Cess Amount" />

                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">ATADJ Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>
                                                <div class="form-horizontal">

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Place Of Supply
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlATADJPlaceOfSupply" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Select" />

                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Rate
                                                           
                                                                </label>
                                                                <div class="col-xs-12">

                                                                    <asp:DropDownList ID="ddltxtAtAdjRate" runat="server" CssClass="form-control chzn-select">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Gross Advance Adjusted
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtAtAdjGrossAdvAdjusted" ErrorMessage="*" ValidationGroup="h" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtAtAdjGrossAdvAdjusted" runat="server" MaxLength="5" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender41" runat="server" TargetControlID="txtAtAdjGrossAdvAdjusted" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator30" runat="server" ControlToValidate="txtAtAdjGrossAdvAdjusted" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="h" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    Cess Amount
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtAtAdjCessAmount" runat="server" CssClass="form-control" MaxLength="15" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" TargetControlID="txtAtAdjCessAmount" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator31" runat="server" ControlToValidate="txtAtAdjCessAmount" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="h" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Button Text="&#xf067; Add" ID="btnAtAdjAdd" OnClick="btnAtAdjAdd_Click" ValidationGroup="h" runat="server" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <label class="col-xs-12">
                                                                    &nbsp;
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:Label Text="" ID="lblAtAdjErrorMsg" runat="server" ForeColor="Red" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">
                                                                <%--    <table class="table table-bordered text-sm">
                                                            <tr>
                                                                <th>Place Of Supply</th>
                                                                <th>Rate</th>
                                                                <th>Gross Advance Received</th>
                                                                <th>Cess Amount</th>

                                                                <th>Delete</th>
                                                            </tr>
                                                            <tr>
                                                                <td>23XXXXX1234X2Z1</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>
                                                                    <asp:Button Text="&#xf1f8; Del" runat="server" CssClass="btn btn-xs btn-sxs btn-danger  btn-asp-fa" /></td>
                                                            </tr>


                                                        </table>--%>
                                                                <asp:GridView runat="server" ID="GridAtAdj" OnRowCommand="GridAtAdj_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>



                                                                        <asp:BoundField Visible="false" HeaderText="Place of Supply Code" DataField="PlaceOfSupplyCode" />
                                                                        <asp:BoundField HeaderText="Place of Supply" DataField="Place Of Supply" />
                                                                        <asp:BoundField HeaderText="Rate" ItemStyle-HorizontalAlign="Center" DataField="Rate" />
                                                                        <asp:BoundField HeaderText="Gross Advance Adjusted" ItemStyle-HorizontalAlign="Center" DataField="Gross Advance Adjusted" />
                                                                        <asp:BoundField HeaderText="Cess Value" ItemStyle-HorizontalAlign="Center" DataField="Cess Amount" />

                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">EXEMP Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel8">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>
                                                <div class="form-horizontal">
                                                    <div class="row ">
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Description
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlExeMpDescription" runat="server" CssClass="form-control chzn-select">
                                                                        <asp:ListItem Value="0" Text="Inter-State supplies to registered persons" />
                                                                        <asp:ListItem Value="1" Text="Inter-State supplies to unregistered persons" />
                                                                        <asp:ListItem Value="2" Text="Intra-State supplies to registered persons" />
                                                                        <asp:ListItem Value="3" Text="Intra-State supplies to unregistered persons" />

                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Nil Rated Supplies
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="txtExeMpNillRatedSupply" ErrorMessage="*" ValidationGroup="i" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtExeMpNillRatedSupply" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender43" runat="server" TargetControlID="txtExeMpNillRatedSupply" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator32" runat="server" ControlToValidate="txtExeMpNillRatedSupply" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="i" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Exempted <span style="font-size: 11px; font-weight: normal">(other than nil rated/non GST supply )</span>

                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="txtExeMpExempted" ErrorMessage="*" ValidationGroup="i" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtExeMpExempted" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender44" runat="server" TargetControlID="txtExeMpExempted" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator33" runat="server" ControlToValidate="txtExeMpExempted" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="i" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Non-GST supplies
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ControlToValidate="txtExeMpNonGstSupply" ErrorMessage="*" ValidationGroup="i" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtExeMpNonGstSupply" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender45" runat="server" TargetControlID="txtExeMpNonGstSupply" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator34" runat="server" ControlToValidate="txtExeMpNonGstSupply" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="i" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <div class="col-xs-12 text-left">
                                                                    <asp:Button Text="&#xf067; Add" ID="btnExeMpAdd" OnClick="btnExeMpAdd_Click" runat="server" ValidationGroup="i" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-6">
                                                            <div class="form-group">

                                                                <div class="col-xs-12 text-right">
                                                                    <asp:Label Text="" ID="lblExeMpErrorMsg" runat="server" ForeColor="Red" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">
                                                                <%--         <table class="table table-bordered text-sm">
                                                            <tr>
                                                                <th>Type</th>
                                                                <th>Place of Supply</th>
                                                                <th>Rate</th>
                                                                <th>Taxable Value</th>
                                                                <th>Cess Amount</th>
                                                                <th>E-Commerce GSTIN</th>
                                                                <th>Delete</th>
                                                            </tr>
                                                            <tr>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>Tst001</td>
                                                                <td>
                                                                    <asp:Button Text="&#xf1f8; Del" runat="server" CssClass="btn btn-xs btn-sxs btn-danger  btn-asp-fa" /></td>
                                                            </tr>


                                                        </table>--%>

                                                                <asp:GridView runat="server" ID="GridExeMp" OnRowCommand="GridExeMp_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>




                                                                        <asp:BoundField HeaderText="Description" DataField="Description" />
                                                                        <asp:BoundField HeaderText="Nil Rated Supplies" ItemStyle-HorizontalAlign="Center" DataField="Nil Rated Supplies" />
                                                                        <asp:BoundField HeaderText="Exempted (other than nil rated/non GST supply )" ItemStyle-HorizontalAlign="Center" DataField="Exempted (other than nil rated/non GST supply )" />
                                                                        <asp:BoundField HeaderText="Non-GST supplies" ItemStyle-HorizontalAlign="Center" DataField="Non-GST supplies" />

                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">HSN Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel9">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>
                                                <div class="form-horizontal">
                                                    <div class="row">

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    HSN :
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtHSNCode" ErrorMessage="*" ValidationGroup="j" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHSNCode" MaxLength="16" onkeydown="upperCaseF(this)" runat="server" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender46" runat="server" FilterType="Custom,Numbers, UppercaseLetters, LowercaseLetters" ValidChars="" TargetControlID="txtHSNCode" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Description
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHsnDescription" runat="server" CssClass="form-control" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    UQC
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlHsnUQC" runat="server" CssClass="form-control chzn-select">
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Total Quantity
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ControlToValidate="txtHSnTotalQuantity" ErrorMessage="*" ValidationGroup="j" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHSnTotalQuantity" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender52" runat="server" TargetControlID="txtHSnTotalQuantity" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator40" runat="server" ControlToValidate="txtHSnTotalQuantity" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="j" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Total Value
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="txtHSnTotalValue" ErrorMessage="*" ValidationGroup="j" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHSnTotalValue" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender47" runat="server" TargetControlID="txtHSnTotalValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator35" runat="server" ControlToValidate="txtHSnTotalValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="j" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Taxable Value
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ControlToValidate="txtHSnTaxableValue" ErrorMessage="*" ValidationGroup="j" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHSnTaxableValue" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender48" runat="server" TargetControlID="txtHSnTaxableValue" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator36" runat="server" ControlToValidate="txtHSnTaxableValue" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="j" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Integrated Tax Amount
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ControlToValidate="txtHSnIntegratedTaxAmt" ErrorMessage="*" ValidationGroup="j" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHSnIntegratedTaxAmt" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender49" runat="server" TargetControlID="txtHSnIntegratedTaxAmt" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator37" runat="server" ControlToValidate="txtHSnIntegratedTaxAmt" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="j" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Central Tax Amount
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtHSnCentralTaxAmt" ErrorMessage="*" ValidationGroup="j" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHSnCentralTaxAmt" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender50" runat="server" TargetControlID="txtHSnCentralTaxAmt" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator38" runat="server" ControlToValidate="txtHSnCentralTaxAmt" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="j" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    State/UT Tax Amount

                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ControlToValidate="txtHSnStateUtTaxAmt" ErrorMessage="*" ValidationGroup="j" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHSnStateUtTaxAmt" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender51" runat="server" TargetControlID="txtHSnStateUtTaxAmt" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator39" runat="server" ControlToValidate="txtHSnStateUtTaxAmt" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="j" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>




                                                    </div>

                                                    <div class="row">

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Cess Amount                                                         
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtHSnCessAmount" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender53" runat="server" TargetControlID="txtHSnCessAmount" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator41" runat="server" ControlToValidate="txtHSnCessAmount" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="j" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    &nbsp;                                                      
                                                                </label>
                                                                <div class="col-xs-12  text-left">
                                                                    <asp:Button Text="&#xf067; Add" ID="btnHsnAdd" ValidationGroup="j" OnClick="btnHsnAdd_Click" runat="server" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">

                                                                <div class="col-xs-12 text-right">
                                                                    <asp:Label ID="lblHsnErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">
                                                                

                                                                <asp:GridView runat="server" ID="GridHsn" OnRowCommand="GridHsn_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>

                                                                        <asp:BoundField HeaderText="HSN" ItemStyle-HorizontalAlign="Center" DataField="HSN" />
                                                                        <asp:BoundField HeaderText="Description" ItemStyle-HorizontalAlign="Center" DataField="Description" />
                                                                        <asp:BoundField HeaderText="UQC" ItemStyle-HorizontalAlign="Center" DataField="UQC" />
                                                                        <asp:BoundField HeaderText="Total Quantity" ItemStyle-HorizontalAlign="Center" DataField="Total Quantity" />
                                                                        <asp:BoundField HeaderText="Total Value" ItemStyle-HorizontalAlign="Center" DataField="Total Value" />
                                                                        <asp:BoundField HeaderText="Taxable Value" ItemStyle-HorizontalAlign="Center" DataField="Taxable Value" />
                                                                        <asp:BoundField HeaderText="Integrated Tax Amount" ItemStyle-HorizontalAlign="Center" DataField="Integrated Tax Amount" />
                                                                        <asp:BoundField HeaderText="Central Tax Amount" ItemStyle-HorizontalAlign="Center" DataField="Central Tax Amount" />
                                                                        <asp:BoundField HeaderText="State/UT Tax Amount" ItemStyle-HorizontalAlign="Center" DataField="State/UT Tax Amount" />
                                                                        <asp:BoundField HeaderText="Cess Value" ItemStyle-HorizontalAlign="Center" DataField="Cess Amount" />



                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="b2b-bhoechie-tab-content">
                                        <h4 class="text-center">DOCS Entry Form</h4>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel10">
                                            <ContentTemplate>
                                                <script type="text/javascript">
                                                    Sys.Application.add_load(LoadAllScript)
                                                </script>
                                                <div class="form-horizontal">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Nature  of Document
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:DropDownList ID="ddlDocsNatureOfDoc" runat="server" CssClass="form-control chzn-select">
                                                                    </asp:DropDownList>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Sr. No. From
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtDocsSrNoFrom" ErrorMessage="*" ValidationGroup="k" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox runat="server" ID="txtDocsSrNoFrom" MaxLength="16" CssClass="form-control" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Sr. No. To
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="txtDocsSrNoTo" ErrorMessage="*" ValidationGroup="k" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox runat="server" ID="txtDocsSrNoTo" MaxLength="16" CssClass="form-control" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Total Number
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ControlToValidate="txtDocsTotalNo" ErrorMessage="*" ValidationGroup="k" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtDocsTotalNo" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender54" runat="server" TargetControlID="txtDocsTotalNo" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator42" runat="server" ControlToValidate="txtDocsTotalNo" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="k" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label class="col-xs-12">
                                                                    Cancelled
                                                                </label>
                                                                <div class="col-xs-12">
                                                                    <asp:TextBox ID="txtDocsCancelled" runat="server" MaxLength="15" CssClass="form-control" />
                                                                    <cc2:FilteredTextBoxExtender ID="FilteredTextBoxExtender55" runat="server" TargetControlID="txtDocsCancelled" FilterType="Custom, Numbers" ValidChars="." />
                                                                    <asp:RegularExpressionValidator CssClass="text-danger validation_error" ID="RegularExpressionValidator43" runat="server" ControlToValidate="txtDocsCancelled" ForeColor="Red" ErrorMessage="Two Decimal Allowed" ValidationGroup="k" ValidationExpression="^[+]?[0-9]\d{0,14}(\.\d{1,2})?%?$"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label>&nbsp;</label>
                                                                <div class="col-xs-12 text-left">
                                                                    <asp:Button Text="&#xf067; Add" ID="btnDocsAdd" OnClick="btnDocsAdd_Click" ValidationGroup="k" runat="server" CssClass="btn btn-primary btn-asp-fa" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label>&nbsp;</label>
                                                                <div class="col-xs-12 text-right">
                                                                    <asp:Label Text="" ID="lblDocsErrorMsg" runat="server" ForeColor="Red" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label>&nbsp;</label>
                                                                <div class="col-xs-12 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-4">
                                                            <div class="form-group">
                                                                <label>&nbsp;</label>
                                                                <div class="col-xs-12 text-right">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row">
                                                            <div class="table-responsive">
                                                                

                                                                <asp:GridView runat="server" ID="GridDocs" OnRowCommand="GridDocs_RowCommand" AutoGenerateColumns="false" class="table table-bordered table-sm">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo.">
                                                                            <ItemTemplate>
                                                                                <%#Container.DataItemIndex+1 %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>

                                                                        <asp:BoundField HeaderText="Nature  of Document" ItemStyle-HorizontalAlign="Center" DataField="Nature  of Document" />
                                                                        <asp:BoundField HeaderText="Sr. No. From" ItemStyle-HorizontalAlign="Center" DataField="Sr. No. From" />
                                                                        <asp:BoundField HeaderText="Sr. No. To" ItemStyle-HorizontalAlign="Center" DataField="Sr. No. To" />
                                                                        <asp:BoundField HeaderText="Total Number" ItemStyle-HorizontalAlign="Center" DataField="Total Number" />
                                                                        <asp:BoundField HeaderText="Cancelled" ItemStyle-HorizontalAlign="Center" DataField="Cancelled" />



                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <i style="position: absolute; margin-top: 4px; margin-left: 4px; color: white" class='fa r fa-trash-o'></i>
                                                                                <asp:Button Style="padding-left: 20px;" runat="server" class="btn btn-xs btn-danger" CommandArgument='<%#Container.DataItemIndex %>' CommandName="DeleteRecords" Text="Delete" />
                                                                                <%--<input type="submit" runat="server" CommandName="DeleteRecords"  class="btn btn-xs btn-danger"><i class="fa r fa-trash-o"></i>Delete</input>--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 text-right">
                                    <asp:Label ID="lblsmsSave" ForeColor="Red" runat="server" Text=""></asp:Label>
                                    <asp:Button ID="btnSave" Text="&#xf0c7; Save" runat="server" OnClick="btnSave_Click" CssClass="btn btn-success btn-asp-fa" />
                                    <asp:Button Text="&#xf021; Clear" ID="btnAllClear" OnClick="btnAllClear_Click" runat="server" CssClass="btn btn-warning btn-asp-fa" />
                                    <asp:Button Text="&#xf00d; Exit" ID="Exit" OnClick="Exit_Click" runat="server" CssClass="btn btn-danger btn-asp-fa" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        $(document).ready(function () {

            $('#<%=btnAdd.ClientID%>').click(function () {
                $('#<%=lblErrorMsg.ClientID%>').html('');
                debugger;
                var GSTIN = $('#<%=txtGstin.ClientID%>').val().trim();
                var ddlPlaceSupply = $('#<%=ddlPlaceSupply.ClientID%>').val();
                var txtInvoiceNo = $('#<%=txtInvoiceNo.ClientID%>').val().trim();
                if (txtInvoiceNo.length > 0 && txtInvoiceNo.length < 17) {

                } else {
                    $('#<%=txtInvoiceNo.ClientID%>').focus();
                    $('#<%=lblErrorMsg.ClientID%>').html('Please Enter Invoice No');
                    return false;
                }

                if (GSTIN != "") {
                    if (GSTIN.length != 15) {
                        $('#<%=txtGstin.ClientID%>').focus();
                        $('#<%=lblErrorMsg.ClientID%>').html('Please Enter Correct GSTIN');
                        return false;
                    }
                }
                if (ddlPlaceSupply == "0") {
                    $('#<%=ddlPlaceSupply.ClientID%>').focus();
                    $('#<%=lblErrorMsg.ClientID%>').html('Please Enter Supply State');
                    return false;
                }


            });
        });

        //----------------------------- B2CL ----------------------

        $('#<%=btnB2clAdd.ClientID%>').click(function () {
            $('#<%=lblB2clErrorMsg.ClientID%>').html('');
            debugger;
            //  var GSTIN = $('#<%=txtGstin.ClientID%>').val().trim();
            var ddlB2clPlaceSupply = $('#<%=ddlB2clPlaceOfSupply.ClientID%>').val();
            var txtB2clInvoiceNo = $('#<%=txtB2clInvoiceNo.ClientID%>').val().trim();
            if (txtB2clInvoiceNo.length > 0 && txtB2clInvoiceNo.length < 17) {

            } else {
                $('#<%=txtB2clInvoiceNo.ClientID%>').focus();
                $('#<%=lblB2clErrorMsg.ClientID%>').html('Please Enter Correct Invoice No');
                return false;
            }
            if (ddlB2clPlaceSupply == "0") {
                $('#<%=ddlB2clPlaceOfSupply.ClientID%>').focus();
                $('#<%=lblB2clErrorMsg.ClientID%>').html('Please Enter Supply State');
                return false;
            }


        });


        //----------------------------- B2Cs ----------------------

        $('#<%=btnB2csAdd.ClientID%>').click(function () {
            $('#<%=lblB2clErrorMsg.ClientID%>').html('');
            debugger;

            var ddlB2csPlaceSupply = $('#<%=ddlB2csPlaceOfSupply.ClientID%>').val();


            if (ddlB2csPlaceSupply == "0") {
                $('#<%=ddlB2csPlaceOfSupply.ClientID%>').focus();
                $('#<%=lblB2csErrorMsg.ClientID%>').html('Please Enter Supply State');
                return false;
            }


        });

        //----------------------------- Cdnr ----------------------

        $('#<%=btnCdnrAdd.ClientID%>').click(function () {
            $('#<%=lblCdnrErrorMsg.ClientID%>').html('');
            debugger;

            var ddlCdnrPlaceSupply = $('#<%=ddlCdnrPlaceOfSupply.ClientID%>').val();
            var ddlCdnrDocType = $('#<%=ddlCdnrDocType.ClientID%>').val();


            if (ddlCdnrPlaceSupply == "0") {
                $('#<%=ddlCdnrPlaceOfSupply.ClientID%>').focus();
                $('#<%=lblCdnrErrorMsg.ClientID%>').html('Please Enter Supply State');
                return false;
            }
            if (ddlCdnrDocType == "0") {
                $('#<%=ddlCdnrDocType.ClientID%>').focus();
                $('#<%=lblCdnrErrorMsg.ClientID%>').html('Please Enter Document Type');
                return false;
            }


        });

        //----------------------------- Cdnur ----------------------

        $('#<%=btnCdnurAdd.ClientID%>').click(function () {
            $('#<%=lblCdnurErrorMsg.ClientID%>').html('');
            debugger;

            var ddlCdnurPlaceSupply = $('#<%=ddlCdnurPlaceOfSupply.ClientID%>').val();
            var ddlCdnurDocType = $('#<%=ddlCdnurDocType.ClientID%>').val();
            var ddlCdnurUrType = $('#<%=ddlCdnurUrType.ClientID%>').val();

            if (ddlCdnurUrType == "0") {
                $('#<%=ddlCdnurUrType.ClientID%>').focus();
                $('#<%=lblCdnurErrorMsg.ClientID%>').html('Please Enter UR Type');
                return false;
            }

            if (ddlCdnurDocType == "0") {
                $('#<%=ddlCdnurDocType.ClientID%>').focus();
                $('#<%=lblCdnurErrorMsg.ClientID%>').html('Please Enter Document Type');
                return false;
            }
            if (ddlCdnurPlaceSupply == "0") {
                $('#<%=ddlCdnurPlaceOfSupply.ClientID%>').focus();
                $('#<%=lblCdnurErrorMsg.ClientID%>').html('Please Enter Supply State');
                return false;
            }


        });



        //----------------------------- Exp ----------------------

        $('#<%=btnExpAdd.ClientID%>').click(function () {
            $('#<%=lblExpErrorMsg.ClientID%>').html('');
            debugger;


            var ddlExpExportType = $('#<%=ddlExpExportType.ClientID%>').val();

            if (ddlExpExportType == "0") {
                $('#<%=ddlExpExportType.ClientID%>').focus();
                $('#<%=lblExpErrorMsg.ClientID%>').html('Please Enter Export Type');
                return false;
            }


        });

        //----------------------------- AT ----------------------

        $('#<%=btnAtAdd.ClientID%>').click(function () {
            $('#<%=lblAtErrorMsg.ClientID%>').html('');
            debugger;


            var ddlAtPlaceOfSupply = $('#<%=ddlAtPlaceOfSupply.ClientID%>').val();

            if (ddlAtPlaceOfSupply == "0") {
                $('#<%=ddlAtPlaceOfSupply.ClientID%>').focus();
                $('#<%=lblAtErrorMsg.ClientID%>').html('Please Enter Place Of Supply');
                return false;
            }


        });

        //----------------------------- ATADJ ----------------------

        $('#<%=btnAtAdjAdd.ClientID%>').click(function () {
            $('#<%=lblAtAdjErrorMsg.ClientID%>').html('');
            debugger;


            var ddlATADJPlaceOfSupply = $('#<%=ddlATADJPlaceOfSupply.ClientID%>').val();

            if (ddlATADJPlaceOfSupply == "0") {
                $('#<%=ddlATADJPlaceOfSupply.ClientID%>').focus();
                $('#<%=lblAtAdjErrorMsg.ClientID%>').html('Please Select Place Of Supply');
                return false;
            }


        });

        //----------------------------- Hsn ----------------------
        $('#<%=btnHsnAdd.ClientID%>').click(function () {
            $('#<%=lblHsnErrorMsg.ClientID%>').html('');
            debugger;


            var ddlHsnUQC = $('#<%=ddlHsnUQC.ClientID%>').val();

            if (ddlHsnUQC == "0") {
                $('#<%=ddlHsnUQC.ClientID%>').focus();
                $('#<%=lblHsnErrorMsg.ClientID%>').html('Please Select UQC');
                return false;
            }


        });

        //----------------------------- Docs ----------------------
        $('#<%=btnDocsAdd.ClientID%>').click(function () {
            $('#<%=lblDocsErrorMsg.ClientID%>').html('');
            debugger;


            var ddlDocsNatureOfDoc = $('#<%=ddlDocsNatureOfDoc.ClientID%>').val();

            if (ddlDocsNatureOfDoc == "0") {
                $('#<%=ddlDocsNatureOfDoc.ClientID%>').focus();
                $('#<%=lblDocsErrorMsg.ClientID%>').html('Please Select Nature Of Document');
                return false;
            }


        });

    </script>

     <script>
         $(document).ready(function () {

             $('.liImportExcel').show();

         });
    </script>
</asp:Content>

