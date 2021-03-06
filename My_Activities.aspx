﻿<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="My_Activities.aspx.cs" Inherits="Account_Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
  

                <asp:GridView CssClass="vert1" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" DataKeyNames="record_id" AllowPaging="True" AllowSorting="True" Caption="My Activities" >
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField AccessibleHeaderText="Activity" DataField="act_date" HeaderText="Activity" SortExpression="act_date" >
                         <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="log_date" HeaderText="Logged" SortExpression="log_date" >
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="record_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="record_id" />
                        <asp:BoundField DataField="names" HeaderText="Name" SortExpression="names" />
                        <asp:BoundField DataField="client" HeaderText="Client" SortExpression="client" />
                        <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                        <asp:BoundField DataField="project_name" HeaderText="Project" SortExpression="project_name" />
                        <asp:BoundField DataField="quantifiable_measure" HeaderText="QM" SortExpression="quantifiable_measure" />
                        <asp:BoundField DataField="activity" HeaderText="Activity" SortExpression="activity" />
                        <asp:BoundField DataField="time_spent" HeaderText="Time" SortExpression="time_spent" />
                        <asp:BoundField DataField="other_description" HeaderText="Description" SortExpression="other_description" />
                        <asp:BoundField DataField="comments" HeaderText="Comments" SortExpression="comments" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
  

    <div class="row">
        <div class="col-md-12">
          
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [TimeSheets] WHERE ([names] = @names)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [TimeSheets] WHERE [record_id] = @original_record_id AND (([unique_id] = @original_unique_id) OR ([unique_id] IS NULL AND @original_unique_id IS NULL)) AND (([activity_date] = @original_activity_date) OR ([activity_date] IS NULL AND @original_activity_date IS NULL)) AND (([logged_date] = @original_logged_date) OR ([logged_date] IS NULL AND @original_logged_date IS NULL)) AND (([names] = @original_names) OR ([names] IS NULL AND @original_names IS NULL)) AND (([client] = @original_client) OR ([client] IS NULL AND @original_client IS NULL)) AND (([department] = @original_department) OR ([department] IS NULL AND @original_department IS NULL)) AND (([project_name] = @original_project_name) OR ([project_name] IS NULL AND @original_project_name IS NULL)) AND (([quantifiable_measure] = @original_quantifiable_measure) OR ([quantifiable_measure] IS NULL AND @original_quantifiable_measure IS NULL)) AND (([activity] = @original_activity) OR ([activity] IS NULL AND @original_activity IS NULL)) AND (([time_spent] = @original_time_spent) OR ([time_spent] IS NULL AND @original_time_spent IS NULL)) AND (([other_description] = @original_other_description) OR ([other_description] IS NULL AND @original_other_description IS NULL)) AND (([comments] = @original_comments) OR ([comments] IS NULL AND @original_comments IS NULL)) AND (([roles] = @original_roles) OR ([roles] IS NULL AND @original_roles IS NULL)) AND (([band] = @original_band) OR ([band] IS NULL AND @original_band IS NULL)) AND (([project_code] = @original_project_code) OR ([project_code] IS NULL AND @original_project_code IS NULL)) AND (([act_date] = @original_act_date) OR ([act_date] IS NULL AND @original_act_date IS NULL)) AND (([log_date] = @original_log_date) OR ([log_date] IS NULL AND @original_log_date IS NULL))" InsertCommand="INSERT INTO [TimeSheets] ([unique_id], [activity_date], [logged_date], [names], [client], [department], [project_name], [quantifiable_measure], [activity], [time_spent], [other_description], [comments], [roles], [band], [project_code], [act_date], [log_date]) VALUES (@unique_id, @activity_date, @logged_date, @names, @client, @department, @project_name, @quantifiable_measure, @activity, @time_spent, @other_description, @comments, @roles, @band, @project_code, @act_date, @log_date)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [TimeSheets] SET [unique_id] = @unique_id, [activity_date] = @activity_date, [logged_date] = @logged_date, [names] = @names, [client] = @client, [department] = @department, [project_name] = @project_name, [quantifiable_measure] = @quantifiable_measure, [activity] = @activity, [time_spent] = @time_spent, [other_description] = @other_description, [comments] = @comments, [roles] = @roles, [band] = @band, [project_code] = @project_code, [act_date] = @act_date, [log_date] = @log_date WHERE [record_id] = @original_record_id AND (([unique_id] = @original_unique_id) OR ([unique_id] IS NULL AND @original_unique_id IS NULL)) AND (([activity_date] = @original_activity_date) OR ([activity_date] IS NULL AND @original_activity_date IS NULL)) AND (([logged_date] = @original_logged_date) OR ([logged_date] IS NULL AND @original_logged_date IS NULL)) AND (([names] = @original_names) OR ([names] IS NULL AND @original_names IS NULL)) AND (([client] = @original_client) OR ([client] IS NULL AND @original_client IS NULL)) AND (([department] = @original_department) OR ([department] IS NULL AND @original_department IS NULL)) AND (([project_name] = @original_project_name) OR ([project_name] IS NULL AND @original_project_name IS NULL)) AND (([quantifiable_measure] = @original_quantifiable_measure) OR ([quantifiable_measure] IS NULL AND @original_quantifiable_measure IS NULL)) AND (([activity] = @original_activity) OR ([activity] IS NULL AND @original_activity IS NULL)) AND (([time_spent] = @original_time_spent) OR ([time_spent] IS NULL AND @original_time_spent IS NULL)) AND (([other_description] = @original_other_description) OR ([other_description] IS NULL AND @original_other_description IS NULL)) AND (([comments] = @original_comments) OR ([comments] IS NULL AND @original_comments IS NULL)) AND (([roles] = @original_roles) OR ([roles] IS NULL AND @original_roles IS NULL)) AND (([band] = @original_band) OR ([band] IS NULL AND @original_band IS NULL)) AND (([project_code] = @original_project_code) OR ([project_code] IS NULL AND @original_project_code IS NULL)) AND (([act_date] = @original_act_date) OR ([act_date] IS NULL AND @original_act_date IS NULL)) AND (([log_date] = @original_log_date) OR ([log_date] IS NULL AND @original_log_date IS NULL))">
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
