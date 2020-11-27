<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Thankyou.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
    <link href="Content/themes/site.css" rel="stylesheet" />
     <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.js"></script>

    <link rel="stylesheet" href="Scripts/jquery.ui.all.css">
		<script src="Scripts/jquery.ui.core.js"></script>
	<script src="Scripts/jquery.ui.widget.js"></script>
	<script src="Scripts/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="Scripts/demos.css">



    <script type="text/javascript">
        $(function () {

            $("[id$=txtDate]").datepicker({

                showOn: 'button',
                buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
                dateFormat: 'dd-mm-yy',
                buttonImageOnly: true,


            });

        });
</script>


<div style=" color: #336699;">
 
      <br />
      <span style="font-size: medium"><strong>Thankyou for taking the time to complete this evaluation!&nbsp;</tr></table></strong></span>
        <br />
        <br /><br />
      
    </div>
    <div style="margin-top:50px; background-color:Silver; padding:10px 5px 10px 5px;">
   
    </div>

  
 
</asp:Content>
