<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SummaryOfChanges.aspx.cs" Inherits="Pibt.OE.SummaryOfChanges" MasterPageFile="~/Content.Master" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<%@ Register Src="~/UserControl/CtlCurrentCoverage.ascx" TagName="CtlCurrentCov" TagPrefix="uc3" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> > My Family > Begin Enrollment > Select Plans > Summary of Changes
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <!--Content Start-->
    <div class="customer-info-box">
        <div class="section-body" style="border: none">
            <asp:Panel ID="census" runat="server">
                <fieldset>
                    <legend><asp:Label ID="lFamily" runat="server"></asp:Label></legend>
                    <uc3:CtlCurrentCov ID="CtlCurrentCov1" runat="server" />
                </fieldset>
            </asp:Panel>
            <asp:Panel ID="newPlans" runat="server">
                <fieldset>
                    <legend>Plans Selected</legend>
                    <telerik:RadGrid ID="plans" runat="server" AutoGenerateColumns="false" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" CssClass="ChoosePlanGrid" GridLines="None" ShowStatusBar="True" OnNeedDataSource="plans_NeedDataSource" ShowFooter="true" OnDataBound="plans_DataBound">
                        <MasterTableView DataKeyNames="planId">
                            <Columns>
                                <telerik:GridBoundColumn DataField="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planTypeId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" SortExpression="planName" HeaderText="Plan&nbsp;Name" ></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planType" UniqueName="planType" SortExpression="planType" HeaderText="Plan&nbsp;Type"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="eeCount" UniqueName="eeCount" SortExpression="eeCount" HeaderText="Employee&nbsp;Count" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="depCount" UniqueName="depCount" SortExpression="depCount" HeaderText="Dependent&nbsp;Count" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="price" UniqueName="price" SortExpression="price" HeaderText="Total" ItemStyle-HorizontalAlign="Right" Aggregate="Sum" DataFormatString="{0:C}" FooterAggregateFormatString="Total Monthly Cost {0:C}" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="effectiveDate" UniqueName="effectiveDate" HeaderText="Effective&nbsp;Date" DataType="System.DateTime" DataFormatString="{0:d}"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </fieldset>
            </asp:Panel>
            <asp:Panel ID="termPlans" runat="server">
                <fieldset>
                    <legend>Terminated Plans</legend>
                    <telerik:RadGrid ID="terminated" runat="server" AutoGenerateColumns="false" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" CssClass="ChoosePlanGrid" GridLines="None" ShowStatusBar="True" OnNeedDataSource="plans_NeedDataSource">
                        <MasterTableView DataKeyNames="planId">
                            <Columns>
                                <telerik:GridBoundColumn DataField="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planTypeId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" SortExpression="planName" HeaderText="Plan&nbsp;Name" ></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planType" UniqueName="planType" SortExpression="planType" HeaderText="Plan&nbsp;Type"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="eeCount" UniqueName="eeCount" SortExpression="eeCount" HeaderText="Employee&nbsp;Count" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="depCount" UniqueName="depCount" SortExpression="depCount" HeaderText="Dependent&nbsp;Count" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="expiryDate" UniqueName="expiryDate" HeaderText="Termination&nbsp;Date" DataType="System.DateTime" DataFormatString="{0:d}"></telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </fieldset>
            </asp:Panel>
        </div>
    </div>
    <!--Content End-->
    <div class="row">
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtBack" CssClass="btn" Text="Previous" OnClick="BtBack_Click" Width="98px" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" CssClass="btn" style="padding-right:10px;" ID="startOver" Text="Start Over" OnClick="startOver_Click" />
            <asp:Button runat="server" ID="Button1" CssClass="btn btn-danger" Text="Save For Later" OnClick="Button1_Click" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClick="BtNext_Click" Width="98px" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
