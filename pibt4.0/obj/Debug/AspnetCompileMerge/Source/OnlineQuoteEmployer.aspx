<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuoteEmployer.aspx.cs" Inherits="Pibt.OnlineQuoteEmployer" MasterPageFile="~/Website.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <fieldset>
                    <legend style="font-size: x-large"><b>Online Quote Employer Section </b></legend>
                    <hr />
                    <span style="font-size:14px; font-weight:bold">To start a quote we need your company and contact information.</span>
                    <div style="font-size:14px; color:red; font-weight:bold">
                        <%-- Get this guy into Sales right away --%>
                        Census is limited to a maximum of 50 employees per quote 
                    </div>
                    <asp:Literal ID="message" runat="server" Visible="false"></asp:Literal>
                    <div class="customer-info-box">
                        <div class="column-6">
                            <asp:PlaceHolder runat="server" ID="phEmployerDetails">
                                <div class="section-title">
                                    Company Information
                                    <hr />                                    
                                </div>
                                
                                    <table class="table-container">
                                        <tbody>
                                            <tr class="row">
                                                <td class="item-name">Company Name:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="companyName" runat="server" CssClass="form-control" Width="260" MaxLength="60" Height="34px"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="CNrequired" runat="server" CssClass="required-info" ErrorMessage="*Company Name is required" ControlToValidate="companyName" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Address:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="companyAddress" runat="server" CssClass="form-control" Width="260" MaxLength="60" Height="34px"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="CArequired" runat="server" CssClass="required-info" ErrorMessage="*Address is required " ControlToValidate="companyAddress" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">City:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="companyCity" runat="server" CssClass="form-control" Width="260" MaxLength="60" Height="34px"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="CCrequired" runat="server" CssClass="required-info" ErrorMessage="*City is required" ControlToValidate="companyCity" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">State:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="companyState" runat="server" CssClass="form-control" Width="60" MaxLength="2" Height="34px"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="required-info" ErrorMessage="*State is required" ControlToValidate="companyState" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Zip:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="companyZip" runat="server" CssClass="form-control" MaxLength="9" Height="34px" Width="260" OnTextChanged="companyZip_TextChanged" AutoPostBack="true" ></telerik:RadTextBox>
                                                </td>
                                                <td>                                                   
                                                    <asp:RequiredFieldValidator ID="CZrequired" runat="server" CssClass="required-info" ErrorMessage="*Zip is required" ControlToValidate="companyZip" ValidationGroup="inputGroup" ></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="CZregExp" ControlToValidate="companyZip" runat="server" ErrorMessage="*Invalid Zipcode" CssClass="required-info" ValidationExpression="^[\d+]{5,5}" ValidationGroup="inputGroup"  ></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Fax:
                                                </td>
                                                <td class="item-value" colspan="2">
                                                    <telerik:RadMaskedTextBox ID="companyFax" runat="server" Mask="(###) ### - ####" Height="36" Width="260" CssClass="form-control" BorderColor="LightGray" FocusedStyle-BorderColor="SkyBlue"></telerik:RadMaskedTextBox>
                                                    (not required)
                                                </td>
                                        </tbody>
                                    </table>
                                
                            </asp:PlaceHolder>
                        </div>
                        <div class="column-6">
                            <asp:PlaceHolder runat="server" ID="phContactInfo">
                                <div class="section-title">
                                    Your Contact Information
                                    <hr />
                                </div>
                                
                                    <table class="table-container">
                                        <tbody>
                                            <tr class="row">
                                                <td class="item-name" style="margin-right: 20px">
                                                    <span style="margin-right: 80px">First Name:</span>
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="contactfName" runat="server" CssClass="form-control" Width="260" MaxLength="60" Height="34px"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="cnfRequired" runat="server" CssClass="required-info" ControlToValidate="contactfName" ErrorMessage="*First Name is required" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Last Name:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="contactlName" runat="server" CssClass="form-control" Width="260" MaxLength="60" Height="34px"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="cnlRequired" runat="server" CssClass="required-info" ControlToValidate="contactlName" ErrorMessage="*Last Name required" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>                                           
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Phone:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadMaskedTextBox ID="contactPhone" runat="server" Mask="(###) ### - ####" Height="36" Width="100%" CssClass="form-control" BorderColor="LightGray" FocusedStyle-BorderColor="SkyBlue"></telerik:RadMaskedTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="phoneValid" runat="server" CssClass="required-info" ErrorMessage="* Phone number required" SetFocusOnError="true" ControlToValidate="contactPhone" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Email:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="contactEmail" runat="server" CssClass="form-control" Width="260" MaxLength="60" Height="34px"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="ceRequired" runat="server" CssClass="required-info" ErrorMessage="* Email Address required" SetFocusOnError="true" ControlToValidate="contactEmail" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="emailExp" runat="server" CssClass="required-info" ErrorMessage="* Valid email required" SetFocusOnError="true" ControlToValidate="contactEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="inputGroup"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>                             
                            </asp:PlaceHolder>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="column-12">
                <div style="text-align:center">
                    <asp:Button ID="continue" runat="server" Text="Next" CssClass="btn" ValidationGroup="inputGroup"  OnClick="continue_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
