<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Account/Sites.Master" AutoEventWireup="true" CodeFile="Create_QM.aspx.cs" Inherits="_Default" %>

 

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

          <asp:Label ID="Label1" runat="server" Text="Create Quantifiable Measure" Font-Size="Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
    <br />
    <br /> 

<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>

 


 

<div class="form-group"> Quantifiable Measure:  <asp:TextBox  runat="server" class="form-control" type = "text" id = "QM" Width="450px"></asp:TextBox> </div>
 

<div class="form-group" > Department: <asp:DropDownList ID="Department" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="False"  

DataSourceID="Project_Department" DataTextField="Department" DataValueField="Department"  ><asp:ListItem Text="--Please Select--" Value="" />   

</asp:DropDownList></div>

 
 
                
      

 

<div class="form-group" >     <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"
    OnClick="Button1_Click" CssClass="btn btn-success" Text="Confirm" width="100px"   />

 <br />
 <br />


<div class="form-group" >       <asp:Button style="color:white;Background-Color: indianred" ID="Cancel" runat="server"  
    OnClick="Cancel_Click" CssClass="btn btn-danger" Text="Cancel" width="100px"  />

 
 

</div> 

 


                     <strong>

 

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

 



 

SelectCommand="SELECT * FROM [Employee_Hierarchy]"></asp:SqlDataSource>

 



 

                     </strong>

 



 

<asp:SqlDataSource ID="QM_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

 



 

SelectCommand="SELECT * FROM [QM_Hierarchy]"

 

               

 

               OnSelecting="QM_Selecting"

 



 

               >

 



 

           </asp:SqlDataSource>

 

  

 



 

<asp:SqlDataSource ID="Activity_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

 

SelectCommand="SELECT * FROM [Activity_Hierarchy]"

 

               

 

               OnSelecting="Activity_Selecting"

 



 

               >

 



 

           </asp:SqlDataSource>

 



 



 

<asp:SqlDataSource ID="Project_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

 

SelectCommand="SELECT * FROM [ProjectHierarchy]" >

 

</asp:SqlDataSource>

 



 



 

      <asp:SqlDataSource ID="Project_Department" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>

 

 

    <asp:SqlDataSource ID="Role_Dropdown" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource>

 

<asp:SqlDataSource ID="Band_Dropdown" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [Band]"></asp:SqlDataSource>

 

      

 

      

 

</asp:Content>

