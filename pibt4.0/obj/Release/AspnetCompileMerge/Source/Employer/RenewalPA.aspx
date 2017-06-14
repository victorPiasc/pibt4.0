<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenewalPA.aspx.cs" Inherits="Pibt.Employer.RenewalPA" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Participation Agreement</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    Renewal Participation Agreement
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <div class="section-body ">
            <h3 class="noScreen">Renewal Participation  Agreement
            </h3>
            <fieldset>
                <legend><span class="legend_print">Company Information</span></legend>
                <table class="table-container simpleText" style="width: 100%">
                    <tr class="row print">
                        <td class="item-name">
                            <span class="print">Company Name:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lbCompanyName" runat="server"></asp:Label>
                        </td>
                        <td class="item-name">
                            <span class="print">DBA Name:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblDBa" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row print">
                        <td class="item-name">
                            <span class="print">Effective Date:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblEffective" runat="server"></asp:Label>
                        </td>
                        <td class="item-name">
                            <span class="print">FEIN:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblFein" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row print">
                        <td class="item-name">
                            <span class="print">Address:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblAddress" runat="server"></asp:Label>
                        </td>
                        <td class="item-name">
                            <span class="print">City:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblCity" runat="server"></asp:Label>
                        </td>
                        <td class="item-name">
                            <span class="print">State:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblState" runat="server"></asp:Label>
                        </td>
                        <td class="item-name">
                            <span class="print">Zip:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblZip" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row print">
                        <td class="item-name">
                            <span class="print">Phone:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblPhone" runat="server"></asp:Label>
                        </td>
                        <td class="item-name">
                            <span class="print">Fax:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblFax" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row print">
                        <td class="item-name">
                            <span class="print">Waiting Period for Future Hires:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblWaitingperiod" runat="server"></asp:Label>
                        </td>
                        <td class="item-name">
                            <span class="print">Number of Employees:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblNbrEmployees" runat="server"></asp:Label>
                        </td>
                        <td class="item-name" colspan="2">
                            <span class="print">Cobra Participants:</span>
                        </td>
                        <td class="item-value">
                            <asp:Label ID="Lblcobra" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend><span class="legend_print">Employer Contribution</span></legend>
                <asp:Panel ID="perPlanType" runat="server" Visible="false">
                    <table class="table-container simpleText" style="width: 80%">
                        <tbody>
                            <tr class="row ">
                                <td>&nbsp;</td>
                                <td class="item-name"><span class="print">Medical</span></td>
                                <td class="item-name"><span class="print">Dental</span></td>
                                <td class="item-name"><span class="print">Vision</span></td>
                                <td class="item-name"><span class="print">Chiro</span></td>
                                <td class="item-name"><span class="print">Mental Health</span></td>
                            </tr>
                            <tr class="row">
                                <td class="item-name"><span class="simpleText bold"><span class="print">Employee:</span></span></td>
                                <td class="item-name">
                                    <asp:TextBox ID="top_1" runat="server" CssClass="form-control print" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                                <td class="item-name">
                                    <asp:TextBox ID="top_2" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                                <td class="item-name">
                                    <asp:TextBox ID="top_3" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                                <td class="item-name">
                                    <asp:TextBox ID="top_4" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                                <td class="item-name">
                                    <asp:TextBox ID="top_5" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr class="row">
                                <td class="item-name"><span class="simpleText bold"><span class="print">Dependent:</span></span></td>
                                <td class="item-name">
                                    <asp:TextBox ID="bot_1" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                                <td class="item-name">
                                    <asp:TextBox ID="bot_2" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>

                                </td>
                                <td class="item-name">
                                    <asp:TextBox ID="bot_3" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                                <td class="item-name">
                                    <asp:TextBox ID="bot_4" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                                <td class="item-name">
                                    <asp:TextBox ID="bot_5" runat="server" CssClass="form-control" Style="display: none" Font-Size="16px" Height="20px" Width="60px" Enabled="false">
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </asp:Panel>
                <asp:Panel ID="dollar" runat="server" Visible="false">
                    <table class="table-container simpleText " style="width: 100%;">
                        <tr class="row print">
                            <td class="item-value">
                                <span class="bold">Employee Defined Contribution:</span>&nbsp;$<asp:Label ID="lbEEDollar" runat="server"></asp:Label>
                            </td>
                            <td class="item-value">
                                <span class="bold">Dependent Defined Contribution:</span>&nbsp;$<asp:Label ID="lbDepDollar" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </fieldset>
            <div class="pagebreak"></div>
            <fieldset>
                <legend><span class="legend_print">Company Selected Plans</span></legend>
                <asp:Panel ID="masterPanel" runat="server">
                    <telerik:RadGrid ID="radgrid_1" AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false" Skin="MetroTouch" BorderWidth="1px" BorderStyle="Solid" runat="server" OnNeedDataSource="med_NeedDataSource" Visible="false">
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" HeaderText="Medical" ItemStyle-CssClass="print_grid">
                                    <HeaderStyle Font-Bold="true" CssClass="print_grid" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <NoRecordsTemplate><span class="print">No plans added for this benefit type</span></NoRecordsTemplate>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <telerik:RadGrid ID="radgrid_2" AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false" BorderWidth="1px" Skin="MetroTouch" BorderStyle="Solid" runat="server" OnNeedDataSource="den_NeedDataSource" Visible="false">
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" HeaderText="Dental" ItemStyle-CssClass="print_grid">
                                    <HeaderStyle Font-Bold="true" CssClass="print_grid" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <NoRecordsTemplate><span class="print">No plans added for this benefit type</span></NoRecordsTemplate>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <telerik:RadGrid ID="radgrid_3" AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false" BorderWidth="1px" Skin="MetroTouch" BorderStyle="Solid" runat="server" OnNeedDataSource="vis_NeedDataSource" Visible="false">
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" HeaderText="Vision" ItemStyle-CssClass="print_grid">
                                    <HeaderStyle Font-Bold="true" CssClass="print_grid" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <NoRecordsTemplate><span class="print">No plans added for this benefit type</span></NoRecordsTemplate>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <telerik:RadGrid ID="radgrid_4" AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false" BorderWidth="1px" Skin="MetroTouch" BorderStyle="Solid" runat="server" OnNeedDataSource="chiro_NeedDataSource" Visible="false">
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" HeaderText="Chiropractic" ItemStyle-CssClass="print_grid">
                                    <HeaderStyle Font-Bold="true" CssClass="print_grid" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <NoRecordsTemplate><span class="print">No plans added for this benefit type</span></NoRecordsTemplate>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <telerik:RadGrid ID="radgrid_6" AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false" BorderWidth="1px" Skin="MetroTouch" BorderStyle="Solid" runat="server" OnNeedDataSource="vtl_NeedDataSource" Visible="false">
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" HeaderText="Voluntary Term Life" ItemStyle-CssClass="print_grid">
                                    <HeaderStyle Font-Bold="true" CssClass="print_grid" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <NoRecordsTemplate><span class="print">No plans added for this benefit type</span></NoRecordsTemplate>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <telerik:RadGrid ID="radgrid_7" AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false" BorderWidth="1px" Skin="MetroTouch" BorderStyle="Solid" runat="server" OnNeedDataSource="mtl_NeedDataSource" Visible="false">
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" HeaderText="Medical Term Life" ItemStyle-CssClass="print_grid">
                                    <HeaderStyle Font-Bold="true" CssClass="print_grid" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <NoRecordsTemplate><span class="print">No plans added for this benefit type</span></NoRecordsTemplate>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <telerik:RadGrid ID="radgrid_8" AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false" BorderWidth="1px" Skin="MetroTouch" BorderStyle="Solid" runat="server" OnNeedDataSource="mh_NeedDataSource" Visible="false">
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" HeaderText="Mental Health" ItemStyle-CssClass="print_grid">
                                    <HeaderStyle Font-Bold="true" CssClass="print_grid" />
                                </telerik:GridBoundColumn>
                            </Columns>
                            <NoRecordsTemplate><span class="print">No plans added for this benefit type</span></NoRecordsTemplate>
                        </MasterTableView>
                    </telerik:RadGrid>
                </asp:Panel>
                <telerik:RadGrid ID="terminatedPlans" AutoGenerateColumns="false" AllowSorting="false" AllowPaging="false" BorderWidth="1px" Skin="MetroTouch" BorderStyle="Solid" runat="server" OnNeedDataSource="terminatedPlans_NeedDataSource">
                    <MasterTableView>
                        <Columns>
                            <telerik:GridBoundColumn DataField="planName" HeaderText="Terminating Plans" ItemStyle-CssClass="print_grid">
                                <HeaderStyle Font-Bold="true" CssClass="print_grid" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="description" HeaderText="Benefit Type" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="print_grid" HeaderStyle-CssClass="print_grid"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="eeCount" HeaderText="Number of Employees" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="print_grid" HeaderStyle-CssClass="print_grid"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="depCount" HeaderText="Number of Dependents" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="print_grid" HeaderStyle-CssClass="print_grid"></telerik:GridBoundColumn>
                        </Columns>
                        <NoRecordsTemplate><span class="print">No plans are terminating</span></NoRecordsTemplate>
                    </MasterTableView>
                </telerik:RadGrid>
            </fieldset>
            <div class="pagebreak"></div>
            <div class="noPrint noScreen simpleText" style="font-size: 10px;">
                <fieldset>
                    <legend><span class="legend_print">Terms and Conditions</span></legend>
                    <asp:Literal ID="docs" runat="server">
                        <ol>
                            <li>The Company wishes to offer its "eligible" employees, as deemed by the Printing Industries Benefit Trust (the “Trust”), coverage under the employee benefit plans selected by the Company (the “Plan”) and offered by the Trust.</li>
                            <li>The Company shall participate in the Trust pursuant to the Amended and Restated Agreement and Declaration of the Trust of PIBT.</li>
                            <li>The Company shall enroll a minimum of 75% of active employees working 30 hours or more per week. The Company shall pay a minimum of 50% of the employee’s monthly premium of the least expensive medical plan offered and 50% of the monthly premium of the least expensive ancillary plan(s) (i.e., dental, vision, chiro, etc.). Please note: Applicable Large Employers (100 or more full-time employees or full-time equivalents) may be subject to penalties under the Affordable Care Act if they do not offer coverage to a sufficient number of or they require an employee to contribute more than 9.66% of W-2 wages for self-only coverage under the lowest cost medical option. See discussion of "Potential Liability under the Affordable Care Act" on the Administrative Guidelines found in the Online Documents at www.PIBT.org.</li>
                            <li>The Company shall give each eligible employee the opportunity to select coverage under any of the plan options selected by the Company and to elect coverage for his/her spouse and/or children who are eligible under the Plan; provided, that the cost of coverage to the extent that it exceeds the amount the Company contributes on behalf of each eligible employee, pursuant to paragraph 3 above, shall be paid by the eligible employee.</li>
                            <li>That Company shall remit to the Trust by the 10th day of each month the total contributions required under the Plan for the month.</li>
                            <li>The Company shall review the statement received from the Trust each month to verify that the coverage set forth therein for each eligible employee is correct and shall report any corrections to the Trust within 20 days following receipt of such statement.</li>
                            <li>Failure to remit to the Trust the contributions required under the Plan when due will cause the termination of coverage under the Plan for all eligible employees of the Company and their spouses and children. In any such event, the Trust shall further be entitled to take any appropriate legal action, including, but not limited to, action to recover all amounts due, interest thereon and expenses incurred, including reasonable attorneys’ fees, and coverage will not be reinstated.</li>
                            <li>The undersigned may voluntarily terminate its participation in the Trust 30 days after receipt by the Trust of written notice thereof.</li>
                            <li>Terminations are effective at the end of the month in which the employee was terminated.</li>
                            <li>This Agreement supersedes any prior agreements related to the subject matter of this Agreement.</li>
                            <li>In the absence of anything to the contrary, this Agreement will be continuous and will be deemed valid including any changes to plans or replacement plans offered.</li>
                        </ol>
                    </asp:Literal>
                </fieldset>
            </div>
            <fieldset>
                <legend><span class="legend_print">Signature</span></legend>
                <asp:Image ID="imgSignature" CssClass="" Width="650px" runat="server" /><br />
                <span class="simpleText bold"><span class="print">Authorized Company Representative:</span></span>
                <table class="table-container simpleText" style="width: 100%">
                    <tr class="row print">
                        <td class="item-value">
                            <span style="font-weight: bold">Name:&nbsp;</span><asp:Label ID="lblCrName" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td class="item-value">
                            <span style="font-weight: bold">Title:&nbsp;</span><asp:Label ID="lblCrTitle" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td class="item-value">
                            <span style="font-weight: bold">Date:&nbsp;</span><asp:Label ID="lblDate" runat="server"></asp:Label>
                        </td>

                    </tr>
                </table>
            </fieldset>
            <asp:Panel ID="buttons" runat="server" CssClass="dontprint">
                <div class="row">
                    <div class="col-md-3" style="text-align: center">
                        <asp:Button ID="Back" runat="server" CssClass="btn" Text="Back" OnClick="Back_Click" />
                    </div>
                    <div class="col-md-6" style="text-align: center">
                        <asp:Button ID="startOver" runat="server" CssClass="btn" Text="Start Over" OnClick="startOver_Click" />&nbsp;
                        <asp:Button ID="Save" runat="server" CssClass="btn" Text="Save For Later" OnClick="Save_Click" />
                    </div>
                    <div class="col-md-3" style="text-align: center">
                        <asp:Button ID="Continue" runat="server" CssClass="btn" Text="Finalize" OnClick="Continue_Click" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
