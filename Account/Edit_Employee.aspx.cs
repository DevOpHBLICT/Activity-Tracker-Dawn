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


        if (Name.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Name,"; }
        if (department.SelectedValue == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Department,"; }
        if (Band.SelectedValue == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Band,"; }
        if (e_role.SelectedValue == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Role,"; }
        if (WTE.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "WTE,"; }

        

        Error_Label.Text = Error_Text.TrimEnd(',');


        if (ok == 1)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalityConn"].ConnectionString;
            cnn.Open();

            var sql = "";
            sql = sql + "update Employee ";

            sql = sql + "set ";
            sql = sql + "department= '" + department.SelectedValue + "',";
            sql = sql + "band='" + Band.SelectedValue + "',";
            sql = sql + "e_role='" + e_role.SelectedValue + "',";
            sql = sql + "wte = '" + WTE.Text + "' ";
         
            sql=sql + "where e_name= '" + e_name.Text + "'";



            SqlCommand cmd2 = new SqlCommand(sql, cnn);
            cmd2.ExecuteNonQuery();

            cnn.Close();

            Response.Redirect("Employee.aspx");


        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Save_Data();



    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Employee.aspx");



    }

    
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {





    }


    protected void OtherSelected(object sender, EventArgs e)
    {
        



    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {



            //Get 
            String i = Request.QueryString["id"].ToString();
            string query = "select * from Employee where record_id ='" + i + "'";
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
                        e_name.Text = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        Name.Text= ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        ad_login.Text = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                        department.SelectedValue = ds.Tables[0].Rows[0].ItemArray[3].ToString();
                        Band.SelectedValue = ds.Tables[0].Rows[0].ItemArray[4].ToString();
                        e_role.SelectedValue = ds.Tables[0].Rows[0].ItemArray[5].ToString();
                        WTE.Text = ds.Tables[0].Rows[0].ItemArray[6].ToString();
                        
                        



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




