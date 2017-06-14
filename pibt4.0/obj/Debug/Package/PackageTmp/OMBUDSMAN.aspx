<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeBehind="OMBUDSMAN.aspx.cs" Inherits="Pibt.OMBUDSMAN" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <h1>OMBUDSMAN</h1>
                <hr />
                <p><b>What is an Ombudsman?</b></p>
                An Ombudsman is a person who serves as an advocate in promptly addressing your concerns, issues or questions.<br />
                An Ombudsman works to support your basic right to be treated fairly and with respect.
            </div>
        </div>
        <div class="row">
            <div class="column-12">
                <h2>Our <%=Pibt.Common.Utilities.Us()%> Ombudsman is your:</h2>
                <br />
                <p><strong>Advocate</strong></p>
                <ul class="disc">
                    <li>Consumer advocate for our members</li>
                    <li>Promotes awareness of key benefits such as prescription & free Preventive Services</li>
                    <li>Finds answers to questions about specific aspects of covered benefits and services</li>
                    <li>Guidance regarding fee or treatment estimates</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="column-12">
                <p><strong>Problem solver</strong></p>
                <ul class="disc">
                    <li>Address claims issues or questions</li>
                    <li>Investigate complaints or grievances between members and carriers</li>
                    <li>Listen to and follow up on concerns about services</li>
                    <li>Verify that identified problems have been promptly & effectively addressed</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="column-12">
                <p><strong>Liaison</strong></p>
                <ul class="disc">
                    <li>Personal visits as part of outreach program</li>
                    <li>Create awareness of total <%=Pibt.Common.Utilities.Us()%> package, including website on-line provisions</li>
                    <li>Discuss observations and concerns related to group health benefits</li>
                    <li>Assist in navigating through healthcare benefits options</li>
                    <li>Available for Open Enrollment meetings</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="column-12">
                <p><strong>For more information</strong>, contact Mario Geraci at (323) 728-9500 ext. 227 or
                   <a href="mailto:mario@piasc.org"><u>mario@piasc.org</u></a>.</p>
            </div>
        </div>
    </div>
</asp:Content>
