using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection conn = new SqlConnection(s);

        conn.Open();

        SqlCommand cmd = new SqlCommand("Select Username from admin where Username = '" + txtUsername.Text + "'AND Password = '" + txtPassword.Text + "'", conn);
        if (cmd.ExecuteScalar() != null)
        {
            Session["name"] = txtUsername.Text;
            Response.Redirect("admin_dashboard.aspx");
            Response.Write("Login Successful");
        }
        else
        {
            lblMessage.Text = "Invalid Username or Password";
        }
    }
}