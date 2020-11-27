<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Account/Sites.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <asp:DynamicFilter ID="DynamicFilter1" runat="server">
        </asp:DynamicFilter>

        <asp:Label ID="Label1" runat="server" Text="REPORTS" Font-Size="X-Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    <br />
    <br />
        <asp:DynamicFilter ID="DynamicFilter2" runat="server">
        </asp:DynamicFilter>
    <br />

    
      
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" DataSourceID="SqlDataSource1" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" AllowSorting="True" DataKeyNames="record_id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="record_id" HeaderText="ID" SortExpression="record_id" ReadOnly="True" InsertVisible="False" />
                        <asp:BoundField DataField="act_date" HeaderText="Activity Date" SortExpression="act_date" />
                        <asp:BoundField DataField="names" HeaderText="Names" SortExpression="names" ItemStyle-Wrap="false" />
                        <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                        <asp:BoundField DataField="client" HeaderText="Client" SortExpression="client" ItemStyle-Wrap="false" />
                        <asp:BoundField DataField="project_name" HeaderText="Project Name" SortExpression="project_name"  />
                        <asp:BoundField DataField="project_code" HeaderText="Project Code" SortExpression="project_code" />
                        <asp:BoundField DataField="quantifiable_measure" HeaderText="Quantifiable Measure" SortExpression="quantifiable_measure" />
                        <asp:BoundField DataField="activity" HeaderText="Activity" SortExpression="activity" ItemStyle-Wrap="false" />
                        <asp:BoundField DataField="time_spent" HeaderText="Time Spent" SortExpression="time_spent" ItemStyle-Wrap="false" />
                        <asp:BoundField DataField="other_description" HeaderText="Other Description" SortExpression="other_description" />
                        <asp:BoundField DataField="comments" HeaderText="Comments" SortExpression="comments" />
                        <asp:BoundField DataField="roles" HeaderText="Roles" SortExpression="roles" />
                        <asp:BoundField DataField="band" HeaderText="Band" SortExpression="band" />
                        <asp:BoundField DataField="logged_date" HeaderText="Log Date" SortExpression="logged_date" />
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
          
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [TimeSheets]" 
                    OldValuesParameterFormatString="original_{0}">
                </asp:SqlDataSource>
            

            

        </div>
    </div>


  

</asp:Content>
