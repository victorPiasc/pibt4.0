<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanDescription.aspx.cs" Inherits="Pibt.PlanDescription" MasterPageFile="~/OnlineQuote.master" %>
<asp:Content runat="server" ContentPlaceHolderID="contentBody">
    <div id="contentWrapper">
        <div class="customer-info-box">
            <div class="row">
                <div class="column-12">
                    <div>
                        <asp:DropDownList ID="planType" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="planType_SelectedIndexChanged" Width="25%"></asp:DropDownList>
                        <asp:Literal ID="placeholder" runat="server" Visible="false" Text="Sorry, there are no benefit descritptions for the plans chosen">
                        </asp:Literal>
                        <telerik:RadGrid ID="dt" runat="server" OnNeedDataSource="test_NeedDataSource" OnPreRender="dt_PreRender"
                            Skin="MetroTouch" EnableLinqExpressions="false" >
                            <ClientSettings EnableAlternatingItems="false" >
                                <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" />
                            </ClientSettings>
                            <MasterTableView DataKeyNames="Plan Name" Width="1700px" >
                            </MasterTableView>
                            <HeaderStyle Width="225px" Height="45px" BackColor="#006DBB" ForeColor="White" Font-Size="Larger" Font-Bold="true" />
                            <PagerStyle />
                        </telerik:RadGrid>
                    </div>
                    <div>
                        <span style="font-size: large; font-weight: bold">Footnotes</span>
                        <hr />
                        <span style="font-weight: bold; font-size: 12px;">This is intended to be used to help you compare coverage benefits and is a summary only.  The evidence of coverage and plan contract should be consulted for a detailed description of coverage benefits and limitations.  In the event of any difference between this summary versus the evidence of coverage and plan contract, the evidence of coverage and plan contract shall prevail.</span>
                        <telerik:RadTreeView ID="bsandhn" runat="server">
                            <Nodes>
                                <telerik:RadTreeNode Text="Blue Shield and Health Net" ExpandMode="ClientSide">
                                    <Nodes>
                                        <telerik:RadTreeNode Text="<sup>#</sup> Charges above Non-Network contract allowable amount are the members' responsibility and do not count toward the plan deductible or copay maximum." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>*</sup> One pair of frames, lenses, or contact lenses per calendar year (children only - from age 0 up to age 19)." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>&#8226;</sup> Specialty Drugs may require prior authorization from Blue Shield Life Pharmacy Services and are covered only when dispensed by network select participating Pharmacies.  Mail service prescriptions may not be covered. A separate drug copay and deductible may apply. " Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>1</sup> Includes the medical plan deductible. Copayments for covered  services from participating providers accrue to both the participating and non-participating provider calendar year out-of-pocket maximums." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>2</sup> Family coverage requires full family deductible and family copay maximum amount must be reached to obtain 100% benefits." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>3</sup> Includes the plan medical deductible." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>4</sup> Plan service available ONLY in certain California counties and cities. You must live or work in this select service area in order to enroll in this plan. Employers may only offer any Access+ HMO plan or Local Access+ " Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>5</sup> This  plan utilize an Accountable Care Organization (ACO) for its provider network. Except for Emergency Services, Urgent Care when the member is out of the Service Area, or when prior authorized, all services must be obtained through the member's Personal Physician and within the ACO provider network to be covered." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>6</sup> Members are required to fill maintenance drugs at CVS retail pharmacies after the prescription has been filled twice at a network pharmacy." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>7</sup> Plan service area encompasses regions in Southern California and Baja California México (within fifty miles of the California-México Border). Subsacribers must live or work in the Salud Plan service area in California ..(Salud Network). Dependents must live or work in the Salud Plan service area in California (Salud Network) OR the approved Salud Plan service area in México (SIMNSA)." Style="white-space: normal"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>

                                <telerik:RadTreeNode Text="Kaiser" ExpandMode="ClientSide">
                                    <Nodes>

                                        <telerik:RadTreeNode Text="<sup>*</sup> One pair of frames, lenses, or contact lenses per calendar year (children only - from age 0 up to age 19) at Kaiser Facilities Only." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>2</sup> Deductible waived for first three visits combined for non-preventive primary care, urgent care and individual mental/behavioral health and substance use disorder services." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>9</sup> Payments are based upon the maximum allowable charge for covered services. Covered persons may be responsible for payment of any amounts i n excess of the maximum allowable charge for a covered service. Charges above Non-Network contract allowable amount are the members' responsibility and do not count toward the plan deductible or copay maximum. " Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>10</sup> Each family member becomes eligible for benefits after meeting the individual deductible. A family member can meet the individual annual out-of-pocket maximum before the family out-of-pocket maximum is satisfied." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>11</sup> Charges incurred toward the out-of-pocket maximum at the non-network tier will not accumulate toward satisfaction of the out-of-pocket maximum of the network tier, or vice-versa." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>12</sup> Preventive lab tests, X-rays and immunizations are covered as part of the preventive exam. Routine adult physical exams are limited to one exam every 12 months." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>25</sup> Entire family deductible must be met before copayments apply for individual family members." Style="white-space: normal"></telerik:RadTreeNode>

                                        <telerik:RadTreeNode Text="<sup>29</sup> Annual pharmacy deductible contributes to the out-of-pocket maximum." Style="white-space: normal"></telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                            </Nodes>
                            <DataBindings>
                                <telerik:RadTreeNodeBinding Expanded="true" />
                            </DataBindings>
                        </telerik:RadTreeView>
                    </div>
                    <asp:PlaceHolder ID="exportPh" runat="server"></asp:PlaceHolder>
                    <asp:Button ID="excelDownload" runat="server" Text="Export" CssClass="btn" OnClick="excelDownload_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
