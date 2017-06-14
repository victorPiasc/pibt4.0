<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentsLibrary.aspx.cs" Inherits="Pibt.Employer.DocumentsLibrary" MasterPageFile="~/Content.master" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2" TagPrefix="uc1" %>

<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Documents Library
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    Documents Library
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <%--Cannot use linkbutton here; response for downloading does not close; a different postback event after link button click will cause the linkbutton action again--%>
            <asp:Panel ID="links" runat="server">
                <ul>
                    <li>
                        <fieldset>
                            The following document is an employee enrollment form that is pre-populated with both <span style="color:#006DBB; font-weight:bold">company and employee information</span> on file and the plans that your company offers. The document includes one enrollment form for each employee. <br /><br />
                            <asp:HyperLink ID="l1" runat="server" style="text-decoration:underline;" NavigateUrl ="/Download/ExportGenericReport.aspx?num=1&type=1" Text="Pre-Populated Customized Enrollment Forms (NEW)"></asp:HyperLink>
                        </fieldset>
                    </li>
                    <li>
                        <fieldset>
                            The following document is an employee enrollment form that is pre-populated with <span style="color:#006DBB; font-weight:bold">only the company information</span> on file and plans your company offers. Employee information must be filled out.<br /><br />
                            <asp:HyperLink ID="l2" runat="server" style="text-decoration:underline;" NavigateUrl ="/Download/ExportGenericReport.aspx?num=1&type=2" Text="Customized Enrollment Form for New Hire (NEW)"></asp:HyperLink>
                        </fieldset>
                    </li>
                    <li>
                        <fieldset>
                            The following "Participation Agreement" is your copy of the executed agreement. <br /><br />
                            <asp:HyperLink ID="l3" runat="server" style="text-decoration:underline;" NavigateUrl ="/Download/ExportGenericReport.aspx?num=2" Text="Participation Agreement (NEW)"></asp:HyperLink>
                        </fieldset>
                    </li>
                </ul>
            </asp:Panel>
        </div>
    </div>
</asp:Content>