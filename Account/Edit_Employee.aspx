<%@ Page Title="Home Page" Language="C#" MasterPageFile="Sites.Master" AutoEventWireup="true" CodeFile="Edit_Employee.aspx.cs" Inherits="_Default" %>



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
                         Edit an Employee:       <asp:Label  ID="Name" runat="server" BorderStyle="None" ></asp:Label>
                     </strong>
              </div>
            
           </div>
       </div>
         <br />
  <div class="row">
           <div class="form-group">
           
              <div class="col-sm-6"> 
                  Name:<asp:TextBox class="form-control" ReadOnly="true" runat="server" id="e_name" Autopostback="true" />
                       <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="e_name" errormessage="Please enter Name!" />
              </div>
           </div>
       </div>

           <div class="row">
           <div class="form-group">
           
              <div class="col-sm-6"> 
                  AD Login:<asp:TextBox ReadOnly="true" class="form-control" runat="server" id="ad_login" Autopostback="true" />
                       <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="ad_login" errormessage="Please enter AD Login!" />
              </div>
           </div>
       </div>

         <div class="row">
             <div class="form-group">
             <div class="col-sm-6"> 
                     Department:<asp:DropDownList ID="department" class="form-control"  runat="server"  AppendDataBoundItems="true" AutoPostBack="True"  
DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="department"  ><asp:ListItem Text="--Please Select--" Value="" />   

                            </asp:DropDownList>
                  </div>
                 </div>
         </div>


            <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                  Band:<asp:DropDownList ID="Band"  class="form-control" runat="server"  AppendDataBoundItems="True" AutoPostBack="True"  
DataSourceID="GetBand" DataTextField="Band" DataValueField="Band"  ><asp:ListItem Text="--Please Select--" Value="" />   
</asp:DropDownList>
                  
                  <asp:SqlDataSource ID="GetBand" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [Band]"></asp:SqlDataSource>
                  
                  </div>

             <div class="row">
             <div class="form-group">
                   <div class="col-sm-6"> 
                     Role:<asp:DropDownList ID="e_role" class="form-control" runat="server"  AppendDataBoundItems="True" AutoPostBack="True"  
 DataTextField="Role" DataValueField="Role"  DataSourceID="GetRole"><asp:ListItem Text="--Please Select--" Value="" />   
</asp:DropDownList>
                       <asp:SqlDataSource ID="GetRole" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource>
                  </div>
                 </div>
         </div>
         <br />
         <div class="row">
            <div class="form-group">
               <div class="col-sm-6">
                   WTE:<asp:TextBox ID="WTE" class="form-control" MaxLength="6" runat="server"  onkeypress="return onlyNumbersWithDot(event);" ></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1"
    ControlToValidate="WTE" runat="server"
    ErrorMessage="Only Numbers allowed"
    ValidationExpression="\d{1,2}[\.]{1}\d{1,2}">
</asp:RegularExpressionValidator>
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
           <br />
 <div>
  
       



                   


  
 
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

           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>

  



  <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>




      <script type="text/javascript">




          $(document).ready(function () {
              $("[id*=Entry_Date]").datepicker({ dateFormat: 'dd/mm/yy' });



          });
    </script>



     </div>
     </div>
     </div>
     </div>
     </div>
</asp:Content>

