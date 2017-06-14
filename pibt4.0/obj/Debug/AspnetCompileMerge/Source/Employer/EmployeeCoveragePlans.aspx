<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
   CodeBehind="EmployeeCoveragePlans.aspx.cs" Inherits="Pibt.Employer.EmployeeCoveragePlans" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
   TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
   <uc1:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
   <input type="button" class="ImgHome" value=" " />
   <a href="/">Home</a> &nbsp;>&nbsp;&nbsp;Coverage Plan Search
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">
   <fieldset>
      <legend><b>Search by </b>:</legend>
      <table class="table-container">
         <tr class="row">
            <td class="item-name">Employee Last Name:
            </td>
            <td class="item-value">
               <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" Height="26px" MaxLength="20"></asp:TextBox>
            </td>
            <td class="item-name">&nbsp;&nbsp;&nbsp;&nbsp;Plan Name:
            </td>
            <td class="item-value">
               <asp:TextBox ID="txtPlanName" runat="server" CssClass="form-control" Height="26px" MaxLength="20"></asp:TextBox>
            </td>
         </tr>
         <tr class="row">
            <td>
               <asp:Button ID="Button1" Text="Search" ValidationGroup="vSearch" runat="server"
                  CssClass="btn" OnClick="btnSearch_Click" />
               <asp:Button ID="Button2" Text="Clear" CausesValidation="false" CssClass="btn" runat="server"
                  OnClick="btnClear_Click" />
            </td>
         </tr>
      </table>
   </fieldset>
    </asp:Panel>
   <br />
   <asp:Label ID="lblGridHeader" runat="server"></asp:Label>
   <telerik:RadGrid ID="PlansGrid" runat="server" AllowPaging="True" Height="100%" AutoGenerateColumns="False" 
      GridLines="None" AllowSorting="True" CellSpacing="0" DataSourceID="odsSearchPlans" Skin="MetroTouch">
      <PagerStyle Mode="NextPrevAndNumeric" />
      <GroupingSettings CaseSensitive="false" />
      <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="MEMBERPLANID"
         AllowSorting="true" Height="100%" PageSize="16" CommandItemDisplay="TopAndBottom"
         DataSourceID="odsSearchPlans">
         <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToExcelButton="false"
            ExportToExcelText="Export to Excel" ShowRefreshButton="false"></CommandItemSettings>
         <Columns>
            <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Underline="false" ItemStyle-CssClass="gridlinkbtn"
                DataNavigateUrlFields="employeeId,employerId" DataNavigateUrlFormatString="EmployeeDetails.aspx?eeId={0}&erId={1}" Text="Select" Exportable="false"
                ItemStyle-VerticalAlign="Bottom">
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="EMPLOYEEID" SortExpression="EMPLOYEEID #ID" UniqueName="EMPLOYEEID" ItemStyle-HorizontalAlign="Center"
               HeaderText="Employee ID" DataType="System.Int32">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="MemberName" HeaderText="Name" SortExpression="MemberName" UniqueName="MemberName" DataType="System.String">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EMPLOYEETYPE" HeaderText="Employee Type" SortExpression="EMPLOYEETYPE"
               UniqueName="EMPLOYEETYPE" DataType="System.String">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="PLANID" HeaderText="Plan ID" SortExpression="PLANID" UniqueName="PLANID" DataType="System.Int32">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" SortExpression="PLANNAME" UniqueName="PLANNAME" DataType="System.String">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EFFECTIVEDATE" HeaderText="Effective Date" SortExpression="EFFECTIVEDATE"
               UniqueName="EFFECTIVEDATE" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" ItemStyle-HorizontalAlign="Center">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EXPIRYDATE" HeaderText="Expiry Date" SortExpression="EXPIRYDATE"
               UniqueName="EXPIRYDATE" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" ItemStyle-HorizontalAlign="Center">
            </telerik:GridBoundColumn>
         </Columns>
         <EditFormSettings>
            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
            </EditColumn>
         </EditFormSettings>
         <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
      </MasterTableView>
      <ExportSettings ExportOnlyData="true" IgnorePaging="true" FileName="Coverage Plans"
         OpenInNewWindow="true" HideStructureColumns="true">
         <Excel Format="Biff" />
      </ExportSettings>
      <FilterMenu EnableImageSprites="False">
      </FilterMenu>
   </telerik:RadGrid>
   <asp:ObjectDataSource ID="odsSearchPlans" runat="server" OnSelecting="odsSearchPlans_Selecting"
      SelectMethod="SearchEEActivePlans" TypeName="Pibt.BLL.Plan">
      <SelectParameters>
         <asp:Parameter Name="erId" Type="String" />
         <asp:Parameter Name="eeId" Type="String" />
         <asp:Parameter Name="planId" Type="String" />
         <asp:Parameter Name="eeName" Type="String" />
         <asp:Parameter Name="planName" Type="String" />
         <asp:Parameter Name="effectivedate" Type="DateTime" />
         <asp:Parameter Name="expirydate" Type="DateTime" />
      </SelectParameters>
   </asp:ObjectDataSource>
</asp:Content>
