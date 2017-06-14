<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentFormPreview.ascx.cs"
    Inherits="Pibt.UserControl.CtlEnrollmentFormPreview" %>
<div id="OEAlertDialog2" class="message-error">
<asp:Literal ID="lblMsg2" ViewStateMode="Disabled" runat="server"></asp:Literal>
</div>
<center>
    <p>
        <h1>
            <asp:Literal ID="HeadTypeName" runat="server"></asp:Literal>
        </h1>
    </p>
    <div class="EnrollmentFormView">
        <div class="header">
            <img class="logo" src="/img/<%=Pibt.Common.Utilities.Us()%>_2015-2016.jpg" alt="logo" width="200px"/>
            <div class="contactInfo" style="margin-top:-5px;">
                <div>
                       5800 South Eastern Avenue, Suite 400, Los Angeles, CA 90040</div>
                <div>
                       Phone: (323) 728-9500 &nbsp;Outside Southern California: (800) 499-4898</div>
                <div>
                       Fax: (323) 215-1796 <a href="http://<%=Pibt.Common.Utilities.OurURL()%>"><%=Pibt.Common.Utilities.OurURL()%></a> License #0747420</div>
            </div>
        </div>
        <div class="empty-line">
            &nbsp;</div>
        <div class="section">
            <div class="section-title">
                &nbsp;A. EMPLOYER INFORMATION
            </div>
            <div class="section-body">
                <table>
                    <tr>
                        <td>
                            <strong>Enrollment Form Type: </strong>
                        </td>
                        <td>
                            <asp:Label ID="lblOETypeName" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:FormView ID="fvErInfo" runat="server" DataSourceID="odsErInfo">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    Employer ID:
                                </td>
                                <td>
                                    <%# Eval("EmployerId") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Employer Name:
                                </td>
                                <td>
                                    <%# Eval("CompanyName")%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Physical Address:</strong>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Street Address 1:
                                </td>
                                <td>
                                    <%# Eval("PhsicalStreetAddress1")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Street Address 2:
                                </td>
                                <td>
                                    <%# Eval("PhsicalStreetAddress2")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    City:
                                </td>
                                <td>
                                    <%# Eval("PhsicalCity")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    State:
                                </td>
                                <td>
                                    <%# Eval("PhsicalState")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Zip:
                                </td>
                                <td>
                                    <%# Eval("PhsicalPostCode")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Contact:
                                </td>
                                <td>
                                    <%# Eval("PhsicalContact")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email:
                                </td>
                                <td>
                                    <%# Eval("PhsicalEmail")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone Number:
                                </td>
                                <td>
                                    <%# Eval("Phonenbr")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Fax Number:
                                </td>
                                <td>
                                    <%# Eval("Faxnbr")%>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="odsErInfo" runat="server" SelectMethod="GetBizInfoDetails"
                    TypeName="Pibt.BLL.Employer">
                    <SelectParameters>
                        <asp:Parameter Name="employerId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;B. EMPLOYEE INFORMATION
            </div>
            <div class="section-body">
                <asp:FormView ID="fvEeInfo" runat="server" DataSourceID="odsEeInfo">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <%=Pibt.Common.Utilities.Us()%> Employee ID:
                                </td>
                                <td>
                                    <%# Eval("EmployeeId")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Name:
                                </td>
                                <td>
                                    <%# Eval("UserName")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Gender:
                                </td>
                                <td>
                                    <%# Eval("Gender")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Birthdate:
                                </td>
                                <td>
                                    <%# Eval("BirthDate")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Marriage Date:
                                </td>
                                <td>
                                    <%# Eval("MarriageDate")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Hire Date:
                                </td>
                                <td>
                                    <%# Eval("HireDate")%>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Physical Address:</strong>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Street&nbsp;Address:
                                </td>
                                <td>
                                    <%# Eval("Address")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    City:
                                </td>
                                <td>
                                    <%# Eval("City")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    State:
                                </td>
                                <td>
                                    <%# Eval("State")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Zip:
                                </td>
                                <td>
                                    <%# Eval("Zip")%>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="odsEeInfo" runat="server" SelectMethod="GetMemberDetails"
                    TypeName="Pibt.BLL.Employee">
                    <SelectParameters>
                        <asp:Parameter Name="memberId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;C. TERMINATED PLAN(S) INFORMATION
            </div>
            <div class="section-body">
                <asp:GridView ID="gvTerminatePlans" Width="750" AutoGenerateColumns="False" AllowSorting="False"
                    ShowStatusBar="True" BorderWidth="1" BorderStyle="Solid" runat="server" DataSourceID="odsTerminate">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"/>
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender"/>
                        <asp:BoundField DataField="Planname" HeaderText="Plan Name" SortExpression="Planname"/>
                        <asp:BoundField DataField="expirydate" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-HorizontalAlign="Center"
                            HeaderText="Expiry Date" SortExpression="expirydate"/>
                    </Columns>
                    <EmptyDataTemplate>
                        None
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsTerminate" runat="server" SelectMethod="GetOETerminatePlans"
                    TypeName="Pibt.BLL.EnrollmentForm">
                    <SelectParameters>
                        <asp:Parameter Name="oeId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;D. COVERAGE INFORMATION
            </div>
            <div class="section-body">
                <asp:GridView ID="gvCoverage" Width="750px" AutoGenerateColumns="False" AllowSorting="False"
                    ShowStatusBar="True" BorderWidth="1px" BorderStyle="Solid" runat="server" DataSourceID="odsCoverage">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"/>
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender"/>
                        <asp:BoundField DataField="Planname" HeaderText="Plan Name" SortExpression="Planname"/>
                        <asp:BoundField DataField="Effectivedate" HeaderText="Effective Date" DataFormatString="{0:MM/dd/yyyy}"
                            ItemStyle-HorizontalAlign="Center" SortExpression="Effectivedate" />
                    </Columns>
                    <EmptyDataTemplate>
                        None
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsCoverage" runat="server" SelectMethod="GetOEAvailablePlans"
                    TypeName="Pibt.BLL.EnrollmentForm">
                    <SelectParameters>
                        <asp:Parameter Name="oeId" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="notIncludeTerminate" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;E. MEDICAL PCP INFORMATION
            </div>
            <div class="section-body">
                <asp:GridView ID="gvPCP" Width="750px" AutoGenerateColumns="False" AllowSorting="False"
                    ShowStatusBar="True" BorderWidth="1px" BorderStyle="Solid" runat="server" DataSourceID="odsPCP">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                        <asp:BoundField DataField="Planname" HeaderText="Plan Name" SortExpression="Planname"/>
                        <asp:BoundField DataField="PlanOffice1" HeaderText="PCP Name" SortExpression="PlanOffice1"/>
                        <asp:BoundField DataField="PlanOffice2" HeaderText="PCP #" SortExpression="PlanOffice2"/>
                        <asp:BoundField DataField="PlanOffice4" HeaderText="Medical Group Name" SortExpression="PlanOffice3"/>
                        <asp:BoundField DataField="PlanOffice3" HeaderText="IPA/Medical Group #" SortExpression="PlanOffice4"/>
                    </Columns>
                    <EmptyDataTemplate>
                        None
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsPCP" runat="server" SelectMethod="GetEnrollmentFormPlans"
                    TypeName="Pibt.BLL.EnrollmentForm">
                    <SelectParameters>
                        <asp:Parameter Name="oeId" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="planTypeId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;F. DENTAL PCP INFORMATION
            </div>
            <div class="section-body">
                <asp:GridView ID="gvDental" Width="750px" AutoGenerateColumns="False" AllowSorting="False"
                    ShowStatusBar="True" BorderWidth="1px" BorderStyle="Solid" runat="server" DataSourceID="odsDental">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                        <asp:BoundField DataField="Planname" HeaderText="Plan Name" SortExpression="Planname"/>
                        <asp:BoundField DataField="PlanOffice1" HeaderText="Dental Office" SortExpression="PlanOffice1"/>
                        <asp:BoundField DataField="PlanOffice2" HeaderText="Office #" SortExpression="PlanOffice2"/>
                        <asp:BoundField DataField="PlanOffice3" HeaderText="Alternate Dental Office Name" SortExpression="PlanOffice3"/>
                    </Columns>
                    <EmptyDataTemplate>
                        None
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsDental" runat="server" SelectMethod="GetEnrollmentFormPlans"
                    TypeName="Pibt.BLL.EnrollmentForm">
                    <SelectParameters>
                        <asp:Parameter Name="oeId" Type="String" />
                        <asp:Parameter DefaultValue="2" Name="planTypeId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;G. LIFE COVERAGE INFORMATION
            </div>
            <div class="section-body">
                <asp:GridView ID="gvConverageAddtional" Width="750px" AutoGenerateColumns="False"
                    AllowSorting="False" ShowStatusBar="True" BorderWidth="1px" BorderStyle="Solid"
                    runat="server" DataSourceID="odsgvConverageAddtional">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                        <asp:BoundField DataField="Planname" HeaderText="Plan Name" SortExpression="Planname"/>
                        <asp:BoundField DataField="RATETYPEDESC" HeaderText="Rate Type Desc" SortExpression="RATETYPEDESC"/>
                        <asp:BoundField DataField="SALARY" HeaderText="Salary" SortExpression="SALARY" DataFormatString="{0:C}"/>
                        <asp:BoundField DataField="INSURANCEAMOUNT" HeaderText="Insurance Amount" SortExpression="INSURANCEAMOUNT" DataFormatString="{0:C}"/>
                        <asp:BoundField DataField="SMOKER" HeaderText="Smoker" SortExpression="SMOKER"/>
                    </Columns>
                    <EmptyDataTemplate>
                        None
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsgvConverageAddtional" runat="server" SelectMethod="GetOEAdditionalInfo"
                    TypeName="Pibt.BLL.EnrollmentForm">
                    <SelectParameters>
                        <asp:Parameter Name="oeId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;H. SECTION 125 CAFETERIA PREMIUM ONLY PLAN
            </div>
            <div class="section-body">
                <asp:CheckBox ID="chkCafeteriaPermium" runat="server" Enabled="false" />
                I want my portion of eligible insurance premiums paid on a pre-tax basis.
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;I. YOUR LEGAL ACKNOWLEDGMENT
            </div>
            <div class="section-body">
                <asp:CheckBox ID="chkReadLegalDoc" Checked="true" runat="server" Enabled="false" />
                I have read and understand the policy.
                <asp:PlaceHolder ID="placeLegalDoc" runat="server">
                    <div class="LegalDocContent">
                        <asp:Literal ID="LegalDocContent" runat="server"></asp:Literal>
                    </div>
                </asp:PlaceHolder>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;J. SIGNATURE
            </div>    
           <div class="section-body">
              <asp:Table ID="signatureDetails" runat="server" Width="80%">
                 <asp:TableRow >
                    <asp:TableCell HorizontalAlign="Left" >
                       <asp:Label ID="nameLabel"  runat="server" Font-Size="16" Text="Name:"/>
                       <asp:label ID="name" runat="server"  Font-Size="16" Font-Underline="true" />
                    </asp:TableCell>                                             
                    <asp:TableCell HorizontalAlign="Right">
                       <asp:Label ID="dateLabel"  runat="server" Font-Size="16" Text="Date:"/>
                       <asp:Label ID="date" runat="server" Font-Size="16" Font-Underline="true"/>                       
                    </asp:TableCell>                    
                 </asp:TableRow>                
              </asp:Table>                            
            </div>        
            <div class="section-body" >
               <asp:Table runat="server">
                  <asp:TableRow>
                     <asp:TableCell>
                        <asp:Label ID="signaturelabel"  runat="server" Font-Size="16" Text="Signature:"  /> 
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:Image ID="imgSignature" Width="300" Height="80" runat="server"/>
                     </asp:TableCell>
                  </asp:TableRow>
                  <asp:TableRow>
                     <asp:TableCell>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label runat="server" Text="______________________________________________________" Font-Bold="true" ></asp:Label>
                     </asp:TableCell>
                  </asp:TableRow>
               </asp:Table>                               
               <asp:CheckBox ID="HasSignature" runat="server" Visible="false"  />                
            </div>
        </div>
    </div>
</center>
<div id="OEAlertDialog" class="message-error">
<asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
</div>
