using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Hotelsystem
{
    public partial class GeneralManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                this.BindGrid();
                GeneraterandomEmployeeID();
            }
        }

        private void BindGrid()
        {
            string constr = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT EmployeeID,FullName,EmailAddress,Contact,Address,EmergencyContact,RoleID,Salary,StartDate FROM EmployeeDetails"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

            GridViewRow row = GridView1.Rows[e.RowIndex];
            int EmployeeID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string FullName = (row.Cells[2].Controls[0] as TextBox).Text;
            string EmailAddress = (row.Cells[3].Controls[0] as TextBox).Text;
            string Contact = (row.Cells[4].Controls[0] as TextBox).Text;
            string Address = (row.Cells[5].Controls[0] as TextBox).Text;
            string EmergencyContact = (row.Cells[6].Controls[0] as TextBox).Text;
            string RoleID = (row.Cells[7].Controls[0] as TextBox).Text;
            string Salary = (row.Cells[8].Controls[0] as TextBox).Text;
            string StartDate = (row.Cells[9].Controls[0] as TextBox).Text;

            string constr = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE EmployeeDetails SET FullName = @FullName, EmailAddress = @EmailAddress, Contact=@Contact, Address=@Address, EmergencyContact=@EmergencyContact, RoleID=@RoleID,Salary=@Salary, StartDate=@StartDate WHERE EmployeeID = @EmployeeID"))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                    cmd.Parameters.AddWithValue("@FullName", FullName);
                    cmd.Parameters.AddWithValue("@EmailAddress", EmailAddress);
                    cmd.Parameters.AddWithValue("@Contact", Contact);
                    cmd.Parameters.AddWithValue("@Address", Address);
                    cmd.Parameters.AddWithValue("@EmergencyContact", EmergencyContact);
                    cmd.Parameters.AddWithValue("@RoleID", RoleID);
                    cmd.Parameters.AddWithValue("@Salary", Salary);
                    cmd.Parameters.AddWithValue("@StartDate", StartDate);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.BindGrid();

            }
            catch (SqlException ex)
            {
                /*This is introduced to handle any exception where new details entered with RoleID outside the
                 * registered roleID in table RoleID will not be saved and display an error script message*/

                if (ex.Number == 547) /*547 is the error code for this type of exception in case it is thrown due to constrait violation
                                       of a forign key*/
                {
                    // Handle the foreign key constraint exception here
                    Response.Write("<script> alert('Check RoleID. Try again') </script>");
                }
                else
                {
                    // Handle other types of SQL exceptions here
                    Response.Write("<script> alert('Wrong details entered. Try again') </script>");
                }
            }
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int EmployeeID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string constr = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True"; ;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM EmployeeDetails WHERE EmployeeID = @EmployeeID"))
                {
                    cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";

                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into EmployeeDetails (EmployeeID,FullName,EmailAddress,Contact,Address,EmergencyContact,RoleID,Salary,StartDate) values (@EmployeeID,@FullName,@EmailAddress,@Contact,@Address,@EmergencyContact,@RoleID,@Salary,@StartDate)", conn);
                cmd.Parameters.AddWithValue("@EmployeeID", TextBox1.Text);
                cmd.Parameters.AddWithValue("@FullName", TextBox2.Text);
                cmd.Parameters.AddWithValue("@EmailAddress", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Contact", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Address", TextBox5.Text);
                cmd.Parameters.AddWithValue("@EmergencyContact", TextBox6.Text);
                cmd.Parameters.AddWithValue("@RoleID", TextBox7.Text);
                cmd.Parameters.AddWithValue("@Salary", TextBox8.Text);
                cmd.Parameters.AddWithValue("@StartDate", TextBox9.Text);

                cmd.ExecuteNonQuery();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";

                Response.Redirect("GeneralManager.aspx");

                
            }

            catch (SqlException ex)
            {
                /*This is introduced to handle any exception where new details entered with RoleID outside the
                 * registered roleID in table RoleID will not be saved and display an error script message*/

                if (ex.Number == 547) /*547 is the error code for this type of exception in case it is thrown due to constrait violation
                                       of a forign key*/
                {
                    // Handle the foreign key constraint exception here
                    Response.Write("<script> alert('Check RoleID. Try again') </script>");
                }
                else
                {
                    // Handle other types of SQL exceptions here
                    Response.Write("<script> alert('Wrong details entered. Try again') </script>");
                }
            }
  
         
        }

        public void GeneraterandomEmployeeID()
        {

            Random rd = new Random();
            int randomEmployeeID = rd.Next(0, int.MaxValue);
            TextBox1.Text = randomEmployeeID.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";

            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into SupplierDetails (SupplierID,Name,EmailAddress,PhoneNumber,Address,Product,ProductCategory) values (@SupplierId,@Name,@EmailAddress,@PhoneNumber,@Address,@Product,@ProductCategory)", conn);
            cmd.Parameters.AddWithValue("@SupplierID", TextBox10.Text);
            cmd.Parameters.AddWithValue("@Name", TextBox11.Text);
            cmd.Parameters.AddWithValue("@EmailAddress", TextBox12.Text);
            cmd.Parameters.AddWithValue("@PhoneNumber", TextBox13.Text);
            cmd.Parameters.AddWithValue("@Address", TextBox14.Text);
            cmd.Parameters.AddWithValue("@Product", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@ProductCategory", DropDownList2.Text);
           

            cmd.ExecuteNonQuery();
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox13.Text = "";
            TextBox14.Text = "";
            DropDownList1.Text = "";
            DropDownList2.Text = "";

            Response.Write("<script> alert('Added Sucessfully') </script>");
            Response.Redirect("GeneralManager.aspx");

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";

            // get the search keyword from a textbox
            string searchKeyword = TextBox15search.Text.Trim();

            // query to retrieve data based on the search keyword
            string query = "SELECT * from EmployeeDetails where EmployeeID LIKE '%" + searchKeyword + "%'";

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            // bind the search results to a GridView or any other control
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("home2.aspx");
        }

    }
}