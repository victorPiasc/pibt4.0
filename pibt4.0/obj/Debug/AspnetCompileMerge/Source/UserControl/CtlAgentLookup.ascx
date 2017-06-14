<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAgentLookup.ascx.cs"
    Inherits="Pibt.UserControl.CtlAgentLookup" %>
<telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadComboBox1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="CurrentEmployeesByEnrollerGrid" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="AgentIdComboBox" />
                <telerik:AjaxUpdatedControl ControlID="AgentComboBox" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
<div class="customer-info-box">
    <div class="section-body">
        <fieldset style="height: 125px">
            <legend>Search</legend>
           <table>
              <tr>
                 <td><b>Select an Agent:</b></td>
                 <td> 
                    <asp:DropDownList ID="AgentComboBox" runat="server" Width="386px" CssClass="form-control"
                    DataTextField="Name" AutoPostBack="True" OnSelectedIndexChanged="AgentComboBox_SelectedIndexChanged"
                    Skin="Metro" />
                 </td>
              </tr>
              <tr><td>&nbsp;</td></tr>
              <tr>
                 <td><b>Select an enroller ID:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                 <td>
                    <asp:DropDownList ID="AgentIdComboBox" runat="server" Width="386px" CssClass="form-control"
                    DataTextField="UserId" DataValueField="Enrollerid" AutoPostBack="true" Skin="Metro" 
                    OnSelectedIndexChanged="AgentIdComboBox_SelectedIndexChanged" />
                 </td>
              </tr>
           </table>
                

               <br /><br />
                

        </fieldset>
        <br />
        <fieldset>
            <legend>Employee List</legend>
            <div>
                <telerik:RadGrid ID="CurrentEmployeesByEnrollerGrid" runat="server" DataKeyNames="enrollerId"
                    AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true" CssClass="AutoWidthGrid"
                    DataSourceID="odsEmployeeList" PagerStyle-PageButtonCount="15">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <MasterTableView AllowMultiColumnSorting="true" EditMode="InPlace" PageSize="20"
                        CommandItemDisplay="TopAndBottom" DataSourceID="odsEmployeeList">
                        <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToExcelButton="true"
                            ExportToExcelText="Export to Excel" ShowRefreshButton="false"></CommandItemSettings>
                        <Columns>
                            <telerik:GridBoundColumn DataField="EMPLOYERID" UniqueName="EMPLOYERID" HeaderText="Employer ID" DataType="System.Int32">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NAME" UniqueName="NAME" HeaderText="Name" DataType="System.String">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EMPLOYEEID" UniqueName="EMPLOYEEID" HeaderText="Employee ID" DataType="System.Int32">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="LASTNAME" UniqueName="LASTNAME" HeaderText="Last Name" DataType="System.String">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FIRSTNAME" UniqueName="FIRSTNAME" HeaderText="First Name" DataType="System.String">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                        <PagerStyle PageSizeControlType="RadComboBox" />
                    </MasterTableView>
                    <ExportSettings ExportOnlyData="true" IgnorePaging="true" FileName="Employee List"
                        OpenInNewWindow="true" HideStructureColumns="true">
                        <Excel Format="Biff" />
                    </ExportSettings>
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                </telerik:RadGrid>
            </div>
        </fieldset>
    </div>
</div>
<asp:ObjectDataSource ID="odsEmployeeList" runat="server" SelectMethod="GetEmployeesByEnrollerId"
    TypeName="Pibt.BLL.Agent">
    <SelectParameters>
        <asp:ControlParameter ControlID="AgentIdComboBox" Name="EnrollerId" PropertyName="SelectedValue"
            Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
