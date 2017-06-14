<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LifeCoverage.aspx.cs" Inherits="Pibt.OE.LifeCoverage" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> > My Family > Begin Enrollment > Select Plans>Life Coverage
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <!--Content Start -->
    <div class="customer-info-box">
        <div class="section-body" style="border: none">
            <div style="width:75%;padding-left:25px;">
                <asp:Literal ID="message" runat="server"></asp:Literal>
            </div>
            <asp:Panel ID="mtl" runat="server">
                <fieldset>
                    <legend>Medical Term Life Information</legend>
                    <telerik:RadGrid ID="mtlView" runat="server" Skin="MetroTouch" AllowSorting="false" AutoGenerateColumns="false" OnNeedDataSource="View_NeedDataSource">
                        <MasterTableView DataKeyNames="ID">
                            <Columns>
                                <telerik:GridBoundColumn DataField="id" UniqueName="id" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="oeId" UniqueName="oeId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="memberId" UniqueName="memberId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="name" HeaderText="Name" UniqueName="name"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planName" HeaderText="Plan Name" UniqueName="planName"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="insuranceAmount" HeaderText="Insurance Amount" UniqueName="insuranceAmount"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <fieldset>
                        <legend>Beneficiaries</legend>
                        <div class="row">
                            <div class="col-lg-9">
                                <telerik:RadGrid ID="mtlBen" runat="server" Skin="MetroTouch" AllowSorting="True" AutoGenerateColumns="False" OnNeedDataSource="Ben_NeedDataSource" EnableLinqExpressions="false">
                                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                                    <MasterTableView DataKeyNames="rId" ShowFooter="true">
                                        <CommandItemSettings ShowRefreshButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="plantypeName" HeaderText="Benefit Type" SortExpression="plantypeName" UniqueName="plantypeName"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="LASTNAME" HeaderText="Last Name" SortExpression="LASTNAME" UniqueName="LASTNAME"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="FIRSTNAME" HeaderText="First Name" SortExpression="FIRSTNAME" UniqueName="FIRSTNAME"></telerik:GridBoundColumn>
                                            <telerik:GridDropDownColumn ColumnEditorID="GridDropDownColumnEditor2" DataField="RELATIONSHIPID" DataSourceID="odsDsBeneficiaryTypes" HeaderText="Relationship" ListTextField="DESCRIPTION" ListValueField="RELATIONSHIPID" UniqueName="RELATIONSHIPID"></telerik:GridDropDownColumn>
                                            <telerik:GridBoundColumn DataField="PERCENTAGE" DataType="System.Decimal" HeaderText="Percentage" SortExpression="PERCENTAGE" UniqueName="PERCENTAGE" Aggregate="Sum" FooterAggregateFormatString="{0}%">
                                                <FooterStyle Font-Bold="true" HorizontalAlign="Right" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                            <div class="col-lg-3">
                                <asp:Button ID="mtlAdd" runat="server" Text="Add or Edit Beneficiaries" CssClass="btn" OnClick="Add_Click" />
                            </div>
                        </div>
                    </fieldset>
                </fieldset>
            </asp:Panel>
            <asp:Panel ID="vtl" runat="server">
                <fieldset>
                    <legend>Voluntary Term Life / AD&D Insurance Information</legend>
                    <asp:CheckBox ID="decline" runat="server" OnCheckedChanged="decline_CheckedChanged" AutoPostBack="true" />
                    <span class="simpleText" style="padding-left: 10px;">I choose to Decline Voluntary Term Life</span>
                    <telerik:RadGrid ID="vtlView" runat="server" Skin="MetroTouch" AllowSorting="false" AutoGenerateColumns="false" OnNeedDataSource="View_NeedDataSource" OnItemDataBound="vtlView_ItemDataBound">
                        <MasterTableView DataKeyNames="memberId">
                            <Columns>
                                <telerik:GridBoundColumn DataField="employeeTypeId" UniqueName="employeeTypeId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="memberId" UniqueName="memberId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="vtl_insuranceAmount" UniqueName="insuranceAmount" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="smoker" UniqueName="ndSmoker" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="employeename" HeaderText="Name" UniqueName="name"></telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderText="Select" UniqueName="selected">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="selected" runat="server" Checked='<%# Eval("hasPlan").ToString() == "Y" %>' AutoPostBack="true" OnCheckedChanged="selected_CheckedChanged" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Smoker?" DataField="smoker" UniqueName="rbSmoker">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="rbSmoker" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbSmoker_SelectedIndexChanged" >
                                            <asp:ListItem Text="Yes" Value="Y" ></asp:ListItem>
                                            <asp:ListItem Text="No" Value="N" ></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Insurance Amount" UniqueName="ddlInsurance">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:DropDownList ID="dpInsuranceAmount" Width="106" runat="server" OnSelectedIndexChanged="dpInsuranceAmount_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="rates" HeaderText="Premium Cost" DataFormatString="${0}"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <div style="text-align: right; padding-right: 55px;">
                        <asp:Label ID="ltotal" runat="server" Font-Bold="true"></asp:Label><br />
                        <asp:Label ID="lmTotal" runat="server" Font-Bold="true"></asp:Label><br />
                    </div>
                    <asp:Panel ID="vtlBenPanel" runat="server">
                        <fieldset>
                            <legend>Beneficiaries:</legend>
                            <div class="row">
                                <div class="col-lg-9">
                                    <telerik:RadGrid ID="vtlBen" runat="server" Skin="MetroTouch" AllowSorting="True" AutoGenerateColumns="False" OnNeedDataSource="Ben_NeedDataSource" EnableLinqExpressions="false" Enabled="false">
                                        <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                                        <MasterTableView DataKeyNames="rId" ShowFooter="true">
                                            <CommandItemSettings ShowRefreshButton="false" />
                                            <Columns>
                                                <telerik:GridBoundColumn DataField="plantypeName" HeaderText="Benefit Type" SortExpression="plantypeName" UniqueName="plantypeName"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="LASTNAME" HeaderText="Last Name" SortExpression="LASTNAME" UniqueName="LASTNAME"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="FIRSTNAME" HeaderText="First Name" SortExpression="FIRSTNAME" UniqueName="FIRSTNAME"></telerik:GridBoundColumn>
                                                <telerik:GridDropDownColumn ColumnEditorID="GridDropDownColumnEditor2" DataField="RELATIONSHIPID" DataSourceID="odsDsBeneficiaryTypes" HeaderText="Relationship" ListTextField="DESCRIPTION" ListValueField="RELATIONSHIPID" UniqueName="RELATIONSHIPID"></telerik:GridDropDownColumn>
                                                <telerik:GridBoundColumn DataField="PERCENTAGE" DataType="System.Decimal" HeaderText="Percentage" SortExpression="PERCENTAGE" UniqueName="PERCENTAGE" Aggregate="Sum" FooterAggregateFormatString="{0}%">
                                                    <FooterStyle Font-Bold="true" />
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </div>
                                <div class="col-lg-3">
                                    <asp:Button ID="vtlAdd" runat="server" Text="Add or Edit Beneficiaries" CssClass="btn" OnClick="Add_Click" Enabled="false" />
                                </div>
                            </div>
                        </fieldset>
                    </asp:Panel>
                </fieldset>
            </asp:Panel>
            <div class="row">
                <div class="col-lg-12 simpleText">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" OnCommand="LinkButton1_Command" CommandName="1" Visible="true" ToolTip="Click to open Notes">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" OnCommand="LinkButton1_Command" CommandName="2" Visible="false" ToolTip="Click to close notes Comparison">
                                <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                    </asp:LinkButton>
                    Click for more information
                </div>
            </div>
            <asp:Panel ID="noteList" Visible="false" runat="server">
                <div class="note-list">
                    <asp:Label ID="Label5" runat="server">The employee must submit Evidence of Insurability form to PIBT for the following amounts:</asp:Label>
                    <table class="table">
                        <tr>
                            <th>Employee</th>
                            <th>Spouse (Domestic Partner)</th>
                        </tr>
                        <tr>
                            <td>$150,000<br />
                                $200,000<br />
                                $300,000<br />
                                $400,000<br />
                                $500,000
                            </td>
                            <td>$30,000<br />
                                $35,000<br />
                                $40,000<br />
                                $45,000<br />
                                $50,000<br />
                                $100,000<br />
                                $150,000
                            </td>
                        </tr>
                    </table>
                    Contact PIBT Customer Service
                </div>
            </asp:Panel>
        </div>
    </div>
    <!--Content End -->
    <div class="row">
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtBack" CssClass="btn" Text="Previous" OnClick="BtBack_Click" Width="98px" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" CssClass="btn" Style="padding-right: 10px;" ID="startOver" Text="Start Over" OnClick="startOver_Click" />
            <asp:Button runat="server" ID="Button1" CssClass="btn btn-danger" Text="Save For Later" OnClick="Button1_Click" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClick="BtNext_Click" Width="98px" />
        </div>
    </div>
    <asp:ObjectDataSource ID="odsDsBeneficiaryTypes" runat="server" SelectMethod="GetBeneficiaryrelationship" TypeName="Pibt.BLL.EnrollmentForm"></asp:ObjectDataSource>
</asp:Content>
