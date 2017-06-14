<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlTags.ascx.cs" Inherits="Pibt.UserControl.CtlTags" %>
<style>
.RadTagCloud_Telerik ul li a
{
    color:Black !important;
    background-color:transparent;
}
</style>
<fieldset style="height: 300px;">
    <div style="text-align: center">
        Popular Tags
    </div>
    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" MinDisplayTime="500">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxPanel ID="AjaxPanel" runat="server" LoadingPanelID="LoadingPanel1">
        <div>
            <telerik:RadTagCloud ID="RadTagCloud1" runat="server" ForeColor="White">
                <Items>
                    <telerik:RadTagCloudItem Text="Aetna" Weight="16" NavigateUrl="https://st2.aetna.com" ToolTip="Aetna" />
                    <telerik:RadTagCloudItem Text="Blue Shield" Weight="134" NavigateUrl="https://www.blueshieldca.com/bsc/home/home.jhtml" ToolTip="Blue Shield of California" />
                    <telerik:RadTagCloudItem Text="Cigna" Weight="56" NavigateUrl="http://www.cigna.com/" ToolTip="Cigna HealthCare" />
                    <telerik:RadTagCloudItem Text="EyeMed" Weight="38" NavigateUrl="http://www.eyemedvisioncare.com/" ToolTip="EyeMed Vision Care" />
                    <telerik:RadTagCloudItem Text="GA Coventry" Weight="73" NavigateUrl="http://www.cvty.com/" ToolTip="Georgia Coventry" />
                    <telerik:RadTagCloudItem Text="Kiser Permanente" Weight="23" NavigateUrl="http://www.kaiserpermanente.org/" ToolTip="Kiser Permanente" />
                    <telerik:RadTagCloudItem Text="Health Net" Weight="78" NavigateUrl="https://www.healthnet.com/portal/member/home.do" ToolTip="Health Net" />
                    <telerik:RadTagCloudItem Text="Humana" Weight="50" NavigateUrl="http://www.humana.com/" ToolTip="Humana" />
                    <telerik:RadTagCloudItem Text="Landmark" Weight="80" NavigateUrl="http://lmhealthcare.com/" ToolTip="Landmark Healthplan of California" />
                    <telerik:RadTagCloudItem Text="MetLife" Weight="20" NavigateUrl="http://www.metlife.com/" ToolTip="MetLife" />
                    <telerik:RadTagCloudItem Text="Safeguard" Weight="50" ToolTip="Safeguard" />
                    <telerik:RadTagCloudItem Text="PIASC Indemnity" Weight="40" NavigateUrl="http://www.safeguard.net/" ToolTip="Safeguard" />
                    <telerik:RadTagCloudItem Text="VSP" Weight="58" NavigateUrl="http://vsp.com/ " ToolTip="Vision Service Plan (VSP)" />
                    <telerik:RadTagCloudItem Text="Western Dental" Weight="60" NavigateUrl="http://westerndental.com/" ToolTip="Western Dental" />
                </Items>
            </telerik:RadTagCloud>
        </div>
    </telerik:RadAjaxPanel>
</fieldset>
