<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true"
    CodeBehind="Lifelines.aspx.cs" Inherits="Pibt.Lifelines" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
    &nbsp;&nbsp;&gt;<span><a href="Register.aspx">Join Us</a></span> &gt;<span>Lifelines</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
    <div class="category-left-links">
        <h1 style="text-align: center">
            Current Events</h1>
        <ul>
            <asp:Repeater ID="RepeaterEvents" runat="server" DataSourceID="odsCurrentEvents">
                <ItemTemplate>
                    <li><a href="/EventDetails.aspx?id=<%#Eval("EventId") %>">
                        <%#Eval("EventName") %></a></li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="odsCurrentEvents" runat="server" SelectMethod="GetList"
                TypeName="Pibt.BLL.Events"></asp:ObjectDataSource>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <div class="titleRight">
        <div class="titleLeft clear">
            <h1>
                <input type="button" class="ImgHome" value=" " />
                <a href="/">Home</a>&nbsp;>&nbsp;<a href="/News.aspx">News</a>&nbsp;>&nbsp;Lifelines</h1>
        </div>
    </div>
    <h1>
        LifeLines</h1>
 <fieldset>
    <asp:FormView ID="FormView1" BorderStyle="None" runat="server">
    <ItemTemplate>
    <asp:Label ID="Label1" runat="server"  Text="Current Issue" />
    </ItemTemplate>
    </asp:FormView>
    <table id="table1" style="margin-bottom: 5px;">
        <tr>
            <td>
                <asp:FormView ID="FormView2" runat="server"/>
                <h2>Current Issue</h2>
            </td>
            <td style="text-align: center;">
            <h2>Archive</h2>
            </td>
        </tr>
        <tr>
            <td style="width: 70%;">
                <telerik:RadSplitter ID="Radsplitter6" runat="server" Orientation="Vertical">
                    <telerik:RadPane ID="Radpane11" runat="server" Height="1800px" Width="700px" ContentUrl="~/UploadFiles/LifelinesFeb14.pdf">
                    </telerik:RadPane>
                </telerik:RadSplitter>
                <%--<iframe id="RecentDoc" runat="server" src="UploadFiles/LifelinesFeb14.pdf" width="700" height="880"></iframe>--%>
                <telerik:RadWindowManager ID="RadWindowManager1" runat="server">
                    <Windows>
                        <telerik:RadWindow ID="RadWindow1" runat="server" Modal="true" Width="1000px" Behaviors="Close, Maximize"
                            Height="750px">
                        </telerik:RadWindow>
                    </Windows>
                </telerik:RadWindowManager>
                <br />
                <telerik:RadButton ID="RadButton1" runat="server" Text="View Larger" AutoPostBack="false"
                    OnClientClicked="openPdf">
                </telerik:RadButton>
            </td>
            <td style="width: 30%; vertical-align: top; text-align: center; font-size: 20px;
                font-family: Open Sans; margin-bottom: 15px;">
                
                <asp:Repeater ID="rptLifelines" runat="server">
                    <ItemTemplate>
                        <li style="font-size: medium; font-family: Open Sans, Sans-Serif; margin-bottom: 7px;">
                            <a href="/LifelinesDetails.aspx?id=<%#Eval("Id") %>">
                                <%# Eval("PublishedDate","{0:MMM-yyyy}")%>,&nbsp;Volume&nbsp;<%#Eval("VolumeNumber") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
    </table>
  </fieldset>
    <script type="text/javascript">
       function openPdf(sender, args) {
          window.radopen("UploadFiles/LifelinesFeb14.pdf", "RadWindow1");
       }
    </script>
    <%--    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Getlifelines"
        ></asp:ObjectDataSource>--%>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>
