<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAdministrators.ascx.cs"
   Inherits="Pibt.UserControl.CtlAdministrators" %>
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
    <fieldset>
       <legend>Quick Search</legend>
       <table class="table-container">
          <tr class="row">
             <td class="item-name">Search For&nbsp;&nbsp;&nbsp;
             </td>
             <td class="item-value">
                <asp:TextBox ID="txtClue" CssClass="form-control" autofocus="autofocus" Height="26px" runat="server"></asp:TextBox>
             </td>
          </tr>
          <tr>
             <td></td>
             <td>
                <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" OnClick="btnSearch_Click" />
                <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" OnClick="btnClear_Click" /></td>
          </tr>
       </table>
    </fieldset>
</asp:Panel>
<br />
<asp:Label ID="lblGridHeader" runat="server"></asp:Label>
<telerik:RadGrid ID="AdministratorsGrid" runat="server" AllowPaging="True" Width="100%" OnItemDataBound="binder" Height="100%" AutoGenerateColumns="False"
    GridLines="None" AllowSorting="true" CellSpacing="0" OnNeedDataSource="AdministratorsGrid_NeedDataSource" OnItemCommand="AdministratorsGrid_ItemCommand"
    Skin="MetroTouch">
   <PagerStyle Mode="NextPrevAndNumeric" />
   <GroupingSettings CaseSensitive="false" />
   <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id,UserId,Loginname"
      AllowSorting="true" Width="100%" Height="100%" PageSize="16">
      <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
      <Columns>
         <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="false" HeaderStyle-Wrap="false" DataNavigateUrlFields="UserId"
             DataNavigateUrlFormatString="/Admin/AdminEdit.aspx?uid={0}" DataTextField="UserId" DataTextFormatString="{0}" HeaderText="View User ID">
            <ItemStyle Wrap="True" Font-Underline="true" />
         </telerik:GridHyperLinkColumn>
         <telerik:GridBoundColumn DataField="UserName" HeaderText="Admin Name" SortExpression="UserName" UniqueName="UserName">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="Loginname" HeaderText="Web Username" SortExpression="Loginname" UniqueName="Loginname">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="Emailaddress" HeaderText="EMail" SortExpression="Emailaddress" UniqueName="Emailaddress">
         </telerik:GridBoundColumn>
         <telerik:GridCheckBoxColumn DataField="HasWebAccount" HeaderText="Active" SortExpression="HasWebAccount" UniqueName="HasWebAccount">
         </telerik:GridCheckBoxColumn>
         <telerik:GridCheckBoxColumn DataField="IsLockout" HeaderText="Lockout" SortExpression="IsLockout" UniqueName="IsLockout">
         </telerik:GridCheckBoxColumn>
         <telerik:GridBoundColumn DataField="Lastlogintime" HeaderText="Last Login Date" SortExpression="Lastlogintime" DataFormatString="{0:MM/dd/yyyy}"
            UniqueName="Lastlogintime">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="Updatedby" HeaderText="Updated By" SortExpression="Updatedby" UniqueName="Updatedby">
         </telerik:GridBoundColumn>
         <telerik:GridBoundColumn DataField="Updated" HeaderText="Updated" SortExpression="Updated" DataFormatString="{0:MM/dd/yyyy}" UniqueName="Updated">
         </telerik:GridBoundColumn>
         <telerik:GridButtonColumn ConfirmText="Delete this admin?" ConfirmDialogType="Classic"
            ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
            UniqueName="DeleteColumn">
         </telerik:GridButtonColumn>
      </Columns>
   </MasterTableView>
</telerik:RadGrid>
