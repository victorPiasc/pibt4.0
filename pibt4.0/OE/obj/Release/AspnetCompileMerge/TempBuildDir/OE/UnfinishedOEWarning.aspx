<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="UnfinishedOEWarning.aspx.cs" Inherits="Pibt.OE.UnfinishedOEWarning" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> / Enroller Form Warning
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <p style="margin-top: 10px; text-align:center; font-family: Open sans; font-size: 17px;">
        Previous enrollment form <strong style="color:Black;">(<asp:Literal ID="lblOEType" runat="server"></asp:Literal>)</strong> was not completed. <br />If you would
        like to proceed with this enrollment form, please click <strong style="color:Black;">"Continue"</strong>. Otherwise, click <strong style="color:Black;">"Cancel"</strong> to start over.
    </p>
    <table align="center">
        <tbody>
            <tr class="row">
                <td class="item-name">
                    <asp:Button runat="server" ID="btnContinue" CssClass="btn" Text="Continue" Width="98px" OnClick="btnContinue_Click" />&nbsp;
                </td>
                <td class="item-name">
                    <asp:Button runat="server" ID="btnNew" CssClass="btn" Text="Cancel" Width="98px" OnClick="btnNew_Click" />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
