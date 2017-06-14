<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployerEmployees.aspx.cs" Inherits="Pibt.Broker.AddEmployerEmployees" MasterPageFile="~/Content.master" %>
<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlQQ4.ascx" TagName="page4" TagPrefix="p4" %>
<asp:Content ID="header" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder"></asp:Content>
<asp:Content ID="menu" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlMenu" runat="server" ViewStateMode="Disabled" />
</asp:Content>
<asp:Content ID="main" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <div id="popup4" class="popup3">
        <fieldset style="padding: 0px 10px 10px 10px !important; border: 1px solid #CFCFCE;">
            <legend class="section-title">Upload:</legend>
            <asp:UpdatePanel ID="fileUpload" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:FileUpload ID="fuCensus" runat="server" CssClass="form-control" Style="display: inline; margin-right: 10px" Width="250px" />
                    <asp:Button ID="btnUpload" runat="server" CssClass="btn" Text="Upload" Style="margin-right: 20px;" OnClientClick="if(! userConfirmation('Are you sure you want to replace the entire census below?')) return false;" OnClick="btnUpload_Click" />
                    <asp:Button ID="Button1" runat="server" CssClass="btn-red" Text="Cancel" OnClientClick="genPopUp('popup4', false)" />
                    <br />
                    <asp:RegularExpressionValidator ID="revFuCensus" runat="server" ControlToValidate="fuCensus" ErrorMessage="Only .csv, .tsv and .txt allowed" ValidationExpression="(.*\.([Cc][Ss][Vv])|.*\.([Tt][Ss][Vv])|.*\.([Tt][Xx][Tt])|.*\.([Xx][Ll][Ss][Xx])|.*\.([Xx][Ll][Ss])$)" CssClass="required-info" Display="Static"></asp:RegularExpressionValidator>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnUpload" />
                </Triggers>
            </asp:UpdatePanel>
        </fieldset>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Literal ID="message" runat="server"></asp:Literal>
        </div>
    </div>
    <p4:page4 ID="page4" runat="server" />
   <div class="row">
        <div class="col-md-3">
            <asp:LinkButton ID="back" runat="server" Text="Back" CssClass="linkbtn" PostBackUrl="/Broker/AddEmployerDepartments.aspx"></asp:LinkButton>
        </div>
        <div class="col-md-3">
            <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn-red" OnClick="cancel_Click" OnClientClick="confirm('Are you sure you want to cancel?');" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="save2" runat="server" Text="Save For Later" CssClass="btn" OnClick="save_Click" OnClientClick="confirm('Are you sure you want to save this application for later?');" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="next" runat="server" Text="Next" CssClass="btn-green" OnClick="next_Click" />
        </div>
    </div>
</asp:Content>