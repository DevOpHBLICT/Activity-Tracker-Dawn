<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Account/Sites.master" AutoEventWireup="true" CodeFile="Client.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="CLIENTS" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
    <br />
    <br />
    <br />



   
   Add New Client: 
    <asp:TextBox ID="Client" runat="server"></asp:TextBox> 

      <asp:LinkButton ID="lbtnSubmit" runat="server" onclick="lbtnSubmit_Click" style="background-color: #336699" ForeColor="White" Width="50px">Submit</asp:LinkButton> 
    <br />
    <br />
        
 
      
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True" DataKeyNames="ID2" Font-Bold="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Client_Name" HeaderText="Client Name" SortExpression="Client_Name" />
                        <asp:BoundField DataField="ID2" HeaderText="ID" SortExpression="ID2" InsertVisible="False" ReadOnly="True" />
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
          
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Client_Name], [ID2] FROM [Client_List]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Client_List] WHERE [ID2] = @original_ID2 AND (([Client_Name] = @original_Client_Name) OR ([Client_Name] IS NULL AND @original_Client_Name IS NULL))" InsertCommand="INSERT INTO [Client_List] ([Client_Name]) VALUES (@Client_Name)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Client_List] SET [Client_Name] = @Client_Name WHERE [ID2] = @original_ID2 AND (([Client_Name] = @original_Client_Name) OR ([Client_Name] IS NULL AND @original_Client_Name IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID2" Type="Int32" />
                        <asp:Parameter Name="original_Client_Name" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Client_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Client_Name" Type="String" />
                        <asp:Parameter Name="original_ID2" Type="Int32" />
                        <asp:Parameter Name="original_Client_Name" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

            

        </div>
    </div>


  

</asp:Content>
