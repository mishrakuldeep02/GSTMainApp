<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucAdministrator.ascx.cs" Inherits="UserControl_wucAdministrator" %>
<div class="item user-block">
                        <div class="user-block-info">
                            <span class="user-block-name item-text">Welcome Administrator</span>
                            <span class="user-block-role"><asp:Label runat="server" ID="lblUserName"></asp:Label></span>
                        </div>
                    </div>
                    <ul class="nav">
                        <li>
                            <a href="../Administrator/frmPaymentStatus.aspx" title="Payment Status" data-toggle="" class="no-submenu">
                                <em class="fa fa-credit-card"></em>
                                <span class="item-text">Payment Status</span>
                            </a>
                        </li>
                        <%--<li>
                            <a href="#" title="Clients" class="no-submenu">
                                <em class="fa fa-user"></em>
                                <span class="item-text">Client Management Administrator</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" title="Team" class="no-submenu">
                                <em class="fa fa-users"></em>
                                <span class="item-text">Team Management Administrator</span>
                            </a>
                        </li>--%>
                    </ul>