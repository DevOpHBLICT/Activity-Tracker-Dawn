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
using System.Drawing;

public partial class _Default : Page
{
    string currentId = "";
    decimal subTotal = 0;

    decimal total = 0;

    int subTotalRowIndex = 0;

    protected void itemSelected(object sender, EventArgs e)
    {

   
    }


   
   protected void Save_Data()
    {
        var ok = 1;
        var project_code = "";
       
        Error_Label.Visible=false;
        var Error_Text="Please Enter:";
      

       if (Name.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Name,"; } 
       if (Entry_Date.Text == "") { ok = 0; Error_Label.Visible = true;Error_Text=Error_Text+"Date,"; }
       if (Client.SelectedValue == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Client,"; }
       if (QM.SelectedValue == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "QM,"; }
       if (Activity.SelectedValue == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Activity,"; }
       if (Project.SelectedValue == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Project,"; }

        // set project_code to N/A
      
       
        string strCon = System.Web
        .Configuration
        .WebConfigurationManager
        .ConnectionStrings["LocalityConn"].ConnectionString;
        string sql = "select Project_ID from ProjectHierarchy where Project_name='" + Project.SelectedValue + "'";
        SqlConnection conn = new SqlConnection(strCon);
        SqlCommand comm = new SqlCommand(sql, conn);
        conn.Open();
        project_code = (String)comm.ExecuteScalar();

        conn.Close();

        if (Project.SelectedValue == "--Please Select--") { project_code = "--Please Select--";Project.SelectedValue = "N/A"; }
        if (Project.SelectedValue == "N/A") { project_code = "N/A"; }
        if (project_code == "") { project_code = Project.SelectedValue; }

        if (Duration.Text == "") { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Duration,"; }

    //   if ((OtherDescription.Text == "") && (Activity.SelectedValue.Contains("Other"))) { ok = 0; Error_Label.Visible = true; Error_Text = Error_Text + "Other Description,"; }

        Error_Label.Text = Error_Text.TrimEnd(',');
       if (Session["department"] == null) { Response.Redirect("default"); }

       if (ok ==1)
        {
            SqlConnection cnn = new SqlConnection();
            cnn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalityConn"].ConnectionString;
            cnn.Open();

            DateTime activity_date = Convert.ToDateTime(Entry_Date.Text);
            DateTime logged_date = Convert.ToDateTime(DateTime.Now);

            var pc = project_code;
            var pc_desc = Project.SelectedValue;
          if (OtherDescription.Text.Length>0)
            {
                pc = OtherDescription.Text;
                pc_desc = OtherDescription.Text;
            }
            sql = "";
            sql = sql + "insert into  TimeSheets(unique_id,activity_date,act_date,logged_date,log_date,names,client,department,project_name,quantifiable_measure,activity,time_spent,other_description,comments,roles,band,project_code";
            
             sql = sql + ")";
            sql = sql + "values(";
            sql = sql + "'" + Name.Text + DateTime.Now.ToString("yyyyMMddHHmmss") + "',";
            sql = sql + "@ActDate,";
            sql = sql + "'" + Entry_Date.Text + "'," ;
            sql = sql + "@LogDate,";
            sql = sql + "'" + DateTime.Now.ToString("dd/mm/yyyy") + "',";
         
            
            sql = sql + "'" + Name.Text + "',";
         sql = sql + "'" + Client.SelectedValue + "',";
         sql = sql + "'" + Session["department"] + "',";
      sql = sql + "'" + pc_desc + "',";
        sql = sql + "'" + QM.SelectedValue + "',";
         sql = sql + "'" + Activity.SelectedValue + "',";
         sql = sql + "'" + Duration.Text + "',";
            sql = sql + "'" + ActivityOther.Text + "',";
            sql = sql + "'" + Comments.Text.Replace("\"", "").Replace("'", "") + "',"; 
            sql = sql + "'" + Session["role"] + "',";
            sql = sql + "'" + Session["band"] + "',";
            sql = sql + "'" + pc + "')";
         
            //     sql = sql + "'" + Trainer2.SelectedValue + "',";
            //       sql = sql + "'" + Trainer_Dropdown.Text.Replace("'","") + "',";
            //     sql = sql + "'" + txtDate.Text.Replace("'","") + "',";




            SqlCommand cmd2 = new SqlCommand(sql, cnn);
            cmd2.Parameters.Add(new SqlParameter("@ActDate", activity_date));
            cmd2.Parameters.Add(new SqlParameter("@LogDate", logged_date));
            cmd2.ExecuteNonQuery();
            Response.Redirect("Activity.aspx");

            cnn.Close();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Save_Data();



    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");



    }

    public void TextBox1_TextChanged(object sender, EventArgs e)
    {
      

            SqlDataSource SqlDataSource5 = new SqlDataSource();

            SqlDataSource1.ID = "SqlDataSource5";

            this.Page.Controls.Add(SqlDataSource5);

            SqlDataSource5.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            //    SELECT* FROM[TimeSheets] WHERE([names] = @names) and convert(date, act_Date,103) >= DATEADD(day, -7, GETDATE()) order by convert(date, act_Date, 103) desc
            SqlDataSource5.SelectCommand = "SELECT act_date,time_spent, comments, department,project_name ,quantifiable_measure, activity from TimeSheets where  [names] = '" +  Name.Text + "' and convert(date,act_Date,103) =convert(date,'" + Entry_Date.Text + "',103)" +   " order by convert(date,act_Date,103) desc";

            GridView1.DataSource = SqlDataSource5;

            GridView1.DataBind();

       

    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    
     
     

    }


    protected void OnDataBound(object sender, EventArgs e)

    {

        for (int i = subTotalRowIndex; i < GridView1.Rows.Count; i++)

        {

            subTotal += Convert.ToDecimal(GridView1.Rows[i].Cells[1].Text);

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

                            subTotal += Convert.ToDecimal(GridView1.Rows[i].Cells[1].Text);

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
        row.Cells.AddRange(new TableCell[2] {

                                        new TableCell { Text = labelText, HorizontalAlign = HorizontalAlign.Left},
                                        new TableCell { Text = value, HorizontalAlign = HorizontalAlign.Left } });



        GridView1.Controls[0].Controls.Add(row);

    }





    protected void Page_Load(object sender, EventArgs e)
    {

        if (Name.Text == "")
        {
            if (Session["name"] != null)
            {
                Name.Text = Session["name"].ToString();
            }else
            {
                Response.Redirect("Default.aspx");
            }
        }
        if (!IsPostBack)
        {

            if (Session["name"] != null)
            {


                Project.Items.Add(new ListItem("N/A", "N/A"));
                OtherLabel.Visible = false;
                OtherDescription.Visible = false;
                ActivityOther.Visible = false;
                Activity_Other_Label.Visible = false;
            }



        }


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

    protected void Project_DropDown()
    {



        //Your ID to use
        string id = Client.SelectedValue;

        //Call your stored procedure here

        string strCon = System.Web
                   .Configuration
                   .WebConfigurationManager
                   .ConnectionStrings["LocalityConn"].ConnectionString;


        //Use a using statement to handle your SQL calls (it's much safer)
        using (SqlConnection sqlConnection = new SqlConnection(strCon))
        {
            //Your SQL Command
            SqlCommand cmd = new SqlCommand("select * from ProjectHierarchy where Current_Project='Y' and  Client_Name ='" + Client.Text + "' order by Project_Name;", sqlConnection);

            //Open your connection
            sqlConnection.Open();

            //Set up your databinding
            Project.DataSource = cmd.ExecuteReader();
            Project.DataTextField = "Project_name";
            Project.DataValueField = "Project_name";
            Project.Items.Insert(0, "--Please Select--");
            Project.Items.Insert(1, "N/A");
            //Bind your data
            Project.DataBind();

            sqlConnection.Close();

        }


    }

    protected void ClientSelected(object sender, EventArgs e)
    {
        Project.Items.Clear();
        Project_DropDown();
    }



    protected void Activity_Selected(object sender, EventArgs e)

    {
        if (Activity.SelectedValue.Contains("Other"))
        {
            Activity_Other_Label.Visible = true;
           ActivityOther.Visible = true;


        }
        else
        {
            Activity_Other_Label.Visible = false;
            ActivityOther.Visible = false;
            ActivityOther.Text = "";
        }
    }




    protected void Project_Selected(object sender, EventArgs e)

    {
        if (Project.SelectedValue.Contains("Other"))
        {
            OtherLabel.Visible = true;
            OtherDescription.Visible = true;
           

        }
        else
        {
            OtherLabel.Visible = false;
            OtherDescription.Visible = false;
            OtherDescription.Text = "";
        }
    }



        protected void ProjectSelecting(object sender, EventArgs e)




    {




        SqlDataSource SqlDataSource6= new SqlDataSource();

        Project.DataSource = null;
     Project.DataBind();
        SqlDataSource6.ID = "SqlDataSource6";

        this.Page.Controls.Add(SqlDataSource6);

        SqlDataSource6.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        //    SELECT* FROM[TimeSheets] WHERE([names] = @names) and convert(date, act_Date,103) >= DATEADD(day, -7, GETDATE()) order by convert(date, act_Date, 103) desc
        SqlDataSource6.SelectCommand = "SELECT Project_name from ProjectHierarchy where  [Client_name] = '" + Client.SelectedValue + "' order by Project_name";

       Project.DataSource = SqlDataSource6;

       Project.DataBind();





      
    }
}



    

