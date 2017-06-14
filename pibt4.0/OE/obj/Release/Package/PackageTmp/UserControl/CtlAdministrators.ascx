<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAdministrators.ascx.cs"
   Inherits="Pibt.UserControl.CtlAdministrators" %>
<%@ Register Src="CtlAddWebUser.ascx" TagName="CtlAddWebUser" TagPrefix="uc2" %>
<uc2:CtlAddWebUser ID="CtlAddWebUser1" runat="server" Role="Administrator" />
<fieldset>
   <legend>Quick Search</legend>
   <table class="table-container">
      <tr class="row">
         <td class="item-name">User ID&nbsp;&nbsp;&nbsp;
         </td>
         <td class="item-value">
            <asp:TextBox ID="txtUserId" CssClass="form-control" autofocus="autofocus" Height="26px" runat="server"></asp:TextBox>
         </td>
         <td class="item-name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Web Login ID
         </td>
         <td class="item-value">
            <asp:TextBox ID="txtLoginName" CssClass="form-control" Height="26px" runat="server"></asp:TextBox>
         </td>
         <td class="item-name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admin Name
         </td>
         <td class="item-value">
            <asp:TextBox ID="txtUserName" CssClass="form-control" Height="26px" runat="server"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td></td>
         <td></td>
         <td>
            <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" OnClick="btnClear_Click" /></td>
      </tr>
   </table>
</fieldset>
<br />
<asp:Label ID="lblGridHeader" runat="server"></asp:Label>
<telerik:RadGrid ID="AdministratorsGrid" runat="server" AllowPaging="True" Width="100%"
   Height="100%" AutoGenerateColumns="False" GridLines="None" AllowSorting="true"
   CellSpacing="0" OnNeedDataSource="AdministratorsGrid_NeedDataSource" OnItemCommand="AdministratorsGrid_ItemCommand">
   <PagerStyle Mode="NextPrevAndNumeric" />
   <GroupingSettings CaseSensitive="false" />
   <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id,UserId,Loginname"
      AllowSorting="true" Width="100%" Height="100%" PageSize="16">
      <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
      <Columns>
         <telerik:GridBoundColumn DataField="UserId" SortExpression="UserId" UniqueName="UserId"
            HeaderText="USER ID">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="UserName" HeaderText="ADMIN NAME" SortExpression="UserName"
            UniqueName="UserName">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="Loginname" HeaderText="WEB LOGIN ID" SortExpression="Loginname"
            UniqueName="Loginname">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="Emailaddress" HeaderText="EMAIL" SortExpression="Emailaddress"
            UniqueName="Emailaddress">
         </telerik:GridBoundColumn>
         <telerik:GridCheckBoxColumn DataField="HasWebAccount" HeaderText="ACTIVE" SortExpression="HasWebAccount"
            UniqueName="HasWebAccount">
         </telerik:GridCheckBoxColumn>
         <telerik:GridCheckBoxColumn DataField="IsLockout" HeaderText="LOCKOUT" SortExpression="IsLockout"
            UniqueName="IsLockout">
         </telerik:GridCheckBoxColumn>
         <telerik:GridBoundColumn DataField="Lastlogintime" HeaderText="LAST LOGIN TIME" SortExpression="Lastlogintime"
            UniqueName="Lastlogintime">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="Updatedby" HeaderText="UPDATED BY" SortExpression="Updatedby"
            UniqueName="Updatedby">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="Updated" HeaderText="UPDATED" SortExpression="Updated"
            UniqueName="Updated">
         </telerik:GridBoundColumn>
         <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="false"
            HeaderStyle-Wrap="false" DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="/Admin/AdminEdit.aspx?uid={0}"
            HeaderStyle-Width="20px" Text="Edit">
            <ItemStyle Wrap="True" Font-Underline="true" />
         </telerik:GridHyperLinkColumn>
         <telerik:GridButtonColumn ConfirmText="Delete this admin?" ConfirmDialogType="Classic"
            ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
            UniqueName="DeleteColumn">
         </telerik:GridButtonColumn>
      </Columns>
   </MasterTableView>
</telerik:RadGrid>
