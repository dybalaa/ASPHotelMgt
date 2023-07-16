using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hotelsystem
{
    public partial class AdminPane_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";

            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into MgtRoles (RoleName) values (@RoleName)", conn);
           
            /*Since the Identity insert is set to off in the construction of the database, the system will automatically generate role ID 
            and assign them to each new role*/ 

            cmd.Parameters.AddWithValue("@RoleName", TextBox2.Text);
            

            cmd.ExecuteNonQuery();
            
            TextBox2.Text = "";

   
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            try
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = @"Data Source=LAPTOP-1N11UBMJ\SQLEXPRESS;Initial Catalog=HotelBookingDatabase;Integrated Security=True";

                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into UserMgtRegistration  (EmailAddress,RoleID,Password) values (@EmailAddress,@RoleID, @Password)", conn);

                cmd.Parameters.AddWithValue("@EmailAddress", TextBox3.Text);

                /*Since RoleID is a foreign key in table UserMgtRegistration it will pick already entered data from the Roles
                 table where RoleID is primary key*/
                cmd.Parameters.AddWithValue("@RoleID", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Password", TextBox5.Text);

                cmd.ExecuteNonQuery();
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";


                Response.Write("<script> alert('Registered successful') </script>");

            }
            catch (SqlException ex)
            {
                /*This is introduced to handle any exception where new details entered with RoleID outside the
                 * registered roleID in table RoleID will not be saved and display an error script message*/

                if (ex.Number == 547) /*547 is the error code for this type of exception in case it is thrown due to constrait violation
                                       of a forign key*/
                {
                    // Handle the foreign key constraint exception here
                    Response.Write("<script> alert('Enter valid RoleID. Try again') </script>");
                }
                else
                {
                    // Handle other types of SQL exceptions here
                    Response.Write("<script> alert('Wrong details entered. Try again') </script>");
                }
            }


        }

        protected void Button3_Click(object sender, EventArgs e)
        {



        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("home2.aspx");
        }

    }
}