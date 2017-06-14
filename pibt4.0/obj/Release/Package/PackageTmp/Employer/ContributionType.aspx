<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContributionType.aspx.cs" Inherits="Pibt.Employer.contributionType" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Contribution Section (2/2)</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <span style="color:#adf4ff;">Introduction > Comparative Costs</span> > Contribution Section (2/2)
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <asp:Panel ID="view2" runat="server">
                <fieldset>
                    <legend>Tell us the base to determine the amount that you will contribute?</legend>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:CustomValidator ID="customValidator1" runat="server" Display="Dynamic" ErrorMessage="*Please select one of the options" CssClass="required-info" ClientValidationFunction="customValidator" ValidationGroup="choices"></asp:CustomValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <asp:RadioButton ID="choice_2" runat="server" Text="<span class='simpleText' >Apply against the premium of the <u>lowest cost</u> plan offered</span>" GroupName="choices" />
                            <span class="simpleText" style="display: block; font-style: italic; padding: 10px 20px 30px 40px"><strong>Note:</strong> The "lowest cost plan" means that the lowest cost rates are on an employee by employee basis. Consequently, the lowest cost plan for one employee might be <span style="font-weight: bold; text-decoration: underline">different</span> from the lowest cost plan for another employee.</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:RadioButton ID="choice_1" runat="server" Text="<span class='simpleText' >Let me select a <u>base plan</u> against which to apply the contribution rate</span>" GroupName="choices" />
                            <span class="simpleText" style="display: block; font-style: italic; padding: 10px 20px 30px 40px"><strong>Note:</strong> Selection of a "base plan" means that only the selected plan's rates are used to determine the employer's cost. Consequently, the base plan for one employee is the <span style="font-weight: bold; text-decoration: underline">same</span> as the base plan for another employee.</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <asp:RadioButton ID="choice_3" runat="server" Text="<span class='simpleText' >Apply against the premium of <u>any plan</u> selected by the employee</span>" GroupName="choices" />
                            <span class="simpleText" style="display: block; font-style: italic; padding: 10px 20px 30px 40px"><strong>Note:</strong> Selecting this option means that the employer cost for each employee is based on applying the contribution percent against whatever plan the employee selects. Consequently, the employer's cost <span style="font-weight: bold; text-decoration: underline">varies</span> for each employee.</span>
                        </div>
                    </div>
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
                        <asp:Button ID="Continue" runat="server" CssClass="btn" Text="Continue" OnClick="Continue_Click" ValidationGroup="choices" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript">
        function customValidator(source, args) {
            args.IsValid = document.getElementById('<%= choice_1.ClientID %>').checked ||
                document.getElementById('<%= choice_2.ClientID %>').checked ||
                document.getElementById('<%= choice_3.ClientID %>').checked
        }
    </script>
</asp:Content>
