<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Beneficiary.aspx.cs" Inherits="Pibt.OE.Beneficiary" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlBeneficiary.ascx" TagName="CtlBeneficiary" TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a id="A2" href="/">Home</a> / Enroller Form / Beneficiaries
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <br />
    <fieldset>
        <legend>Beneficiary Information:</legend>
        <br />
        You have the following Life Coverage(s):
        <br />
        <asp:Label ID="lbNoCoverage" runat="server" Text='You did not choose any Life Coverage'
            CssClass="red" Visible="False" />
        <br />
        <asp:DataList ID="dlCoverages" runat="server" DataSourceID="OdsLifeCoverage">
            <ItemTemplate>
                &nbsp;&nbsp;&nbsp;<strong>*</strong>&nbsp;<asp:Label ID="DESCRIPTIONLabel" runat="server" Font-Bold="true" Text='<%# Eval("DESCRIPTION") %>' />
               <br /><br />
            </ItemTemplate>
        </asp:DataList>
        <asp:ObjectDataSource ID="OdsLifeCoverage" runat="server" SelectMethod="GetOELifeCoverages"
            TypeName="Pibt.BLL.EnrollmentForm">
            <SelectParameters>
                <asp:SessionParameter Name="oeId" SessionField="OEId" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <uc2:CtlBeneficiary ID="CtlBeneficiary1" runat="server" />
    </fieldset>
    <div class="bottom-center-buttons">
        <asp:Button runat="server" CssClass="btn" CausesValidation="false" ID="BtBack" Text="Previous"
            OnClick="BtBack_Click" Width="98px" />
        <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClick="BtNext_Click"
            Width="98px" />
       <asp:Button runat="server" ID="btnSaveAndExit" CssClass="btn btn-danger" text="Save and Exit" OnClick="btnSaveAndExit_Click" />

    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
