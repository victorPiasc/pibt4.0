<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentFormPreview.ascx.cs"
    Inherits="Pibt.UserControl.CtlEnrollmentFormPreview" %>
<div id="OEAlertDialog2" class="message-error">
    <asp:Literal ID="lblMsg2" ViewStateMode="Disabled" runat="server"></asp:Literal>
</div>
<center>
    <p>
        <h1>
            <asp:Literal ID="HeadTypeName" runat="server"></asp:Literal>
            <asp:HyperLink ID="export" runat="server" style="font-size:25px;padding-left:25px; text-decoration:none;" >
                <span aria-hidden="true" class="glyphicon glyphicon-print"></span>
            </asp:HyperLink>
        </h1>
    </p>
    <div class="EnrollmentFormView">
        <div class="header">
            <img class="<%=Pibt.Common.Utilities.LogoPicker()%>" src="/img/<%=Pibt.Common.Utilities.Us()%>_2015-2016.jpg" alt="logo" width="200px" style="margin-top:0px"/>
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
                                <td >
                                    Employer&nbsp;ID:
                                </td>
                                <td colspan="4">
                                    <%# Eval("EmployerId").ToString().Contains("-") ? "Pending" : Eval("EmployerId") %>
                                </td>
                                
                            </tr>
                            <tr>
                                <td >
                                    Employer&nbsp;Name:
                                </td>
                                <td colspan="4">
                                    <%# Eval("CompanyName")%>
                                </td>
                               
                            </tr>
                            <tr>
                                <td colspan="5">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>Contact&nbsp;Information:</strong>
                                </td>
                                <td>&nbsp;</td>
                                <td colspan="2">
                                    <strong>Physical&nbsp;Address:</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100px">
                                    Contact:
                                </td>
                                <td style="width:150px">
                                    <%# Eval("PhsicalContact")%>
                                </td>
                                <td>&nbsp;</td>
                                <td style="width:100px">
                                    Street&nbsp;Address&nbsp;1:
                                </td>
                                <td style="width:200px">
                                    <%# Eval("PhsicalStreetAddress1")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email:
                                </td>
                                <td>
                                    <%# Eval("PhsicalEmail")%>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    Street&nbsp;Address&nbsp;2:
                                </td>
                                <td>
                                    <%# Eval("PhsicalStreetAddress2")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone&nbsp;Number:
                                </td>
                                <td>
                                    <%# Eval("Phonenbr")%>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    City:
                                </td>
                                <td>
                                    <%# Eval("PhsicalCity")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Fax&nbsp;Number:
                                </td>
                                <td>
                                    <%# Eval("Faxnbr")%>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    State:
                                </td>
                                <td>
                                    <%# Eval("PhsicalState")%>
                                </td>
                            </tr>        
                            <tr>
                                <td colspan="3">&nbsp;</td>
                                <td>
                                    Zip:
                                </td>
                                <td>
                                    <%# Eval("PhsicalPostCode")%>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="odsErInfo" runat="server" SelectMethod="GetBizInfoDetails" TypeName="Pibt.BLL.Employer">
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
                                <td colspan="2">
                                    <%--<%=Pibt.Common.Utilities.Us()%>--%>
                                   <strong>Employee&nbsp;ID:&nbsp;</strong><%# Eval("EmployeeId")%>
                                </td>
                                <td>&nbsp;</td>
                                <td colspan="2">
                                    <strong>Physical&nbsp;Address:</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:100px">
                                    Name:
                                </td>
                                <td style="width:150px">
                                    <%# Eval("UserName")%>
                                </td>
                                <td>&nbsp;</td>
                                <td style="width:100px">
                                    Street&nbsp;Address&nbsp;1:
                                </td>
                                <td style="width:200px">
                                    <%# Eval("AddressOne")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Gender:
                                </td>
                                <td>
                                    <%# Eval("Gender")%>
                                </td>
                                <td>&nbsp;</td>
                                <td style="width:100px">
                                    Street&nbsp;Address&nbsp;2:
                                </td>
                                <td style="width:200px">
                                    <%# Eval("AddressTwo")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Birthdate:
                                </td>
                                <td>
                                    <%# Eval("BirthDate")%>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    City:
                                </td> 
                                <td>
                                    <%# Eval("City")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Marriage Date:
                                </td>
                                <td>
                                    <%# Eval("MarriageDate")%>
                                </td>
                                <td>&nbsp;</td>
                               <td>
                                    State:
                               </td>
                               <td>
                                    <%# Eval("State")%>
                               </td>
                            </tr>
                            <tr>
                                <td>
                                    Hire Date:
                                </td>
                                <td>
                                    <%# Eval("HireDate")%>
                                </td>
                                <td >&nbsp;</td>
                                <td>
                                    Zip:
                                </td>
                                <td>
                                    <%# Eval("Zip")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Smoker:
                                </td>
                                <td>
                                    <%# (bool)Eval("smoker") ? "Yes" : "No" %>
                                </td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Hours Worked:
                                </td>
                                <td>
                                    <%# Eval("Hoursworked") %>
                                </td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Pay Periods/Year:
                                </td>
                                <td>
                                    <%# setPayPeriod(Eval("Periodsperyear")) %>
                                </td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Pay per Period:
                                </td>
                                <td>
                                    <%# Eval("Salaryperperiod") %>
                                </td>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                        </table>                        
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="odsEeInfo" runat="server" SelectMethod="GetMemberDetails" TypeName="Pibt.BLL.Employee">
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
                <asp:GridView ID="gvTerminatePlans" Width="750" AutoGenerateColumns="False" AllowSorting="False" ShowStatusBar="True" BorderWidth="1"
                    BorderStyle="Solid" runat="server" DataSourceID="odsTerminate">
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
                <asp:ObjectDataSource ID="odsTerminate" runat="server" SelectMethod="GetOETerminatePlans" TypeName="Pibt.BLL.EnrollmentForm">
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
                <asp:GridView ID="gvCoverage" Width="750px" AutoGenerateColumns="False" AllowSorting="False" ShowStatusBar="True" BorderWidth="1px"
                    BorderStyle="Solid" runat="server" DataSourceID="odsCoverage">
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
                <asp:ObjectDataSource ID="odsCoverage" runat="server" SelectMethod="GetEnrollerFormData" TypeName="Pibt.BLL.EnrollmentForm">
                    <SelectParameters>
                        <asp:Parameter Name="oeId" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="notInclude" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;E. MEDICAL PROVIDER INFORMATION
            </div>
            <div class="section-body">
                <asp:GridView ID="gvPCP" Width="750px" AutoGenerateColumns="False" AllowSorting="False" ShowStatusBar="True" BorderWidth="1px" BorderStyle="Solid"
                    runat="server" DataSourceID="odsPCP">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                        <asp:BoundField DataField="Planname" HeaderText="Plan Name" SortExpression="Planname"/>
                        <asp:BoundField DataField="PlanOffice1" HeaderText="Doctor Name" SortExpression="PlanOffice1"/>
                        <asp:BoundField DataField="PlanOffice2" HeaderText="Provider ID" SortExpression="PlanOffice2"/>
                        <asp:BoundField DataField="PlanOffice3" HeaderText="Medical Group IPA/Enrollment ID " SortExpression="PlanOffice3"/>
                    </Columns>
                    <EmptyDataTemplate>
                        None
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsPCP" runat="server" SelectMethod="GetEnrollmentFormPlans" TypeName="Pibt.BLL.EnrollmentForm">
                    <SelectParameters>
                        <asp:Parameter Name="oeId" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="planTypeId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;F. DENTAL PROVIDER INFORMATION
            </div>
            <div class="section-body">
                <asp:GridView ID="gvDental" Width="750px" AutoGenerateColumns="False" AllowSorting="False" ShowStatusBar="True" BorderWidth="1px"
                    BorderStyle="Solid" runat="server" DataSourceID="odsDental">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                        <asp:BoundField DataField="Planname" HeaderText="Plan Name" SortExpression="Planname"/>
                        <asp:BoundField DataField="PlanOffice1" HeaderText="Dental Office Name" SortExpression="PlanOffice1"/>
                        <asp:BoundField DataField="PlanOffice2" HeaderText="Provider ID" SortExpression="PlanOffice2"/>
                        <asp:BoundField DataField="PlanOffice3" HeaderText="Dental Office ID" SortExpression="PlanOffice3"/>
                    </Columns>
                    <EmptyDataTemplate>
                        None
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsDental" runat="server" SelectMethod="GetEnrollmentFormPlans" TypeName="Pibt.BLL.EnrollmentForm">
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
                <asp:GridView ID="gvConverageAddtional" Width="750px" AutoGenerateColumns="False" AllowSorting="False" ShowStatusBar="True" BorderWidth="1px"
                    BorderStyle="Solid" runat="server" DataSourceID="odsgvConverageAddtional">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"/>
                        <asp:BoundField DataField="Planname" HeaderText="Plan Name" SortExpression="Planname"/>
                        <asp:BoundField DataField="INSURANCEAMOUNT" HeaderText="Insurance Amount" SortExpression="INSURANCEAMOUNT" DataFormatString="{0:C}"/>
                    </Columns>
                    <EmptyDataTemplate>
                        None
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:ObjectDataSource ID="odsgvConverageAddtional" runat="server" SelectMethod="GetOEAdditionalInfo" TypeName="Pibt.BLL.EnrollmentForm">
                    <SelectParameters>
                        <asp:Parameter Name="oeId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;H. YOUR LEGAL ACKNOWLEDGMENT
            </div>
            <div class="section-body">
                <asp:CheckBox ID="chkReadLegalDoc" Checked="true" runat="server" Enabled="false" />
                I have read and understand the policy.
                <div class="LegalDocContent">
                    <asp:Literal ID="LegalDocContent" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="section-title">
                &nbsp;I. SIGNATURE
            </div>    
           <div class="section-body">
              <asp:Table ID="signatureDetails" runat="server" Width="80%">
                 <asp:TableRow >
                    <asp:TableCell HorizontalAlign="Left" >
                       <asp:Label ID="nameLabel"  runat="server" Font-Size="16" Text="Full Name:"/>
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
