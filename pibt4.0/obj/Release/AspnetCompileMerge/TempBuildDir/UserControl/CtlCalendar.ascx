<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlCalendar.ascx.cs" Inherits="Pibt.UserControl.CtlCalendar" %>
<%@ Register Src="/UserControl/CtlQuickViewEr.ascx" TagName="QuickView" TagPrefix="uc1" %>
<div id="qvPopUp" class="quickPopUp" >
    <uc1:QuickView id="quickView" runat="server" ></uc1:QuickView>
</div>
<div class="row">
    <div class="col-md-12">
        <fieldset>
            <legend>Filter</legend>
            <div class="row">
                <div class="col-md-6">
                    <table style="width:100%">
                        <tr>
                            <td style="width:100px;">Search:</td>
                            <td><asp:TextBox ID="tbSearch" runat="server" CssClass="form-control" MaxLength="60"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6">
                    <table style="width:100%">
                        <tr>
                            <td style="width:100px;">Type:</td>
                            <td>
                                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" style="width:50%;" OnSelectedIndexChanged="ddlTime_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1" Text="Renewal" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Quote" ></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="typeReq" runat="server" CssClass="required-info" ErrorMessage="*Required" Display="Static" ControlToValidate="ddlType" InitialValue="0" ValidationGroup="search"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <table style="width:100%">
                        <tr>
                            <td style="width:100px;">Time Frame:</td>
                            <td>
                                <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-control" style="width:50%;"  onchange="if(!timeChange(this,'customFrame', 4)) return true;" OnSelectedIndexChanged="ddlTime_SelectedIndexChanged" AutoPostBack="true"> 
                                    <asp:ListItem Value="1" Text="1 Month"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="3 Month"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="6 Month"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Custom"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="customFrame" class="row" style="display:none;">
                <div class="col-md-6">
                    <table style="width:100%">
                        <tr>
                            <td style="width:100px;">Start Date:</td>
                            <td><telerik:RadDatePicker ID="start" runat="server" Height="34" style="width:50%;" ></telerik:RadDatePicker></td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6">
                    <table style="width:100%">
                        <tr>
                            <td style="width:100px;">End Date:</td>
                            <td><telerik:RadDatePicker ID="end" runat="server" Height="34px" style="width:50%;" ></telerik:RadDatePicker></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table>
                        <tr>
                            <td><asp:Button ID="search" runat="server" Text="Search" CssClass="btn" OnClick="search_Click" ValidationGroup="search" /></td>
                            <td>&nbsp;</td>
                            <td><asp:Button ID="clear" runat="server" Text="Clear" CssClass="btn" OnClick="clear_Click" CausesValidation="false"/></td>
                        </tr>
                    </table>
                </div>
            </div>
        </fieldset>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <fieldset>
            <legend>Current Employer Roster</legend>
            <telerik:RadGrid ID="events" runat="server" Skin="MetroTouch" AutoGenerateColumns="false" OnNeedDataSource="events_NeedDataSource" EnableLinqExpressions="false" >
                <ClientSettings>
                    <ClientEvents OnCommand="OnCommand" />
                </ClientSettings>
                <MasterTableView DataKeyNames="id" ClientDataKeyNames="id">
                    <Columns>
                        <telerik:GridBoundColumn DataField="id" UniqueName="id" display="false"></telerik:GridBoundColumn>
                        <telerik:GridButtonColumn DataTextField="name" Text="{0}" ButtonType="LinkButton" UniqueName="name" HeaderText="Name" CommandName="open" ItemStyle-Font-Underline="true"></telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="address" UniqueName="address" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="city" UniqueName="city" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="state" UniqueName="state" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="zip" UniqueName="zip" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="contact" UniqueName="contact" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="phoneNbr" UniqueName="phoneNbr" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="email" UniqueName="email" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="renewalDate" UniqueName="renewalDate" HeaderText="Upcoming Date" SortExpression="renewalDate"></telerik:GridBoundColumn>
                        <telerik:GridButtonColumn ButtonCssClass="btn-green" ButtonType="PushButton" Text="Copy to clipboard" CommandName="copy" ></telerik:GridButtonColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </fieldset>
    </div>
</div>