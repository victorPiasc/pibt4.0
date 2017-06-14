<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InHouseQuote.aspx.cs" Inherits="Pibt.InHouseQuote" MasterPageFile="~/Website.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <table>
                    <tbody>
                        <tr>
                            <td>Enter ZipCode:
                            </td>
                            <td>
                                <asp:TextBox ID="zipCode" runat="server" MaxLength="5" ></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="zipCodeValidator" runat="server" ErrorMessage="ZipCode required" ForeColor="Red" ControlToValidate="zipCode" ValidationGroup="submit"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td>
                                Month to quote on:
                            </td>
                            <td>
                                <asp:DropDownList ID="effectiveDate" runat="server" >
                                    <asp:ListItem Text="-- Select --" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td colspan="3">
                                <asp:UpdatePanel ID="updatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="section-body">
                                            <asp:FileUpload ID="fuCensus" runat="server" Width="250px" />
                                            <asp:RegularExpressionValidator ID="revFuCensus" runat="server" ControlToValidate="fuCensus" ErrorMessage="Only .csv, .tsv and .txt allowed" ValidationExpression="(.*\.([Cc][Ss][Vv])|.*\.([Tt][Ss][Vv])|.*\.([Tt][Xx][Tt])|.*\.([Xx][Ll][Ss][Xx])|.*\.([Xx][Ll][Ss])$)" CssClass="required-info" Display="Dynamic"></asp:RegularExpressionValidator>
                                            <br />
                                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnUpload" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td>Number of Employees added:
                            </td>
                            <td>
                                <asp:Label ID="eeCount" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="deleteAll" runat="server" Text="Delete all" BackColor="Red" OnClick="deleteAll_Click" />(click here to delete the list and start over)
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td>Message:
                            </td>
                            <td>
                                <asp:Literal ID="lblCreationMessage" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="getQuote" runat="server" Text="Quote" OnClick="getQuote_Click" ValidationGroup="submit" /> 
                            </td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td>
                                FORMAT (CSV, TSV, TXT in either format). Each row of data should in the following order separated by commas.
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                Employee Name, Type(Employee, Spouse/Domestic Partner, Child) , Gender, DOB 
                            </td>
                        </tr>
                    </tbody>
                </table>
                <asp:PlaceHolder ID="exportPh" runat="server"></asp:PlaceHolder>
                <script id="strife" src="https://s3-us-west-2.amazonaws.com/strife/production/strife.js" data-strife-key="4KnlWTmmpDv6FvY_"></script>
            </div>
        </div>
    </div>
</asp:Content>
