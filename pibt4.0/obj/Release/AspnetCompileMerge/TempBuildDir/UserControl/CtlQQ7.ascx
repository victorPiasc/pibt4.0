<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQQ7.ascx.cs" Inherits="Pibt.UserControl.CtlQQ7" %>
<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<div class="row">
    <div class="column-12">
        <fieldset>
            <legend>Terms and Conditions
            </legend>
            <div style="min-height: 200px; max-height: 200px; overflow-y: scroll">
                <asp:Literal runat="server">
                    <ol style="padding-left:25px; list-style-type:decimal;">
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
                    <div>
                        IN WITNESS WHEREOF the company has executed this Agreement as of the date below. 
                    </div>
                </asp:Literal>
            </div>
        </fieldset>
    </div>
</div>
<div class="simpleText">
    <div class="row">
        <div class="column-6">
            Full Name:
            <asp:TextBox ID="fullName" runat="server" CssClass="form-control" Style="display: inline; width: 80%;" MaxLength="60" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="nameValid" runat="server" ControlToValidate="fullName" ErrorMessage="*" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
        </div>
        <div class="column-6">
            Title:
            <asp:TextBox id="title" runat="server" CssClass="form-control" Style="display: inline; width: 80%;" MaxLength="30" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="titleValid" runat="server" ControlToValidate="title" ErrorMessage="*" ForeColor="Red" Display="Static" ></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="column-9">
            Sign Here:
            <cc1:MouseSignature ID="ctlSignature" runat="server" SignImageScaleFactor="0.50" SignPenSize="2" BorderStyle="None" SignRequired="false" SignRequiredPoints="50" SignHeight="100" SignBackGroundImage="/img/sign-here.png" SignWidth="555" SignPenColor="red" SignStatusBar="true" />
        </div>
        <div class="column-3">
            Date:<asp:Label ID="date" runat="server"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="column-12">
            <asp:CustomValidator ID="cvSignature" runat="server" CssClass="required-info" ErrorMessage="*You must sign before continuing" EnableClientScript="true" ClientValidationFunction="isSigned" Display="Dynamic"></asp:CustomValidator>
        </div>
    </div>
</div>
<script type="text/javascript">
        function isSigned(sender, e){
            e.IsValid = SignatureTotalPoints('<%= ctlSignature.ClientID%>') >= 50;
        }
</script>