<%@ Page Title="Home Page" Language="C#" MasterPageFile="Sites.Master" AutoEventWireup="true" CodeFile="Edit_Reports.aspx.cs" Inherits="_Default" %>



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
                         Edit Activity for :       <asp:Label  ID="Name" runat="server" BorderStyle="None" ></asp:Label>
                     </strong>
              </div>
            
           </div>
       </div>
         <br />
  <div class="row">
           <div class="form-group">
           
              <div class="col-sm-6"> 
                  Date:<asp:Label runat="server" id="Entry_Date" BorderStyle="None"/>
                </div>
               <br />
           </div>
       </div>
         <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                  QM<asp:DropDownList ID="QM" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="False"  
 >
                   <asp:ListItem Text="--Please Select--" Value="" />   </asp:DropDownList>

                  </div>
                 <div class="col-sm-6"> 
                     Client:<asp:DropDownList ID="Client" class="form-control"  onselectedindexchanged="ClientSelected" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"  
 ><asp:ListItem Text="--Please Select--" Value="" />    </asp:DropDownList>
                  </div>
                 </div>
         </div>
         <br />
            <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                Activity <asp:DropDownList ID="Activity" onselectedindexchanged="OtherSelected" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"  
DataSourceID="Activity_Hierarchy" DataTextField="Activity" DataValueField="Activity"  ><asp:ListItem Text="--Please Select--" Value="" />   
</asp:DropDownList>
                  <asp:Label ID="OtherLabel" runat="server" Text="Other Description"></asp:Label>
<asp:TextBox ID="OtherDescription" class="form-control" MaxLength="50" runat="server"></asp:TextBox>
                  </div>
                   <div class="col-sm-6"> 
                     Project  <asp:DropDownList ID="Project" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"  
 ><asp:ListItem Text="--Please Select--"  />   
</asp:DropDownList>
                  </div>
                 </div>
         </div>
         <br />
         <div class="row">
            <div class="form-group">
               <div class="col-sm-6">
                   Duration<asp:TextBox ID="Duration" class="form-control" MaxLength="4" runat="server"  onkeypress="return validateDec(event)"  ></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Duration" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression=" ^[0-9](\.[0-9]+)?$">
</asp:RegularExpressionValidator>
               </div>
                
                 <div class="col-sm-6">
                    Comments:<asp:TextBox class="form-control" Rows="2"  TextMode="MultiLine" ID="Comments" runat="server" Height="50px" Width="500px" ></asp:TextBox></div>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Comments" ForeColor = "Red"
ValidationExpression="[a-zA-Z0-9]*$" ErrorMessage="*Valid characters: Alphabets and Numbers." />

               </div>
            </div>
         <div class="row">
             <div class="form-group">
                 <div class="col-sm-6" >
 <div>  <asp:Button style="color:white; Background-Color: #005EB8" ID="Button2" runat="server"  Width="100px" OnClick="Button1_Click" CssClass="btn btn-success" Text="Confirm"    /></div>
                     <br />
                    <div>  <asp:Button ID="Cancel" runat="server"  OnClick="Cancel_Click" CssClass="btn btn-warning" Width="100px" Text="Cancel"   />
                        <br />
                        <br />
                     </div>
       
            <div>  <asp:Button align="right" ID="Delete" runat="server"  OnClick="Delete_Click" CssClass="btn btn-danger" Width="100px" Text="Delete" Enabled="False"   />&nbsp;&nbsp;
                Type 'delete' to delete record<asp:TextBox Autopostback="true" ID="deletebox" OnTextChanged="Delete_Check" runat="server" MaxLength="10"></asp:TextBox>
                     </div>
                     
                 </div>

                 </div>
             </div>
         </div>


      </div>
    
  
       

                     
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

SelectCommand="SELECT * FROM [Client_List]"></asp:SqlDataSource>

                   

<asp:SqlDataSource ID="QM_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

SelectCommand="SELECT [QM] FROM [QM_Hierarchy] where Department=@DynamicVariable" OnSelecting="QM_Selecting"  >

<SelectParameters>
    <asp:Parameter Name="DynamicVariable" Type="String"/>
</SelectParameters>
 </asp:SqlDataSource>
  
 
   <asp:SqlDataSource ID="Activity_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 
SelectCommand="SELECT [Activity] FROM [Activity_Hierarchy] where Department=@DynamicVariable"
               
               OnSelecting="Activity_Selecting"

               >

<SelectParameters>
    <asp:Parameter Name="DynamicVariable" Type="String"/>
</SelectParameters>

           </asp:SqlDataSource>


<asp:SqlDataSource ID="Project_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 
SelectCommand="SELECT [Project_name] FROM [ProjectHierarchy]" >
 </asp:SqlDataSource>
  <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

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



        
    </script>

</asp:Content>
