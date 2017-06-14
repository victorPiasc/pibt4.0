<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQuickViewEr.ascx.cs" Inherits="Pibt.UserControl.CtlQuickViewEr" %>
<div class="simpleText" style="background-color:#F5F5F5;padding: 0px 15px; height:100%">
    <div class="row"  style="background-color:#006DBB;">
        <div class="col-md-12" style="color:#FFFFFF; padding:10px; text-align:center">
            <span id="ucEmployerName"></span> 
        </div>
    </div>
    <div class="row" style="padding:10px 0px;">
        <div class="col-md-12">
            <span id="ucAddress"></span>
        </div>
    </div>
    <div class="row" style="padding-bottom:10px;">
        <div class="col-md-12">
            <span id="ucCity"></span>,&nbsp;&nbsp;<span id="ucState"></span>&nbsp;&nbsp;<span id="ucZip"></span>
        </div>
    </div>
    <div class="row" style="padding-bottom:10px;">
        <div class="col-md-4">Primary Contact:</div>
        <div class="col-md-4"><span id="ucContact"></span></div>
    </div>
    <div class="row" style="padding-bottom:10px;">
        <div class="col-md-4">Phone Number:</div>
        <div class="col-md-4"><span id="ucPhone"></span></div>
    </div>
    <div class="row" style="padding-bottom:10px;">
        <div class="col-md-4">EMail address:</div>
        <div class="col-md-4"><span id="ucEmail"></span></div>
    </div>
    <div class="row" style="padding-bottom:10px;">
        <div class="col-md-12" style="text-align:center">
            <input class="btn-red" value="Hide" type="button" onclick="genPopUp('qvPopUp', false)" />
        </div>
    </div>
</div>