<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Account/Sites.Master" AutoEventWireup="true" CodeFile="Create_Activity.aspx.cs" Inherits="_Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

         <asp:Label ID="Label1" runat="server" Text="Create Activity" Font-Size="Large" Font-Underline="True" Font-Bold="True"></asp:Label>
    
    <br />
    <br />
 
<asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>

 
 



 



 

<div class="form-group" > Department: <asp:DropDownList ID="Department" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="False"  

DataSourceID="Department1" DataTextField="Department" DataValueField="Department"  ><asp:ListItem Text="--Please Select--" Value="" />   

</asp:DropDownList></div>

 


 


 

<div class="form-group" > Activity: <asp:TextBox  runat="server" class="form-control" type = "text" id = "Activity" > </asp:TextBox>

   

 

 

</div>

 


   

 

<div class="form-group" >     <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"  OnClick="Button1_Click" CssClass="btn btn-success" Text="Confirm" width="100px"   /></div>

<div class="form-group" >       <asp:Button style="color:white;Background-Color: indianred" ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-danger" Text="Cancel" width="100px"  /></div>

      

 

 

 

   

<asp:SqlDataSource ID="Department1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

SelectCommand="SELECT * FROM [Department]"

 


          

 


               >



           </asp:SqlDataSource>

 


 


      

 

</asp:Content>

