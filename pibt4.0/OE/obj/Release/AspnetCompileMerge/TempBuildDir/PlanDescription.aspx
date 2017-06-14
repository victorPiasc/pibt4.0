<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanDescription.aspx.cs" Inherits="Pibt.PlanDescription" MasterPageFile="~/Website.master" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>

                <telerik:RadFormDecorator ID="RadFormDecorator2" DecoratedControls="All" ControlsToSkip="Fieldset,CheckBoxes"
                    DecorationZoneID="mainzone" runat="server" />

                <telerik:RadAjaxPanel ID="RadAjaxPanel1" EnableAJAX="true" ClientEvents-OnRequestStart="onRequestStart" ClientEvents-OnResponseEnd="OnResponseEnd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                    <!-- content start -->
                    <asp:Literal ID="placeHolder" runat="server"></asp:Literal>
                    <div >
                        <asp:PlaceHolder ID="tables" runat="server" ></asp:PlaceHolder>
                    </div>
                    <div>
                        <asp:PlaceHolder ID="pl" runat="server"></asp:PlaceHolder>
                    </div>
                    <!-- content end -->
                </telerik:RadAjaxPanel>
                <telerik:RadCodeBlock runat="server">
                    <script type="text/javascript" language="javascript">

                        var ajaxObjectId = "<%= RadAjaxPanel1.ClientID%>";
                        var ajaxObject = null;
                        function disableAjax() {
                            ajaxObject = $find(ajaxObjectId);
                            if (ajaxObject != null && ajaxObject.get_enableAJAX()) {
                                ajaxObject.set_enableAJAX(false);
                            }
                        }
                        function enableAjax() {
                            ajaxObject = $find(ajaxObjectId);
                            if (ajaxObject != null && !ajaxObject.get_enableAJAX()) {
                                ajaxObject.set_enableAJAX(true);
                            }
                        }
                        function onRequestStart(sender, args) {
                            ajaxObject = sender;
                            try {
                                if (typeof (customRequestStart) != 'undefined') {
                                    customRequestStart(sender, args);
                                }
                            } catch (ex) {
                            }
                            if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                                args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                                args.get_eventTarget().indexOf("ExportToPdfButton") >= 0) {
                                args.set_enableAjax(false);
                            }
                        }
                        function OnResponseEnd(sender, args) {
                            try {
                                if (typeof (customResponseEnd) != 'undefined') {
                                    customResponseEnd(sender, args);
                                }
                            } catch (ex) {
                            }
                        }
                        function scrollTop() {
                            window.document.body.scrollTop = 0;
                            window.document.documentElement.scrollTop = 0;
                        }
                    </script>
                </telerik:RadCodeBlock>
                
            </div>
        </div>
    </div>

</asp:Content>

