<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQuickViewInvoice.ascx.cs" Inherits="Pibt.UserControl.CtlQuickViewInvoice" %>
<div class="simpleText" style="background-color:#F5F5F5;padding: 0px 15px; height:100%">
    <div class="row" style="background-color:#006DBB;">
        <div class="col-md-12" style="color:#FFFFFF; padding:10px; text-align:center">
            <span id="iEmployerName"></span>
        </div>
    </div>
    <div class="row" style="padding:10px 0px;">
        <div class="col-md-12">
            <table>
                <thead>
                    <tr>
                        <th>
                        </th>
                        <th>
                            Date
                        </th>
                        <th>
                            Amount
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            Premium Billed
                        </td>
                        <td>
                            <span id="bDate"></span>
                        </td>
                        <td>
                            <span id="bAmount"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Adjustments
                        </td>
                        <td>
                            <span id="aDate"></span>
                        </td>
                        <td>
                            <span id="aAmount"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Premium Paid
                        </td>
                        <td>
                            <span id="pDate"></span>
                        </td>
                        <td>
                            <span id="pAmount"></span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
     <div class="row" style="padding-bottom:10px;">
        <div class="col-md-12" style="text-align:center">
            <input class="btn-red" value="Hide" type="button" onclick="genPopUp('qvInvoice', false)" />
        </div>
    </div>
</div>