<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="Pibt.Employer.Rates" MasterPageFile="~/Content.master" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc2" %>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">\
    <div class="customer-info-box">
    <div class="row">
        <div class="col-md-8">
            <asp:DropDownList ID="planTypeList" runat="server" CssClass="form-control" OnPreRender="planTypeList_PreRender" OnSelectedIndexChanged="planTypeList_SelectedIndexChanged">
            </asp:DropDownList>  
        </div>
        <div class="col-md-8">
            <telerik:RadGrid ID="plansList" runat="server" CssClass="form-control" Skin="MetroTouch" AutoGenerateColumns ="false" OnNeedDataSource="plansList_NeedDataSource">
                <MasterTableView DataKeyNames="PLANID" >
                    <CommandItemSettings ShowAddNewRecordButton="false" />
                    <Columns>
                        <telerik:GridBoundColumn DataField="EMPLOYEENAME" HeaderText="Name" UniqueName="EMPLOYEENAME" ></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PIAPLANTIERDESC" HeaderText="Type" UniqueName="PIAPLANTIERDESC"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" UniqueName="PLANNAME"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="EMPLOYEERATES" HeaderText="Premium" UniqueName="EMPLOYEERATES"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>  
        </div>
    </div>
</div>
</asp:Content>
