<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployerDepartments.aspx.cs" Inherits="Pibt.Broker.AddEmployerDepartments" MasterPageFile="~/Content.master" %>
<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlDepartments.ascx" TagName="CtlDept" TagPrefix="uc2" %>
<asp:Content ID="header" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder">
    Add&nbsp;Employer&nbsp;>&nbsp;Basic&nbsp;Company&nbsp;Information&nbsp;>&nbsp;Set&nbsp;Up&nbsp;Departments&nbsp;>
</asp:Content>
<asp:Content ID="menu" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlMenu" runat="server" ViewStateMode="Disabled" />
</asp:Content>
<asp:Content ID="main" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <div class="row">
        <div class="col-md-12">
            <asp:Literal ID="message" runat="server"></asp:Literal>
        </div>
        <div class="col-md-12">
            <p><b>NOTE</b>: The Portal allows an employer to assign each employee to a "department."  The monthly invoice will show the company's cost by department. Departments can be designed based on general ledger accounts or other budget/cost center configurations.</p>
            <p>Department numbers can have no more than 16 digits and the description is limited to 30 characters.  In the absence of departments and/or no assignment of employees to departments, the default is that employees are automatically coded to "100 - General." </p>
        </div>
    </div>
    <uc2:CtlDept ID="CtlDept" runat="server" />
    <div class="row">
        <div class="col-md-3">
            <%--<asp:Button ID="back" runat="server" Text="back" CssClass="btn" />--%>
            <asp:LinkButton ID="back" runat="server" Text="Back" CssClass="linkbtn" PostBackUrl="/Broker/AddEmployer.aspx"></asp:LinkButton>
        </div>
        <div class="col-md-3">
            <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn-red" OnClick="cancel_Click" OnClientClick="confirm('Are you sure you want to cancel?');" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="save" runat="server" Text="Save For Later" CssClass="btn" OnClick="save_Click"  OnClientClick="confirm('Are you sure you want to save this application for later?');" />
        </div>
        <div class="col-md-3">
            <asp:LinkButton ID="next" runat="server" Text="Next" CssClass="linkbtn-green" PostBackUrl="/Broker/AddEmployerEmployees.aspx"/>
        </div>
    </div>
</asp:Content>
