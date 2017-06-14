<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnrollmentFromPlanPreview.aspx.cs"
    Inherits="Pibt.Employer.EnrollmentFromPlanPreview" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlEnrollmentFormPreview.ascx" TagName="CtlEnrollmentFormPreview"
    TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-language" content="en" />
    <meta name="author" content="PIASC" />
    <link rel="shortcut icon" href="/images/favicon.ico" />
    <link rel="icon" type="/image/gif" href="/images/animated_favicon1.gif" />
    <link rel="stylesheet" href="/styles/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/styles/enrollmentformview.css" type="text/css" media="screen" />
    <style>
        body { background-color: transparent; }
    </style>
    <title>PIBT | Enrollment Form View</title>
    <script>
        function exportPdf() {
            window.open("<%=ExportLink %>", 'newwindow', 'height=100,width=50,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--<uc2:CtlEnrollmentPlanReportingViewer ID="CtlEnrollmentPlanReportingViewer1" runat="server" />--%>
        <uc3:CtlEnrollmentFormPreview ID="CtlEnrollmentFormPreview1" runat="server" />
        <asp:Label ID="lblMessage" runat="server" CssClass="required-info"></asp:Label>
        <div class="bottom-center-buttons">
            <input id="btnExportPdf" type="button" class="btn" value="Export to PDF" onclick="exportPdf();" />
            <asp:LoginView ID="LoginViewFunctionButtons" runat="server">
                <RoleGroups>
                    <asp:RoleGroup Roles="Employee">
                        <ContentTemplate>
                            <asp:Button ID="btnTerminate" CssClass="btn" runat="server" Text="Cancel Enrollment Form"
                                OnClick="btnTerminate_Click" />
                        </ContentTemplate>
                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="Administrator">
                        <ContentTemplate>
                            <asp:Button ID="btnApprove" CssClass="btn" runat="server" Text="Approve" OnClick="btnApprove_Click" />
                            <asp:Button ID="btnReject" CssClass="btn" runat="server" Text="Reject" ValidationGroup="vReject"
                                OnClick="btnReject_Click" />
                            <fieldset>
                                <legend>Reject Reason</legend>
                                <div class="customer-info-box">
                                    <div style="clear: both">
                                    </div>
                                    <asp:TextBox ID="txtReason" Width="100%" runat="server" TextMode="MultiLine" Rows="10"
                                        MaxLength="256">
                                    </asp:TextBox>
                                </div>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvReason" runat="server" CssClass="required-info"
                                    Display="Dynamic" ErrorMessage="It's required" ValidationGroup="vReject" ControlToValidate="txtReason"></asp:RequiredFieldValidator>
                            </fieldset>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
        </div>
        <p></p>
        <p></p>
        <p></p>
    </div>
    </form>
</body>
</html>
