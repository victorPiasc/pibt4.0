<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenewalIntroduction.aspx.cs" Inherits="Pibt.Employer.RenewalIntroduction" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Renewal Introduction</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    Introduction >
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <div class="row" style="padding-bottom:35px;">
                <div class="col-md-12">
                    <div class="simpleText" >
                        Renewing your group health plan benefits takes a few steps. You can return to a previous step, "save for later" or, if you prefer, "start over" at any time. The <b>Dashboard</b> allows you to change inputs made previously.
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 simpleText">
                    <fieldset>
                        <legend>Steps of the Process</legend>
                        <div>
                            <a href="#" id="a_1" style="font-weight:bold; color:#004B84;" onclick='changeTab("c_1")'>A. Comparative Cost</a>
                        </div>
                        <div>
                            <img src="../images/Arrow.gif" />
                            <a href="#" id="a_2" onclick='changeTab("c_2")'>B. Contribution Section (1 of 2)</a>
                        </div>
                        <div style="padding-left:113px;">
                            <img src="../images/Arrow.gif" />
                            <a href="#" id="a_3" onclick='changeTab("c_3")'>C. Contribution Section (2 of 2)</a>
                        </div>
                        <div style="padding-left:227px;">
                            <img src="../images/Arrow.gif" />
                            <a href="#" id="a_4" onclick='changeTab("c_4")'>D. Dashboard</a>
                        </div>
                        <div style="padding-left:340px;">
                            <img src="../images/Arrow.gif" />
                            <a href="#" id="a_5" onclick='changeTab("c_5")'>E. Review Plans Selected</a>
                        </div>
                        <div style="padding-left:453px; color:#428bca;">
                            <img src="../images/Arrow.gif" />
                            F. Terms & Conditions and Finalize
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 simpleText" >
                    <fieldset style="height:200px;">
                        <legend id="stepName">A. Comparative Cost</legend>
                        <div id="c_1">
                            This page compares your expiring plans to renewal plans. The presentation assumes that all plans and all employee plan selections remain the same. The comparison allows you to review rate changes. You can also view employee level detail. If you prefer, you can renew your plans without changes.
                        </div>
                        <div id="c_2" style="display:none;">
                            Your contribution is the result of determining the percentage to be applied against a base rate. Alternatively, you can set a specific dollar amount to be contributed to each employee as a subsidy against their total benefit cost. This page develops the percentage or the dollar amount. This is the initial input and can be changed on the <b>Dashboard</b> page.
                        </div>
                        <div id="c_3" style="display:none;">
                            Your contribution is the result of determining the percentage to be applied against a base rate. This page identifies the base to which the percentage identified in Step B is applied. The base can be <b style="text-decoration:underline;">"lowest cost"</b>, a <b style="text-decoration:underline;">"base plan"</b> that you select, or <b style="text-decoration:underline;">"any plan"</b> selected by each employee. This is the initial input and can be changed on the <b>Dashboard</b> page.
                        </div>
                        <div id="c_4" style="display:none;">
                            This page allows you to select plans to offer to your employees. You start with the plans that you currently offer. You can compare, add and/or remove plans.  Each plan's cost information is calculated based on the inputs from Steps B and C, however these inputs can be changed and the page will be updated to reflect the effects of the new inputs. Furthermore, the cost information shown for the current plans assumes that all employees enrolled in the respective benefit continue to enroll in each plan.
                            <br /><br />
                            <b>Note:</b> If you select a new plan to add to your offering, the cost amounts assume that all employees enroll in the new plan.  While this is highly unlikely, there is no way to determine which employees may enroll in the new plan. 
                        </div>
                        <div id="c_5" style="display:none;">
                            This page is your final shopping cart and offers you a chance to review your selections. If you want to make changes, you will need to go <b>"back"</b> to the <b>Dashboard</b>. You can also elect to <b>"start over"</b> or <b>"save for later"</b>.
                            <br /><br />
                            If you <b>"continue"</b> you will be asked to indicate that you have reviewed the <b>Terms & Conditions</b> and sign the agreement. Selecting to <b>"continue"</b> from here will generate the Participation Agreement, a copy of which will be saved in your <b>Company Documents</b> folder on the portal.
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4" style="text-align: center">
                    <asp:Button ID="cancel" runat="server" CssClass="btn" Text="Cancel" OnClick="cancel_Click" />
                </div>
                <div class="col-md-4">&nbsp;</div>
                <div class="col-md-4" style="text-align: center">
                    <asp:Button ID="next" runat="server" CssClass="btn" Text="Next" OnClick="next_Click" style="width:70px;" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function changeTab(sender) {
            var c = document.getElementById(sender);
            var leg = document.getElementById("stepName");
            var tmp1, tmp2;
            for (var i = 1; i < 6; i++) {
                tmp1 = document.getElementById("c_" + i);
                tmp2 = document.getElementById("a_" + i);
                if (tmp1 == c) {
                    tmp1.style.display = "inline";
                    tmp2.style.fontWeight = "bold";
                    tmp2.style.color = "#004B84";
                    leg.innerHTML = tmp2.innerHTML;
                }
                else {
                    tmp1.style.display = "none";
                    tmp2.style.fontWeight = "normal";
                    tmp2.style.color = "#428bca";
                }
                    
            }
        }
    </script>
</asp:Content>