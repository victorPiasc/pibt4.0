<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlContacts.ascx.cs" Inherits="Pibt.UserControl.CtlContacts" %>
<div>
    <div class="customer-info-box">
        <div class="bottom-left-buttons">
            <asp:Button CssClass="btn" ID="btAdd" runat="server" Text="Add New Contact" OnClick="btAdd_Click" />
        </div>
        <asp:Label ID="lblError" runat="server" Text="" CssClass="red"></asp:Label>
        <div class="EmployerContacts">
            <telerik:RadListView ID="RadListViewContacts" runat="server"
                OnItemCommand="RadListViewContacts_ItemCommand"
                DataKeyNames="rowid" OnNeedDataSource="RadListViewContacts_NeedDataSource" AllowPaging="True">
                <ItemTemplate>
                    <asp:HiddenField ID="hideRowId" Value='<%#Eval("rowid")%>' runat="server" />
                    <fieldset style="float: left;">
                        <legend><b>Title </b>:
                    <%#Eval("title")%></legend>
                        <div class="details">
                            <div class="data-container">
                                <ul class="readonly-view">
                                    <li>
                                        <label>
                                            Contact Name:</label>
                                        <span class="data">
                                            <%#Eval("name")%></span>
                                    </li>
                                    <li>
                                        <label>
                                            Title:</label>
                                        <span class="data">
                                            <%#Eval("title")%></span>
                                    </li>
                                    <li>
                                        <label>
                                            Office:</label>
                                        <span class="data">
                                            <telerik:RadMaskedTextBox ID="BizPhoneOut" runat="server" ReadOnly="true" Width="100px" Text='<%#Eval("bizPhone1")%>' Mask="(###) ###-####">
                                            </telerik:RadMaskedTextBox></span> &nbsp;&nbsp;
                                <label>
                                    Ext.</label>
                                        <span class="data">
                                            <%#Eval("bizExt1")%></span>
                                    </li>
                                    <li>
                                        <label>
                                            Mobile:</label>
                                        <span class="data">
                                            <telerik:RadMaskedTextBox ID="MobileOut" runat="server" ReadOnly="true" Width="100px" Text='<%#Eval("mobile")%>' Mask="(###) ###-####">
                                            </telerik:RadMaskedTextBox></span>
                                    </li>
                                    <li>
                                        <label>
                                            Fax:</label>
                                        <span class="data">
                                            <telerik:RadMaskedTextBox ID="FaxOut" runat="server" ReadOnly="true" ForeColor="black" Width="100px" Text='<%#Eval("fax")%>' Mask="(###) ###-####">
                                            </telerik:RadMaskedTextBox></span>
                                    </li>
                                    <li>
                                        <label>
                                            EMail:</label>
                                        <span class="data">
                                            <%#Eval("email")%></span>
                                    </li>

                                </ul>
                            </div>

                            <div class="bottom-right-buttons">
                                <asp:Button ID="btnEdit" CssClass="btn" CommandName="Edit" Text="Edit" runat="server"></asp:Button>
                                <asp:Button ID="btnDelete" CssClass="btn" CommandName="Delete" Text="Delete" runat="server" CommandArgument='<%#Eval("rowid") %>'></asp:Button>
                            </div>

                        </div>
                    </fieldset>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <asp:HiddenField ID="hideRowId" Value='<%#Eval("rowid")%>' runat="server" />
                    <fieldset style="float: left;">
                        <legend><b>Title </b>:
                    <%#Eval("title")%></legend>
                        <div class="details">
                            <div class="data-container">
                                <ul class="readonly-view">
                                    <li>
                                        <label>
                                            Contact Name:</label>
                                        <span class="data">
                                            <%#Eval("name")%></span>
                                    </li>
                                    <li>
                                        <label>
                                            Title:</label>
                                        <span class="data">
                                            <%#Eval("title")%></span>
                                    </li>
                                    <li>
                                        <label>
                                            Office:</label>
                                        <span class="data">
                                            <telerik:RadMaskedTextBox ID="BizPhoneOut" runat="server" ReadOnly="true" Width="100px" Text='<%#Eval("bizPhone1")%>' Mask="(###) ###-####">
                                            </telerik:RadMaskedTextBox>
                                        </span>&nbsp;&nbsp;
                                <label>
                                    Ext.</label>
                                        <span class="data">
                                            <%#Eval("bizExt1")%></span>
                                    </li>
                                    <li>
                                        <label>
                                            Mobile:</label>
                                        <span class="data">
                                            <telerik:RadMaskedTextBox ID="MobileOut" runat="server" ReadOnly="true" Width="100px" Text='<%#Eval("mobile")%>' Mask="(###) ###-####">
                                            </telerik:RadMaskedTextBox>
                                        </span>
                                    </li>
                                    <li>
                                        <label>
                                            Fax:</label>
                                        <span class="data">
                                            <telerik:RadMaskedTextBox ID="FaxOut" runat="server" ReadOnly="true" ForeColor="black" Width="100px" Text='<%#Eval("fax")%>' Mask="(###) ###-####">
                                            </telerik:RadMaskedTextBox>
                                        </span>
                                    </li>
                                    <li>
                                        <label>
                                            EMail:</label>
                                        <span class="data">
                                            <%#Eval("email")%></span>
                                    </li>
                                </ul>
                            </div>

                            <div class="bottom-right-buttons">
                                <asp:Button ID="btnEdit" CssClass="btn" CommandName="Edit" Text="Edit" runat="server"></asp:Button>
                                <asp:Button ID="btnDelete" CssClass="btn" CommandName="Delete" Text="Delete" runat="server" CommandArgument='<%#Eval("rowid") %>'></asp:Button>
                            </div>

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
                                            <td class="item-name">First Name:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="20"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator CssClass="required-info" ID="rfvFirstName" runat="server"
                                                    ValidationGroup="InsertContact" ControlToValidate="txtFirstName" Display="Dynamic"
                                                    ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="required-info"
                                                    ControlToValidate="txtFirstName" ErrorMessage="The first name can't include numeric or any special character."
                                                    Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">M.I.:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="txtMiddleName" Width="20" runat="server" MaxLength="1"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="required-info"
                                                    ControlToValidate="txtMiddleName" ErrorMessage="The middle initial can only be a letter."
                                                    Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z]">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Last Name:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="txtLastName" runat="server" MaxLength="20"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator CssClass="required-info" ID="rfvLastName" runat="server"
                                                    ValidationGroup="InsertContact" ControlToValidate="txtLastName" Display="Dynamic"
                                                    ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info"
                                                    ControlToValidate="txtLastName" ErrorMessage="The last name can't include numeric or any special character."
                                                    Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Title:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="tbTitle" runat="server" MaxLength="15"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator CssClass="required-info" ID="rfvTitle" runat="server"
                                                    ValidationGroup="InsertContact" ControlToValidate="tbTitle" Display="Dynamic"
                                                    ErrorMessage="Title is required."></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revTitle" runat="server" CssClass="required-info"
                                                    ControlToValidate="tbTitle" ErrorMessage="The title can't include numeric or any special character."
                                                    Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Office:
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
                                            <td class="item-name">Mobile:
                                            </td>
                                            <td class="item-value">
                                                <telerik:RadMaskedTextBox ID="tbMobileNo" runat="server" Width="100px" Mask="(###) ###-####">
                                                </telerik:RadMaskedTextBox>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Fax:
                                            </td>
                                            <td class="item-value">
                                                <telerik:RadMaskedTextBox ID="tbFaxNo" runat="server" Width="100px" Mask="(###) ###-####">
                                                </telerik:RadMaskedTextBox>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Email:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="tbEmail1" runat="server" MaxLength="60"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="revEmail1" ControlToValidate="tbEmail1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                                                    CssClass="required-info" Display="Dynamic" ValidationGroup="InsertContact" runat="server"
                                                    ErrorMessage="Enter valid Email address."></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name"></td>
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
                                            <td class="item-name">First Name:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="txtFirstName" Text='<%#Eval("Firstname")%>' runat="server" MaxLength="20"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator CssClass="required-info" ID="rfvFirstName" runat="server"
                                                    ValidationGroup="InsertContact" ControlToValidate="txtFirstName" Display="Dynamic"
                                                    ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="required-info"
                                                    ControlToValidate="txtFirstName" ErrorMessage="The first name can't include numeric or any special character."
                                                    Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$">
                                                </asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">M.I.:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="txtMiddleName" Text='<%#Eval("MiddleName")%>' Width="20" runat="server"
                                                    MaxLength="1"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" CssClass="required-info"
                                                    ControlToValidate="txtMiddleName" ErrorMessage="The middle initial can only be a letter."
                                                    Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z]"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Last Name:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="txtLastName" Text='<%#Eval("LastName")%>' runat="server" MaxLength="20"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator CssClass="required-info" ID="rfvLastName" runat="server"
                                                    ValidationGroup="InsertContact" ControlToValidate="txtLastName" Display="Dynamic"
                                                    ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" CssClass="required-info"
                                                    ControlToValidate="txtLastName" ErrorMessage="The last name can't include numeric or any special character."
                                                    Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Title:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="tbTitle" Text='<%#Eval("title")%>' runat="server" MaxLength="15"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator CssClass="required-info" ID="rfvTitle" runat="server"
                                                    ValidationGroup="InsertContact" ControlToValidate="tbTitle" Display="Dynamic"
                                                    ErrorMessage="Title is required."></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info"
                                                    ControlToValidate="tbTitle" ErrorMessage="The title can't include numeric or any special character."
                                                    Display="Dynamic" ValidationGroup="InsertContact" ValidationExpression="^[A-Za-z\-\.\s]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Office:
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
                                            <td class="item-name">Mobile:
                                            </td>
                                            <td class="item-value">
                                                <telerik:RadMaskedTextBox ID="tbMobileNo" Text='<%#Eval("mobile")%>' runat="server"
                                                    Width="100px" Mask="(###) ###-####">
                                                </telerik:RadMaskedTextBox>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Fax:
                                            </td>
                                            <td class="item-value">
                                                <telerik:RadMaskedTextBox ID="tbFaxNo" Text='<%#Eval("fax")%>' runat="server" Width="100px"
                                                    Mask="(###) ###-####">
                                                </telerik:RadMaskedTextBox>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Email:
                                            </td>
                                            <td class="item-value">
                                                <asp:TextBox ID="tbEmail1" Text='<%#Eval("email")%>' runat="server" MaxLength="60" Width="250"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="revEmail1" ControlToValidate="tbEmail1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                                                    CssClass="required-info" Display="Dynamic" ValidationGroup="InsertContact" runat="server"
                                                    ErrorMessage="Enter valid Email address."></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name"></td>
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
    </div>
</div>
