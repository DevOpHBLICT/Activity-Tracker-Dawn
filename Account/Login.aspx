<%@ Page Title="Log in" Language="C#" MasterPageFile="S.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
  
    <table align="center">
           <tr>
             <td>
              
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                 </td></tr>
                    <tr>

        <td>

                         <asp:Label runat="server" AssociatedControlID="UserName" CssClass="" style="text-align: left">Username:</asp:Label>
                              </td> <td>
                               <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                         </td><td>
                                     <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="The user name field is required." />
                </td>
                              
                  
                    </tr>
                    <tr><td>
     
                        <asp:Label runat="server" AssociatedControlID="Password" style="text-align: left">Password:</asp:Label></td><td >
                         
                               <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control"  />
                     </td><td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                     </td></tr><tr><td>
                             
                   <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                             
                        </td><td>
                             
                      
                             
                        </td><td>
                             
                        </td><td>
                 
                  
                             &nbsp;</td></tr><tr><td>
                             &nbsp;</td></tr>
               
          
        

      
  
        </table>
</asp:Content>

