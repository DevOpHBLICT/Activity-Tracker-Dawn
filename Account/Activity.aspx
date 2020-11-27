<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Account/Sites.master" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="Account_Manage" %>

 

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinkButton CssClass="btn-success" ID="lbtnAdd" runat="server" onclick="lbtnAdd_Click">Add New Activity</asp:LinkButton>

    

    

    

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="25" >

                    <AlternatingRowStyle BackColor="White" />

                    <Columns>

                        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />

                        <asp:BoundField DataField="Activity" HeaderText="Activity" SortExpression="Activity" />

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



 

    <div>

      

 

    </div>

 

    <div class="row">

        <div class="col-md-12">

          

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [Activity_Hierarchy] order by department,activity" 
                    OldValuesParameterFormatString="original_{0}">



                </asp:SqlDataSource>

            

            

 

        </div>

    </div>

 

    

 

 

        

 

 

 

</asp:Content>
