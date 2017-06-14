<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenewalTerms.aspx.cs" Inherits="Pibt.Employer.RenewalLegalDocs" MasterPageFile="~/Content.master" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server"> Terms & Conditions</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <span style="color:#333333;">Introduction > Comparative Costs > Contribution Section > Dashboard > Review Plans Selected</span> > Terms & Conditions
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <fieldset>
                <legend>
                    Terms and Conditions
                </legend>
                <div class="row">
                    <div class="col-md-12 simpleText">
                        <div style="min-height: 200px;max-height: 200px;overflow-y: scroll">
                            <asp:Literal ID="docs" runat="server" >
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
                        </div>
                    </div>
                </div>
            </fieldset>
            <br />
            <div class="row">
                <div class="col-md-12 simpleText">
                    <asp:CheckBox ID="accept" runat="server" TextAlign="Right"/>
                    <asp:Label ID="cbLabel" runat="server">I agree that I have read and understand the policy.</asp:Label>
                    <asp:CustomValidator ID="cvCheckBox" runat="server" CssClass="required-info" ErrorMessage="*You must select this box to proceed" EnableClientScript="true" ClientValidationFunction="checkBoxRequired" Display="Dynamic" ValidationGroup="input"></asp:CustomValidator>
                    <br />
                    Your signature indicates that you are an authorized representative of the company.
                </div>
            </div>
            <br />
            <div class="row simpleText">
                <div class="col-md-4">
                    <asp:Label ID="name" runat="server">Authorized Company Representative:</asp:Label>
                    <asp:TextBox ID="tbName" runat="server" style="display:inline;" CssClass="form-control" Font-Size="16px" Height="20px" MaxLength="60"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFname" runat="server" ControlToValidate="tbName" CssClass="required-info" ErrorMessage="*required" Display="Dynamic" ValidationGroup="input" ></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="title" runat="server">Title:</asp:Label>
                    <asp:TextBox ID="tbTitle" runat="server" style="display:inline;" CssClass="form-control" Font-Size="16px" Height="20px" MaxLength="30" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvfLname" runat="server" ControlToValidate="tbTitle" CssClass="required-info" ErrorMessage="*required" Display="Dynamic" ValidationGroup="input" ></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="date" runat="server">Date:</asp:Label>
                    <asp:Label ID="date2" runat="server"></asp:Label>
                </div>
            </div>
            <br />
            <fieldset>
                <div class="row">
                    <div class="col-md-2 simpleText" style="font-size: 30px;text-align: center;padding-top: 50px">
                        Sign here:
                    </div>
                    <div class="col-md-10">
                        <cc1:MouseSignature ID="ctlSignature" runat="server" SignImageScaleFactor="0.50" SignPenSize="2" BorderStyle="None" SignRequired="false" SignRequiredPoints="50" SignHeight="100" SignBackGroundImage="/img/sign-here.png" SignWidth="555" SignPenColor="red" SignStatusBar="true" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:CustomValidator ID="cvSignature" runat="server" CssClass="required-info" ErrorMessage="*You must sign before continuing" EnableClientScript="true" ClientValidationFunction="isSigned" Display="Dynamic" ValidationGroup="input"></asp:CustomValidator>
                    </div>
                </div>
            </fieldset>
            <br />
            <div class="row dontprint" >
                <div class="col-md-3" style="text-align: center">
                    <asp:Button ID="Back" runat="server" CssClass="btn" Text="Back" OnClick="Back_Click" />
                </div>
                <div class="col-md-6" style="text-align: center">
                    <asp:Button ID="startOver" runat="server" CssClass="btn" Text="Start Over" OnClick="startOver_Click" />&nbsp;
                    <asp:LinkButton ID="save" runat="server" CssClass="btn" Text="Save For Later" PostBackUrl="/Employer/BusinessInfo.aspx"></asp:LinkButton>
                </div>
                <div class="col-md-3" style="text-align: center">
                    <asp:Button ID="Continue" runat="server" CssClass="btn" Text="Continue" ValidationGroup="input" OnClick="Continue_Click" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function checkBoxRequired(sender, e) {
            var checkbox = document.getElementById('<%= accept.ClientID%>');
            e.IsValid = checkbox.checked;
        }

        function isSigned(sender, e){
            e.IsValid = SignatureTotalPoints('<%= ctlSignature.uID%>') >= 50;
        }
    </script>
</asp:Content>