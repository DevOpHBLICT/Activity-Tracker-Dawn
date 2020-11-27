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




    protected void itemSelected(object sender, EventArgs e)
    {


    }

  



    protected void Save_Data()
    {
        var ok = 1;

        Error_Label.Visible = false;
        var Error_Text = "Please Enter:";


        if (Client_name.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Client_name,"; }
        if (Project_name.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Project_name,"; }
        if (Project_ID.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Project_ID,"; }


        Error_Label.Text = Error_Text.TrimEnd(',');


        if (ok == 1)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalityConn"].ConnectionString;
            cnn.Open();

            var sql = "";
            sql = sql + "update ProjectHierarchy" +

            " set Project_name='" + Project_name.Text + "'," +
            "Current_Project='" + Current_Project.SelectedValue + "'," +
            "Project_ID='" + Project_ID.Text + "'," +
            "Client_name='" + Client_name.SelectedValue + "' where id = '" +
           Request.QueryString["id"].ToString() + "'";








            SqlCommand cmd2 = new SqlCommand(sql, cnn);
            cmd2.ExecuteNonQuery();

            Response.Redirect("ProjectHierarchy.aspx");

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Save_Data();



    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProjectHierarchy.aspx");



    }




    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {





    }





    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {



            //Get 
            String i = Request.QueryString["id"].ToString();
            string query = "select * from ProjectHierarchy where id ='" + i + "'";
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

                        //    string name= ds.Tables[0].Rows[0].ItemArray[4].ToString();
                        String client = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                        Client_name.SelectedValue = client;
                        Project_name.Text = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        Project_ID.Text = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                        Current_Project.SelectedValue= ds.Tables[0].Rows[0].ItemArray[4].ToString();



                    }


                }


            }









          




        }



    }

    protected void OtherSelected(object sender, EventArgs e)
    {


    }

   


    protected void Prefer_To_Have_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}


    

