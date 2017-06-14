<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEmployerGrid.ascx.cs"
    Inherits="Pibt.UserControl.CtlEmployerGrid" %>
<style type="text/css">
   .auto-style1 {
      width: 416px;
   }
   .auto-style2 {
      width: 423px;
   }
</style>
<telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadGridEmployers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadGridEmployers" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
<fieldset>
    <legend>Quick Search</legend>
    <table class="table-container" width="100%">
        <tr class="row">
            <td class="item-name">
                Employer ID:
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtEmployerId" runat="server" Height="27px" Width="300px" Placeholder="Enter Employer ID" CssClass="form-control" MaxLength="8" ValidationGroup="vgId"></asp:TextBox>
                <asp:RangeValidator ID="rvId" runat="server" ControlToValidate="txtEmployerId" Display="Dynamic"
                    ValidationGroup="vgId" CssClass="red" ErrorMessage="It must be 1-99999999" MinimumValue="1"
                    MaximumValue="99999999"></asp:RangeValidator>
            </td>
           <td class="item-name">Search By Registration:</td>
           <td class="auto-style3">
                <asp:DropDownList ID="ddlTypes" CssClass="form-control"  runat="server">
                    <asp:ListItem Text="All accounts" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Web Registered Accounts" Value="2"></asp:ListItem>
                    <asp:ListItem Text="None Web Registered Accounts" Value="3"></asp:ListItem>
                </asp:DropDownList>
              </td>
           </tr>
        <tr class="row">
            <td class="item-name">
                Web Login ID:
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtLoginName"  Height="27px" Width="300px" Placeholder="Enter Weblogin ID" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
           <td class="auto-style3">&nbsp;</td>
           <td class="auto-style3">
              <asp:Button ID="bt_SearchByType" CssClass="btn" runat="server" Text="Search By Registration" OnClick="bt_SearchByType_Click" />
            </td>
        </tr>
        <tr class="row">
            <td class="item-name">
                Employer Name:
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtUserName" Height="27px" Width="300px" Placeholder="Enter Employer Name" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
           <td class="auto-style3" colspan="2">&nbsp;</td>
        </tr>

        <tr class="row">
            <td class="item-name">
                Address:
            </td>
            <td class="auto-style1" colspan="3">
                <asp:TextBox ID="txtAddress"  Height="27px" Width="300px" CssClass="form-control" Placeholder="Enter Address" runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" CssClass="btn" ValidationGroup="vgId" Text="Search" runat="server" OnClick="btnSearch_Click" />
                <asp:Button ID="btnClear" CssClass="btn" CausesValidation="false" Text="Clear" runat="server" OnClick="btnClear_Click" />
               <asp:Label ID="lblSearchingMsg" runat="server" CssClass="red"></asp:Label>
            </td>
        </tr>

    </table>
</fieldset>
<br />
<asp:Button ID="btnSynEmployer" CssClass="btn" runat="server" Text="Click here to sync all employers"
    OnClick="btnSynEmployer_Click" />
<br />

<br />
<asp:Label ID="lblGridHeader" runat="server"></asp:Label>
<telerik:RadGrid ID="EmployersGrid" runat="server" AllowPaging="True" AllowSorting="True"
    Height="100%" AutoGenerateColumns="False" OnItemCommand="EmployersGrid_ItemCommand" AllowMultiRowSelection="True" OnNeedDataSource="EmployersGrid_NeedDataSource">
    <PagerStyle Mode="NextPrevAndNumeric" />
    <GroupingSettings CaseSensitive="false" />
    <ClientSettings>
     <Selecting AllowRowSelect="True" />
    </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id,EMPLOYERID,Loginname" CommandItemDisplay="Bottom"
        AllowSorting="true" Width="100%" Height="100%" PageSize="16">
        <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
        <Columns>
            <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn">
            </telerik:GridClientSelectColumn>
            <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="false"
                HeaderStyle-Wrap="false" DataNavigateUrlFields="EMPLOYERID" DataNavigateUrlFormatString="/Employer/BusinessInfo.aspx?erId={0}"
                HeaderStyle-Width="20px" Text="Select">
        <HeaderStyle Wrap="False" Font-Bold="False" Width="20px"></HeaderStyle>
                <ItemStyle Wrap="True" Font-Underline="true" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="EMPLOYERID" SortExpression="EMPLOYERID" UniqueName="EMPLOYERID"
                HeaderText="EMPLOYER ID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LoginName" HeaderText="WEB LOGIN ID" SortExpression="LoginName"
                UniqueName="LoginName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NAME" HeaderText="NAME" SortExpression="NAME"
                UniqueName="NAME">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Address" HeaderText="ADDRESS" SortExpression="Address"
                UniqueName="Address">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CITY" HeaderText="CITY" SortExpression="CITY"
                UniqueName="CITY">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="STATE" HeaderText="STATE" SortExpression="STATE"
                UniqueName="STATE">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="ZIP" HeaderText="ZIP" SortExpression="ZIP" UniqueName="ZIP">
            </telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn DataField="HasWebAccount" HeaderText="ACTIVE" SortExpression="HasWebAccount"
                UniqueName="HasWebAccount">
            </telerik:GridCheckBoxColumn>
        <%--<telerik:GridCheckBoxColumn DataField="IsLockout" HeaderText="LOCKOUT" SortExpression="IsLockout"
                UniqueName="IsLockout">
            </telerik:GridCheckBoxColumn>--%>
            <telerik:GridBoundColumn DataField="Lastlogintime" HeaderText="LAST LOGIN" SortExpression="Lastlogintime"
                UniqueName="Lastlogintime">
            </telerik:GridBoundColumn>
            <telerik:GridButtonColumn ConfirmText="Delete this ER?" ConfirmDialogType="Classic"
                ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                UniqueName="DeleteColumn">
            </telerik:GridButtonColumn>
        </Columns>
        <CommandItemTemplate>
            <asp:Button ID="bt_CreateWebAcct" runat="server" CommandName="btCreateAcct" CssClass="btn" Text="Create Web Account" />
            <%--<asp:Button ID="bt_AddToFavorites" runat="server" CommandName="btAddToFavorites" CssClass="btn" Text="Add To Favorites" />--%>
        </CommandItemTemplate>
    </MasterTableView>
</telerik:RadGrid>
<div class="note-list">
   Note: If any missing employer account, click the top button "Click here to sync all employers".
</div> 
   <br />
   <asp:CheckBox ID="ck_email" runat="server" Checked="False" Text="After a web account is created, a notification email will be sent to " Font-Bold="True" />
   <asp:TextBox ID="tb_email" runat="server">stephanie@piasc.org</asp:TextBox>.
   <br />
   <asp:Label ID="Label1" runat="server" Text="(by default the notification email will be sent to Employer email address.)"></asp:Label>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <asp:Label ID="lblMessage" runat="server"></asp:Label>

