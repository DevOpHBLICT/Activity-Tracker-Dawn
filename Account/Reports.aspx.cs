using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Account_Manage : System.Web.UI.Page
{

    protected void lbtnAdd_Click(object sender, EventArgs e)

    {

        Response.Redirect("Reports.aspx");

        // Hide the Add button and showing Add panel. 

        // lbtnAdd.Visible = false;



    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Data.DataRowView drv = e.Row.DataItem as System.Data.DataRowView;
            e.Row.Attributes.Add("ondblclick", String.Format("window.location='Edit_Reports.aspx?id={0}&source=default'", drv["record_id"]));
        }
    }



    private void BindGridView()
    {
        GridView1.DataBind();
    }


        

    
}