using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace Hotelsystem
{
    public partial class Booking2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
              Generaterandombooking1d();
            }

        }

         public void Generaterandombooking1d(){
            
              Random rd = new Random();
                int randomBookingID = rd.Next(0, int.MaxValue);
                TextBox1.Text = randomBookingID.ToString();

         }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";

            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into Booking  (BookingID,NoofAdults,NoofChildren,CheckIn,CheckOut,RoomName,Rate,FullName,PhoneNumber) values (@BookingID,@NoOfAdults,@NoOfChildren,@CheckIn,@CheckOut,@RoomName,@Rate,@FullName,@PhoneNumber)", conn);
            cmd.Parameters.AddWithValue("@BookingID", TextBox1.Text);
            cmd.Parameters.AddWithValue("@NoOfAdults", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@NoOfChildren", DropDownList2.Text);
            cmd.Parameters.AddWithValue("@CheckIn",TextCheckIn .Text);
            cmd.Parameters.AddWithValue("@CheckOut", TextCheckOut.Text);
            cmd.Parameters.AddWithValue("@RoomName", DropDownList3.SelectedValue);
            cmd.Parameters.AddWithValue("@Rate", TextBox4.Text);
            cmd.Parameters.AddWithValue("@FullName", TextBox2.Text);
            cmd.Parameters.AddWithValue("@PhoneNumber", TextBox3.Text);
            cmd.ExecuteNonQuery();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextCheckIn.Text = "";
            TextCheckOut.Text = "";
            DropDownList1.SelectedValue= "";
            DropDownList2.Text = "";
            DropDownList3.SelectedValue = "";


           
            Response.Redirect("Login.aspx");
        }
    }
}