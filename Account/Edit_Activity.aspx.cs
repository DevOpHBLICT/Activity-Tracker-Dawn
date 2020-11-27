using System;
using System.Collections.Generic;
using System.Linq;
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


public partial class _Default : Page
{




    protected void Save_Data()
    {
        var ok = 1;

        Error_Label.Visible = false;
        var Error_Text = "Please Enter:";


            if (Department.SelectedValue == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Department,"; }
        if (Activity.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Activity,"; }

    
        Error_Label.Text = Error_Text.TrimEnd(',');


        if (ok == 1)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalityConn"].ConnectionString;
            cnn.Open();

            var sql = "";
            sql = sql + "update Activity_Hierarchy set ";
            sql = sql + "department = '" + Department.SelectedValue + "',";
            sql = sql + "activity = '" +Activity.Text + "' ";
            
            sql = sql  +"where id = '" + Request.QueryString["id"].ToString() + "'";

            //     sql = sql + "'" + Trainer2.SelectedValue + "',";
            //       sql = sql + "'" + Trainer_Dropdown.Text.Replace("'","") + "',";
            //     sql = sql + "'" + txtDate.Text.Replace("'","") + "',";




            SqlCommand cmd2 = new SqlCommand(sql, cnn);
            cmd2.ExecuteNonQuery();

            cnn.Close();
            Response.Redirect("Activity.aspx");


        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Save_Data();



    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reports.aspx");



    }

    
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {





    }


    protected void Department_DropDown()
    {





        //Call your stored procedure here

        string strCon = System.Web
                   .Configuration
                   .WebConfigurationManager
                   .ConnectionStrings["LocalityConn"].ConnectionString;


        //Use a using statement to handle your SQL calls (it's much safer)
        using (SqlConnection sqlConnection = new SqlConnection(strCon))
        {
            //Your SQL Command
            SqlCommand cmd = new SqlCommand("select * from Department;", sqlConnection);

            //Open your connection
            sqlConnection.Open();

            //Set up your databinding
            Department.DataSource = cmd.ExecuteReader();
         Department.DataTextField = "Department";
           Department.DataValueField = "Department";
     
            //Bind your data
            Department.DataBind();
            sqlConnection.Close();

        }


    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {



            //Get 
            String i = Request.QueryString["id"].ToString();
            string query = "select * from Activity_Hierarchy where id ='" + i + "'";
            SqlCommand cmd = new SqlCommand(query);

            string strCon = System.Web
                      .Configuration
                      .WebConfigurationManager
                      .ConnectionStrings["LocalityConn"].ConnectionString;


            using (SqlConnection con = new SqlConnection(strCon))

            {

                using (SqlDataAdapter sda = new SqlDataAdapter())

                {

                    cmd.Connection = con;

                    sda.SelectCommand = cmd;

                    using (DataSet ds = new DataSet())

                    {

                        sda.Fill(ds);
                        Department_DropDown();
                        if (Department.Items.FindByValue(ds.Tables[0].Rows[0].ItemArray[0].ToString()) == null)
                        {
                           Department.Items.Insert(0, new ListItem(ds.Tables[0].Rows[0].ItemArray[0].ToString(), ds.Tables[0].Rows[0].ItemArray[0].ToString()));
                        }
                        Department.SelectedValue = ds.Tables[0].Rows[0].ItemArray[0].ToString();

                     Activity.Text = ds.Tables[0].Rows[0].ItemArray[1].ToString();



                        //  Duration.Text= ds.Tables[0].Rows[0].ItemArray[16].ToString();
                    }


                }


            }


                                             


        }



    }

     
    

    protected void Prefer_To_Have_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

   
}




