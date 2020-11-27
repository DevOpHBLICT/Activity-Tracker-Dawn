<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QM_Hierarchy.aspx.cs" Inherits="QM_Hierarchy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="QM_Hierarchy2">
                <Columns>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                    <asp:BoundField DataField="QM" HeaderText="QM" SortExpression="QM" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="QM_Hierarchy2" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [QM_Hierarchy]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
