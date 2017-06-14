<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEmployeeDetails.ascx.cs"
    Inherits="Pibt.UserControl.CtlEmployeeDetails" %>
<telerik:RadListView ID="RadListViewEEDetails" runat="server" DataSourceID="" ItemPlaceholderID="ListViewContainer">
    <LayoutTemplate>
        <asp:PlaceHolder runat="server" ID="ListViewContainer" />
    </LayoutTemplate>
    <ItemTemplate>
        <fieldset>
            <legend><b>Member</b>:#<%#Eval("memberid")%>&nbsp;&nbsp;&nbsp;
                <%#Eval("name")%></legend>
            <div style="float: left; position: relative; left: 30px;" class="customer-info-box">
                <asp:Label CssClass="info" ID="Name" runat="server" Style="font-size: x-large; line-height: 1.5em;"><%# Eval("name")%></asp:Label><br />
                <asp:Label CssClass="info" ID="Label1" runat="server"><%# Eval("employeeType")%></asp:Label>
                <div>
                </div>
                <asp:PlaceHolder runat="server" ID="phEmployeeDetails">
                    <div class="section-title">
                        Member Details :
                    </div>
                    <div class="clear">
                    </div>
                    <div class="section-body">
                        <table class="table-container">
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="phGender">
                                    <tr class="row">
                                        <td class="item-name">
                                            Gender:
                                        </td>
                                        <td class="item-value">
                                            <div class="readonly">
                                                <%# Eval("Gender")%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phBirthDate">
                                    <tr class="row">
                                        <td class="item-name">
                                            Birth Date :
                                        </td>
                                        <td class="item-value">
                                            <div class="readonly">
                                                <%# Eval("birthDate","{0:DD-MMM-yyyy}")%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phMarriageDate">
                                    <tr class="row">
                                        <td class="item-name">
                                            Marriage Date:
                                        </td>
                                        <td class="item-value">
                                            <div class="readonly">
                                                <%# Eval("marriageDate", "{0:DD-MMM-yyyy}")%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phHireDateDate">
                                    <tr class="row">
                                        <td class="item-name">
                                            Hire Date:
                                        </td>
                                        <td class="item-value">
                                            <div class="readonly">
                                                <%# Eval("hireDate", "{0:DD-MMM-yyyy}")%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                            </tbody>
                        </table>
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="phPhsicalAddress">
                    <div class="section-title">
                        Physical Address :
                    </div>
                    <div class="clear">
                    </div>
                    <div class="section-body">
                        <table class="table-container">
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="phPhsicalStreetAddress1">
                                    <tr class="row">
                                        <td class="item-name">
                                            Street Address:
                                        </td>
                                        <td class="item-value">
                                            <div class="readonly">
                                                <%# Eval("address")%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phPhsicalCity">
                                    <tr class="row">
                                        <td class="item-name">
                                            City:
                                        </td>
                                        <td class="item-value">
                                            <div class="readonly">
                                                <%# Eval("city")%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phPhsicalState">
                                    <tr class="row">
                                        <td class="item-name">
                                            State:
                                        </td>
                                        <td class="item-value">
                                            <div class="readonly">
                                                <%# Eval("state")%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phPhsicalPostCode">
                                    <tr class="row">
                                        <td class="item-name">
                                            Postal Code:
                                        </td>
                                        <td class="item-value">
                                            <div class="readonly">
                                                <%# Eval("zip")%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                            </tbody>
                        </table>
                    </div>
                    <div class="clear">
                    </div>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="phContactDetails">
                    <div class="section-title">
                        Contact Details:
                    </div>
                    <div class="clear">
                    </div>
                    <div class="section-body">
                        <table class="table-container">
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="phCellPhone">
                                    <tr class="row">
                                        <td class="item-name">
                                            Cell:
                                        </td>
                                        <td class="item-value">
                                        <div class="readonly">
                                                <%# Eval("mobilePhoneNbr") == DBNull.Value? "&nbsp;" : (String.Format("{0:(###) ###-####}", Convert.ToInt64(Eval("mobilePhoneNbr").ToString())))%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phHomePhone">
                                    <tr class="row">
                                        <td class="item-name">
                                            Home:
                                        </td>
                                        <td class="item-value">
                                        <div class="readonly">
                                                <%# Eval("homePhoneNbr") == DBNull.Value ? "&nbsp;" : (String.Format("{0:(###) ###-####}", Convert.ToInt64(Eval("homePhoneNbr").ToString())))%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phWorkPhone">
                                    <tr class="row">
                                        <td class="item-name">
                                            Work:
                                        </td>
                                        <td class="item-value">
                                        <div class="readonly">
                                                <%# Eval("workPhoneNbr") == DBNull.Value ? "&nbsp;" : (String.Format("{0:(###) ###-####}", Convert.ToInt64(Eval("workPhoneNbr").ToString())))%></div>
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder runat="server" ID="phPhsicalEmail">
                                    <tr class="row">
                                        <td class="item-name">
                                            Contact Email:
                                        </td>
                                        <td class="item-value">
                                         <div class="readonly">
                                                <%# Eval("emailAddress")%></div> 
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                            </tbody>
                        </table>
                    </div>
                    <div class="clear">
                    </div>
                </asp:PlaceHolder>
            </div>
        </fieldset>
    </ItemTemplate>
</telerik:RadListView>
<br />
<div style="clear: both;">
</div>
