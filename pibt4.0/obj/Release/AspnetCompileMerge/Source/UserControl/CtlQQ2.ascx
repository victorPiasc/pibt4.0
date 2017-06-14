<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQQ2.ascx.cs" Inherits="Pibt.UserControl.CtlQQ2" %>
<style>
    .simpleText{
        font-size: 14px;
    }
</style>
 <div class="row">
    <div class="column-12 col-md-12">
        <span style="font-size: large; font-weight: bold; color: #085394;">Participation Setup- Company Information</span>
    </div>
</div>
<div class="row">
    <div class="column-12 col-md-12">
        <asp:Literal ID="message" runat="server"></asp:Literal>
    </div>
</div>
<div class="row">
    <div class="column-12 col-md-12">
        <span class="simpleText bold">Company&nbsp;Name:</span>
        <asp:TextBox ID="companyName" runat="server" CssClass="form-control" style="display:inline;width:89%; " MaxLength="30"></asp:TextBox>
        <div style="display:block">
            <asp:RequiredFieldValidator ID="nameReq" runat="server" CssClass="required-info" ErrorMessage="*Company Name required" ControlToValidate="companyName"></asp:RequiredFieldValidator>
        </div>
    </div>
</div>
<div class="row">
    <div class="column-6 col-md-6">
        <span class="simpleText bold">Address One:</span>&nbsp;
        <asp:TextBox ID="pAddress1" runat="server" CssClass="form-control" style="display:inline; width:81%;" MaxLength="50"></asp:TextBox>
        <div style="display:block">
            <asp:RequiredFieldValidator ID="pAddReq" runat="server" CssClass="required-info" ErrorMessage="*Address One required" ControlToValidate="pAddress1"></asp:RequiredFieldValidator>
         </div>
    </div>
    <div class="column-6 col-md-6">
        <span class="simpleText bold">Address Two:</span>&nbsp;
        <asp:TextBox ID="pAddress2" runat="server" CssClass="form-control" style="display:inline; width:81%;" MaxLength="30"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="column-6 col-md-6">
        <span class="simpleText bold">City:</span>&nbsp;
        <asp:TextBox ID="pCity" runat="server" CssClass="form-control" style="display:inline; width:90%;" MaxLength="30"></asp:TextBox>
        <div style="display:block">
            <asp:RequiredFieldValidator ID="pCityReq" runat="server" CssClass="required-info" ErrorMessage="*City is required" ControlToValidate="pCity"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="column-3 col-md-3">
        <span class="simpleText bold">State:</span>
            &nbsp;
            <asp:TextBox ID="pState" runat="server" CssClass="form-control" style="display:inline; width:29%" MaxLength="2"></asp:TextBox>
            <div style="display:block">
                <asp:RequiredFieldValidator ID="pStateReq" runat="server" CssClass="required-info" ErrorMessage="*City is required" ControlToValidate="pState" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="pStateReg" runat="server" CssClass="required-info" ErrorMessage="*Alpha only" ControlToValidate="pState" ValidationExpression="[a-z A-Z]+" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
    </div>
    <div class="column-3 col-md-3">
        <span class="simpleText bold">Zip:</span>&nbsp;
        <asp:TextBox ID="pZip" runat="server" CssClass="form-control" style="display:inline; width:86%" MaxLength="9"></asp:TextBox>
            <div style="display:block">
                <asp:RequiredFieldValidator ID="pZipReq" runat="server" CssClass="required-info" ErrorMessage="*Zip is required" ControlToValidate="pZip" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="pZipReg" runat="server" CssClass="required-info" ErrorMessage="*Numbers only" ControlToValidate="pZip" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
    </div>
</div>
<div class="row">
    <div class="column-6 col-md-6">
        <span class="simpleText bold">Phone Number:</span>&nbsp;
        <asp:TextBox ID="phone" runat="server" CssClass="form-control" style="display:inline; width:78%;" MaxLength="10"></asp:TextBox>
        <div style="display:block">
            <asp:RegularExpressionValidator ID="phoneReq" runat="server" CssClass="required-info" ErrorMessage="*Numbers only" ControlToValidate="phone" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="column-6 col-md-6">
        <span class="simpleText bold">Fax Number:</span>&nbsp;
        <asp:TextBox ID="fax" runat="server" CssClass="form-control" style="display:inline; width:82%;" MaxLength="10"></asp:TextBox>
        <div style="display:block">
            <asp:RegularExpressionValidator ID="faxReq" runat="server" CssClass="required-info" ErrorMessage="*Numbers only" ControlToValidate="fax" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
    </div>
</div>
<div class="row">
    <div class="column-12 col-md-12">
        <span class="simpleText bold">Mailing address same as physical address?</span>&nbsp;
        <asp:RadioButtonList ID="sameAddress" runat="server" RepeatDirection="Horizontal" style="display:inline;vertical-align: -webkit-baseline-middle;" OnSelectedIndexChanged="sameAddress_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="0" Selected="True"><span class="simpleText">Yes</span></asp:ListItem>
            <asp:ListItem Value="1"><span class="simpleText">No</span></asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator id="sameAddressReq" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="sameAddress"></asp:RequiredFieldValidator>
    </div>
</div>

