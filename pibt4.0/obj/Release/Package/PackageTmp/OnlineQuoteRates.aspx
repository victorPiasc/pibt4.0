<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuoteRates.aspx.cs" Inherits="Pibt.OnlineQuoteRates" MasterPageFile="~/OnlineQuote.master" %>
<%@ Register Src="/UserControl/CtlQQ5.ascx" TagName="CtlQQ5" TagPrefix="uc5" %>
<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
        <style>
            .simpleText {
                font-size: 14px;
            }
        </style>
        <!-- content start -->
        <div id="contentWrapper">
            <div class="customer-info-box">
                <div style="background: #9fc5f8;">
                    <div class="row">
                        <div class="column-12 section-title">
                            <a href="OnlineQuoteEmployer.aspx">Employer Information ></a>&nbsp;<a href="OnlineQuoteEmployee.aspx">Employee Census Information ></a>&nbsp;DashBoard
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="column-12">
                        <span style="font-size: large; font-weight: bold; color: #085394;">Step 3 of 4 - Select the benefits and plans that your want.</span>
                    </div>
                </div>
                <uc5:CtlQQ5 ID="dashBoard" runat="server" />
                <div class="row">
                    <div class="column-6" style="text-align: center;">
                        <asp:Button ID="back" CssClass="btn" runat="server" CausesValidation="false" Text="Back" PostBackUrl="/OnlineQuoteEmployee.aspx"/>
                    </div>
                    <div class="column-6" style="text-align: center;">
                        <asp:Button ID="submit" CssClass="btn" runat="server" ValidationGroup="empInputGroup" Text="Next" OnClick="submit_Click" />
                    </div>
                </div>

                <%--<asp:Button ID="exportQuote" runat="server" Text="Export Quote" OnClientClick="btnPress('export');" CssClass="btn" Visible="false" />
                <asp:LoginView ID="loggedInSaveQuote" runat="server" Visible="false">
                    <RoleGroups>
                        <asp:RoleGroup Roles="Administrator, Broker, Agent, RK">
                            <ContentTemplate>
                                <asp:Button ID="saveQuote" runat="server" CssClass="btn" Text="Save Quote" OnClick="saveQuote_Click" />
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>--%>
            </div>
        </div>
        <!-- content end -->
    <%--<asp:Button ID="export" runat="server" OnClick="exportQuote_Click" Style="display: none;" />--%>
</asp:Content>
