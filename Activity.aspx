<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="_Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
    
  <script type="text/javascript">
      function() {
          $(".target-active").find("[href='/']").parent().addClass("active");
      });
  </script>


   <script type="text/javascript">
       function onlyNumbersWithDot(e) {
           var charCode;
           if (e.keyCode > 0) {
               charCode = e.which || e.keyCode;
           }
           else if (typeof (e.charCode) != "undefined") {
               charCode = e.which || e.keyCode;
           }
           if (charCode == 46)
               return true
           if (charCode > 31 && (charCode < 48 || charCode > 57))
               return false;
           return true;
       }
    </script>


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
                         Create an Activity for :       <asp:Label  ID="Name" runat="server" BorderStyle="None" ></asp:Label>
                     </strong>
              </div>
            
           </div>
       </div>
         <br />
  <div class="row">
           <div class="form-group">
           
              <div class="col-sm-6"> 
                  Date:<asp:TextBox class="form-control" AutoCompleteType="Disabled" runat="server" autocomplete="false" id="Entry_Date" Autopostback="true"  ontextchanged="TextBox1_TextChanged"/>
                       <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="Entry_Date" errormessage="Please enter date!" />
              </div>
           </div>
       </div>
         <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                  QM<asp:DropDownList ID="QM"  autocomplete="false"  class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="False"  
  DataSourceID="QM_Hierarchy" DataTextField="QM" DataValueField="QM"  >
                   <asp:ListItem Text="--Please Select--" Value="" />   </asp:DropDownList>

                  </div>
                 <div class="col-sm-6"> 
                     Client:<asp:DropDownList ID="Client" class="form-control"  autocomplete="false"  runat="server"  AppendDataBoundItems="true" AutoPostBack="True"  
DataSourceID="SqlDataSource1" DataTextField="Client_Name" DataValueField="Client_Name"  onselectedindexchanged="ClientSelected"><asp:ListItem Text="--Please Select--" Value="" />    </asp:DropDownList>
                  </div>
                 </div>
         </div>
         <br />
            <div class="row">
             <div class="form-group">
              <div class="col-sm-6"> 
                  Activity <asp:DropDownList ID="Activity"  autocomplete="false"  class="form-control" runat="server"  AppendDataBoundItems="true" AutoPostBack="True"  
DataSourceID="Activity_Hierarchy" DataTextField="Activity" onselectedindexchanged="Activity_Selected" DataValueField="Activity"  ><asp:ListItem Text="--Please Select--" Value="" />   
</asp:DropDownList>
                 
   <br />
                        <asp:Label ID="Activity_Other_Label" runat="server" Text="Other Activity"></asp:Label>
<asp:TextBox ID="ActivityOther"  autocomplete="false" class="form-control" Height="50px" Width="500px" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="ActivityOther" ForeColor = "Red"
ValidationExpression="[a-zA-Z0-9]]{0,100}$" ErrorMessage="*Valid characters: Alphabets and Numbers./100 characters max" />
                  </div>
                   <div class="col-sm-6"> 
                     Project  <asp:DropDownList ID="Project" class="form-control" runat="server"  autocomplete="false"  AppendDataBoundItems="True" AutoPostBack="True"  
 DataTextField="Project_name" DataValueField="Project_name"  onselectedindexchanged="Project_Selected" OnSelecting="Project_Selecting"><asp:ListItem Text="--Please Select--" Value="" />   
</asp:DropDownList>
                       <br />
                        <asp:Label ID="OtherLabel" runat="server" Text="Other Project"></asp:Label>
<asp:TextBox ID="OtherDescription"  autocomplete="false"  class="form-control" Height="50px" Width="500px" runat="server"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="OtherDescription" ForeColor = "Red"
ValidationExpression="[a-zA-Z0-9]]{0,100}$" ErrorMessage="*Valid characters: Alphabets and Numbers./100 characters max" />
                  </div>
                 </div>
         </div>
         <br />
         <div class="row">
            <div class="form-group">
               <div class="col-sm-6">
                   Duration<asp:TextBox ID="Duration"   AutoCompleteType="Disabled" autocomplete="false" class="form-control" MaxLength="4" runat="server"  onkeypress="return onlyNumbersWithDot(event);" ></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1"
    ControlToValidate="Duration" runat="server"
    ErrorMessage="Only Numbers allowed"
    ValidationExpression="\d{1,2}[\.]{1}\d{1,2}">
</asp:RegularExpressionValidator>
               </div>
                
                 <div class="col-sm-6">
                    Comments:<asp:TextBox autocomplete="false"  class="form-control" Rows="2"  TextMode="MultiLine" ID="Comments" runat="server" Height="50px" Width="500px" ></asp:TextBox></div>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Comments" ForeColor = "Red"
ValidationExpression="[a-zA-Z0-9]]{0,100}$" ErrorMessage="*Valid characters: Alphabets and Numbers./100 characters max" />

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

           <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%"   OnDataBound = "OnDataBound" OnRowCreated = "OnRowCreated"    >
               <AlternatingRowStyle BackColor="White" />
              
              
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

           </div>
      </div>
    
  
    </div>   

                     
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

SelectCommand="SELECT [Client_Name] FROM [Client_List] order by Client_Name"></asp:SqlDataSource>

                   

<asp:SqlDataSource ID="QM_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 

SelectCommand="SELECT [QM] FROM [QM_Hierarchy] where Department=@DynamicVariable order by QM" OnSelecting="QM_Selecting"  >

<SelectParameters>
    <asp:Parameter Name="DynamicVariable" Type="String"/>
</SelectParameters>
 </asp:SqlDataSource>
  
 
   <asp:SqlDataSource ID="Activity_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 
SelectCommand="SELECT [Activity] FROM [Activity_Hierarchy]  where Department=@DynamicVariable  order by Activity"
               
               OnSelecting="Activity_Selecting"

               >

<SelectParameters>
    <asp:Parameter Name="DynamicVariable" Type="String"/>
</SelectParameters>

           </asp:SqlDataSource>


<asp:SqlDataSource ID="Project_Hierarchy" runat="server" ConnectionString="<%$ ConnectionStrings:LocalityConn %>" 
SelectCommand="SELECT [Project_ID], [Project_name], [Client_Name] FROM [ProjectHierarchy]  WHERE Current_Project='Y' and  Client_Name=@DynamicVariable order by Project_name" >

    <SelectParameters>
    <asp:Parameter Name="DynamicVariable" Type="String"   />
</SelectParameters>
                 


 </asp:SqlDataSource>
  <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>




      <script type="text/javascript">

         


          $(document).ready(function () {
              $("[id*=Entry_Date]").datepicker({ dateFormat: 'dd/mm/yy', maxDate: '0' });



          });
    </script>



</asp:Content>
