using System;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class Account_Manage : System.Web.UI.Page
{


    public string un = "";
    public string name = "";
    public string department = "";
    public string Username = "";


string currentId ="";

    decimal subTotal = 0;

    decimal total = 0;

    int subTotalRowIndex = 0;


    protected void OnDataBound(object sender, EventArgs e)

    {
       
            for (int i = subTotalRowIndex; i < GridView1.Rows.Count; i++)

            {

                subTotal += Convert.ToDecimal(GridView1.Rows[i].Cells[3].Text);

            }
            if (total != 0)
            {
                this.AddTotalRow("Total", subTotal.ToString("0.##"));

               }
            
     
    }

    protected void OnRowCreated(object sender, GridViewRowEventArgs e)

    {

            subTotal = 0;

            if (e.Row.RowType == DataControlRowType.DataRow)

            {
            if (e.Row.DataItem != null)
            {
                DataTable dt = (e.Row.DataItem as DataRowView).DataView.Table;

                string orderId = Convert.ToString(dt.Rows[e.Row.RowIndex]["act_date"]);

                total += Convert.ToDecimal(dt.Rows[e.Row.RowIndex]["time_spent"]);

                if (orderId != currentId)

                {

                    if (e.Row.RowIndex > 0)

                    {

                        for (int i = subTotalRowIndex; i < e.Row.RowIndex; i++)

                        {

                            subTotal += Convert.ToDecimal(GridView1.Rows[i].Cells[3].Text);

                        }
                        if (total != 0)
                        {
                            this.AddTotalRow("Sub Total", subTotal.ToString("0.##"));
                        }
                        subTotalRowIndex = e.Row.RowIndex;

                    }

                    currentId = orderId;

                }
            }

            }
        
    }



    private void AddTotalRow(string labelText, string value)

    {
     
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal);

            row.BackColor = Color.White;
            row.ForeColor = ColorTranslator.FromHtml("#005EB8");
            if (labelText == "Total")
            {
                row.BackColor = ColorTranslator.FromHtml("#009639");
                row.ForeColor = Color.White;
                row.CssClass = "bold";

            }
            row.Cells.AddRange(new TableCell[4] { new TableCell (), //Empty Cell

                                        new TableCell { Text = labelText, HorizontalAlign = HorizontalAlign.Right},
                                                    new TableCell { Text = "", HorizontalAlign = HorizontalAlign.Right},
                                        new TableCell { Text = value, HorizontalAlign = HorizontalAlign.Left } });



            GridView1.Controls[0].Controls.Add(row);
       
    }




    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Data.DataRowView drv = e.Row.DataItem as System.Data.DataRowView;
            e.Row.Attributes.Add("ondblclick", String.Format("window.location='Edit_Activity.aspx?id={0}&source=history'", drv["record_id"]));
        }
    }


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




    private DataSet GetData(string query)

    {

        string conString = System.Web
                     .Configuration
                     .WebConfigurationManager
                     .ConnectionStrings["LocalityConn"].ConnectionString;

        SqlCommand cmd = new SqlCommand(query);

        using (SqlConnection con = new SqlConnection(conString))

        {

            using (SqlDataAdapter sda = new SqlDataAdapter())

            {

                cmd.Connection = con;

                sda.SelectCommand = cmd;

                using (DataSet ds = new DataSet())

                {

                    sda.Fill(ds);

                    return ds;

                }

            }

        }
    }



        protected void Page_Load(object sender, EventArgs e)
    {

        string strCon = System.Web
                       .Configuration
                       .WebConfigurationManager
                       .ConnectionStrings["LocalityConn"].ConnectionString;

        //Get Windows Login
        //  string Username = System.Security.Principal.WindowsIdentity.GetCurrent().Name.ToString();
        if (!IsPostBack)
        {
            //   string Username = Request.ServerVariables["LOGON_USER"];
             Username = HttpContext.Current.Request.LogonUserIdentity.Name.ToString();
           
            //   string un = Username.Substring(0, Username.LastIndexOf(@"\") + 1);
            un = Username.Replace("NEBULA\\", "");
         


        }


        if (un.Length > 0)
        {
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

                if (GridView1.Rows[i].Cells[3].Text != "")
                {
                    //         sum += Convert.ToInt32(GridView1.Rows[i].Cells[10].Text);
                    sum += Convert.ToDecimal(GridView1.Rows[i].Cells[3].Text);
                }

            }
            conn.Close();
            //    Total.Text = sum.ToString();
        }
        
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        String s = e.Day.Date.ToString();
        string strCon = System.Web
                    .Configuration
                    .WebConfigurationManager
                    .ConnectionStrings["LocalityConn"].ConnectionString;
        string sql = "select Isnull(sum(Cast([time_spent] as float)),0)  from TimeSheets where names='" + Session["name"].ToString() + "' and act_Date = '" + e.Day.Date.ToShortDateString() + "'";

        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(sql, conn);
        conn.Open();
double total  = (double)comm.ExecuteScalar();


        conn.Close();



     //   e.Cell.Controls.Add(new LiteralControl("<table style='height:50px;width:100%;'><tr><td style='vertical-align:bottom;padding:5px;'><span class='label label-primary'>" + total + "</span></td></tr></table>"));
        e.Cell.Controls.Add(new LiteralControl("<table style='height:25px;width:100%;'><tr><td style='align:right;padding:5px;border:1px:color:black'><span class='label label-primary'>" + total + "</span></td></tr></table>"));

    }




    protected void Show_All_Click(object sender, EventArgs e)
    {
        Response.Redirect("View_All.aspx");
    }


}