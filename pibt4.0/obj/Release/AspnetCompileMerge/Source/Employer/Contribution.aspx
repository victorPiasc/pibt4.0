<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contribution.aspx.cs" Inherits="Pibt.Employer.Contribution" MasterPageFile="~/Content.master" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Contribution Section (1/2)</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <span style="color:#adf4ff;">Introduction > Comparative Costs</span> > Contribution Section (1/2)
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <asp:Panel ID="view1" runat="server">
                <asp:Literal ID="message" runat="server"></asp:Literal>
                <fieldset>
                    <legend>Tell us how you will be sharing the cost with your employees?</legend>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="simpleText" style="display:block">Currently your company makes the following contribution to the cost of all benefits:</span>
                            <span class="simpleText" style="font-size:12px">(You will have the option to modify this later.)</span>
                        </div>
                    </div>
                    <br />
                    <div class="row" style="text-align:center;">
                        <div class="col-md-4">
                            <span class="simpleText">Employee: </span>
                            <asp:Label ID="eeCount" runat="server" CssClass="simpleText bold" Font-Bold="true" ></asp:Label>
                        </div>
                        <div class="col-md-4">
                            <span class="simpleText">Dependent: </span>
                            <asp:Label ID="depCount" runat="server" CssClass="simpleText bold" Font-Bold="true" ></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <span class="simpleText">Are you interested in other contribution options?</span>
                        </div>
                    </div>
                    <asp:Panel ID="contButtons" runat="server">
                        <div class="row">
                            <div class="col-md-4" style="text-align: right">
                                <asp:Button ID="learnMore" runat="server" CssClass="btn" Text="Yes"  OnClientClick="showContributionOptions();return false;"/>
                            </div>
                            <div class="col-md-4" style="text-align: left">
                                <asp:Button ID="keepCur" runat="server" CssClass="btn" Text="No"  OnClick="keepCur_Click"/>
                            </div>
                        </div>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="morePanel" runat="server" style="display:none;">
                        <div class="row">
                            <div class="col-md-12">
                                <span class="simpleText" style="font-weight: bold;">1. How are you going to share cost with your employees and dependents? (*)</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-10" style="padding-left: 30px">
                                <asp:RadioButtonList ID="rdlPercentDollar" runat="server" onclick="radioButtonDisplay(this);" RepeatDirection="Vertical">
                                    <asp:ListItem Value="1"><span class="simpleText" >Percentage (e.g., company pays 50% of premium)</span></asp:ListItem>
                                    <asp:ListItem Value="2"><span class="simpleText" style="padding-top:20px" >Defined Contribution Amount (e.g., Company contributes $300 per month per employee<br /> toward medical premium regardless of the plan selected.)</span></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <br />
                        <asp:Panel ID="question2" runat="server" style="display:none;">
                            <div class="row">
                                <div class="col-md-12">
                                    <span class="simpleText" style="font-weight: bold">2. Now do you want to share cost on an overall (e.g., all benefit types) OR on a benefit-type basis?</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-10" style="padding-left: 30px">
                                    <asp:RadioButtonList ID="rdlPerType" runat="server" onclick="getRadioButtonValue(this);">
                                        <asp:ListItem Value="1"><span class="simpleText" >Apply to total cost of all benefit types</span></asp:ListItem>
                                        <asp:ListItem Value="2"><span class="simpleText" >Apply to each benefit type and indicate percent of cost shared</span></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </asp:Panel>
                        <br />
                        <asp:Panel ID="overallCont" runat="server" style="display:none">
                            <div class="row">
                                <div class="col-md-4" style="text-align: center;">
                                    <span class="simpleText">Employees: </span>
                                    <asp:TextBox ID="overAllContEE" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" ></asp:TextBox>&nbsp;
                                    <span class="simpleText">%</span>
                                </div>
                                <div class="col-md-4" style="text-align: left;">
                                    <span class="simpleText">Dependents:</span>
                                    <asp:TextBox ID="overAllContDep" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" ></asp:TextBox>&nbsp;
                                    <span class="simpleText">%</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4" style="text-align: center;">
                                    <asp:CustomValidator ID="csOverAllPercent" runat="server" CssClass="required-info" ErrorMessage="*50-100%" ControlToValidate="overAllContEE" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                </div>
                                <div class="col-md-4" style="text-align: center;">
                                    <asp:CustomValidator ID="csOverallDep" runat="server" CssClass="required-info" ErrorMessage="*0-100%" ControlToValidate="overAllContDep" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="overallDollar" runat="server" style="display:none">
                            <div class="row">
                                <div class="col-md-12">
                                    <span class="simpleText">Enter the dollar amount per employee per month. Later, we will check to see that your contribution is at least 50% of the least expensive plan offered from your selection.</span>
                                </div>
                            </div>
                            <div class="row" style="padding-top:15px">
                                <div class="col-md-4" style="text-align: center; ">
                                    <span class="simpleText">Employees: </span>
                                    <span class="simpleText">$</span>&nbsp;
                                    <asp:TextBox ID="dollarCont" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" ></asp:TextBox>
                                </div>
                                <div class="col-md-4" style="text-align: left;">
                                    <span class="simpleText">Dependents:</span>
                                    <span class="simpleText">$</span>&nbsp;
                                    <asp:TextBox ID="dollarDepCont" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4" style="text-align: center;">
                                    <asp:CustomValidator ID="csDollar" runat="server" CssClass="required-info" ErrorMessage="*number value greater than 0 " ControlToValidate="dollarCont" ClientValidationFunction="valDollar" Display="Dynamic"></asp:CustomValidator>
                                </div>
                                <div class="col-md-4" style="text-align: center;">
                                    <asp:CustomValidator ID="csDollarDep" runat="server" CssClass="required-info" ErrorMessage="*number value greater than 0" ControlToValidate="dollarDepCont" ClientValidationFunction="valDollar" Display="Dynamic"></asp:CustomValidator>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="perPlanTypeCont" runat="server" style="display:none">
                            <div class="row">
                                <div class="col-md-10">
                                    <table class="table-container" style="width: 100%">
                                        <tbody>
                                            <tr class="row">
                                                <td>&nbsp;</td>
                                                <td class="item-name" ><span class="simpleText bold und">Medical</span></td>
                                                <td class="item-name" ><span class="simpleText bold und">Dental</span></td>
                                                <td class="item-name" ><span class="simpleText bold und">Vision</span></td>
                                                <td class="item-name" ><span class="simpleText bold und">Chiropractic</span></td>
                                                <td class="item-name" ><span class="simpleText bold und">Mental Health</span></td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name"><span class="simpleText bold">Employee:</span></td>
                                                <td >
                                                    <asp:TextBox ID="top_1" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="top_2" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="top_3" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="top_4" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="top_5" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="required-info" ErrorMessage="* Employee Medical:50-100%" ControlToValidate="top_1" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator2" runat="server" CssClass="required-info" ErrorMessage="*Employee Dental :50-100%" ControlToValidate="top_2" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator3" runat="server" CssClass="required-info" ErrorMessage="*Employee Vison: 50-100%" ControlToValidate="top_3" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator4" runat="server" CssClass="required-info" ErrorMessage="*Employee Chiropractic: 50-100%" ControlToValidate="top_4" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator5" runat="server" CssClass="required-info" ErrorMessage="*Employee Mental Health: 50-100%" ControlToValidate="top_5" ClientValidationFunction="validateEE" ></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name"><span class="simpleText bold">Dependent:</span></td>
                                                <td >
                                                    <asp:TextBox ID="bot_1" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="bot_2" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="bot_3" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                                <td >
                                                    <asp:TextBox ID="bot_4" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                                 <td >
                                                    <asp:TextBox ID="bot_5" runat="server" CssClass="form-control" Style="display: none" Font-Size="16px" Height="20px" Width="60px" >
                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator6" runat="server" CssClass="required-info" ErrorMessage="*Dep Medical: 0-100%" ControlToValidate="bot_1" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator7" runat="server" CssClass="required-info" ErrorMessage="* Dep Dental: 0-100%" ControlToValidate="bot_2" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator8" runat="server" CssClass="required-info" ErrorMessage="*Dep Vision: 0-100%" ControlToValidate="bot_3" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator9" runat="server" CssClass="required-info" ErrorMessage="*Dep Chiropractic: 0-100%" ControlToValidate="bot_4" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                                </td>
                                                <td>&nbsp</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </asp:Panel>
                        <br />
                        <span class="simpleText" style="display:block; font-weight:bold; font-size:12px;">(*) Note that, employers must share in no less than 50% of benefit cost for groups under 100 employees.</span>
                        <span class="simpleText" style="display:block; font-weight:bold; font-size:12px;">Applicable large employers (ALE) can charge no more than 9.66% of an employee's W-2 (wages for medical benefits)</span>
                    </asp:Panel>
                </fieldset>
            </asp:Panel>
            <asp:Panel ID="buttons" runat="server" CssClass="dontprint">
                <div class="row">
                    <div class="col-md-4" style="text-align: center">
                        <asp:Button ID="Back" runat="server" CssClass="btn" Text="Back" OnClick="Back_Click" />
                    </div>
                    <div class="col-md-4" style="text-align: center">
                        <asp:Button ID="Save" runat="server" CssClass="btn" Text="Save For Later" OnClick="Save_Click" />
                    </div>
                    <div class="col-md-4" style="text-align: center">
                        <asp:Button ID="Continue" runat="server" CssClass="btn" Text="Continue" OnClick="Continue_Click" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <style>
        #PlaceHolderMain_MiddlePlaceHolder_MainContentPlaceHolder_rdlPercentDollar_1 {
            vertical-align:top;
        }
    </style>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script type="text/javascript">
        function showContributionOptions() {
            document.getElementById('<%= morePanel.ClientID %>').style.display = 'inline';
        }
        function radioButtonDisplay(radioButtonList) {
            for (var i = 0; i < radioButtonList.rows.length; ++i) {
                if (radioButtonList.rows[i].cells[0].firstChild.checked) {
                    if (radioButtonList.rows[i].cells[0].firstChild.value == 1) {
                        document.getElementById('<%= question2.ClientID%>').style.display = 'inline';
                        document.getElementById('<%= overallCont.ClientID %>').style.display = 'none';
                        document.getElementById('<%= overallDollar.ClientID %>').style.display = 'none';
                        document.getElementById('<%= dollarCont.ClientID%>').value = 
                            document.getElementById('<%= dollarDepCont.ClientID%>').value = "";
                    }
                    else {
                        document.getElementById('<%= question2.ClientID%>').style.display =
                            document.getElementById('<%= perPlanTypeCont.ClientID %>').style.display = 'none';
                        document.getElementById('<%= overallCont.ClientID %>').style.display = 'none';
                        document.getElementById('<%= overallDollar.ClientID %>').style.display = 'inline';
                        resetPerPlan();
                        resetOverall();
                        var x = document.getElementById('<%= rdlPerType.ClientID %>');
                        x.rows[0].cells[0].firstChild.checked = false;
                        x.rows[1].cells[0].firstChild.checked = false;
                    }
                }
            }
        }

        function getRadioButtonValue(radioButtonList) {
            for (var i = 0; i < radioButtonList.rows.length; ++i) {
                if (radioButtonList.rows[i].cells[0].firstChild.checked) {
                    if (radioButtonList.rows[i].cells[0].firstChild.value == 1) {
                        document.getElementById('<%= overallCont.ClientID %>').style.display = 'inline'; 
                        document.getElementById('<%= perPlanTypeCont.ClientID %>').style.display = 'none';
                        resetPerPlan();
                    }
                    else {
                        document.getElementById('<%= overallCont.ClientID %>').style.display = 'none';
                        document.getElementById('<%= perPlanTypeCont.ClientID %>').style.display = 'inline';
                        resetOverall();
                    }
                }
            }
        }

        function resetPerPlan() {
            document.getElementById('<%= top_1.ClientID%>').value = document.getElementById('<%= top_2.ClientID%>').value
                = document.getElementById('<%= top_3.ClientID%>').value = document.getElementById('<%= top_4.ClientID%>').value
                = document.getElementById('<%= top_5.ClientID%>').value = document.getElementById('<%= bot_1.ClientID%>').value
                = document.getElementById('<%= bot_2.ClientID%>').value = document.getElementById('<%= bot_3.ClientID%>').value
                = document.getElementById('<%= bot_4.ClientID%>').value = "";
        }

        function resetOverall() {
            document.getElementById('<%= overAllContEE.ClientID%>').value = document.getElementById('<%= overAllContDep .ClientID%>').value = "";
        }

        //TODO move to static file start
        function validateEE(source, args) {
            args.IsValid = validatePercentEE(args.Value);
        }

        function validateDep(source, args) {
            args.IsValid = validatePercentDep(args.Value);
        }

        function valDollar(source, args) {
            args.IsValid = validateDollar(args.Value);
        }
        //TODO move to static file end
    </script>
</asp:Content>
