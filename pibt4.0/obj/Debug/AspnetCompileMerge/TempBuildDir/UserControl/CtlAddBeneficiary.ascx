<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAddBeneficiary.ascx.cs"
    Inherits="Pibt.UserControl.CtlAddBeneficiary" %>
<fieldset>
    <legend>Add a new Beneficiary:</legend>
    <div class="customer-info-box">
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <asp:PlaceHolder runat="server" ID="phLastname">
                        <tr class="row">
                            <td class="item-name">
                                Last Name:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbLastname" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phFirstName">
                        <tr class="row">
                            <td class="item-name">
                                First Name:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbFirstName" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phMiddle">
                        <tr class="row">
                            <td class="item-name">
                                Middle Name:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbMiddle" runat="server" MaxLength="1" Width="6"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phRK">
                        <tr class="row">
                            <td class="item-name">
                                Relationship:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbRK" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phSSN">
                        <tr class="row">
                            <td class="item-name">
                                SSN:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbSSN" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phPercentage">
                        <tr class="row">
                            <td class="item-name">
                                Percentage:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbPercentage" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phAddress">
                        <tr class="row">
                            <td class="item-name">
                                Address:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbAddress" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phCity">
                        <tr class="row">
                            <td class="item-name">
                                City:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbCity" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phState">
                        <tr class="row">
                            <td class="item-name">
                                State:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbState" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phZip">
                        <tr class="row">
                            <td class="item-name">
                                Zip:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbZip" runat="server" MaxLength="80" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <tr class="row">
                        <td class="item-name">
                            <div class="section-title">
                                <asp:Button ID="BtAdd" CssClass="btn" runat="server" Text="Add" Width="52px" />
                            </div>
                            <div class="section-title">
                            </div>
                        </td>
                        <td class="item-value">
                            <div class="section-title">
                            </div>
                            <div class="section-title">
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</fieldset>
