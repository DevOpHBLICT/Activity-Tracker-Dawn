using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



public partial class Account_Manage : System.Web.UI.Page
{
   


    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalityConn"].ToString()))
        {
            // Create a command object. 
            SqlCommand cmd = new SqlCommand();


            // Assign the connection to the command. 
            cmd.Connection = conn;


            // Set the command text 
            // SQL statement or the name of the stored procedure  
            cmd.CommandText = "INSERT INTO Department(Department, Project_Eligible) VALUES ( @Department, 0)";


            // Set the command type 
            // CommandType.Text for ordinary SQL statements;  
            // CommandType.StoredProcedure for stored procedures. 
            cmd.CommandType = CommandType.Text;


            // Append the parameters. 
            cmd.Parameters.Add("@Department", SqlDbType.NVarChar, 50).Value = Department.Text;



            // Open the connection. 
            conn.Open();


            // Execute the command. 
            cmd.ExecuteNonQuery();

            conn.Close();

        }


        // Rebind the GridView control to show inserted data. 
        BindGridView();


        // Empty the TextBox controls. 
        Department.Text = "";



        // Show the Add button and hiding the Add panel. 
      //  lbtnAdd.Visible = true;
     //   pnlAdd.Visible = false;
    }
    private void BindGridView()
    {
        GridView1.DataBind();
    }


    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        // Empty the TextBox controls. 
      Department.Text = "";



        // Show the Add button and hiding the Add panel. 
     //   lbtnAdd.Visible = true;
      //  pnlAdd.Visible = false;
    }






    protected void Page_Load()
    {

    }








    protected void Page_Load(object sender, EventArgs e)
    {
    }
}