<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEmployeeDetails.ascx.cs" Inherits="Pibt.UserControl.CtlEmployeeDetails" %>
<fieldset style="min-height:200px;">
    <legend><b><asp:Literal ID="Literal1" runat="server"> Family: </asp:Literal></b></legend>
    <telerik:RadTreeView ID="RadTreeView1" Skin="Vista" runat="server" Width="185px"
        OnClientLoad="OnClientLoad" OnNodeExpand="RadTreeView1_NodeExpand" Height="200px" >
    </telerik:RadTreeView>
</fieldset>
<fieldset>
    <legend><span style="font-size: x-large">To continue the enrollment process, please make a selection</span> </legend>
    <div style="float: left; position: relative;" class="customer-info-box">
        <div class="section-body">
            <span style="font-size: medium">If you are requesting to add a dependent or an additional dependent select this option.</span>
            <br />
            <asp:Button CssClass="btn" ID="addDependentButton" runat="server" OnClick="addDependentButton_Click" Text="Add Dependent" />
        </div>
        <br />
        <br />
        <div class="section-body">
            <span style="font-size: medium">To continue the enrollment process select this option to add coverages.</span>
            <br />
            <asp:Button CssClass="btn" ID="planEnrollmentButton" runat="server" OnClick="planEnrollmentButton_Click" Text="Plan Enrollment" />
        </div>
        <br />
        <br />
        <div class="section-body">
            <span style="font-size: medium">Return to view record</span>
            <br />
            <asp:Button CssClass="btn" ID="cancel" runat="server" OnClick="cancel_Click" Text="Go Back" />
        </div>
    </div>
</fieldset>
