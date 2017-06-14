<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEmployerGeneralInfoView.ascx.cs"
    Inherits="Pibt.UserControl.CtlEmployerGeneralInfoView" %>
<asp:FormView ID="fvEmployer" runat="server" Width="100%" BorderWidth="0" DataSourceID="odsEmployer">
    <ItemTemplate>
        <div class="customer-info-box">
            <div class="section-title">
                Company Details
            </div>
            <div class="section-body">
                <ul class="readonly-view">
                    <li>
                        <span class="label">
                            Company Name:</span>
                        <span class="data">
                            <%#Eval("CompanyName")%></span> </li>
                </ul>
            </div>
            <div class="section-title">
                Mailing Address
            </div>
            <div class="section-body">
                <ul class="readonly-view">
                    <li>
                        <span class="label">
                            Street&nbsp;Address:</span>
                        <span class="data">
                            <%#Eval("MailingStreetAddress1")%></span></li>
                    <li>
                        <span class="label">
                            &nbsp:</span>
                        <span class="data">
                            <%#Eval("MailingStreetAddress2")%></span> </li>
                    <li>
                        <span class="label">
                            City:</span>
                        <span class="data">
                            <%#Eval("MailingCity")%></span> </li>
                    <li>
                        <span class="label">
                            State:</span>
                        <span class="data">
                            <%#Eval("MailingState")%></span> </li>
                    <li>
                        <span class="label">
                            Zip:</span>
                        <span class="data">
                            <%#Eval("MailingPostCode")%></span> </li>
                    <li>
                        <span class="label">
                            Contact Person:</span>
                        <span class="data">
                            <%#Eval("MailingContact")%></span> </li>
                    <li>
                        <span class="label">
                            EMail :</span>
                        <span class="data">
                            <%#Eval("MailingEmail")%></span> </li>
                </ul>
            </div>
            <div class="section-title">
                Physical Address
            </div>
            <div class="section-body">
                <ul class="readonly-view">
                    <li>
                        <span class="label">
                            Street&nbsp;Address:</span>
                        <span class="data">
                            <%#Eval("PhsicalStreetAddress1")%></span></li>
                    <li>
                        <span class="label">
                            &nbsp;</span>
                        <span class="data">
                            <%#Eval("PhsicalStreetAddress2")%></span> </li>
                    <li>
                        <span class="label">
                            City:</span>
                        <span class="data">
                            <%#Eval("PhsicalCity")%></span> </li>
                    <li>
                        <span class="label">
                            State:</span>
                        <span class="data">
                            <%#Eval("PhsicalState")%></span> </li>
                    <li>
                        <span class="label">
                            Zip:</span>
                        <span class="data">
                            <%#Eval("MailingPostCode")%></span> </li>
                    <li>
                        <span class="label">
                            Contact Person:</span>
                        <span class="data">
                            <%#Eval("PhsicalContact")%></span> </li>
                    <li>
                        <span class="label">
                            EMail :</span>
                        <span class="data">
                            <%#Eval("PhsicalEmail")%></span> </li>
                </ul>
            </div>
             <div class="section-title">
                Status
            </div>
            <div class="section-body">
                <ul class="readonly-view">
                    <li>
                        <span class="label">
                            Start Date: 
                        </span>
                        <span class="data">
                            <%#Eval("StartDate") %>
                        </span>
                    </li>
                    <li>
                        <span class="label">
                            End Date: 
                        </span>
                        <span class="data">
                            <%#Eval("EndDate") %>
                        </span>
                    </li>

                </ul>
            </div>
        </div>
    </ItemTemplate>
</asp:FormView>
<asp:ObjectDataSource ID="odsEmployer" runat="server" SelectMethod="GetBizInfoDetails"
    TypeName="Pibt.BLL.Employer" onselecting="odsEmployer_Selecting">
    <SelectParameters>
        <asp:Parameter Name="employerId" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
