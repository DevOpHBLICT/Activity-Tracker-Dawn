<%@ Page Title="Home Page" Language="C#" MasterPageFile="Sites.Master" AutoEventWireup="true" CodeFile="Edit_Project.aspx.cs" Inherits="_Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
      

     <div class="container"> 
         
       <div class="row">
           <div class="form-group">
           <div class="col-sm-6">
           <asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                  </div>

        </div>
       
            
</div>
         </div>

         <br />

      <div class="row">
     <strong>
         Edit Project:
     </strong>
            
          </div>
    <br />
       <div class="row">
           <div class="form-group">
          
           <div class="col-sm-6"> 
    
         Edit Project: <asp:TextBox class="form-control" runat="server" id="Project_name" Width="400px"/>
                         <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="Project_name" errormessage="Please enter Project Name!" />
              </div>

           </div>
       
           </div>

       <div class="row">
           <div class="form-group">
           <div class="col-sm-6"> 
            Project ID:<asp:TextBox class="form-control" runat="server" id="Project_ID"/>
                       <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="Project_ID" errormessage="Please enter Project ID!" />
              </div>
           </div>
       
           </div>

         <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                  Client:<asp:DropDownList ID="Client_name" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True" DataSourceID="Department" 
                      DataTextField="Client_name" DataValueField="Client_name"  >
                   <asp:ListItem Text="--Please Select--" Value="" />   </asp:DropDownList>

                  </div>

                    
                 </div>
         
            </div>
    <br />
         <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                  Current Project:<asp:DropDownList ID="Current_Project" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True" 
                      DataTextField="Current_Project" DataValueField="Current_Project"  >
                   <asp:ListItem Text="--Please Select--" Value="" /> 
                      
   <asp:ListItem Value="Y" Text="Yes"></asp:ListItem>
   <asp:ListItem Value="N" Text="No"></asp:ListItem>  

                                  </asp:DropDownList>

                  </div>

                    
                 </div>
         
            </div>
    <br />
         <div class="row">
             <div class="form-group">
                 <div class="col-sm-6" >
 <div>  <asp:Button style="color:white; Background-Color: #005EB8" ID="Button2" runat="server"  Width="100px" OnClick="Button1_Click" CssClass="btn btn-success" Text="Confirm"    /></div>
                     <br />
                    <div>  <asp:Button ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-danger" Width="100px" Text="Cancel"   /></div>
                 </div>

                 </div>
             </div>
         


      </div>
    
  
       



                   

<asp:SqlDataSource ID="Department" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

SelectCommand="SELECT * FROM [Client_List]" OldValuesParameterFormatString="original_{0}"  >


 </asp:SqlDataSource>
  
 
    <script type="text/javascript">
        
          function validateDec(key) {
              //getting key code of pressed key
              var keycode = (key.which) ? key.which : key.keyCode;
              //comparing pressed keycodes
              if (!(keycode == 8 || keycode == 46) && (keycode < 48 || keycode > 57)) {
                  return false;
              }
              else {
                  var parts = key.srcElement.value.split('.');
                  if (parts.length > 1 && keycode == 46)
                      return false;
                  return true;
              }
          }



          $(document).ready(function () {
              $("[id*=Entry_Date]").datepicker({ dateFormat: 'dd/mm/yy' });



          });
    </script>

     </div>
</asp:Content>
