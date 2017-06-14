<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddingTestDocuments.aspx.cs" Inherits="Pibt.AddingTestDocuments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <h2>Document Library</h2>
        <asp:TreeView ID="TreeView1" runat="server">
            <NodeStyle  ForeColor="#000000" />
            <HoverNodeStyle  BackColor="#dddddd"/>
            <SelectedNodeStyle BackColor="#999999" Font-Bold="true"/>
        </asp:TreeView>
        <br /><br />
        <table>
<%--            <tr>
                <td>
                    Selected Node :
                </td>
                <td>
                    <asp:Label ID="SelectedNodeLabel" runat="server" Text="<%# Eval('TreeView1.SelectedValue') %>"></asp:Label>
                </td>
            </tr>--%>
            <tr>
                <td>
                    Type Category Name :
                </td>
                <td>
                    <asp:TextBox ID="NodeNameTextbBox" runat="server"></asp:TextBox>
                    <asp:Button ID="AddCategoryButton" runat="server" Text="Add a New Node" OnClick="AddCategoryButton_Click" />
                </td>
            </tr>
        </table>
        <br />
        <h2>File Upload</h2>
        <table>
            <tr>
                <td>
                    Document Title :
                </td>
                <td>
                    <asp:TextBox ID="DocumentNameTextBox" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    File Upload :
                </td>
                <td>
                    <asp:FileUpload ID="DocumentUpload" runat="server" />
                    <asp:Button ID="UploadButton" runat="server" Text="Upload" OnClick="UploadButton_Click" />
                   
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <h2>Document List</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="DocumentId" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="DocumentId" />
                <asp:BoundField DataField="DocumentName" HeaderText="Document Name" SortExpression="DocumentName" />
                <asp:BoundField DataField="DocumentTypeId" HeaderText="Document Type Id" SortExpression="DocumentTypeId" />
                <asp:BoundField DataField="Keywords" HeaderText="Keywords" SortExpression="Keywords" />
                <asp:BoundField DataField="DocumentURL" HeaderText="DocumentURL" SortExpression="DocumentPath" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MaximumASPSQLServer %>"
            SelectCommand="SELECT * FROM [Documents] WHERE ([DocumentTypeId] = @DocumentTypeId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TreeView1" DefaultValue="-1" Name="DocumentTypeId"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
