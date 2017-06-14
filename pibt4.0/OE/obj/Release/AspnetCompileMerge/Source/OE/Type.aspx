<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Type.aspx.cs" Inherits="Pibt.OE.Type" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> / Enroller Form
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <script>
      function redirect() {
         location.href = '/Employer/BusinessInfo.aspx';
      }
   </script>
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <fieldset>
        <legend>Please Select One:</legend>
        <div class="customer-info-box">
            <div class="section-body">
               <asp:Label ID="lb_Msg" runat="server" Font-Names="Open Sans"
                  Font-Bold="True" Font-Size="Large" ForeColor="Red" Visible="False"></asp:Label>
                <asp:RadioButtonList ID="rblTypes"  runat="server" Width="600px" Font-Size="Medium">
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="bottom-center-buttons">
            <asp:Button runat="server" CssClass="btn" ID="BtBack" Text="Previous" OnClick="BtBack_Click"
                Width="98px" />
            <asp:Button runat="server" CssClass="btn" ID="BtNext" Text="Continue" OnClick="BtNext_Click"
                Width="98px" />
           <input id="btnSaveAndExit" type="button" class="btn btn-danger" value="Save and Exit" onclick="redirect();" />
        </div>
        <div id="alertDialog" class="message-error">
            <asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
        </div>
    </fieldset>
    <fieldset>
        <legend>Definitions :</legend>
        <asp:Repeater ID="OEUseage" runat="server">
            <HeaderTemplate>
                <div id="accordion" class="OEUseage">
            </HeaderTemplate>
            <ItemTemplate>
                <h3>
                    <%#Eval("Description") %></h3>
                <div>
                    <p>
                        <%#Eval("Usage") %>
                    </p>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </fieldset>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            $(function () { $("#accordion").accordion({ heightStyle: "content", collapsible: true, active: false }); });

            function customRequestStart(sernder, args) {
            }

            function customResponseEnd(sernder, args) {
                $("#accordion").accordion({ heightStyle: "content" });
                if (args.EventTarget == "<%=BtNext.UniqueID %>") {
                    var msgHTML = $("#alertDialog").html();
                    if (msgHTML != "") {
                        PopupMsgDialog("alertDialog");
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
