<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQQ3.ascx.cs" Inherits="Pibt.UserControl.CtlQQ3" %>
<%@ Register Src="/UserControl/CtlDepartments.ascx" TagName="CtlDepartments" TagPrefix="uc1" %>
<style>
    .simpleText{
        font-size: 14px;
    }
</style>
 <div class="row" >
    <div class="column-12">
        <span style="font-size: large; font-weight: bold;color: #085394;">Department Setup</span>
    </div>
     <div class="column-12 simpleText"> 
         The Portal allows you to assign each employee to a "department". Your monthly invoice will show the company's cost by department. Departments can be designed based on your general ledger accounts or other budget/cost center configurations. For Example:
     </div>
</div>
<div class="row simpleText">
    <div class="column-4">
        <div class="RadGrid RadGrid_MetroTouch " >
            <table class="rgMasterTable" style="width:100%;">
                <thead>
                    <tr>
                        <th scope="col" class="rgHeader">
                            Department<br />
                            Number
                        </th>
                        <th scope="col" class="rgHeader">
                            Description
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="rgRow">
                        <td>100</td>
                        <td>Admin</td>
                    </tr>
                    <tr class="rgRow">
                        <td>200</td>
                        <td>Sales</td>
                    </tr>
                    <tr class="rgRow">
                        <td>300</td>
                        <td>Manufactoring</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="column-4 simpleText" style="text-align:center;">
        OR
    </div>
    <div class="column-4">
        <div class="RadGrid RadGrid_MetroTouch ">
        <table class="rgMasterTable" style="width:100%;">
            <thead>
                <tr>
                    <th scope="col" class="rgHeader">
                        Department<br />
                        Number
                    </th>
                    <th scope="col" class="rgHeader">
                        Description
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr class="rgRow">
                    <td>100</td>
                    <td>Admin&nbsp;-&nbsp;Staff</td>
                </tr>
                <tr class="rgRow">
                    <td>150</td>
                    <td>Admin&nbsp;-&nbsp;Management</td>
                </tr>
                <tr class="rgRow">
                    <td>200</td>
                    <td>Sales&nbsp;-&nbsp;Staff</td>
                </tr>
                <tr class="rgRow">
                    <td>250</td>
                    <td>Sales&nbsp;-&nbsp;Management</td>
                </tr>
                <tr class="rgRow">
                    <td>300</td>
                    <td>Manufactoring&nbsp;-&nbsp;Staff</td>
                </tr>
                <tr class="rgRow">
                    <td>350</td>
                    <td>Manufactoring&nbsp;-&nbsp;Management</td>
                </tr>
            </tbody>
        </table>
            </div>
    </div>
</div>
<div class="row simpleText">
    <div class="column-12">
        Department numbers can have no more than 16 digits and the description is limited to 30 characters. In absence of departments and/or no assignment of employees to departments, the default is that employees are automatically coded to "100 - General"
    </div>
</div>
<div class="row">
    <div class="column-12">
        <uc1:CtlDepartments ID="ctlDepartments1" runat="server" />
    </div>
</div>