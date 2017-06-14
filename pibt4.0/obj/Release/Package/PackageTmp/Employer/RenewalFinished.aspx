<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenewalFinished.aspx.cs" Inherits="Pibt.Employer.RenewalFinished" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">R</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
Participation Agreement Submitted
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <fieldset>
            <legend>Submitted</legend>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <p class="simpleText">
                            Thank you for finalizing your renewal.  The Participation Agreement has been automatically forwarded to the “Company Documents” folder under Company Profile in your portal.  If you have any questions, place contact <asp:Label ID="name" runat="server"></asp:Label> at (800) 449-4849 EXT.<asp:Label ID="ext" runat="server"></asp:Label>.
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <span class="simpleText"><a href="/Employer/BusinessInfo.aspx">Click here</a> to return home</span>
                    </div>
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
