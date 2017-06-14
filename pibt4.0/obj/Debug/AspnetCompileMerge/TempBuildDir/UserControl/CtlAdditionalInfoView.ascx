<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAdditionalInfoView.ascx.cs"
    Inherits="Pibt.UserControl.CtlAdditionalInfoView" %>
<div class="customer-info-box">
    <div class="section-title">
        Additional Infomation
    </div>
    <div class="section-body">
        <asp:FormView ID="fvEmployer" runat="server" Width="100%" BorderWidth="0px" DataSourceID="odsEmployer">
            <ItemTemplate>
                <ul class="readonly-view">
                    <li><span class="label">Waiting Period:</span> <span class="data">
                        <%#Eval("WaitingPeriod")%></span></li>
                    <li><span class="label">Enroller:</span> <span class="data">
                        <%#Eval("Enroller")%></span> </li>
                    <li><span class="label">Team Lead:</span> <span class="data">
                        <%#Eval("TeamLead")%></span> </li>
                    <li><span class="label">Relationship Keeper:</span> <span class="data">
                        <%#Eval("RK")%></span> </li>
                    <li><span class="label">Terms:</span> <span class="data">
                        <%#Eval("Term")%></span> </li>
                    <li><span class="label">Tax ID#:</span> <span class="data">
                        <%#Eval("Taxid")%></span> </li>
                    <li><span class="label">SIC#:</span> <span class="data">
                        <%#Eval("Sic")%></span> </li>
                    <li><span class="label">Nature of Business:</span> <span class="data">
                        <%#Eval("NatureOfBiz")%></span> </li>
                    <li><span class="label">Employee Contribution:</span><asp:TextBox ID="EeContribution" runat="server" Text='<%#Eval("EeContribution")%>'></asp:TextBox>%</li>
                    <li><span class="label">Dependent Contribution:</span><asp:TextBox ID="DepContribution" runat="server" Text='<%#Eval("Depcontribution")%>'></asp:TextBox>%</li>
                    <li><span class="label">Employee Dollar:</span>$<asp:TextBox ID="EeDollar" runat="server" Text='<%#Eval("EeDollar")%>'></asp:TextBox></li>
                    <li><span class="label">Dependent Dollar:</span>$<asp:TextBox ID="DepDollar" runat="server" Text='<%#Eval("DepDollar")%>'></asp:TextBox></li>
                </ul>
            </ItemTemplate>
        </asp:FormView>
<table class="table-container">
            <tbody>
                <tr class="row" style="border-bottom:solid">
                    <td class="item-name" >
                        Plan Type
                    </td>
                    <td class="item-name">
                        Employee % &nbsp;
                    </td>
                    <td class="item-name">
                        Dependent %
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">
                        Medical:                        
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MedicalEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MedicalDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">                        
                        Dental:
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="DentalEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="DentalDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">   
                        Vision:                     
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="VisionEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="VisionDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">
                        Chiro:                        
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="ChiroEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="ChiroDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">
                        Managed Group Life:                        
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MglEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MglDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">     
                        VTL:                   
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="VtlEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="VtlDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">                        
                        MTL:
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MtlEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MtlDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">
                        Mental Health:                        
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MentalEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MentalDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">        
                        Executive Benefits:                
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="EbEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="EbDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">                        
                        MTL GA:
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MtlgaEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MtlgaDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">  
                        MTL Multi-Tier:                      
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MtlmtEE" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                    <td class="item-Value">
                        <asp:TextBox ID="MtlmtDep" runat="server" MaxLength="6" Width="50px" ></asp:TextBox>
                    </td>
                </tr>
            </tbody>
        </table>
        <telerik:Radgrid ID="PlanType" 
    </div>
</div>
<asp:ObjectDataSource ID="odsEmployer" runat="server" SelectMethod="GetBizInfoDetails2"
    TypeName="Pibt.BLL.Employer" OnSelecting="odsEmployer_Selecting">
    <SelectParameters>
        <asp:Parameter Name="employerId" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
