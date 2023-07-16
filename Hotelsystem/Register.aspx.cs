using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hotelsystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";

            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into ClientRegistration (EmailAddress,Username,Password) values (@EmailAddress,@Username, @Password)", conn);
            cmd.Parameters.AddWithValue("@EmailAddress",TextBox1.Text);
            cmd.Parameters.AddWithValue("@Username", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox3.Text);

            cmd.ExecuteNonQuery();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";


            /*If registration is successfull, it throws an alert and redirects user to login page*/
            Response.Write("<script language='javascript'>window.alert('Registered successfully');window.location='Login.aspx';</script>");
        }


        /*The method below is introduced to check whether the email entered already exists in the database or new. If it exist
         it will prompt the user to enter new email adress*/
        protected void onEmailCheck(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";
            string EmaiIAddress = TextBox1.Text.Trim();

            SqlCommand cmd = new SqlCommand("SELECT EmailAddress FROM ClientRegistration WHERE EmailAddress ='" + EmaiIAddress + "'", conn);
            conn.Open();
            SqlDataReader idr = cmd.ExecuteReader();
            if (idr.HasRows)
            {
                lblMessage.Text = "Email address exists. Enter new Email Address";
                TextBox1.Focus();
            }
            else
            {
                lblMessage.Text = "";
            }
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home2.aspx");
        }
    }
}