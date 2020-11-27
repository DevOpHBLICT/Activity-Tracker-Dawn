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
        


        

        if (Department.SelectedValue == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Department,"; }



       



        if (Activity.Text == "") { ok = 1; Error_Label.Visible = true; Error_Text = Error_Text + "Activity,"; }
        


        Error_Label.Text = Error_Text.TrimEnd(',');



        if (ok == 0)


        {

            SqlConnection cnn = new SqlConnection();

            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalityConn"].ConnectionString;



            cnn.Open();


            var sql = "";

            sql = sql + "insert into Activity_Hierarchy(department,activity";
            sql = sql + ")";
            sql = sql + "values(";
            sql = sql + "'" + Department.SelectedValue + "',";
            sql = sql + "'" + Activity.Text + "'";
            sql = sql + ")";

            

            SqlCommand cmd2 = new SqlCommand(sql, cnn);



            cmd2.ExecuteNonQuery();

            cnn.Close();
            Response.Redirect("Create_Activity.aspx");


        }







    }











    protected void Button1_Click(object sender, EventArgs e)



    {




        Save_Data();



                                    

    }











    protected void Cancel_Click(object sender, EventArgs e)



    {



        Response.Redirect("Activity.aspx");






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





