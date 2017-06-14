<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnrollmentFromPlanPreview.aspx.cs"
    Inherits="Pibt.Employer.EnrollmentFromPlanPreview" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlEnrollmentFormPreview.ascx" TagName="CtlEnrollmentFormPreview"
    TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-language" content="en" />
    <meta name="author" content="PIASC" />
     <% if (Pibt.Common.Utilities.Us()=="PIBT") { %>
            <link rel="icon" type="/image/gif" href="/images/animated_favicon1.gif" />
     <% }
        else { %>
            <link rel="shortcut icon" href="/images/pcFavicon.ico" />
            <link rel="icon" type="/image/gif" href="/images/pcAnimated_favicon1.gif" />
     <% } %>
    <link rel="stylesheet" href="/styles/general.css" type="text/css"/>
    <link rel="stylesheet" href="/styles/enrollmentformview.css" type="text/css"/>
    <link href="/css/bootstrap.min.css" rel="stylesheet" />
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet" />
    <title><%=Pibt.Common.Utilities.Us()%> | Enrollment Form View</title>
</head>
<body style="background-color: transparent;">
    <form id="form1" runat="server">
    <div>
        <uc3:CtlEnrollmentFormPreview ID="CtlEnrollmentFormPreview1" runat="server" />
        <asp:Label ID="lblMessage" runat="server" CssClass="required-info"></asp:Label>
        <div class="bottom-center-buttons">
            <asp:Button ID="btnTerminate" CssClass="btn" runat="server" Text="Cancel Enrollment Form" OnClick="btnTerminate_Click" />
        </div>
    </div>
    </form>
</body>
</html>
