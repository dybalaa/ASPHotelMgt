using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Hotelsystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";

            //conn.Open(); no need to open new connection because previous connection is not closed
            SqlCommand cmd = new SqlCommand("select * from ClientRegistration  where Username=@Username and Password=@Password", conn);
            //picks data from Registration table to enable login

            cmd.Parameters.AddWithValue("@Username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox2.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Open();
            cmd.ExecuteNonQuery();
            if (dt.Rows.Count > 0)
            {
                Server.Transfer("Booking.aspx");
            }
            else
            {
                Label3.Text = "Non-matching";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("home2.aspx");
        }
    }
}