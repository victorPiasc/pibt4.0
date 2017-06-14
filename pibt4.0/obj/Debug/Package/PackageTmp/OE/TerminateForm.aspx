<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="TerminateForm.aspx.cs" Inherits="Pibt.OE.TerminateForm" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> / Enroller Form / Terminate Plans
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <br />
    <fieldset>
        <fieldset>
            <legend>
                Termination Reason:
            </legend>
            <telerik:RadComboBox ID="dpReason" Width="500" runat="server" Skin="MetroTouch" DataSourceID="OdsTReason" DataTextField="Reason" DataValueField="TReasonId" OnDataBound="dpReason_DataBound" EmptyMessage="Select Reason...">
            </telerik:RadComboBox>
            <asp:ObjectDataSource ID="OdsTReason" runat="server" SelectMethod="GetTReason" TypeName="Pibt.BLL.EnrollmentForm">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="3" Name="specialReasonId" SessionField="OETypeId" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </fieldset>
        <fieldset>
            <legend>
                Terminating Plan(s):
            </legend>
            <telerik:RadGrid ID="RadGridPlans" DataKeyNames="Memberplanid" Skin="MetroTouch" CssClass="EnrollmentPlanGrid" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Width="100%" OnNeedDataSource="RadGridPlans_NeedDataSource">
                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                <ClientSettings EnablePostBackOnRowClick="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
                <MasterTableView AllowMultiColumnSorting="True" DataKeyNames="Memberplanid,employeeType,description">
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="firstname" HeaderText="Name" DataField="firstname" UniqueName="firstname">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="employeeType" HeaderText="Type" DataField="employeeType" UniqueName="employeeType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="description" HeaderText="Coverage Type" DataField="description" UniqueName="plantype">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="planname" HeaderText="Plan Name" SortExpression="planname" UniqueName="planname">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="memberplanid" HeaderText="Plan ID" SortExpression="memberplanid" UniqueName="memberplanid" Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </fieldset>
        <fieldset>
            <legend>
                Termination Date:
            </legend>
            <telerik:RadComboBox ID="dtExpiryDate" runat="server" Skin="MetroTouch">
            </telerik:RadComboBox>
            <span style="font-weight:bold;color:red;display:block;">Click next to continue termination</span>
        </fieldset>
        <div class="note-list">
            <span class="Required">If the termination is considered a "COBRA Qualifying Event", COBRA will be mailed within the next 14-days.  To verify COBRA
                eligibility, please contact <%=Pibt.Common.Utilities.Us()%>.</span>
        </div>
        <div id="OEAlertDialog" class="message-error">
            <asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <asp:Button runat="server" CssClass="btn" ID="cancel" Text="Cancel" OnClick="cancel_Click" />
            </div>
            <div class="col-lg-4">
                <asp:Button runat="server" CssClass="btn" ID="startOver" Text="Start Over" OnClick="startOver_Click" />
            </div>
            <div class="col-lg-4">
                <asp:Button runat="server" CssClass="btn" ID="BtNext" Text="Continue" OnClick="BtNext_Click" Width="98px" />
            </div>
        </div>
    </fieldset>
</asp:Content>
