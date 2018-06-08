<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CommonMaster.master" AutoEventWireup="true" CodeFile="frmGSTR2Summary_design.aspx.cs" Inherits="CA_Admin_frmGSTR2Summary_design" %>

<%@ Register TagName="UserControl" TagPrefix="cc1" Src="~/UserControl/wucTaxPayerStrip.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script>
         $(document).ready(function () {
             $('.liImportExcel').show();
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section>
        <style>
            .panel-gstr-2-summary .panel-heading {
                padding: 8px 8px;
                background: #0d4f86;
            }

            @media (min-width:768px) {
                .panel-gstr-2-summary .panel-heading {
                    min-height: 58px;
                }

                /*.panel-gstr-2-summary .panel-body {
                    min-height: 107px;
                }*/

                .panel-gstr-2-summary .panel-body {
                    min-height: 122px;
                }



            }

            .panel-gstr-2-summary .panel-heading p {
                margin: 0;
                font-size: 14px;
                font-weight: 400;
            }

                .panel-gstr-2-summary .panel-heading p a {
                    color: #fff;
                }

                    .panel-gstr-2-summary .panel-heading p a:hover,.panel-gstr-2-summary .panel-heading p a:focus,.panel-gstr-2-summary .panel-heading p a:active {
                        text-decoration:underline !important;
                    }

            .panel-gstr-2-summary .panel-body p {
                margin: 0;
                font-size: 13px;
            }

            .panel-gstr-2-summary .panel-body {
                padding: 10px;
                padding-bottom: 0;
            }

                .panel-gstr-2-summary .panel-body .gst2-panel-inner-grid-mb {
                    margin-bottom: 8px;
                }

            .rupee-font-icon {
                font-family: FontAwesome,Roboto,Arial,sans-serif;
            }
            .lbl1
            {
                    background-color: white;
    padding:3px 7px;
    border-radius: 49px;
    color: #0d4f86;
    margin-left: 6px;
            }
        </style>
        <div class="content-wrapper">
            <cc1:UserControl runat="server" ID="wucTaxPayerStrip" />
            <h3 class="second_heading">GSTR 2 Summary</h3>
            <div class="row">
                <div class="col-md-12">
                    <h5>GSTR 2 :- Invoice Details</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p><a href="frmGSTR2Action.aspx?RecordNo=20">3,4A - Inward Supplies received from Registerd person including reverse charge supplies</a>
                                <asp:Label ID="lblB2bTotInvoRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Taxable Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblB2bTotTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Invoice Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblB2bTotInvo" Text=" 0.00" runat="server" />  
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total ITC Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblB2bTotITC" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p><a href="frmGSTR2Action.aspx?RecordNo=23">5 - Import of Inputs/Capital goods and Supplies received from SEZ</a>
                                <asp:Label ID="lblImpgTotInvoRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Taxable Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblImpgTotTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Invoice Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblImpgTotInvo" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total ITC Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblImpgTotITC" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p>
                               <a href="frmGSTR2Action.aspx?RecordNo=24"> 4C - Import of service</a>
                               <asp:Label ID="lblImpsTotInvoRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Taxable Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblImpsTotTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Invoice Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblImpsTotInvo" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total ITC Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblImpsTotITC" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p>  <a href="frmGSTR2Action.aspx?RecordNo=22">6C - Debit/Credit Notes for supplies from registered person</a>
                                <asp:Label ID="lblCdnrTotInvoRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Taxable Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblCdnrTotTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Note/Refund Voucher Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblCdnrTotNoteRefVoucherValue" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total ITC Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblCdnrTotITC" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p><a href="frmGSTR2Action.aspx?RecordNo=21">4B - Inward supplies from an unregistered supplier</a>
                                <asp:Label ID="lblB2burTotInvoRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Taxable Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblB2burTotTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Invoice Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblB2burTotInvo" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total ITC Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblB2burTotITC" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                               
                            </div>
                        </div>



                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p>
                               <a href="frmGSTR2Action.aspx?RecordNo=30">  6C - Debit Notes/Credit Notes for Unregistered Supplier</a>
                               <asp:Label ID="lblCdnurTotInvoRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Taxable Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblCdnurTotTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                  <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Note/Refund Voucher Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblCdnurTotNoteRefVoucherValue" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total ITC Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblCdnurTotITC" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                               
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <h5>GSTR 2 :- Other Details</h5>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p> <a href="frmGSTR2Action.aspx?RecordNo=25">7 - Supplies from composition taxable person and other exempt/nil rated/non GST supplies</a>
                                <asp:Label ID="lblexempTotRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Composition Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblExempCompTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                  <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Nil Rated Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblExempTotalNilRatedTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total NonGST Tax</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblExempTotalNonGSTTax" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p> <a href="frmGSTR2Action.aspx?RecordNo=26">10(I) - 10A - Advance amount paid for reverse charge supplies</a>
                                <asp:Label ID="lblatTotRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Gross Adv Paid</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label id="lblAtGrossAdv" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Cess</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblAtTotalCESS" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p><a href="frmGSTR2Action.aspx?RecordNo=27">10(I) - 10B - Adjustment of Advance amount paid earilier for reverse charge supplies</a>
                                <asp:Label ID="lblatadjTotRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                          <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Gross Adv Paid Adjust</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label id="lblAtAdjGrossAdv" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Cess Adjust</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblAtadjTotalCESS" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                             <p><a href="frmGSTR2Action.aspx?RecordNo=29">13 - HSN summary of inward supplies</a>
                                 <asp:Label ID="lblhsnTotRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                             </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Quantity </b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label id="lblHsnTotalQuantity" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Taxable Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblHsnTotalTaxableValue" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblHsnTotalValue" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p><a href="frmGSTR2Action.aspx?RecordNo=28">11 - Input Tax Credit Reversal/Reclaim</a>
                                <asp:Label ID="lblitcrTotRow" runat="server" Text="" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total ITC Value</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label ID="lblItcrTotalITC" Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-4">
                    <div class="panel panel-primary panel-gstr-2-summary">
                        <div class="panel-heading">
                            <p>
                                8 - ISD Credit recieved
                                <asp:Label ID="lblCreditReceived" runat="server" Text="0" CssClass="lbl1" ></asp:Label>
                            </p>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Tax Credit Receivd</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label Text=" 0.00" runat="server" />

                                       <%-- <asp:Label ID="lblTaxCredit" runat="server" Text="" CssClass="lbl1" ></asp:Label>--%>

                                    </p>
                                </div>
                                <div class="col-xs-6 col-sm-6 gst2-panel-inner-grid-mb">
                                    <p><b>Total ITC Available</b></p>
                                    <p class="rupee-font-icon">
                                        <asp:Label Text=" 0.00" runat="server" />
                                    </p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

