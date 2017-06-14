<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAdditionalInfoView.ascx.cs"
    Inherits="Pibt.UserControl.CtlAdditionalInfoView" %>
<asp:FormView ID="fvEmployer" runat="server" Width="100%" BorderWidth="0px" DataSourceID="odsEmployer">
    <ItemTemplate>
        <div class="customer-info-box">
            <div class="section-title">
                Additional Infomation
            </div>
            <div class="section-body">
                <ul class="readonly-view">
                    <li><span class="label">Waiting Period :</span> <span class="data">
                        <%#Eval("WaitingPeriod")%></span></li>
                    <li><span class="label">Enroller :</span> <span class="data">
                        <%#Eval("Enroller")%></span> </li>
                    <li><span class="label">Team Lead :</span> <span class="data">
                        <%#Eval("TeamLead")%></span> </li>
                    <li><span class="label">Relationship Keeper :</span> <span class="data">
                        <%#Eval("RK")%></span> </li>
                    <li><span class="label">Terms :</span> <span class="data">
                        <%#Eval("Term")%></span> </li>
                    <li><span class="label">Employee Contribution :</span> <span class="data">
                        <%#Eval("EeContribution")%></span> % </li>
                    <li><span class="label">Dependent Contribution :</span> <span class="data">
                        <%#Eval("Depcontribution")%></span> % </li>
                    <li><span class="label">Tax ID# :</span> <span class="data">
                        <%#Eval("Taxid")%></span> </li>
                    <li><span class="label">SIC# :</span> <span class="data">
                        <%#Eval("Sic")%></span> </li>
                    <li><span class="label">Nature of Business :</span> <span class="data">
                        <%#Eval("NatureOfBiz")%></span> </li>
                </ul>
            </div>
        </div>
    </ItemTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="odsEmployer" runat="server" SelectMethod="GetBizInfoDetails2"
    TypeName="Pibt.BLL.Employer" OnSelecting="odsEmployer_Selecting">
    <SelectParameters>
        <asp:Parameter Name="employerId" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
