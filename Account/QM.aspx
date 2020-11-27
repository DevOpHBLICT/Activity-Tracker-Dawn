<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Account/Sites.master" AutoEventWireup="true" CodeFile="QM.aspx.cs" Inherits="Account_Manage" %>

 

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <asp:Label ID="Label1" runat="server" Text="QUANTIFIABLE MEASURES" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
    <br />



    <asp:LinkButton CssClass="btn-success" ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click">Add New Quantifiable Measure (QM)</asp:LinkButton>

    

    

    

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="25" DataKeyNames="ID">

                    <AlternatingRowStyle BackColor="White" />

                    <Columns>

                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />

                        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />

                        <asp:BoundField DataField="QM" HeaderText="QM" SortExpression="QM" />

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

          

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [QM_Hierarchy]" 
                    OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [QM_Hierarchy] WHERE [ID] = @original_ID AND [Department] = @original_Department AND [QM] = @original_QM" InsertCommand="INSERT INTO [QM_Hierarchy] ([Department], [QM]) VALUES (@Department, @QM)" UpdateCommand="UPDATE [QM_Hierarchy] SET [Department] = @Department, [QM] = @QM WHERE [ID] = @original_ID AND [Department] = @original_Department AND [QM] = @original_QM">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_Department" Type="String" />
                        <asp:Parameter Name="original_QM" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Department" Type="String" />
                        <asp:Parameter Name="QM" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Department" Type="String" />
                        <asp:Parameter Name="QM" Type="String" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                        <asp:Parameter Name="original_Department" Type="String" />
                        <asp:Parameter Name="original_QM" Type="String" />
                    </UpdateParameters>

                </asp:SqlDataSource>

            

            

 

        </div>

    </div>

 

    

 

 

        

 

 

 

</asp:Content>
