using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Data.SqlClient;

namespace Hotelsystem
{
    public partial class Receptionist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            populateRateBooingReference();
            populateRateAttendants();

        }


        public void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            conn.Open();

            SqlCommand cmdd = new SqlCommand("INSERT INTO Attendants (BookingReference,EmployeeID) VALUES (@BookingReference,@Attendant)", conn);
            cmdd.Parameters.AddWithValue("@BookingReference", DropDownList1.SelectedItem.Text);
            cmdd.Parameters.AddWithValue("@Attendants", DropDownList2.SelectedItem.Text);
            

            cmdd.ExecuteNonQuery();
           
            DropDownList1.SelectedItem.Text = "";
            DropDownList2.SelectedItem.Text = "";

            Response.Write("<script> alert('Attendant added successfully') </script>");

        }
        public void populateRateBooingReference()
        {
            string connectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT BookingReference FROM Reservations", connection);
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DropDownList1.Items.Add(reader["BookingReference"].ToString());
                   
                }
                reader.Close();
            }
        }

        public void populateRateAttendants()
        {
            string connectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT EmployeeID FROM EmployeeDetails where RoleID = 1003", connection);
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DropDownList1.Items.Add(reader["EmployeeID"].ToString());

                }
                reader.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home2.aspx");
        }

    }
}