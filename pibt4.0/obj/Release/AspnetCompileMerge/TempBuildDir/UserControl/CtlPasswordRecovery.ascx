<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlPasswordRecovery.ascx.cs" Inherits="Pibt.UserControl.CtlPasswordRecovery" %>


<div class="customer-info-box">
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">

</telerik:RadAjaxLoadingPanel>
<telerik:RadAjaxPanel runat="server" ID="AjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1">
    <div class="section-title" style="font-size:18px; font-family: Open sans;">
        Provide us your username</div>
    <div class="section-body">
        <table class="table-container">
            <tbody>
                <tr class="row">
                    <td class="item-name">
                        Username: &nbsp;&nbsp;
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtLoginName" runat="server" CssClass="form-control"
                  autofocus="autofocus"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLoginName" runat="server" ControlToValidate="txtLoginName"
                            CssClass="required-info" ErrorMessage="User Name Is Required" ValidationGroup="CreateUser" />
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">
                    </td>
                    <td>
                        <asp:Button ID="btn_PWRecovery" CssClass="btn" runat="server" Text="Remind Me" OnClick="btn_PWRecovery_Click" Width="112px" 
                             />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="clear">
    </div>
    <div id="MsgDialog" class="message-error">
        <asp:Literal ID="lbl_ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
        <asp:Literal ID="lbl_Message" runat="server" EnableViewState="false"></asp:Literal>
    </div>
</telerik:RadAjaxPanel>
</div>
