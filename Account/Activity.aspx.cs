using Microsoft.AspNet.Identity;

using System;

using System.Collections.Generic;

using System.Linq;

using WebSite6;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Data.SqlClient;

using System.Data;

using System.Net.Mail;

using System.Collections;

using System.Configuration;

using System.Web.Security;

using System.Web.UI.HtmlControls;

using System.Web.UI.WebControls.WebParts;

using System.IO;

using System.Text;

using System.Net.Mime;







public partial class Account_Manage : System.Web.UI.Page

{

    protected void lbtnAdd_Click(object sender, EventArgs e)

    {

        Response.Redirect("Create_Activity.aspx");

        // Hide the Add button and showing Add panel. 

        lbtnAdd.Visible = false;



    }



    
    private void BindGridView()

    {

        GridView1.DataBind();

    }





    protected void lbtnCancel_Click(object sender, EventArgs e)

    {

        // Empty the TextBox controls. 









        // Show the Add button and hiding the Add panel. 

        lbtnAdd.Visible = true;



    }













    protected void Page_Load()

    {



    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Data.DataRowView drv = e.Row.DataItem as System.Data.DataRowView;
            e.Row.Attributes.Add("ondblclick", String.Format("window.location='Edit_Activity.aspx?id={0}'", drv["id"]));
        }
    }


          



    protected void Page_Load(object sender, EventArgs e)

    {

    }

}
