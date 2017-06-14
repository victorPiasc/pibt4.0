<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuoteTenPlus.aspx.cs" Inherits="Pibt.OnlineQuoteTenPlus"  MasterPageFile="~/Website.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <fieldset>
                    <legend><b>Online Quote for more than 10 employees</b></legend>
                    <div class="customer-info-box">
                        <div class="section-body">
                            <asp:Literal ID="lblCreationMessage" runat="server" EnableViewState="false"></asp:Literal>
                            <table class="table-container">
                                <tbody>
                                    <tr class="row">
                                        <td class="item-name" colspan="3">
                                            Download the file: <a href="/Documents/Employee_Quote_Entry.xls" style="text-decoration:underline;">Click here to download</a>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name" colspan="4">
                                            Fill out the excel file, then upload 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">
                                            Contact Name:
                                        </td>
                                        <td class="item-value">
                                            <asp:TextBox runat="server" ID="contactName" ></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="nameValidator" runat="server" ControlToValidate="contactName" ErrorMessage="*Name is required" CssClass="required-info" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        </td>                                        
                                    </tr>                                    
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">
                                            Contact Email:
                                        </td>
                                        <td class="item-value">
                                            <asp:TextBox runat="server" ID="contactEmail" ></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="emailRequired" runat="server" ControlToValidate="contactEmail" ErrorMessage="*Email Required" CssClass="required-info" ></asp:RequiredFieldValidator>                                       
                                            <asp:RegularExpressionValidator ID="emailValidator" runat="server" ControlToValidate="contactEmail" ErrorMessage="*Enter a valid email address" CssClass="required-info" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">
                                            Upload file here:
                                        </td>
                                        <td class="item-value" colspan="2">
                                            <telerik:RadAsyncUpload runat="server" ID="ASupload" AllowedFileExtensions=".xls, .xlsx" MultipleFileSelection="Disabled" Skin="Telerik"  MaxFileInputsCount="1" OnClientFileSelected="checkFile" UseApplicationPoolImpersonation="true"  TemporaryFolder="~/temp" >
                                            </telerik:RadAsyncUpload>                                           
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td colspan="2">
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Button ID="Send" runat="server" OnClick="Send_Click" Text="submit" style="display:none" CssClass="btn" />
                                        </td>
                                    </tr>
                                </tbody>                                                            
                            </table>   
                            <script type="text/javascript" language ="javascript">
                                function checkFile() {
                                    var button = document.getElementById('<%= Send.ClientID %>');
                                    button.style.display = 'inherit';
                                }
                            </script>                         
                        </div>       
                    </div>
                </fieldset>                                       
            </div>
        </div>
   </div>
</asp:Content>        

