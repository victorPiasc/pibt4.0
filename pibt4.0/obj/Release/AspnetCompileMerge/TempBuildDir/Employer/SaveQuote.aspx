<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveQuote.aspx.cs" Inherits="Pibt.Employer.SaveQuote" MasterPageFile="~/Content.master" %>

<%@ Register Src="~/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Save Quote</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server"></asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value="" />
    <a href="/">Home</a> > Save Quote
</asp:Content>
<asp:Content ID="LeftMenuContent" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h1>Save Quote</h1>
    <asp:LoginView ID="LoginViewPageContent" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,Broker,Agent, RK">
                <ContentTemplate>
                    <fieldset>
                        <div class="customer-info-box">
                            <table class="table-container">
                                <tbody>
                                    <tr class="row">
                                        <td class="item-name">
                                            Quote Label
                                        </td>
                                        <td class="item-value">
                                            <telerik:RadTextBox ID="tbLabelName" runat="server" CssClass="form-control" width="260" MaxLength="50" Height="34px" ValidationGroup="save"></telerik:RadTextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldQuoteName" CssClass="required-info" SetFocusOnError="true" runat="server" ErrorMessage="*Required if using the search feature" ControlToValidate="tbLabelName" ValidationGroup="save"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Button ID="tbSave" runat="server" Text="Save" ValidationGroup="save" CssClass="btn" OnClick="tbSave_Click" ></asp:Button>      
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </fieldset>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Employer">
                <ContentTemplate>
                    <fieldset>
                        <div class="customer-info-box">
                            <div class="section-body">
                                <ul class="login-page" style="width: auto;">                                    
                                    <li>This feature is not available.</li>
                                    <li>If you have any questions please feel free to contact our office at</li>
                                    <li>(323) 728-9500 and (800) 449-4898 outside of Southern CA</li>
                                    <li>or email us your questions at <a href="mailto:OnlineHelpDesk@piasc.org" style="color:blue; text-decoration:underline; ">OnlineHelpDesk@piasc.org</a> 
                                    </li>
                                </ul>
                                <br />
                                <span style="font-weight: bold; font-size: 12px; color: red; text-indent: 20px; font-style: italic;">Sorry for any inconvenience this may have caused you, please contact your relationshop
                            keeper for any questions.</span>
                            </div>
                        </div>
                    </fieldset>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</asp:Content>
