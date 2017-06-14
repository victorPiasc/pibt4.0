<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true"
    CodeBehind="Carriers.aspx.cs" Inherits="Pibt.Carriers" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
&nbsp; &nbsp;&gt; <span><a href="/ContactUs.aspx">Contact Us</a></span> &gt; <span>Carriers</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <h1>
        Carriers</h1>
     &nbsp;<style>
        .awards p { padding-left: 15px; margin-right: 15px; font-size: 15px;}
        .awards span { float:right; margin-right: 15px; }
                                          .auto-style1 {
                                             width: 100%;
                                          }
                                          .auto-style2 {                 width: 972px;
              }
                                          .auto-style4 {
                 font-size: large;
              }
              .auto-style10 {
                 width: 972px;
                 height: 54px;
              }
              .auto-style11 {
                 width: 412px;
                 height: 54px;
                 text-align: left;
              }
                     .auto-style14 {
                 width: 412px;
                 text-align: left;
              }
              .auto-style18 {
                 width: 982px;
                               text-align: left;
                            }
                            .auto-style24 {
                               font-size: x-large;
                               background-color: #FFFFFF;
                            }
                            .auto-style25 {
                 width: 412px;
                 height: 54px;
                 text-align: left;
                 background-color: #FFFFFF;
              }
                            .auto-style27 {
                 height: 54px;
                 background-color: #FFFFFF;
                 width: 972px;
              }
                            .auto-style29 {
                               background-color: #FFFFFF;
                            }
                            .auto-style30 {
                 height: 54px;
                 text-align: left;
                 width: 982px;
                 background-color: #FFFFFF;
              }
                            .auto-style33 {
                               height: 54px;
                               font-size: x-large;
                               background-color: #FFFFFF;
                 text-align: left;
              }
                            .auto-style34 {
                               height: 54px;
                               text-align: left;
                               width: 982px;
                            }
                            .auto-style35 {
                               height: 53px;
                               font-size: x-large;
                               background-color: #FFFFFF;
                 text-align: left;
              }
              .auto-style36 {
                 font-size: x-large;
                 background-color: #FFFFFF;
                 text-align: left;
              }
        </style><div class="awards" >

        <div style="background-color:#e8f2fb; padding-top:2px; padding-bottom:2px;">
           <table class="auto-style1">
              <tr class="auto-style4">
                 <td class="auto-style24" colspan="3"><strong>
                    Medical</strong></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style10">Kaiser Permanente</td>
                 <td class="auto-style34">(800) 464-4000</td>
                 <td class="auto-style11"><a href="http://www.kp.org">www.kp.org</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style27">Blue Shield</td>
                 <td class="auto-style30">(888) 235-1765</td>
                 <td class="auto-style25"><a href="http://www.blueshieldca.com">www.blueshieldca.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style10">HealthNet</td>
                 <td class="auto-style34">(800) 361-3366</td>
                 <td class="auto-style11"><a href="http://www.healthnet.com">www.healthnet.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style36" colspan="3"><strong>
                    <br />
                    Dental</strong></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style2">Humana</td>
                 <td class="auto-style18">PPO:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (800) 233-4013<br />
                    DHMO:&nbsp; (877) 873-2241</td>
                 <td class="auto-style14"><a href="http://www.humana.com">www.humana.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style27">CIGNA</td>
                 <td class="auto-style30">(800) 367-1037</td>
                 <td class="auto-style25"><a href="http://www.cigna.com">www.cigna.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style10">Blue Shield Dental</td>
                 <td class="auto-style34">(800) 585-8111</td>
                 <td class="auto-style11"><a href="http://www.blueshieldca.com">www.blueshieldca.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style27">Western Dental</td>
                 <td class="auto-style30">(800) 992-3366</td>
                 <td class="auto-style25"><a href="http://www.westerndental.com">www.westerndental.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style36" colspan="3"><strong>
                    <br />
                    Vision</strong></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style10">EyeMed</td>
                 <td class="auto-style34">(800) 334-7591</td>
                 <td class="auto-style11"><a href="http://www.eyemed.com">www.eyemed.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style27">VSP</td>
                 <td class="auto-style30">(800) 877-7195</td>
                 <td class="auto-style25"><a href="http://www.vsp.com">www.vsp.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style35" colspan="3"><strong>
                    <br />
                    Voluntary Benefits</strong></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style10">Allstate</td>
                 <td class="auto-style34">(800) 521-3535</td>
                 <td class="auto-style11"><a href="http://www.allstate.com">www.allstate.com</a></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style33" colspan="3"><strong>
                    <br />
                    Chriopractic</strong></td>
              </tr>
              <tr class="auto-style4">
                 <td class="auto-style10">MHN</td>
                 <td class="auto-style34">(800) 777-9355</td>
                 <td class="auto-style11"><a href="http://www.mhn.com">www.mhn.com</a></td>
              </tr>
              <tr>
                 <td class="auto-style29" colspan="3">&nbsp;</td>
              </tr>
              </table>
        </div>
<%--            

        <p>        
            <strong>Blue Shield <td class="auto-style2">&nbsp;</td>
                 <td class="auto-style3">&nbsp;</td>
                 <td>&nbsp;</td>
              </tr>
           </table>
        </div>
            
           <p>
            <strong>Kaiser Permanante</strong> - <a href="http://www.kaiserpermanente.org">www.kaiserpermanente.org</a>
            <span>(800)464-4000</span></p>
        <p>        
            <strong>Blue Shield</strong> - <a href="http://www.blueshield.com">www.blueshieldca.com</a><span>(888)235-1765</span></p>
            <div style="background-color:#e8f2fb; padding-top:2px; padding-bottom:2px;">
        <p>
            <strong>Humana</strong> - <a href="http://www.humana.com">www.humana.com</a><span>(800)833-6917</span></p></div>
        <p>
            <strong>CIGNA</strong> - <a href="http://www.cigna.com">www.cigna.com</a><span>(800)244-6224</span></p>


        <div style="background-color:#e8f2fb; padding-top:2px; padding-bottom:2px;">
        <p>
            <strong>EyeMed</strong> - <a href="http://www.eyemedvisioncare.com">www.eyemed.com</a><span>(888)581-3648</span></p>
            </div>
            
        <p>
        
            <strong>VSP</strong> - <a href="http://www.vsp.com">www.vsp.com</a><span>(800)877-7195</span></p>
            <div style="background-color:#e8f2fb; padding-top:2px; padding-bottom:2px;">
        <p>
            <strong>Allstate</strong> - <a href="http://www.allstate.com">www.allstate.com</a><span>(800)255-7828</span></p></div>
        <p>
            <strong>Western Dental</strong> - <a href="http://www.westerndental.com">www.westerndental.com</a><span>(800)579-3783</span></p>
                    <div style="background-color:#e8f2fb; padding-top:2px; padding-bottom:2px;">
        <p>
            <strong>Landmark</strong> - <a href="http://www.landmarkinsuranceagency.com">www.landmarkinsuranceagency.com</a><span>(714)821-4340</span></p></div>
        <p>
            <strong>MHN</strong> - <a href="http://www.mhn.com">www.mhn.com</a><span>(800)327-7526</span></p>
        </div>   --%>
    </div>
</asp:Content>
