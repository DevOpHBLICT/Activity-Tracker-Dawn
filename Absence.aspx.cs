using System;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Collections.Generic;
using System.Linq;
public partial class Account_Manage : System.Web.UI.Page
{

    public static List<DateTime> list = new List<DateTime>();
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
        Session["SelectedDates"] = null;
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
       

        if (!IsPostBack)
        {

            list.Clear();


            string strCon = System.Web
                       .Configuration
                       .WebConfigurationManager
                       .ConnectionStrings["LocalityConn"].ConnectionString;


            if (un == "")
            {
                if (Session["name"] != null)
                {
                    un = Session["name"].ToString();
                    Name.Text = un;
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
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
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
      var  ok = 1;
        
        var Error_Text = "Please Enter:";


        if (Name.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Name,"; }
       // set project_code to N/A

        var sql = "";

        if (SickAb.SelectedValue != "Sickness" && SickAb.SelectedValue != "Annual Leave") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Sickness/Annual Leave,"; }

       if (Duration5.Text=="") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Duration,"; }
  

        Error_Label.Text = Error_Text;
        Error_Label.Text = Error_Text.TrimEnd(',');

        if (ok == 1) {
            if (Session["SelectedDates"] != null)
            {
                List<DateTime> newList = (List<DateTime>)Session["SelectedDates"];
                if (newList.Count == 0) { ok = 0; Error_Label.Visible = true; Error_Label.Text = Error_Label.Text + "Date(s)"; }
                if (ok == 1)
                {
                    foreach (DateTime dt in newList.Select(x => x.Date).Distinct())
                    {
                        Save_Data(dt);
                        //             Response.Write(dt.ToShortDateString() + "<BR/>");

                    }
                }
                Session["SelectedDates"] = null;
               
                if (newList.Count > 0)
                {
                    Response.Redirect("Default.aspx");
                }
                list.Clear();
            }
        }
    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Session["SelectedDates"] = null;
        list.Clear();

        Response.Redirect("Default.aspx");
    }

    protected void Clear_Click(object sender, EventArgs e)
    {
        Session["SelectedDates"] = null;
        Calendar.SelectedDates.Clear();
        list.Clear();
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if (Session["SelectedDates"] != null)
        {
            List<DateTime> newList = (List<DateTime>)Session["SelectedDates"];
            foreach (DateTime dt in newList)
            {
                Calendar.SelectedDates.Add(dt);
            }
            list.Clear();
        }
    }


    protected void Save_Data(DateTime dt)
    {

       
        string dt1 = dt.ToString("dd/MM/yyyy");
      

        var ok = 1;
        
        var project_code = "";

        Error_Label.Visible = false;
        var Error_Text = "Please Enter:";

  // set project_code to N/A

        var sql = "";

           if (Session["department"] == null) { Response.Redirect("default"); }

        if (ok == 1)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalityConn"].ConnectionString;
            cnn.Open();

              DateTime logged_date = Convert.ToDateTime(DateTime.Now);

            var pc = project_code;
       
            sql = "";
            sql = sql + "insert into  TimeSheets(unique_id,activity_date,act_date,logged_date,log_date,names,client,department,project_name,quantifiable_measure,activity,time_spent,other_description,comments,roles,band,project_code";

            sql = sql + ")";
            sql = sql + "values(";
            sql = sql + "'" + Name.Text + DateTime.Now.ToString("yyyyMMddHHmmss") + "',";
            sql = sql + "@ActDate,";
            sql = sql + "'" + dt1 + "',";
            sql = sql + "@LogDate,";
            sql = sql + "'" + DateTime.Now.ToString("dd/mm/yyyy") + "',";


            sql = sql + "'" + Name.Text + "',";
            sql = sql + "'HBL Partnership',";
            sql = sql + "'" + Session["department"] + "',";
            sql = sql + "'N/A',";
            sql = sql + "'Function',";
            sql = sql + "'Absence',";
            sql = sql + "'" + Duration5.Text + "',";
            sql = sql + "'',";
            sql = sql + "'" + SickAb.SelectedValue + "',";
            sql = sql + "'" + Session["role"] + "',";
            sql = sql + "'" + Session["band"] + "',";
            sql = sql + "'N/A')";

            //     sql = sql + "'" + Trainer2.SelectedValue + "',";
            //       sql = sql + "'" + Trainer_Dropdown.Text.Replace("'","") + "',";
            //     sql = sql + "'" + txtDate.Text.Replace("'","") + "',";




            SqlCommand cmd2 = new SqlCommand(sql, cnn);
            cmd2.Parameters.Add(new SqlParameter("@ActDate", dt));
            cmd2.Parameters.Add(new SqlParameter("@LogDate", logged_date));
            cmd2.ExecuteNonQuery();
       //     Response.Redirect("Activity.aspx");

            cnn.Close();
        }

    }





    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

        if (Session["name"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        e.Day.IsSelectable = !e.Day.IsWeekend;


       if (e.Day.IsWeekend)
        {
            e.Cell.BackColor = Color.LightBlue;
        }



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

        if (total != 0) { e.Day.IsSelectable = false; e.Cell.BackColor = Color.LightBlue; }
        //only allow annual leave on days with 0 hrs
        conn.Close();



     //   e.Cell.Controls.Add(new LiteralControl("<table style='height:50px;width:100%;'><tr><td style='vertical-align:bottom;padding:5px;'><span class='label label-primary'>" + total + "</span></td></tr></table>"));
        e.Cell.Controls.Add(new LiteralControl("<table style='height:25px;width:100%;'><tr><td style='align:right;padding:5px;border:1px:color:black'><span class='label label-primary'>" + total + "</span></td></tr></table>"));


        if (e.Day.IsSelected == true)
        {
            list.Add(e.Day.Date);
        }
        Session["SelectedDates"] = list;



    }




    protected void Show_All_Click(object sender, EventArgs e)
    {
        Response.Redirect("View_All.aspx");
    }



    protected void ClientSelected(object sender, EventArgs e)
    {

    }
}