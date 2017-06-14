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
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
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
                    <asp:ListItem Text="All Accounts" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Web Registered Accounts" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Unregistered Accounts" Value="3"></asp:ListItem>
                </asp:DropDownList>
              </td>
           </tr>
        <tr class="row">
            <td class="item-name">
                Web&nbsp;Usernane:
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
                Employer&nbsp;Name:
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
            </td>
        </tr>
        <tr class="row">
            <td class="item-name">
                &nbsp;
            </td>
            <td class="auto-style1" colspan="3">
                <asp:Button ID="btnSearch" CssClass="btn" ValidationGroup="vgId" Text="Search" runat="server" OnClick="btnSearch_Click" />
                <asp:Button ID="btnClear" CssClass="btn" CausesValidation="false" Text="Clear" runat="server" OnClick="btnClear_Click" />
               <asp:Label ID="lblSearchingMsg" runat="server" CssClass="red"></asp:Label>
            </td>
        </tr>
    </table>
</fieldset>
</asp:Panel>
<br />
<br />
<asp:Label ID="lblGridHeader" runat="server"></asp:Label>
<telerik:RadGrid ID="EmployersGrid" runat="server" AllowPaging="True" AllowSorting="True"
        Height="100%" AutoGenerateColumns="False" OnItemCommand="EmployersGrid_ItemCommand" AllowMultiRowSelection="True"
        OnNeedDataSource="EmployersGrid_NeedDataSource">
    <PagerStyle Mode="NextPrevAndNumeric" />
    <GroupingSettings CaseSensitive="false" />
    <ClientSettings>
        <Selecting AllowRowSelect="True" />
    </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id,EMPLOYERID,Loginname" CommandItemDisplay="Bottom"
            AllowSorting="true" Width="100%" Height="100%" PageSize="16">
        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
        <Columns>
            <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn">
            </telerik:GridClientSelectColumn>
            <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="false" HeaderStyle-Wrap="false" DataNavigateUrlFields="EMPLOYERID"
                DataNavigateUrlFormatString="/Employer/BusinessInfo.aspx?erId={0}" Text="Select">
        <HeaderStyle Wrap="False" Font-Bold="False" Width="20px"></HeaderStyle>
                <ItemStyle Wrap="True" Font-Underline="true" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="EMPLOYERID" SortExpression="EMPLOYERID" UniqueName="EMPLOYERID" HeaderText="Employer ID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LoginName" HeaderText="Web Username" SortExpression="LoginName" UniqueName="LoginName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NAME" HeaderText="Name" SortExpression="NAME" UniqueName="NAME">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Address" HeaderText="Address" SortExpression="Address" UniqueName="Address">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CITY" HeaderText="City" SortExpression="CITY" UniqueName="CITY">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="STATE" HeaderText="State" SortExpression="STATE" UniqueName="STATE">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="ZIP" HeaderText="Zip" SortExpression="ZIP" UniqueName="ZIP">
            </telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn DataField="HasWebAccount" HeaderText="Active" SortExpression="HasWebAccount" UniqueName="HasWebAccount">
            </telerik:GridCheckBoxColumn>
            <telerik:GridBoundColumn DataField="Lastlogintime" HeaderText="Last Login" SortExpression="Lastlogintime" DataFormatString="{0:MM/dd/yyyy}"
                UniqueName="Lastlogintime">
            </telerik:GridBoundColumn>
            <telerik:GridButtonColumn ConfirmText="Delete this employer?" ConfirmDialogType="Classic" ConfirmTitle="Delete" ButtonType="ImageButton"
                CommandName="Delete" Text="Delete" UniqueName="DeleteColumn">
            </telerik:GridButtonColumn>
        </Columns>
        <CommandItemTemplate>
            <asp:Button ID="bt_CreateWebAcct" runat="server" CommandName="btCreateAcct" CssClass="btn" Text="Create Web Account" />
        </CommandItemTemplate>
    </MasterTableView>
</telerik:RadGrid>
   <asp:CheckBox ID="ck_email" runat="server" Checked="False" Text="After a web account is created, a notification email will be sent to " Font-Bold="True" />
   <asp:TextBox ID="tb_email" runat="server">stephanie@piasc.org</asp:TextBox>.
   <br />
   <asp:Label ID="Label1" runat="server" Text="(by default, the notification eMail will be sent to Employer eMail address.)"></asp:Label>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <asp:Label ID="lblMessage" runat="server"></asp:Label>
