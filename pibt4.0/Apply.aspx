<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Apply.aspx.cs" Inherits="Pibt.apply" MasterPageFile="~/OnlineQuote.master" %>

<%@ Register Src="/UserControl/CtlQQ1.ascx" TagName="CtlQQ1" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlQQ2.ascx" TagName="CtlQQ2" TagPrefix="uc2" %>
<%@ Register Src="/UserControl/CtlQQ3.ascx" TagName="CtlQQ3" TagPrefix="uc3" %>
<%@ Register Src="/UserControl/CtlQQ4.ascx" TagName="CtlQQ4" TagPrefix="uc4" %>
<%@ Register Src="/UserControl/CtlQQ5.ascx" TagName="CtlQQ5" TagPrefix="uc5" %>
<%@ Register Src="/UserControl/CtlQQ6.ascx" TagName="CtlQQ6" TagPrefix="uc6" %>
<%@ Register Src="/UserControl/CtlQQ7.ascx" TagName="CtlQQ7" TagPrefix="uc7" %>
<%@ Register Src="/UserControl/CtlQQ8.ascx" TagName="CtlQQ8" TagPrefix="uc8" %>
<asp:Content ID="content2" ContentPlaceHolderID="contentBody" runat="server">
    <div id="contentWrapper">
        <div class="customer-info-box">
            <div class="row">
                <div class="column-12">
                    <asp:Literal ID="message" runat="server"></asp:Literal>
                    <div id="popup4" class="popup3">
                        <fieldset style="padding: 0px 10px 10px 10px !important; border: 1px solid #CFCFCE;">
                            <legend class="section-title">Upload:</legend>
                            <asp:UpdatePanel ID="fileUpload" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:FileUpload ID="fuCensus" runat="server" CssClass="form-control" Style="display: inline; margin-right: 10px" Width="250px" />
                                    <asp:Button ID="btnUpload" runat="server" CssClass="btn" Text="Replace Census" Style="margin-right: 20px;" OnClick="btnUpload_Click1" OnClientClick="if(! userConfirmation('Are you sure you want to replace the entire census below?')) return false;" />
                                    <asp:Button ID="cancel" runat="server" CssClass="btn-red" Text="Cancel" OnClientClick="genPopUp('popup4', false)" />
                                    <br />
                                    <asp:RegularExpressionValidator ID="revFuCensus" runat="server" ControlToValidate="fuCensus" ErrorMessage="Only .csv, .tsv and .txt allowed" ValidationExpression="(.*\.    ([Cc][Ss][Vv])|.*\.([Tt][Ss][Vv])|.*\.([Tt][Xx][Tt])|.*\.([Xx][Ll][Ss][Xx])|.*\.([Xx][Ll][Ss])$)" CssClass="required-info" Display="Static"></asp:RegularExpressionValidator>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnUpload" />
                                    <asp:PostBackTrigger ControlID="next" />
                                    <asp:PostBackTrigger ControlID="back" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div style="background: #9fc5f8;">
                <%-- Banner --%>
                <div class="row">
                    <div class="column-12 section-title">
                        <%--Introduction > Company Information > Association Setup > Departments > Employee Census > Dashboard > Final Quote > Terms & Conditions--%>
                        Introduction > Company Information > Departments > Employee Census > Dashboard > Final Quote > Terms & Conditions
                    </div>
                </div>
            </div>
            <div id="content1" runat="server">
                <div class="row">
                    <div class="column-10">
                        <asp:Literal ID="literal1" runat="server"></asp:Literal>
                    </div>
                </div>
                <asp:Panel ID="pageControls" runat="server">
                    <uc1:CtlQQ1 ID="page1" runat="server"></uc1:CtlQQ1>
                    <uc2:CtlQQ2 ID="page2" runat="server" Visible="false"></uc2:CtlQQ2>
                    <uc3:CtlQQ3 ID="page3" runat="server" Visible="false"></uc3:CtlQQ3>
                    <uc4:CtlQQ4 ID="page4" runat="server" Visible="false"></uc4:CtlQQ4>
                    <uc5:CtlQQ5 ID="page5" runat="server" Visible="false"></uc5:CtlQQ5>
                    <uc6:CtlQQ6 ID="page6" runat="server" Visible="false"></uc6:CtlQQ6>
                    <uc7:CtlQQ7 ID="page7" runat="server" Visible="false"></uc7:CtlQQ7>
                    <uc8:CtlQQ8 ID="page8" runat="server" Visible="false"></uc8:CtlQQ8>
                </asp:Panel>
                <div class="row">
                    <div class="column-6">
                        <asp:Button ID="back" runat="server" CssClass="btn" Text="Back" OnClick="back_Click" Visible="false" CausesValidation="false"/>
                    </div>
                    <div class="column-6">
                        <asp:Button ID="next" runat="server" CssClass="btn" Text="Continue" OnClick="next_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
