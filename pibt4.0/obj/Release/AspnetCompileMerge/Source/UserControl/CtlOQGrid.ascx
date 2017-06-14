<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlOQGrid.ascx.cs" Inherits="Pibt.UserControl.CtlOQGrid" %>
<fieldset>
    <legend>
        <b>Saved Online Quotes</b>
    </legend>
    <div class="customer-info-box">
         <asp:PlaceHolder runat="server" ID="phQuoteSearch">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name">
                            Quote Label:
                        </td>
                        <td class="item-value">
                            <telerik:RadTextBox ID="tbQuoteName" runat="server" CssClass="form-control" width="260" MaxLength="50" Height="34px" ValidationGroup="search"></telerik:RadTextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldQuoteName" CssClass="required-info" SetFocusOnError="true" runat="server" ErrorMessage="*Required if using the search feature" ControlToValidate="tbQuoteName" ValidationGroup="search"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="tbSearch" runat="server" Text="Search" ValidationGroup="search" CssClass="btn" OnClick="tbSearch_Click"></asp:Button>&nbsp;
                            <asp:Button ID="tbClear" runat="server" Text="Clear" CssClass="btn" OnClick="tbClear_Click" />&nbsp;
                            <asp:Button ID="tbNew" runat="server" Text="New Quote" CssClass="btn" style="background-color:red;" OnClick="tbNew_Click"/>
                        </td>
                    </tr>
                </tbody>
            </table>             
         </asp:PlaceHolder>
        <br />
        <asp:PlaceHolder runat="server" ID="phGRID">
            <telerik:RadGrid ID="trQuotesGrid" runat="server" OnNeedDataSource="trQuotesGrid_NeedDataSource" AutoGenerateColumns="false" Skin="MetroTouch" CssClass="ChoosePlanGird" AllowMultiRowSelection="false" OnItemCommand="trQuotesGrid_ItemCommand" >
                <MasterTableView AllowSorting="true" Width="100%" Height="100%" DataKeyNames="CARTID"  >
                    <Columns>
                        <telerik:GridButtonColumn ButtonCssClass="btn" Text="Select" ButtonType="PushButton" CommandName="Select" UniqueName="SelectColumn" HeaderText="Select" >
                        </telerik:GridButtonColumn>
                        <telerik:GridBoundColumn UniqueName="CARTID" DataField="CARTID" Display="false" ></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="DATESAVED" HeaderText="Date Saved" DataField="DATESAVED" DataType="System.DateTime"
                            DataFormatString="{0:MM/dd/yyyy}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="LABELNAME" HeaderText="Quote Label" DataField="LABELNAME"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="COMPANYNAME" HeaderText="Company Name" DataField="COMPANYNAME"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="QUOTENUM" HeaderText="Quote #" DataField="QUOTENUM"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:PlaceHolder>
    </div>   
</fieldset>
