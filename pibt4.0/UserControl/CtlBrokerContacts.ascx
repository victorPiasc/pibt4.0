<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlBrokerContacts.ascx.cs" Inherits="Pibt.UserControl.CtlBrokerContacts" %>
<div class="customer-info-box">
    <div class="row">
        <fieldset>
            <legend>Relationship Keeper</legend>
            <div class="col-md-6">
                <table>
                    <tbody>
                        <tr>
                            <td>Name:</td>
                            <td><asp:TextBox ID="rkName" runat="server" CssClass="form-control" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Email Address:</td>
                            <td><asp:TextBox ID="rkEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <fieldset>
                    <legend>Phone Numbers</legend>
                    <table>
                        <tbody>
                            <tr>
                                <td>Office:</td>
                                <td><asp:TextBox  ID="rkOffice" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Mobile:</td>
                                <td><asp:TextBox  ID="rkMobile" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </fieldset>
        <fieldset>
            <legend>Portal Help Desk</legend>
            <div class="col-md-6">
                <table>
                    <tbody>
                        <tr>
                            <td>Name:</td>
                            <td><asp:TextBox ID="phName" runat="server" CssClass="form-control" ></asp:TextBox></td>
                            
                        </tr>
                        <tr>
                            <td>Email Address:</td>
                            <td><asp:TextBox ID="phEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <fieldset>
                    <legend>Phone Numbers</legend>
                    <table>
                        <tbody>
                            <tr>
                                <td>Office:</td>
                                <td><asp:TextBox  ID="phOffice" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Mobile:</td>
                                <td><asp:TextBox  ID="phMobile" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </fieldset>
        <fieldset>
            <legend>Private Choice Administrator</legend>
            <div class="col-md-6">
                <table>
                    <tbody>
                        <tr>
                            <td>Name:</td>
                            <td><asp:TextBox ID="pcName" runat="server" CssClass="form-control" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Email Address:</td>
                            <td><asp:TextBox ID="pcEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <fieldset>
                    <legend>Phone Numbers</legend>
                    <table>
                        <tbody>
                            <tr>
                                <td>Office:</td>
                                <td><asp:TextBox  ID="pcOffice" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Mobile:</td>
                                <td><asp:TextBox  ID="pcMobile" runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </fieldset>
    </div>
</div>
