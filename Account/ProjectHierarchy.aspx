<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Account/Sites.master" AutoEventWireup="true" CodeFile="ProjectHierarchy.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <asp:Label ID="Label1" runat="server" Text="PROJECTS" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <br />

        <asp:LinkButton CssClass="btn-success" ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click">Add New Project</asp:LinkButton>
   
       
 
      
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="25" DataKeyNames="ID">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" InsertVisible="False" />
                        <asp:BoundField DataField="Client_name" HeaderText="Client Name" SortExpression="Client_name" />
                         <asp:BoundField DataField="Project_name" HeaderText="Project Name" SortExpression="Project_name" />
                        <asp:BoundField DataField="Project_ID" HeaderText="Project ID" SortExpression="Project_ID" />
                        <asp:BoundField DataField="Current_Project" HeaderText="Current" SortExpression="Current_Project" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" ForeColor="White" />
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
                
    <div>
      

    </div>

    <div class="row">
        <div class="col-md-12">
          
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [ProjectHierarchy] order by client_name,project_name" 
                    OldValuesParameterFormatString="original_{0}">
                </asp:SqlDataSource>
            

            

        </div>
    </div>


  

</asp:Content>
