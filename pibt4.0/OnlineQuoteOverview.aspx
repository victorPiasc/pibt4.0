<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuoteOverview.aspx.cs" Inherits="Pibt.OnlineQuoteOverview" MasterPageFile="~/OnlineQuote.master" %>
<%@ Register Src="/UserControl/CtlQQ6.ascx" TagName="CtlQQ6" TagPrefix="uc6" %>
<asp:Content ID="Content2" ContentPlaceHolderID="contentBody" runat="server">
    <style>
            .simpleText {
                font-size: 14px;
            }
        </style>
    <div id="contentWrapper">
        <div class="customer-info-box">
            <div style="background: #9fc5f8;">
                <div class="row">
                    <div class="column-12 section-title">
                        <a href="OnlineQuoteEmployer.aspx">Employer Information ></a>&nbsp;<a href="OnlineQuoteEmployee.aspx">Employee Census Information ></a>&nbsp;<a href="OnlineQuoteRates.aspx">DashBoard ></a>&nbsp;Quote
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="column-12">
                    <span style="font-size: large; font-weight: bold; color: #085394;">Step 4 of 4 - Estimated cost of the benefits and plans selected.</span>
                </div>
            </div>
            <uc6:CtlQQ6 ID="page6" runat="server" ></uc6:CtlQQ6>
           <%-- <div class="row simpleText">
                <div class="column-6">&nbsp;</div>
                <div class="column-6">
                    To save your quote or to enroll enter your email address and click on submit. 
                </div>
            </div>--%>
            <div class="row">
                <div class="column-6" style="text-align: center;">
                    <asp:Button ID="back" CssClass="btn" runat="server" CausesValidation="false" Text="Back" PostBackUrl="/OnlineQuoteRates.aspx"/>
                </div>
                <%--<div class="column-6" style="text-align: center;">
                    <span class="simpleText bold">Email:&nbsp;</span>
                    <asp:TextBox ID="email" runat="server" CssClass="form-control" style="display:inline; width:50%" ValidationGroup="submit" MaxLength="60"></asp:TextBox>
                    <asp:Button ID="submit" CssClass="btn" runat="server" Text="Submit" OnClick="submit_Click" ValidationGroup="submit" />
                    <div style="display:block">
                        <asp:RequiredFieldValidator ID="emailReq" runat="server" ControlToValidate="email" CssClass="required-info" ErrorMessage="*Email required to submit" ValidationGroup="submit"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="email" runat="server" ForeColor="Red" Font-Size="larger" ErrorMessage="*Please enter valid email address." Display="Dynamic" Text="*"></asp:RegularExpressionValidator>
                    </div>
                </div>--%>
            </div>
            <%--<div class="row">
                <div class="column-6">
                    &nbsp;
                </div>
                <div class="column-6">
                    <asp:Literal ID="submitResult" runat="server"></asp:Literal>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
