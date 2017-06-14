<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlContacts.ascx.cs"
    Inherits="Pibt.UserControl.CtlContacts" %>
<div>

        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">

        </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxPanel runat="server" ID="AjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1">

<asp:LoginView ID="LoginViewFunctionButtons" runat="server">
    <RoleGroups>
        <asp:RoleGroup Roles="Employer">
            <ContentTemplate>
                <div class="bottom-left-buttons">
                    <asp:Button CssClass="btn" ID="btAdd" runat="server" Text="Add New Contact" OnClick="btAdd_Click" />
                </div>
            </ContentTemplate>
        </asp:RoleGroup>
    </RoleGroups>
</asp:LoginView>
<asp:Label ID="lblError" runat="server" Text="" CssClass="red"></asp:Label>
<div class="EmployerContacts">
    <telerik:RadListView ID="RadListViewContacts" runat="server"
       OnItemCommand="RadListViewContacts_ItemCommand"
        DataKeyNames="rowid" OnNeedDataSource="RadListViewContacts_NeedDataSource" AllowPaging="True">
        <ItemTemplate>
           <asp:HiddenField ID="hideRowId" Value=<%#Eval("rowid")%> runat="server" />
            <fieldset style="float: left;">
                <legend><b>Title </b>:
                    <%#Eval("title")%></legend>
                <div class="details">
                    <div class="data-container">
                        <ul class="readonly-view">
                            <li>
                                <label>
                                    Contact Name :</label>
                                <span class="data">
                                    <%#Eval("name")%></span> </li>
                            <li>
                                <label>
                                    Title :</label>
                                <span class="data">
                                    <%#Eval("title")%></span> </li>
                        <%--<li>
                                <label>
                                    Office :</label>
                                <span class="data">
                                    <%#Eval("phone")%></span> </li>--%>
                            <li>
                                <label>
                                    Office :</label>
                                <span class="data">
                                 <telerik:RadMaskedTextBox ID="BizPhoneOut" runat="server" ReadOnly="true" Width="100px" Text='<%#Eval("bizPhone1")%>' Mask="(###) ###-####">
                                 </telerik:RadMaskedTextBox></span> &nbsp;&nbsp;
                                <label>
                                    Ext.</label>
                                <span class="data">
                                    <%#Eval("bizExt1")%></span> </li>
                            <li>
                                <label>
                                    Cell :</label>
                                <span class="data">
                                 <telerik:RadMaskedTextBox ID="MobileOut" runat="server" ReadOnly="true" Width="100px" Text='<%#Eval("mobile")%>' Mask="(###) ###-####">
                                 </telerik:RadMaskedTextBox></span> </li>
                            <li>
                                <label>
                                    Fax :</label>
                                <span class="data">
                                 <telerik:RadMaskedTextBox ID="FaxOut" runat="server" ReadOnly="true" ForeColor="black" Width="100px" Text='<%#Eval("fax")%>' Mask="(###) ###-####">
                                 </telerik:RadMaskedTextBox></span> </li>
                                                       <li>
                                <label>
                                    Email :</label>
                                <span class="data">
                                    <%#Eval("email")%></span> </li>
                        <%--<li>
                                <label>
                                    Phone No.3 :</label>
                                <span class="data">
                                    <%#Eval("bizPhone2")%></span> &nbsp;&nbsp;
                                <label>
                                    Ext.</label>
                                <span class="data">
                                    <%#Eval("bizExt2")%></span> </li>--%>
                        <%--<li>
                                <label>
                                    Email 2 :</label>
                                <span class="data">
                                    <%#Eval("email2")%></span> </li>--%>
                        </ul>
                    </div>
                    <asp:LoginView ID="LoginViewFunctionButtons" runat="server">
                        <RoleGroups>
                            <asp:RoleGroup Roles="Employer">
                                <ContentTemplate>
                                    <div class="bottom-right-buttons">
                                        <asp:Button ID="btnEdit" CssClass="btn" CommandName="Edit" Text="Edit" runat="server">
                                        </asp:Button>
                                       <asp:Button ID="btnDelete" CssClass="btn" CommandName="Delete" Text="Delete" runat="server" CommandArgument='<%#Eval("rowid") %>'>
                                        </asp:Button>
                                    </div>
                                </ContentTemplate>
                            </asp:RoleGroup>
                        </RoleGroups>
                    </asp:LoginView>
                </div>
            </fieldset>
        </ItemTemplate>
        <AlternatingItemTemplate>
           <asp:HiddenField ID="hideRowId" Value=<%#Eval("rowid")%> runat="server" />
            <fieldset style="float: left;">
                <legend><b>Title </b>:
                    <%#Eval("title")%></legend>
                <div class="details">
                    <div class="data-container">
                        <ul class="readonly-view">
                            <li>
                                <label>
                                    Contact Name :</label>
                                <span class="data">
                                    <%#Eval("name")%></span> </li>
                            <li>
                                <label>
                                    Title :</label>
                                <span class="data">
                                    <%#Eval("title")%></span> </li>
                        <%--<li>
                                <label>
                                    Office :</label>
                                <span class="data">
                                 <telerik:RadMaskedTextBox ID="PhoneOut" runat="server" Enabled="false" Width="100px" Text='<%#Eval("phone")%>' Mask="(###) ###-####">
                                 </telerik:RadMaskedTextBox></span> </li>--%>
                            <li>
                                <label>
                                    Office :</label>
                                <span class="data">
                                 <telerik:RadMaskedTextBox ID="BizPhoneOut" runat="server" ReadOnly="true" Width="100px" Text='<%#Eval("bizPhone1")%>' Mask="(###) ###-####">
                                 </telerik:RadMaskedTextBox>
                                 </span> &nbsp;&nbsp;
                                <label>
                                    Ext.</label>
                                <span class="data">
                                    <%#Eval("bizExt1")%></span> </li>
                            <li>
                                <label>
                                    Cell :</label>
                                <span class="data">
                                 <telerik:RadMaskedTextBox ID="MobileOut" runat="server" ReadOnly="true" Width="100px" Text='<%#Eval("mobile")%>' Mask="(###) ###-####">
                                 </telerik:RadMaskedTextBox>
                                 </span> </li>
                        <%--<li>
                                <label>
                                    Phone No.3 :</label>
                                <span class="data">
                                    <%#Eval("bizPhone2")%></span> &nbsp;&nbsp;
                                <label>
                                    Ext.</label>
                                <span class="data">
                                    <%#Eval("bizExt2")%></span> </li>--%>
                            <li>
                                <label>
                                    Fax :</label>
                                <span class="data">
                                 <telerik:RadMaskedTextBox ID="FaxOut" runat="server" ReadOnly="true" ForeColor="black" Width="100px" Text='<%#Eval("fax")%>' Mask="(###) ###-####">
                                 </telerik:RadMaskedTextBox>
                                </span> </li>
                            <li>
                                <label>
                                    Email :</label>
                                <span class="data">
                                    <%#Eval("email")%></span> </li>
                        <%--<li>
                                <label>
                                    Email 2 :</label>
                                <span class="data">
                                    <%#Eval("email2")%></span> </li>--%>
                        </ul>
                    </div>
                    <asp:LoginView ID="LoginViewFunctionButtons" runat="server">
                        <RoleGroups>
                            <asp:RoleGroup Roles="Employer">
                                <ContentTemplate>
                                    <div class="bottom-right-buttons">
                                        <asp:Button ID="btnEdit" CssClass="btn" CommandName="Edit" Text="Edit" runat="server">
                                        </asp:Button>
                                       <asp:Button ID="btnDelete" CssClass="btn" CommandName="Delete" Text="Delete" runat="server" CommandArgument='<%#Eval("rowid") %>'>
                                        </asp:Button>
                                    </div>
                                </ContentTemplate>
                            </asp:RoleGroup>
                        </RoleGroups>
                    </asp:LoginView> 
                </div>
            </fieldset>
            <div class="clear">
            </div>
        </AlternatingItemTemplate>
        <InsertItemTemplate>
            <fieldset>
                <div class="details">
                    <div class="data-container">
                        <table class="table-container">
                            <tbody>
                                <tr class="row">
                                    <td class="item-name">
                                        First Name:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="20"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator CssClass="required-info" ID="rfvFirstName" runat="server"
                                            ValidationGroup="InsertContact" ControlToValidate="txtFirstName" Display="Dynamic"
                                            ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="required-info"
                                            ControlToValidate="txtFirstName" ErrorMessage="It can't include numeric or any special character."
                                            Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        M.I.:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="txtMiddleName" Width="20" runat="server" MaxLength="1"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="required-info"
                                            ControlToValidate="txtMiddleName" ErrorMessage="It can't include numeric or any special character."
                                            Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z]"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Last Name:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="txtLastName" runat="server" MaxLength="20"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator CssClass="required-info" ID="rfvLastName" runat="server"
                                            ValidationGroup="InsertContact" ControlToValidate="txtLastName" Display="Dynamic"
                                            ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info"
                                            ControlToValidate="txtLastName" ErrorMessage="It can't include numeric or any special character."
                                            Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Title:
                                    </td>
                                    <td class="item-value">
                                       <%--<asp:DropDownList runat="server" ID="ddlTitle">
                                           <asp:ListItem Text="Owner" Value="Owner" Selected="True"></asp:ListItem>
                                           <asp:ListItem Text="Secretary" Value="Secretary"></asp:ListItem>
                                           <asp:ListItem Text="Help Desk" Value="Help Desk"></asp:ListItem>
                                           <asp:ListItem Text="Customer Service" Value="Customer Service"></asp:ListItem>
                                           <asp:ListItem Text="President/CEO" Value="President"></asp:ListItem>
                                           <asp:ListItem Text="Vice President" Value="Vice President"></asp:ListItem>
                                           <asp:ListItem Text="Executive Director" Value="Executive Director"></asp:ListItem>
                                           <asp:ListItem Text="Managing Director" Value="Managing Director"></asp:ListItem>
                                           <asp:ListItem Text="General Manager" Value="General Manager"></asp:ListItem>
                                           <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                                           <asp:ListItem Text="Assistance Manager" Value="Assistance Manager"></asp:ListItem>
                                           <asp:ListItem Text="Staff" Value="Staff"></asp:ListItem>
                                           <asp:ListItem Text="CFO" Value="CFO"></asp:ListItem>
                                           <asp:ListItem Text="Accountant" Value="Accountant"></asp:ListItem>
                                           <asp:ListItem Text="CTO" Value="CTO"></asp:ListItem>
                                           <asp:ListItem Text="CIO" Value="CIO"></asp:ListItem>
                                           <asp:ListItem Text="IT Manager" Value="IT Manager"></asp:ListItem>
                                           <asp:ListItem Text="Developer" Value="Developer"></asp:ListItem>
                                           <asp:ListItem Text="Designer" Value="Designer"></asp:ListItem>
                                           <asp:ListItem Text="Systems Administrator" Value="Systems Administrator"></asp:ListItem>
                                           <asp:ListItem Text="IT Staff" Value="IT Staff"></asp:ListItem>
                                           <asp:ListItem Text="Customer Service" Value="Customer Service"></asp:ListItem>
                                           <asp:ListItem Text="Technical Writer" Value="Technical Writer"></asp:ListItem>
                                           <asp:ListItem Text="Help Desk" Value="Help Desk"></asp:ListItem>
                                           <asp:ListItem Text="Customer Service" Value="Customer Service"></asp:ListItem>
                                           <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                        <asp:TextBox ID="tbTitle" runat="server" MaxLength="15"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator CssClass="required-info" ID="rfvTitle" runat="server"
                                            ValidationGroup="InsertContact" ControlToValidate="tbTitle" Display="Dynamic"
                                            ErrorMessage="Title is required."></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revTitle" runat="server" CssClass="required-info"
                                            ControlToValidate="tbTitle" ErrorMessage="It can't include numeric or any special character."
                                            Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            <%--<tr class="row">
                                    <td class="item-name">
                                        Office :
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbPhoneNo" runat="server" Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                    </td>
                                </tr>--%>
                                <tr class="row">
                                    <td class="item-name">
                                        Office:
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbPhoneNo1" runat="server" Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                        <label>
                                            Ext.</label>
                                        <asp:TextBox ID="tbExt1" runat="server" Width="50" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Cell:
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbMobileNo" runat="server" Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                    </td>
                                </tr>
                            <%--<tr class="row">
                                    <td class="item-name">
                                        Phone No.3:
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbPhoneNo2" runat="server" Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                        <label>
                                            Ext.</label>
                                        <asp:TextBox ID="tbExt2" runat="server" Width="50" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>--%>
                                <tr class="row">
                                    <td class="item-name">
                                        Fax:
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbFaxNo" runat="server" Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Email:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="tbEmail1" runat="server" MaxLength="60"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revEmail1" ControlToValidate="tbEmail1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                                            CssClass="required-info" Display="Dynamic" ValidationGroup="InsertContact" runat="server"
                                            ErrorMessage="Enter valid Email address!"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            <%--<tr class="row">
                                    <td class="item-name">
                                        Email 2:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="tbEmail2" runat="server" MaxLength="60"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revEmail2" ControlToValidate="tbEmail2" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                                            CssClass="required-info" Display="Dynamic" ValidationGroup="InsertContact" runat="server"
                                            ErrorMessage="Enter valid Email address!"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>--%>
                                <tr class="row">
                                    <td class="item-name">
                                    </td>
                                    <td class="item-value">
                                        <asp:Button ID="btnSave" CssClass="btn" runat="server" Text="Save" Width="100" ValidationGroup="InsertContact"
                                            CommandName="PerformInsert" />
                                        <asp:Button ID="btnCancel" CssClass="btn" runat="server" Text="Cancel" Width="100"
                                            CommandName="Cancel" CausesValidation="false" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </fieldset>
        </InsertItemTemplate>
        <EditItemTemplate>
            <fieldset>
                <div class="details">
                    <div class="data-container">
                        <table class="table-container">
                            <tbody>
                                <tr class="row">
                                    <td class="item-name">
                                        First Name:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="txtFirstName" Text='<%#Eval("Firstname")%>' runat="server" MaxLength="20"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator CssClass="required-info" ID="rfvFirstName" runat="server"
                                            ValidationGroup="InsertContact" ControlToValidate="txtFirstName" Display="Dynamic"
                                            ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="required-info"
                                            ControlToValidate="txtFirstName" ErrorMessage="It can't include numeric or any special character."
                                            Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        M.I.:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="txtMiddleName" Text='<%#Eval("MiddleName")%>' Width="20" runat="server"
                                            MaxLength="1"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" CssClass="required-info"
                                            ControlToValidate="txtMiddleName" ErrorMessage="It can't include numeric or any special character."
                                            Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z]"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Last Name:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="txtLastName" Text='<%#Eval("LastName")%>' runat="server" MaxLength="20"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator CssClass="required-info" ID="rfvLastName" runat="server"
                                            ValidationGroup="InsertContact" ControlToValidate="txtLastName" Display="Dynamic"
                                            ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" CssClass="required-info"
                                            ControlToValidate="txtLastName" ErrorMessage="It can't include numeric or any special character."
                                            Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Title:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="tbTitle" Text='<%#Eval("title")%>' runat="server" MaxLength="15"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator CssClass="required-info" ID="rfvTitle" runat="server"
                                            ValidationGroup="InsertContact" ControlToValidate="tbTitle" Display="Dynamic"
                                            ErrorMessage="Title is required."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info"
                                            ControlToValidate="tbTitle" ErrorMessage="It can't include numeric or any special character."
                                            Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            <%--<tr class="row">
                                    <td class="item-name">
                                        Office :
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbPhoneNo" Text='<%#Eval("phone")%>' runat="server"
                                            Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                    </td>
                                </tr>--%>
                                <tr class="row">
                                    <td class="item-name">
                                        Office:
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbPhoneNo1" Text='<%#Eval("bizPhone1")%>' runat="server" Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                        <label>
                                            Ext.</label>
                                        <asp:TextBox ID="tbExt1" Text='<%#Eval("bizExt1")%>' runat="server" Width="50" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Cell:
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbMobileNo" Text='<%#Eval("mobile")%>' runat="server"
                                            Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                    </td>
                                </tr>
                            <%--<tr class="row">
                                    <td class="item-name">
                                        Phone No.3:
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbPhoneNo2" Text='<%#Eval("bizPhone2")%>' runat="server"
                                            Width="100px" Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                        <label>
                                            Ext.</label>
                                        <asp:TextBox ID="tbExt2" runat="server" Text='<%#Eval("bizExt2")%>' Width="50" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>--%>
                                <tr class="row">
                                    <td class="item-name">
                                        Fax:
                                    </td>
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="tbFaxNo" Text='<%#Eval("fax")%>' runat="server" Width="100px"
                                            Mask="(###) ###-####">
                                        </telerik:RadMaskedTextBox>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Email:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="tbEmail1" Text='<%#Eval("email")%>' runat="server" MaxLength="60" Width="250"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revEmail1" ControlToValidate="tbEmail1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                                            CssClass="required-info" Display="Dynamic" ValidationGroup="InsertContact" runat="server"
                                            ErrorMessage="Enter valid Email address!"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            <%--<tr class="row">
                                    <td class="item-name">
                                        Email 2:
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="tbEmail2" Text='<%#Eval("email2")%>' runat="server" MaxLength="60"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revEmail2" ControlToValidate="tbEmail2" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                                            CssClass="required-info" Display="Dynamic" ValidationGroup="InsertContact" runat="server"
                                            ErrorMessage="Enter valid Email address!"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>--%>
                                <tr class="row">
                                    <td class="item-name">
                                    </td>
                                    <td class="item-value">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="100" ValidationGroup="InsertContact"
                                            CssClass="btn" CommandArgument='<%#Eval("rowid")%>' CommandName="Update" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100" CommandName="Cancel"
                                            CssClass="btn" CausesValidation="false" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </fieldset>
        </EditItemTemplate>
    </telerik:RadListView>
</div>

</telerik:RadAjaxPanel>
   </div>
