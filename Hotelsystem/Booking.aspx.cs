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
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateRateRoom();
                GeneraterandomBookingref();
            }
        }

        public void GeneraterandomBookingref()
        {

            Random rd = new Random();
            int randomBookingReference = rd.Next(0, int.MaxValue);
            TextBox4.Text = randomBookingReference.ToString();

        }

        public void populateRateRoom(){
            string connectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Room, Rate FROM Rooms", connection);
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DropDownList5.Items.Add(reader["Room"].ToString());
                    DropDownList6.Items.Add(reader["Rate"].ToString());
                }
                reader.Close();
            }
        }
        
        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                //Ensures the rate matches with the room
                SqlCommand cmd = new SqlCommand("SELECT Rate FROM Rooms WHERE Room=@Room", connection);
                cmd.Parameters.AddWithValue("@Room", DropDownList5.SelectedItem.Text);
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DropDownList6.Items.Clear();
                while (reader.Read())
                {
                    DropDownList6.Items.Add(reader["Rate"].ToString());
                }
                reader.Close();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList5.SelectedItem.Text == "--Select a Room--" || DropDownList6.SelectedItem.Text == "--Select a Rate--")
            {
                Label11.Text = "Check Room and Rate again";
                Label11.Visible = true;
            }
            else
            {
                Label11.Visible = false;

                /*this code checks if the selected room is available or not*
                 *it not available it will inform the client */
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Reservations WHERE Room=@Room AND CheckIn <= @CheckOut AND CheckOut >= @CheckIn", conn);
                cmd.Parameters.AddWithValue("@Room", DropDownList5.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@CheckIn", TextBox6.Text);
                cmd.Parameters.AddWithValue("@CheckOut", TextBox5.Text);
                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    Response.Write("<script> alert('The selected room is not available for the requested dates.') </script>");
                }
                else
                {
                    // Room is available, so proceed with the reservation hence reservation saved
                    SqlCommand cmdd = new SqlCommand("INSERT INTO Reservations (NoofAdults,NoofChildren,CheckIn,CheckOut,Room,Rate,FullName,PhoneNumber,EmailAddress,BookingReference) VALUES (@NoOfAdults,@NoOfChildren,@CheckIn,@CheckOut,@Room,@Rate,@FullName,@PhoneNumber,@EmailAddress,@BookingReference)", conn);
                    cmdd.Parameters.AddWithValue("@NoOfAdults", DropdownList1.Text);
                    cmdd.Parameters.AddWithValue("@NoOfChildren", DropdwonList2.Text);

                    //since the room and rate columns are populated from the databse. We use SelectedItem.Text to selcted the item
                    cmdd.Parameters.AddWithValue("@Rate", DropDownList6.SelectedItem.Text);
                    cmdd.Parameters.AddWithValue("@FullName", TextBox1.Text);
                    cmdd.Parameters.AddWithValue("@PhoneNumber", TextBox2.Text);
                    cmdd.Parameters.AddWithValue("@EmailAddress", TextBox3.Text);
                    cmdd.Parameters.AddWithValue("@BookingReference", TextBox4.Text);
                    cmdd.Parameters.AddWithValue("@CheckIn", TextBox6.Text);
                    cmdd.Parameters.AddWithValue("@CheckOut", TextBox5.Text);
                    cmdd.Parameters.AddWithValue("@Room", DropDownList5.SelectedItem.Text);


                    cmdd.ExecuteNonQuery();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    DropdownList1.Text = "";
                    DropdwonList2.Text = "";

                    Response.Write("<script> alert('Reservation Successful') </script>");
                }

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home2.aspx");
        }

   }
}