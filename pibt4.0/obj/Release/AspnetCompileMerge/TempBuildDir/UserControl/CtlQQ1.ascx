<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQQ1.ascx.cs" Inherits="Pibt.UserControl.CtlQQ1" %>
<div class="row">
    <div class="column-12">
        <fieldset>
            <legend>Steps of the Process</legend>
            <%-- <div>
                <a href="#" id="a_1" style="font-weight:bold; color:#004B84;" onclick='changeTab("c_1")'>A. PIASC Association </a>
            </div> --%>
            <div>
                <a href="#" id="a_1" style="font-weight:bold; color:#004B84;" onclick='changeTab("c_1")'>A. Company Information </a>
            </div>
            <div>
                <img src="../images/Arrow.gif" />
                <a href="#" id="a_2" onclick='changeTab("c_2")'>B. Department Set Up</a>
            </div>
            <div style="padding-left:113px;">
                <img src="../images/Arrow.gif" />
                <a href="#" id="a_3" onclick='changeTab("c_3")'>C. Employee Census Information</a>
            </div>
            <div style="padding-left:227px;">
                <img src="../images/Arrow.gif" />
                <a href="#" id="a_4" onclick='changeTab("c_4")'>D. Dashboard</a>
            </div>
            <div style="padding-left:340px;">
                <img src="../images/Arrow.gif" />
                <a href="#" id="a_5" onclick='changeTab("c_5")'>E. Review Plans Selected</a>
            </div>
            <%--<div style="padding-left:453px; color:#428bca;">
                <img src="../images/Arrow.gif" />
                F. Terms & Conditions and Finalize
            </div>--%>
        </fieldset>
    </div>
</div>
<div class="row">
    <div class="col-md-12 simpleText" >
        <fieldset style="height:200px;">
            <%--<legend id="stepName">A. PIASC Association</legend>
                <div id="c_1">
                Lou will return this one. 
            </div> --%>
            <legend id="stepName">A. Comparative Cost</legend>
            <div id="c_1">
                <p>You may have provided some of your employees' census information during the Quick Quote process.  You can elect to use that information provided or upload more complete information.  Many employers extract data from their payroll system and upload it to the Portal.  The more information that we obtain now, the less will be required from you and/or your employees during open enrollment.</p>
                <p>In order to make the open enrollment process more efficient, we offer you an enrollment template that pre-populates company information, benefits/plans you select to offer and employee/dependent information.  The result is an individualized form that can be distributed to each employee.</p>
            </div>
            <div id="c_2" style="display:none;">
                <p>This page asks you to set up "departments" to which you employees can be assigned.  Your monthly invoice will show the company's total cost split by department.  Some employers set up "departments" to mirror their general ledger accounts and/or payroll classifications.</p>
                <p>Department codes are limited to 10 digits and department descriptions are limited to 30 characters.</p>
                <p>If you prefer, you can set up departments at a later date.  However, employees will be assigned to a default department 100 - General.</p>
            </div>
            <div id="c_3" style="display:none;">
               <p>You may have provided some of your employees' census information during the Quick Quote process.  You can elect to use that information provided or upload more complete information.  Many employers extract data from their payroll system and upload it to the Portal.  The more information that we obtain now, the less will be required from you and/or your employees during open enrollment.</p>
                <p>In order to make the open enrollment process more efficient, we offer you an enrollment template that pre-populates company information, benefits/plans you select to offer and employee/dependent information.  The result is an individualized form that can be distributed to each employee.</p>
            </div>
            <div id="c_4" style="display:none;">
                <p>This page allows you to select plans to offer to your employees. You start with the plans that you selected in the quick quote. You can compare, add and/or remove plans. Each plan's cost information is calculated based on the inputs from the quick quote, however these inputs can be changed and the page will be updated to reflect the effects of the new inputs. Furthermore, the cost information shown plans assumes that all employees enroll in the plans offered. While this is highly unlikely, there is no way to determine which employees may enroll in the plans.</p>
            </div>
            <div id="c_5" style="display:none;">
                <p>This page is your final shopping cart and offers you a chance to review your selections. If you want to make changes, you will need to go <b>"back"</b> to the Dashboard. </p>
                <p>If you <b>"continue"</b> you will be asked to indicate that you have reviewed the <b>Terms & Conditions</b> and sign the agreement. Selecting to <b>"continue"</b> from here will generate the Participation Agreement, a copy of which will be saved in your <b>Company Documents</b> folder on the portal.</p>
            </div>
        </fieldset>
    </div>
</div>