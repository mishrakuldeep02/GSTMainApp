<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucArtical.ascx.cs" Inherits="UserControl_wucArtical" %>
 <div class="item user-block">
                        <div class="user-block-info">
                            <span class="user-block-name item-text">Welcome Artical</span>
                            <span class="user-block-role"><asp:Label runat="server" ID="lblUserName"></asp:Label></span>
                        </div>
                    </div>
                    <ul class="nav">
                        <li>
                            <a href="frmDashboard.aspx" title="Dashboard" data-toggle="" class="no-submenu">
                                <em class="fa fa-home"></em>
                                <span class="item-text">Dashboard Artical</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" title="Clients" class="no-submenu">
                                <em class="fa fa-user"></em>
                                <span class="item-text">Client Management Artical</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" title="Team" class="no-submenu">
                                <em class="fa fa-users"></em>
                                <span class="item-text">Team Management Artical</span>
                            </a>
                        </li>
                    </ul>