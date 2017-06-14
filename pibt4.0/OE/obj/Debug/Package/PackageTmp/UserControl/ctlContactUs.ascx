<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ctlContactUs.ascx.cs"
   Inherits="Pibt.UserControl.ctlContactUs" %>
   <script type="text/javascript">
      function validateTextBoxes() {
         var txt1 = document.getElementById("txtFullName").value.replace(/^\s+|\s+$/g, '');
         var txt2 = document.getElementById("txtEmail").value.replace(/^\s+|\s+$/g, '');

         if((txt1 == null || txt1 == "") &&
            (txt2 == null || txt2 == "")) {
            alert('Textbox should be entered');
            return false;
         }
      }
   </script>
   <asp:Panel ID="ContactPanel" runat="server" DefaultButton="btnSubmit">
      <div class="row contactUsArea">
         <div class="col-xs-12 col-md-9">

            <div class="form-group">
               <label for="txtName" class="control-label">Your Name</label><br />
               <asp:TextBox ID="txtFullName" runat="server" Width="100%"
                  CssClass="form-control"
                  autofocus="autofocus"
                  placeholder="Enter Your Name"
                  title="Enter Your Name" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFullName" CssClass="message-error" ErrorMessage="*Required"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
               <label for="txtEmail" class="control-label">Your E-mail Address</label><br />
               <asp:TextBox ID="txtEmail" runat="server" Width="100%"
                  TextMode="Email"
                  CssClass="form-control"
                  placeholder="Enter Your E-mail Address"
                  title="Enter Your E-mail Address" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" 
                  CssClass="message-error" ErrorMessage="*Required"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
               <label for="txtMsg" class="control-label">
                  Message</label><br />
               <asp:TextBox ID="txtEnquiry" runat="server" Width="100%"
                  TextMode="MultiLine"
                  CssClass="form-control"
                  Rows="5"
                  Columns="50"
                  MaxLength="500"
                  placeholder="Enter Your Message"
                  title="Enter Your Message" />
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEnquiry" CssClass="message-error" ErrorMessage="*Required"></asp:RequiredFieldValidator>
            </div>
            <div class="row">
               <div class="col-xs-12">
                  <div id="divMessageArea"
                     runat="server"
                     visible="false">
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-xs-12">
                  <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-lg"
                     Text="Send us your message"
                     CssClass="btn btn-primary"
                     title="Send us your message"
                     OnClick="btnContactUs_Click" />
                  <%--          <asp:Button ID="btnCancel" runat="server"
            Text="Cancel"
            CssClass="btn btn-primary"
            formnovalidate="formnovalidate"
            OnClick="btnCancel_Click" />--%>
               </div>
            </div>

         </div>
      </div>
   </asp:Panel>
   <asp:Label ID="lblMessage" CssClass="message-error" Font-Size="X-Large"  runat="server" Font-Names="Open Sans"></asp:Label>
