<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuoteEmployee.aspx.cs" Inherits="Pibt.OnlineQuote" MasterPageFile="~/OnlineQuote.master" %>
<asp:Content ID="Content5" ContentPlaceHolderID="contentBody" runat="server">
    <div id="contentWrapper">
        <div class="customer-info-box">
                <div style="background: #9fc5f8;">
                    <div class="row">
                        <div class="column-12 section-title">
                            <a href="OnlineQuoteEmployer.aspx">Employer Information ></a>&nbsp;Employee Census Information
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="column-12">
                        <span style="font-size: large; font-weight: bold; color: #085394;">Step 2 of 4 - We need some information about the employees to be covered.</span>
                    </div>
                    <div class="column-12">
                        <fieldset style="padding: 0px 10px 10px 10px !important; border: 1px solid #CFCFCE;">
                            <legend class="section-title">Requirements:</legend>
                            Entering insured data:
                            <ol>
                                <li>You can upload a file with the required data in one of these formats: .csv, .tsv, .txt, .xlsx, .xls </li>
                                <li>You can input individual insureds</li>
                            </ol>
                        </fieldset>
                    </div>
                    <div class="column-12">
                        <fieldset style="padding: 0px 10px 10px 10px !important; border: 1px solid #CFCFCE;">
                            <legend class="section-title">Upload:</legend>
                            <asp:UpdatePanel ID="updatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:FileUpload ID="fuCensus" runat="server" CssClass="form-control" Style="display: inline; margin-right: 10px" Width="250px" />
                                    <asp:Button ID="btnUpload" runat="server" CssClass="btn" Text="Upload" Style="margin-right: 20px;" OnClick="btnUpload_Click" />
                                    <a href="\Documents\QucikQuoteTemplate.xlsx" target="_blank">Download Template</a>
                                    <br />
                                    <asp:RegularExpressionValidator ID="revFuCensus" runat="server" ControlToValidate="fuCensus" ErrorMessage="Only .csv, .tsv and .txt allowed" ValidationExpression="(.*\.([Cc][Ss][Vv])|.*\.([Tt][Ss][Vv])|.*\.([Tt][Xx][Tt])|.*\.([Xx][Ll][Ss][Xx])|.*\.([Xx][Ll][Ss])$)" CssClass="required-info" Display="Static"></asp:RegularExpressionValidator>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnUpload" />
                                    <asp:PostBackTrigger ControlID="submit" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </fieldset>
                    </div>
                    <div class="column-12">
                        <fieldset style="padding: 0px 10px 10px 10px !important; border: 1px solid #CFCFCE;">
                            <legend class="section-title">Employee Information:</legend>
                            <asp:UpdatePanel runat="server" ID="phEmployeeDetails">
                                <ContentTemplate>
                                    <div class="simpleText">
                                        Employee Count:&nbsp;<asp:Label ID="eeCount" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Literal ID="lblCreationMessage" runat="server" ></asp:Literal>
                                        <asp:CustomValidator ID="batchValid" runat="server" CssClass="required-info" ErrorMessage="*The grid has been modifed, please save changed before continuing." Display="Static" ClientValidationFunction="hasChanges" ValidationGroup="empInputGroup"></asp:CustomValidator>
                                    </div>
                                    <style>
                                        #ctl00_ctl00_ContentPlaceHolder1_contentBody_employeeRadGrid_ctl00_ctl02_ctl00_SaveChangesIcon,
                                        #ctl00_ctl00_ContentPlaceHolder1_contentBody_employeeRadGrid_ctl00_ctl02_ctl00_CancelChangesIcon{
                                            background-color: #006DBB;
                                            margin-left: 40px;
                                        }
                                    </style>
                                    <div class="section-body">
                                        <asp:Button ID="add" runat="server" Text="Add Employee" CssClass="btn" ValidationGroup="inputGroup" OnClick="add_Click" />
                                        <br />
                                        <div id="popup1" class="popup2" style="width:65%; padding:20px;" runat="server">
                                            <div class="sectionHeader" >
                                                Add dependent to :&nbsp<asp:Label ID="eeName" runat="server"></asp:Label> 
                                            </div>
                                            <div class="simpleText">
                                                What kind of dependent do you want to add?
                                            </div>
                                            <asp:HiddenField ID="hFamId" runat="server" />
                                            <div class="row">
                                                <div class="column-4">
                                                    <asp:Button ID="spouseBtn" runat="server" Text="Spouse" CssClass="btn" OnClick="dep_Click" CommandName="1" />
                                                </div>
                                                <div class="column-4">
                                                    <asp:Button ID="childBtn" runat="server" Text="Child" CssClass="btn" OnClick="dep_Click" CommandName="2" />
                                                </div>
                                                <div class="column-4">
                                                    <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="btn-red" OnClick="dep_Click" CommandName="cancel" />
                                                </div>
                                            </div>
                                        </div>
                                        <telerik:RadGrid ID="employeeRadGrid" AllowMultiRowSelection="false" runat="server" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="false" Skin="MetroTouch" GridLines="None" ShowStatusBar="true" OnNeedDataSource="employeeGrid_NeedDataSource" OnDeleteCommand="employeeRadGrid_DeleteCommand" OnBatchEditCommand="employeeRadGrid_BatchEditCommand" OnItemCommand="employeeRadGrid_ItemCommand" OnItemDataBound="employeeRadGrid_ItemDataBound">
                                            <MasterTableView CommandItemDisplay="Top" DataKeyNames="ROWID,EMPLOYEETYPEID" EditMode="Batch">
                                                <CommandItemSettings ShowAddNewRecordButton="false" ShowSaveChangesButton="true" ShowRefreshButton="false" ShowCancelChangesButton="true" />
                                                <BatchEditingSettings EditType="Cell" />
                                                <Columns>
                                                    <telerik:GridBoundColumn UniqueName="ROWID" DataField="ROWID" Display="false"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn UniqueName="EMPLOYEETYPEID" DataField="EMPLOYEETYPEID" Display="false"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn UniqueName="familyId" DataField="familyId" Display="false"></telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn UniqueName="employeeName" HeaderText="Name" HeaderStyle-Width="250px" >
                                                        <ItemTemplate>
                                                            <span class="form-control" style="width: 200px;"><%#Eval("employeeName") %></span>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="tbName" runat="server" CssClass="form-control" Text='<%# Eval("employeeName") %>' Style="display: inline; width: 200px;" ></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="nameValid" runat="server" ForeColor="Red" ControlToValidate="tbName" ErrorMessage="*" Display="Static"></asp:RequiredFieldValidator>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn UniqueName="employeeType" HeaderText="Type" DataField="employeeType" SortExpression="employeeType" ReadOnly="true"></telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn UniqueName="birthdate" HeaderText="Birthdate">
                                                        <ItemTemplate>
                                                            <span class="form-control" style="width: 120px;"><%# DateTime.Parse(Eval("Birthdate").ToString()).ToShortDateString() %></span>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <telerik:RadDatePicker ID="dpBirthDate" MinDate="1900/1/1" runat="server" Height="34" SelectedDate='<%#Eval("Birthdate") %>' Width="110px"></telerik:RadDatePicker>
                                                            <asp:RequiredFieldValidator ID="dateValid" runat="server" ForeColor="Red" ControlToValidate="dpBirthDate" ErrorMessage="*" Display="Static"></asp:RequiredFieldValidator>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="gender" HeaderText="Gender">
                                                        <ItemTemplate>
                                                            <span class="form-control" style="width: 100px;"><%# "Y".Equals(Eval("male"))? "Male":"Female" %></span>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddlGenderGrid" runat="server" CssClass="form-control" Width="100" Style="display: inline;">
                                                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                                             </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="ddlGenderValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlGenderGrid" ValidationGroup="inputGroup" InitialValue="4"></asp:RequiredFieldValidator>
                                                        </EditItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridButtonColumn UniqueName="addDep" HeaderText="Add Dependent" Text="Add Dependent" CommandName="addDep" ButtonCssClass="btn" ItemStyle-ForeColor="White" ButtonType="PushButton"></telerik:GridButtonColumn>
                                                    <telerik:GridButtonColumn UniqueName="DELETECOLUMN" HeaderText="Remove" Text="Delete" CommandName="DELETE" ButtonType="PushButton" ButtonCssClass="btn" ItemStyle-ForeColor="white"></telerik:GridButtonColumn>
                                                </Columns>
                                            </MasterTableView>
                                        </telerik:RadGrid>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="add" />
                                    <asp:PostBackTrigger ControlID="employeeRadGrid" />
                                    <asp:PostBackTrigger ControlID="submit" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </fieldset>
                    </div>
                </div>
            <telerik:RadCodeBlock runat="server">
                <script type="text/javascript">
                    function hasChanges(source, args) {
                        var grid = $find('<%= employeeRadGrid.ClientID %>'),
                            batchManager = grid.get_batchEditingManager();
                        args.IsValid = (batchManager._extractChangesString(grid.get_masterTableView()) === "");
                    }
                </script>
            </telerik:RadCodeBlock>
            <div class="row">
                <div class="column-6" style="text-align: center;">
                    <asp:Button ID="back" CssClass="btn" runat="server" CausesValidation="false" Text="Back" PostBackUrl="/OnlineQuoteEmployer.aspx"/>
                </div>
                <div class="column-6" style="text-align: center;">
                    <asp:Button ID="submit" CssClass="btn" runat="server" ValidationGroup="empInputGroup" Text="Next"  OnClick="submit_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