<asp:Panel ID="mailInfo" runat="server" Visible="false">
    <div class="row">
        <div class="column-6 col-md-6">
            <span class="simpleText bold">Address One:</span>&nbsp;
            <asp:TextBox ID="mAddress1" runat="server" CssClass="form-control" style="display:inline; width:81%;" MaxLength="50"></asp:TextBox>
            <div style="display:block">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" ErrorMessage="*Address One required" ControlToValidate="mAddress1" ></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="column-6 col-md-6">
            <span class="simpleText bold">Address Two:</span>&nbsp;
            <asp:TextBox ID="mAddress2" runat="server" CssClass="form-control" style="display:inline; width:81%;" MaxLength="30"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="column-6 col-md-6">
            <span class="simpleText bold">City:</span>&nbsp;
            <asp:TextBox ID="mCity" runat="server" CssClass="form-control" style="display:inline; width:93%;" MaxLength="30"></asp:TextBox>
            <div style="display:block">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="required-info" ErrorMessage="*City is required" ControlToValidate="mCity" ></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="column-3 col-md-3">
            <span class="simpleText bold">State:</span>&nbsp;
            <asp:TextBox ID="mState" runat="server" CssClass="form-control" style="display:inline; width:29%;" MaxLength="2"></asp:TextBox>
            <div style="display:block">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="required-info" ErrorMessage="*City is required" ControlToValidate="mState" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="mStateReg" runat="server" CssClass="required-info" ErrorMessage="*Alpha only" ControlToValidate="mState" ValidationExpression="[a-z A-Z]+"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="column-3 col-md-3">
            <span class="simpleText bold">Zip:</span>&nbsp;
            <asp:TextBox ID="mZip" runat="server" CssClass="form-control" style="display:inline; width:86%;"></asp:TextBox>
            <div style="display:block">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="required-info" ErrorMessage="*Zip is required" ControlToValidate="mZip" Display="Dynamic" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="mZipReg" runat="server" CssClass="required-info" ErrorMessage="*Numbers only" ControlToValidate="mZip" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </div>
        </div>
    </div>
</asp:Panel>
<div class="row">
    <div class="column-6 col-md-6">
        <span class="simpleText bold">Contact First Name:</span>&nbsp;
        <asp:TextBox ID="cFname" runat="server" CssClass="form-control" style="display:inline; width:73%;" MaxLength="30"></asp:TextBox>
         <div style="display:block">
            <asp:RequiredFieldValidator ID="cFnameReq" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="cFname"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="column-6 col-md-6">
        <span class="simpleText bold">Contact Last Name:</span>&nbsp;
        <asp:TextBox ID="cLname" runat="server" CssClass="form-control" style="display:inline; width:73%;" MaxLength="29"></asp:TextBox>
        <div style="display:block">
            <asp:RequiredFieldValidator ID="cLnameReq" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="cLname"></asp:RequiredFieldValidator>
        </div>
    </div>
</div>
<div class="row">
        <div class="column-6 col-md-6">
        <span class="simpleText bold">Contact Email:</span>&nbsp;
        <asp:TextBox ID="cEmail" runat="server" CssClass="form-control" style="display:inline; width:80%;" MaxLength="60"></asp:TextBox>
        <div style="display:block">
            <asp:RequiredFieldValidator ID="cEmailReq" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="cEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="cEmailReg" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="cEmail" runat="server"  ErrorMessage="*Invalid email address." CssClass="required-info" ></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="column-6 col-md-6">
        <span class="simpleText bold">Number of part-time employees:</span>&nbsp;
        <asp:TextBox ID="partee" runat="server" CssClass="form-control" style="display:inline; width:15%;" MaxLength="3"></asp:TextBox>
        <div style="display:block">
            <asp:RegularExpressionValidator ID="parteeReg" runat="server" CssClass="required-info" ErrorMessage="*Numbers only" ControlToValidate="partee" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
    </div>
</div>
<div class="row">
    <div class="column-4 col-md-4">
        <span class="simpleText bold">Tax ID:</span>&nbsp;
        <asp:TextBox ID="taxId" runat="server" CssClass="form-control" style="display:inline; width:84%;" MaxLength="9"></asp:TextBox>
        <div style="display:block">
            <asp:RequiredFieldValidator ID="taxIdReq" runat="server" CssClass="require-info" ErrorMessage="*Required" ControlToValidate="taxId"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="taxIdReg" runat="server" CssClass="required-info" ErrorMessage="*Numbers only" ControlToValidate="taxId" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="column-4 col-md-4">
        <span class="simpleText bold">Waiting Period:</span>&nbsp;
        <asp:DropDownList ID="wPeriod" runat="server" CssClass="form-control" style="display:inline; width:67%;" AppendDataBoundItems="true">
            <asp:ListItem Value="7"  Text="--Select--" Selected="True"></asp:ListItem>
        </asp:DropDownList>
        <div style="display:block">
            <asp:RequiredFieldValidator ID="wPeriodReq" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="wPeriod" InitialValue="7"></asp:RequiredFieldValidator>
        </div>
    </div>
     <div class="column-4 col-md-4">
        <span class="simpleText bold">SIC:</span>&nbsp;
        <asp:TextBox ID="sic" runat="server" CssClass="form-control" style="display:inline; width:90%;" MaxLength="9"></asp:TextBox>
        <div style="display:block">
            <asp:RequiredFieldValidator ID="sicRequired" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="sic" ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="sicReg" runat="server" CssClass="required-info" ErrorMessage="*Numbers only" ControlToValidate="sic" ValidationExpression="\d+"></asp:RegularExpressionValidator>
        </div>
    </div>
</div>