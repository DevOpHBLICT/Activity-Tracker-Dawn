<%@ Page Title="Home Page" Language="C#" MasterPageFile="Sites.Master" AutoEventWireup="true" CodeFile="Edit_QM.aspx.cs" Inherits="_Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
      

     <div class="container"> 
         
       <div class="row">
           <div class="form-group">
              <div class="col-sm-6">
             <asp:Label ID="Error_Label" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                  </div>

        </div>
       
            
</div>
         

         <br />

<div class="row">
           <div class="form-group">
              <div class="col-sm-6"> 
                   <strong>
                         Edit Quantifiable Measure:       <asp:Label  ID="ID" runat="server" BorderStyle="None" ></asp:Label>
                     </strong>
              </div>
</div>
    </div>


  <div class="row">
           <div class="form-group">
           
              <div class="col-sm-6"> 
                  Quantifiable Measure:<asp:TextBox class="form-control" runat="server" id="QM" Width="200px"/>
                       <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="QM" errormessage="Please enter QM!" />
              </div>

           </div>
       
           </div>
      
         <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                  Department<asp:DropDownList ID="Department" class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"  
  DataSourceID="QM_Hierarchy" DataTextField="Department" DataValueField="Department"  >
                   <asp:ListItem Text="--Please Select--" Value="" />   </asp:DropDownList>

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
         


      
    
  
       



                   

<asp:SqlDataSource ID="QM_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

SelectCommand="SELECT * FROM [Department]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Department] WHERE [ID] = @original_ID AND [Department] = @original_Department AND [Project_Eligible] = @original_Project_Eligible" InsertCommand="INSERT INTO [Department] ([Department], [Project_Eligible]) VALUES (@Department, @Project_Eligible)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Department] SET [Department] = @Department, [Project_Eligible] = @Project_Eligible WHERE [ID] = @original_ID AND [Department] = @original_Department AND [Project_Eligible] = @original_Project_Eligible"  >
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int32" />
        <asp:Parameter Name="original_Department" Type="String" />
        <asp:Parameter Name="original_Project_Eligible" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Department" Type="String" />
        <asp:Parameter Name="Project_Eligible" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Department" Type="String" />
        <asp:Parameter Name="Project_Eligible" Type="Int32" />
        <asp:Parameter Name="original_ID" Type="Int32" />
        <asp:Parameter Name="original_Department" Type="String" />
        <asp:Parameter Name="original_Project_Eligible" Type="Int32" />
    </UpdateParameters>


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

</asp:Content>
