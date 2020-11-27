<%@ Page Title="Home Page" Language="C#" MasterPageFile="Sites.Master" AutoEventWireup="true" CodeFile="Edit_Activity.aspx.cs" Inherits="_Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
      

     <div class="container"> 
         
       <div class="row">
           <div class="form-group">
              <div class="col-sm-6">
             <asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                  </div>

        </div>
       <div class="row">
           <div class="form-group">
              <div class="col-sm-6"> 
                   <strong>
                         Edit an Activity</strong></div>
            
           </div>
       </div>
         <br />
  <div class="row">
    
             <div class="form-group">
              <div class="col-sm-6"> 
                  Department<asp:DropDownList ID="Department" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"  
  >
                   <asp:ListItem Text="--Please Select--" Value="" />   </asp:DropDownList>

                  </div>
                
         </div>
      </div>
        
            <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                  Activity 
                  <asp:TextBox class="form-control" ID="Activity" runat="server" Text="Activity"></asp:TextBox>

                  </div>
                  
         </div>
      </div>
         <div class="row">
             <div class="form-group">
                 <div class="col-sm-6" >
                 </div>
                  <div class="col-sm-6">
                   <div>  <asp:Button style="color:white;Background-Color: #005EB8" ID="Button2" runat="server"  Width="100px" OnClick="Button1_Click" CssClass="btn btn-success" Text="Confirm"    /></div>
                     <br />
                    <div>  <asp:Button ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-danger" Width="100px" Text="Cancel"   /></div>
                 </div>
             </div>
         </div>
      
 <div>
  
       



                   

   
     </div>


                   

   <asp:SqlDataSource ID="Activity_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 
SelectCommand="SELECT * FROM [Activity_Hierarchy]"           
               >

           </asp:SqlDataSource>





     </div>
</asp:Content>

