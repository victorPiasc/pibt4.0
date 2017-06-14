<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEmployeeDetails.ascx.cs"
    Inherits="Pibt.UserControl.CtlEmployeeDetails" %>

<fieldset>
    <legend><span style="font-size: x-large">To continue the enrollment process, please make a selection</span> </legend>          
    <div style="float: left; position: relative;" class="customer-info-box">
        <asp:PlaceHolder runat="server" ID="addDependent">
            <div class="section-body">
                <span style="font-size:medium">If you are requesting to add a dependent or an additional dependent select this option.</span> <br />
                <asp:Button CssClass="btn" ID="addDependentButton" runat="server" OnClick="addDependentButton_Click" Text="Add Dependent" />                       
            </div>
        </asp:PlaceHolder>
        <br />
        <br />
        <asp:PlaceHolder runat="server" ID="planEnrollment">
            <div class="section-body">
                <span style="font-size:medium">
                To continue the enrollment process select this option to add coverages.</span> <br />                    
                <asp:Button CssClass="btn" ID="planEnrollmentButton" runat="server" OnClick="planEnrollmentButton_Click" Text="Plan Enrollment" />                  
            </div>
        </asp:PlaceHolder>
    </div>            
</fieldset>
