<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="View_All.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
   <asp:Label ID="Label4" runat="server" Text="READ-ONLY Historical view of activities" style="font-weight: 700"></asp:Label>

      <br />
      <br />
     <asp:Label ID="Label3" runat="server" Text="All Activities" style="font-weight: 700"></asp:Label>
                <asp:Button style="color:white;Background-Color: #005EB8" CssClass="btn btn-default" ID="Show_All" onclick="Show_One_Click" runat="server" Text="Last 7 Days Activities" />
                <asp:Label ID="Label1" runat="server" Text="Time:"></asp:Label>
               <asp:TextBox ID="Total" runat="server" Text="Total" Width="61px"  ReadOnly="true"></asp:TextBox>
             <asp:Label ID="Label2" runat="server" Text="Hrs"></asp:Label>

                <br />

                <br />

             

                <asp:GridView CssClass="vert1" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="None" DataKeyNames="record_id" AllowPaging="True" AllowSorting="True" ForeColor="#333333" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:BoundField DataField="record_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="record_id" />
                        <asp:BoundField DataField="names" ItemStyle-Wrap="false" HeaderText="Name" SortExpression="names" >
<ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundField>


                        <asp:BoundField AccessibleHeaderText="Activity" DataField="act_date" HeaderText="Activity Date" SortExpression="act_date" >
                         <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="time_spent" HeaderText="Time" SortExpression="time_spent" />

                        <asp:BoundField  ItemStyle-Wrap="false" DataField="department" HeaderText="Department" SortExpression="department" >
<ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField ItemStyle-Wrap="false" DataField="client" HeaderText="Client" SortExpression="client" >
<ItemStyle Wrap="False" ></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField ItemStyle-Wrap="false" DataField="project_name" HeaderText="Project" SortExpression="project_name"  >
<ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField ItemStyle-Wrap="false" DataField="quantifiable_measure" HeaderText="QM" SortExpression="quantifiable_measure" >
<ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField ItemStyle-Wrap="false" DataField="activity" HeaderText="Activity" SortExpression="activity" >
<ItemStyle Wrap="False"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="log_date" HeaderText="Logged" SortExpression="log_date" >
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                 
                   
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#0072CE" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
  

    <div class="row">
        <div class="col-md-12">
          
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [TimeSheets] WHERE ([names] = @names)  order by convert(date,act_Date,103) desc" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [TimeSheets] WHERE [record_id] = @original_record_id AND (([unique_id] = @original_unique_id) OR ([unique_id] IS NULL AND @original_unique_id IS NULL)) AND (([activity_date] = @original_activity_date) OR ([activity_date] IS NULL AND @original_activity_date IS NULL)) AND (([logged_date] = @original_logged_date) OR ([logged_date] IS NULL AND @original_logged_date IS NULL)) AND (([names] = @original_names) OR ([names] IS NULL AND @original_names IS NULL)) AND (([client] = @original_client) OR ([client] IS NULL AND @original_client IS NULL)) AND (([department] = @original_department) OR ([department] IS NULL AND @original_department IS NULL)) AND (([project_name] = @original_project_name) OR ([project_name] IS NULL AND @original_project_name IS NULL)) AND (([quantifiable_measure] = @original_quantifiable_measure) OR ([quantifiable_measure] IS NULL AND @original_quantifiable_measure IS NULL)) AND (([activity] = @original_activity) OR ([activity] IS NULL AND @original_activity IS NULL)) AND (([time_spent] = @original_time_spent) OR ([time_spent] IS NULL AND @original_time_spent IS NULL)) AND (([other_description] = @original_other_description) OR ([other_description] IS NULL AND @original_other_description IS NULL)) AND (([comments] = @original_comments) OR ([comments] IS NULL AND @original_comments IS NULL)) AND (([roles] = @original_roles) OR ([roles] IS NULL AND @original_roles IS NULL)) AND (([band] = @original_band) OR ([band] IS NULL AND @original_band IS NULL)) AND (([project_code] = @original_project_code) OR ([project_code] IS NULL AND @original_project_code IS NULL)) AND (([act_date] = @original_act_date) OR ([act_date] IS NULL AND @original_act_date IS NULL)) AND (([log_date] = @original_log_date) OR ([log_date] IS NULL AND @original_log_date IS NULL))" InsertCommand="INSERT INTO [TimeSheets] ([unique_id], [activity_date], [logged_date], [names], [client], [department], [project_name], [quantifiable_measure], [activity], [time_spent], [other_description], [comments], [roles], [band], [project_code], [act_date], [log_date]) VALUES (@unique_id, @activity_date, @logged_date, @names, @client, @department, @project_name, @quantifiable_measure, @activity, @time_spent, @other_description, @comments, @roles, @band, @project_code, @act_date, @log_date)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [TimeSheets] SET [unique_id] = @unique_id, [activity_date] = @activity_date, [logged_date] = @logged_date, [names] = @names, [client] = @client, [department] = @department, [project_name] = @project_name, [quantifiable_measure] = @quantifiable_measure, [activity] = @activity, [time_spent] = @time_spent, [other_description] = @other_description, [comments] = @comments, [roles] = @roles, [band] = @band, [project_code] = @project_code, [act_date] = @act_date, [log_date] = @log_date WHERE [record_id] = @original_record_id AND (([unique_id] = @original_unique_id) OR ([unique_id] IS NULL AND @original_unique_id IS NULL)) AND (([activity_date] = @original_activity_date) OR ([activity_date] IS NULL AND @original_activity_date IS NULL)) AND (([logged_date] = @original_logged_date) OR ([logged_date] IS NULL AND @original_logged_date IS NULL)) AND (([names] = @original_names) OR ([names] IS NULL AND @original_names IS NULL)) AND (([client] = @original_client) OR ([client] IS NULL AND @original_client IS NULL)) AND (([department] = @original_department) OR ([department] IS NULL AND @original_department IS NULL)) AND (([project_name] = @original_project_name) OR ([project_name] IS NULL AND @original_project_name IS NULL)) AND (([quantifiable_measure] = @original_quantifiable_measure) OR ([quantifiable_measure] IS NULL AND @original_quantifiable_measure IS NULL)) AND (([activity] = @original_activity) OR ([activity] IS NULL AND @original_activity IS NULL)) AND (([time_spent] = @original_time_spent) OR ([time_spent] IS NULL AND @original_time_spent IS NULL)) AND (([other_description] = @original_other_description) OR ([other_description] IS NULL AND @original_other_description IS NULL)) AND (([comments] = @original_comments) OR ([comments] IS NULL AND @original_comments IS NULL)) AND (([roles] = @original_roles) OR ([roles] IS NULL AND @original_roles IS NULL)) AND (([band] = @original_band) OR ([band] IS NULL AND @original_band IS NULL)) AND (([project_code] = @original_project_code) OR ([project_code] IS NULL AND @original_project_code IS NULL)) AND (([act_date] = @original_act_date) OR ([act_date] IS NULL AND @original_act_date IS NULL)) AND (([log_date] = @original_log_date) OR ([log_date] IS NULL AND @original_log_date IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_record_id" Type="Int32" />
                        <asp:Parameter Name="original_unique_id" Type="String" />
                        <asp:Parameter Name="original_activity_date" Type="DateTime" />
                        <asp:Parameter Name="original_logged_date" Type="DateTime" />
                        <asp:Parameter Name="original_names" Type="String" />
                        <asp:Parameter Name="original_client" Type="String" />
                        <asp:Parameter Name="original_department" Type="String" />
                        <asp:Parameter Name="original_project_name" Type="String" />
                        <asp:Parameter Name="original_quantifiable_measure" Type="String" />
                        <asp:Parameter Name="original_activity" Type="String" />
                        <asp:Parameter Name="original_time_spent" Type="Decimal" />
                        <asp:Parameter Name="original_other_description" Type="String" />
                        <asp:Parameter Name="original_comments" Type="String" />
                        <asp:Parameter Name="original_roles" Type="String" />
                        <asp:Parameter Name="original_band" Type="String" />
                        <asp:Parameter Name="original_project_code" Type="String" />
                        <asp:Parameter Name="original_act_date" Type="String" />
                        <asp:Parameter Name="original_log_date" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="unique_id" Type="String" />
                        <asp:Parameter Name="activity_date" Type="DateTime" />
                        <asp:Parameter Name="logged_date" Type="DateTime" />
                        <asp:Parameter Name="names" Type="String" />
                        <asp:Parameter Name="client" Type="String" />
                        <asp:Parameter Name="department" Type="String" />
                        <asp:Parameter Name="project_name" Type="String" />
                        <asp:Parameter Name="quantifiable_measure" Type="String" />
                        <asp:Parameter Name="activity" Type="String" />
                        <asp:Parameter Name="time_spent" Type="Decimal" />
                        <asp:Parameter Name="other_description" Type="String" />
                        <asp:Parameter Name="comments" Type="String" />
                        <asp:Parameter Name="roles" Type="String" />
                        <asp:Parameter Name="band" Type="String" />
                        <asp:Parameter Name="project_code" Type="String" />
                        <asp:Parameter Name="act_date" Type="String" />
                        <asp:Parameter Name="log_date" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter Name="names" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="unique_id" Type="String" />
                        <asp:Parameter Name="activity_date" Type="DateTime" />
                        <asp:Parameter Name="logged_date" Type="DateTime" />
                        <asp:Parameter Name="names" Type="String" />
                        <asp:Parameter Name="client" Type="String" />
                        <asp:Parameter Name="department" Type="String" />
                        <asp:Parameter Name="project_name" Type="String" />
                        <asp:Parameter Name="quantifiable_measure" Type="String" />
                        <asp:Parameter Name="activity" Type="String" />
                        <asp:Parameter Name="time_spent" Type="Decimal" />
                        <asp:Parameter Name="other_description" Type="String" />
                        <asp:Parameter Name="comments" Type="String" />
                        <asp:Parameter Name="roles" Type="String" />
                        <asp:Parameter Name="band" Type="String" />
                        <asp:Parameter Name="project_code" Type="String" />
                        <asp:Parameter Name="act_date" Type="String" />
                        <asp:Parameter Name="log_date" Type="String" />
                        <asp:Parameter Name="original_record_id" Type="Int32" />
                        <asp:Parameter Name="original_unique_id" Type="String" />
                        <asp:Parameter Name="original_activity_date" Type="DateTime" />
                        <asp:Parameter Name="original_logged_date" Type="DateTime" />
                        <asp:Parameter Name="original_names" Type="String" />
                        <asp:Parameter Name="original_client" Type="String" />
                        <asp:Parameter Name="original_department" Type="String" />
                        <asp:Parameter Name="original_project_name" Type="String" />
                        <asp:Parameter Name="original_quantifiable_measure" Type="String" />
                        <asp:Parameter Name="original_activity" Type="String" />
                        <asp:Parameter Name="original_time_spent" Type="Decimal" />
                        <asp:Parameter Name="original_other_description" Type="String" />
                        <asp:Parameter Name="original_comments" Type="String" />
                        <asp:Parameter Name="original_roles" Type="String" />
                        <asp:Parameter Name="original_band" Type="String" />
                        <asp:Parameter Name="original_project_code" Type="String" />
                        <asp:Parameter Name="original_act_date" Type="String" />
                        <asp:Parameter Name="original_log_date" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

            
          
    </div>

 



</div>
</asp:Content>
