<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAdditionalInfoView.ascx.cs"
    Inherits="Pibt.UserControl.CtlAdditionalInfoView" %>
<div class="customer-info-box">
    <script type="text/javascript">
        function iShow() {
            document.getElementById('iData').style.display = 'block';
            document.getElementById('iMarker').style.display = 'none';
        }
    </script>
    <div class="section-title">
        Additional Information
    </div>
    <div class="section-body">
        <asp:FormView ID="fvEmployer" runat="server" Width="100%" BorderWidth="0px" DataSourceID="odsEmployer">
            <ItemTemplate>
                <table class="table-container">
                    <tr class="row">
                        <td class="item-name" style="padding-top:5px; padding-bottom:5px;" >
                            Waiting Period:
                        </td>
                        <td class="readonly-view item-Value ">
                            <span class="data"><%#Eval("WaitingPeriod")%></span>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name" style="padding-top:5px; padding-bottom:5px;" >
                            Enroller:
                        </td>
                        <td class="readonly-view item-Value ">
                            <span class="data"><%#Eval("Enroller")%></span>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name" style="padding-top:5px; padding-bottom:5px;">
                            Team Lead:
                        </td>
                        <td class="readonly-view item-Value ">
                            <span class="data"><%#Eval("TeamLead")%></span>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name" style="padding-top:5px; padding-bottom:5px;">
                            Relationship Keeper:
                        </td>
                        <td class="readonly-view item-Value ">
                            <span class="data"><%#Eval("RK")%></span>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name" style="padding-top:5px; padding-bottom:5px;">
                            Terms:
                        </td>
                        <td class="readonly-view item-Value ">
                            <span class="data"><%#Eval("Term")%></span>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name" style="padding-top:5px; padding-bottom:5px;">
                            Tax ID:
                        </td>
                        <td class="readonly-view item-Value ">
                            <span class="data"><%#Eval("Taxid")%></span>
                        </td>
                    </tr>
                    <tr class="row" id="sicRow">
                        <td class="item-name" style="padding-top:5px; padding-bottom:5px;">
                            SIC:
                        </td>
                        <td class="readonly-view item-Value ">
                            <span class="data" id="sicSpan"><%#Eval("Sic")%></span>
                        </td>
                    </tr>
                    <tr class="row" id="natureRow">
                        <td class="item-name" style="padding-top:5px; padding-bottom:5px;">
                            Nature of Business:
                        </td>
                        <td class="readonly-view item-Value ">
                            <span class="data" id="natureSpan"><%#Eval("NatureOfBiz")%></span>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name" colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <%--<tr class="row">
                        <td class="item-name" colspan="2">
                            <u>Employer Monthly Contributions<span id="iMarker" onclick="iShow()">&nbsp;&nbsp;&#x24be;</span></u>
                        </td>
                    </tr>--%>
                </table>
                <%-- TODO 
                        If dollar contribution exist display dollar only
                        If all contributions are the same, display overall percent 
                        Else display contribution on a benefit type basis --%>
                <%--<table class="table-container" id="iData" style="display:none;">
                    <tr class="row">
                        <td class="item-name">
                            There are a number of ways in which you can manage your company's contribution to you employees' insurance:<br /><br />
                            <ol>
                                <li>
                                    You can define an across-the-board contribution to all insurance plans, at one rate for employees, and at another rate for
                                    their dependents.  For instance, you could cover 100% of the employees' costs and 75% of their dependents' costs.  You would do
                                    this in the "For Employees (as %)" and "For Dependents (as %)" fields on this page.
                                </li>
                                <li>
                                    You can define these percentages on a plan-type by plan-type basis.  For instance, you could pay 100% of employee medical, 90%
                                    of dependent medical, 80% of employee dental, 70% of dependent dental, and so on.  You would do this in the "Employee %" and
                                    "Dependent %" columns in the table on this page.
                                </li>
                                <li>
                                    You can define a dollar amount that you're willing to pay, overall, for the combined coverages for each employee (in the "For
                                    Employees (as $)" field on this page), and for the employees' families (in the "For Dependents (as $)" field on this page).
                                    This is called "defined benefits", and lets you know up front what your costs will be.
                                </li>
                                <li>
                                    You may offer special deals to specific classes of employees.  To do that, go to the Employee page and enter dollar amounts or
                                    percentages in the "For Employee (as %)", "For Dependents (as %)", "For Employee (as $)", and/or "For Dependents (as $)"
                                    fields.
                                </li>
                            </ol>
                            When we run invoices, we can run a costing report for you with those invoices, detailing what you will pay for the insurance, and what
                            your employees will pay.  The quotes and reports this system provides will compare all the ways of calculating contributions you enter,
                            and pick the rule that's best for the employee.  Note that no you must enter at least 50% into the table cell showing the percentage
                            contribution for employees' medical coverage.  For large companies, some federal rules apply, and those will enter into the
                            calculations as well.<br /><br />
                        </td>
                    </tr>
                </table>
                <table class="table-container">
                    <tr class="row">
                        <td class="item-name">
                            For Employees (as %):
                        </td>
                        <td class=" readonly-view item-Value tcell-padding">
                            <span class="data"><asp:Label ID="eePercent" runat="server" Text='<%#Eval("EeContribution")%>' Height="26px" Font-Size="14px" ></asp:Label></span>
                        </td>
                        <td>
                            &nbsp;
                            <asp:CheckBox ID="ofBase" runat="server" Text="(of lowest cost plan)" TextAlign="Right" Checked='<%# Eval("ofBase").ToString().Equals("Y") ? true : false %>'  Enabled="false"/>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            For Dependents (as %):
                        </td>
                        <td class=" readonly-view item-Value tcell-padding">
                            <span class="data"><asp:Label ID="depPercent" runat="server" Text='<%#Eval("Depcontribution")%>'  Height="26px" Font-Size="14px" ></asp:Label></span>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            For Employees (as $):
                        </td>
                        <td class=" readonly-view item-Value tcell-padding">
                            <span class="data"><asp:Label ID="eeAmount" runat="server" Text='<%#Eval("EeDollar")%>' Height="26px" Font-Size="14px" ></asp:Label></span>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            For Dependents (as $):
                        </td>
                        <td class=" readonly-view item-Value tcell-padding">
                            <span class="data"><asp:Label ID="depAmount" runat="server" Text='<%#Eval("DepDollar")%>' Height="26px" Font-Size="14px" ></asp:Label></span>
                        </td>
                    </tr>
                </table>--%>
            </ItemTemplate>
        </asp:FormView>
        <br />
        <table class="table-container">
            <tbody >
                <tr class="row">
                    <td class="item-name">
                        <u>Benefit&nbsp;Type:</u>
                    </td>
                </tr>
                <tr class="row" style="border-bottom: solid;text-align:center" >
                    <td class="item-name">&nbsp;</td>
                    <td class="item-name">Employee&nbsp;%
                    </td>
                    <td >&nbsp;</td>
                    <td class="item-name">Dependent&nbsp;%
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="row">
                    <td class="item-name">Medical:
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="left_1" runat="server" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                    <td style="text-align:center;">
                        <asp:CheckBox ID="middle_1" runat="server" Text="of lowest cost" Enabled="false" />
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="right_1" runat="server" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">Dental:
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="left_2" runat="server" MaxLength="6" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                    <td style="text-align:center;">
                        <asp:CheckBox ID="middle_2" runat="server" Text="of lowest cost"  Enabled="false" />
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="right_2" runat="server" MaxLength="6" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">Vision:
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="left_3" runat="server" MaxLength="6" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                    <td style="text-align:center;">
                        <asp:CheckBox ID="middle_3" runat="server" Text="of lowest cost" Enabled="false"/>
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="right_3" runat="server" MaxLength="6" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">Chiro:
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="left_4" runat="server" MaxLength="6" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                    <td style="text-align:center;">
                        <asp:CheckBox ID="middle_4" runat="server" Text="of lowest cost" Enabled="false" />
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="right_4" runat="server" MaxLength="6" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">Mental Health:
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="left_5" runat="server" MaxLength="6" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                    <td style="text-align:center;">
                        <asp:CheckBox ID="middle_5" runat="server" Text="of lowest cost" Enabled="false" />
                    </td>
                    <td class="item-Value tcell-padding" style="text-align:center;">
                        <asp:Label ID="right_5" runat="server" MaxLength="6" Height="26px" Font-Size="14px"></asp:Label>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <asp:ValidationSummary DisplayMode="BulletList" runat="server" CssClass="required-info" ValidationGroup="update" />
        <asp:Literal ID="Message" runat="server"></asp:Literal>
    </div>
</div>
<asp:ObjectDataSource ID="odsEmployer" runat="server" SelectMethod="GetBizInfoDetails2"
    TypeName="Pibt.BLL.Employer" OnSelecting="odsEmployer_Selecting">
    <SelectParameters>
        <asp:Parameter Name="employerId" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<script type="text/javascript">
    if (document.getElementById('sicSpan').innerHTML == '')
        document.getElementById('sicRow').style.display = 'none';
    if (document.getElementById('natureSpan').innerHTML == '')
        document.getElementById('natureRow').style.display = 'none';
</script>