using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hotelsystem
{
    public partial class HotelMgtLogin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string emailAddress = TextBox1.Text;
            string Password = TextBox2.Text;

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            string msg = scalarReturn("select count (*) from UserMgtRegistration  where EmailAddress='" + emailAddress + "' and Password='" + Password + "'");
            if (msg.Equals("0"))
            {
                Response.Write("<script> alert('Invalid Email or Password') </script>");
            }
            else
            {
                msg = scalarReturn("select RoleID from UserMgtRegistration  where EmailAddress='" + emailAddress + "' and Password='" + Password + "'");
                if (msg.Equals("1"))
                {
                    Response.Redirect("AdminPanel.aspx");
                }
                else if (msg.Equals("2"))
                {
                    Response.Redirect("Booking2.aspx");
                }
                else
                {
                    Session.RemoveAll();
                    Session.Abandon();

                }
            }
        }

        //method introduced to enable logging in and redirecting mgt user to their different panels using RoleID

        public string scalarReturn(string q)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            conn.Open();
            SqlCommand cmd = new SqlCommand(q, conn);
            string s = cmd.ExecuteScalar().ToString();
            return s;

        }
    }
}