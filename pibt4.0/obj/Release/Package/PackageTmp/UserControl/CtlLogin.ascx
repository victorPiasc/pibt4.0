<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlLogin.ascx.cs" Inherits="Pibt.UserControl.CtlLogin" %>
<%@ Register Src="CtlTopInfoMenu.ascx" TagName="CtlTopInfoMenu" TagPrefix="uc1" %>
<asp:LoginView ID="LoginViewLoginPart" runat="server">    
    <LoggedInTemplate>
        <uc1:CtlTopInfoMenu ID="CtlTopInfoMenu1" runat="server" />
       <div style="margin-bottom:6px;">
        <asp:Button ID="btnLogout" CausesValidation="false" runat="server" CssClass="btn" 
            OnClick="btnLogout_Click" Text="Sign Out"></asp:Button>
        </div>
    </LoggedInTemplate>
</asp:LoginView>
