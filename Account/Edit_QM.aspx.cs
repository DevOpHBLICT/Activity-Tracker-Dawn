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

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Data.DataRowView drv = e.Row.DataItem as System.Data.DataRowView;
            e.Row.Attributes.Add("ondblclick", String.Format("window.location='Edit_QM.aspx?id={0}'", drv["id"]));
        }
    }




    protected void Save_Data()
    {
        var ok = 1;

        Error_Label.Visible = false;
        var Error_Text = "Please Enter:";


        if (QM.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "QM,"; }
        if (Department.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Department,"; }


        Error_Label.Text = Error_Text.TrimEnd(',');


        if (ok == 1)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalityConn"].ConnectionString;
            cnn.Open();

            var sql = "";
            sql = sql + "update QM_Hierarchy" +

            " set QM='" + QM.Text + "'," +
            "department='" + Department.SelectedValue + "' where id = '" +
           Request.QueryString["id"].ToString() + "'";








            SqlCommand cmd2 = new SqlCommand(sql, cnn);
            cmd2.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("QM.aspx");

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Save_Data();



    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("QM.aspx");



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
            string query = "select * from QM_Hierarchy where id ='" + i + "'";
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

                        Department.SelectedValue = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                        QM.Text = ds.Tables[0].Rows[0].ItemArray[2].ToString();
                        


                      
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


    

