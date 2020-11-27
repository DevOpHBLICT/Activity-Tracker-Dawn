using System;
using System.Data.SqlClient;
using System.Web;



public partial class Account_Manage : System.Web.UI.Page
{


    public string un = "";
    public string name = "";
    public string department = "";




    private void BindGridView()
    {




        GridView1.DataBind();
    }


    private void GrandTotal()
    {

    }





    protected void Page_Load()
    {

    }








    protected void Page_Load(object sender, EventArgs e)
    {
        //Get Windows Login
        //  string Username = System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString();
        string Username = HttpContext.Current.Request.LogonUserIdentity.Name.ToString();

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
            SqlDataSource1.SelectParameters["names"].DefaultValue = (string)nwReader["e_name"];
            Session["department"] = (string)nwReader["department"];

            // Do something with UserID here...
        }
        nwReader.Close();

        decimal sum = 0;

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            //  sum += Convert.ToInt32(GridView1.Rows[i].Cells[10].Text);
            sum += Convert.ToDecimal(GridView1.Rows[i].Cells[3].Text);

        }

        Total.Text = sum.ToString();


    }


    protected void Show_One_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

}