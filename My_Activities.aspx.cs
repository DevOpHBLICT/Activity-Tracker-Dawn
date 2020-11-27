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


    public string un = "";
    public string name = "";
    public string department = "";




    private void BindGridView()
    {




        GridView1.DataBind();
    } 


 

   

    

    protected void Page_Load()
    {
       
    }






    

        protected void Page_Load(object sender, EventArgs e)
    {
        //Get Windows Login
        string Username = System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString();
        //   string un = Username.Substring(0, Username.LastIndexOf(@"\") + 1);
        un = Username.Replace("NEBULA\\", "");
        string strCon = System.Web
                      .Configuration
                      .WebConfigurationManager
                      .ConnectionStrings["LocalityConn"].ConnectionString;






        string sql = "select e_name,department from Employee where ad_login='" + un + "'";



        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(sql, conn);
        conn.Open();
        SqlDataReader nwReader = comm.ExecuteReader();
        while (nwReader.Read())
        {
            Session["name"] = (string)nwReader["e_name"];
            Session["department"] = (string)nwReader["department"];
            // Do something with UserID here...
        }
        nwReader.Close();

        SqlDataSource1.SelectParameters["names"].DefaultValue = Session["name"].ToString();

    }
}