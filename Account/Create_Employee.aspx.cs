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



        var ok = 0;







        Error_Label.Visible = false;



        var Error_Text = "Please Enter:";
        


        if (Name.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Name,"; }



        if (AD_Login.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "AD_Login,"; }



        if (Department.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Department,"; }



        if (Band.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Band,"; }



        if (Role.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Role,"; }



        if (WTE.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "WTE,"; }
        


        Error_Label.Text = Error_Text.TrimEnd(',');



        if (ok == 0)


        {

            SqlConnection cnn = new SqlConnection();

            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalityConn"].ConnectionString;



            cnn.Open();







            var sql = "";



            sql = sql + "insert into Employee(e_name,ad_login,department,band,e_role,wte";



            sql = sql + ")";


            sql = sql + "values(";


            sql = sql + "'" + Name.Text + "',";
            sql = sql + "'" + AD_Login.Text + "',";
            sql = sql + "'" + Department.Text + "',";
            sql = sql + "'" + Band.Text + "',";
            sql = sql + "'" + Role.Text + "',";
            sql = sql + "'" + WTE.Text + "')";

            

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




       




    protected void Page_Load(object sender, EventArgs e)



    {














    }




          


    protected void QM_Selecting(object sender, SqlDataSourceCommandEventArgs e)



    {



        e.Command.Parameters["@DynamicVariable"].Value = Session["department"];



    }







    protected void Activity_Selecting(object sender, SqlDataSourceCommandEventArgs e)



    {



        e.Command.Parameters["@DynamicVariable"].Value = Session["department"];



    }







    protected void Prefer_To_Have_SelectedIndexChanged(object sender, EventArgs e)



    {







    }



}





