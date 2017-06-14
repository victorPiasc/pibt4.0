<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true" CodeBehind="TermsOfUse.aspx.cs" Inherits="Pibt.TermsOfUse" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Terms Of Use
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
&gt;<span>Terms Of Use</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
    <div class="category-left-links">
        <h1>
            Current Events</h1>
        <ul>
            <asp:Repeater ID="RepeaterEvents" runat="server" DataSourceID="odsCurrentEvents">
                <ItemTemplate>
                    <li><a href="/EventDetails.aspx?id=<%#Eval("EventId") %>">
                        <%#Eval("EventName") %></a></li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="odsCurrentEvents" runat="server" SelectMethod="GetList" TypeName="Pibt.BLL.Events">
            </asp:ObjectDataSource>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
   <table summary="content table" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titleRight">
                            <div class="titleLeft clear">
                                <h1>
                                    Terms Of Use
                                </h1>
                            </div>
                        </div>
                        <br />
                    </td>
                </tr>
            </table>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>
