using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection conn = new SqlConnection(s);

        conn.Open();



        SqlCommand cmd = new SqlCommand("SELECT FullName FROM Users WHERE Email='" + txtEmail.Text + "' AND Password='" + txtPassword.Text + "'", conn);

        
        

        
        

        if (cmd.ExecuteScalar() != null)
        {
            Session["UserName"] = cmd.ExecuteScalar().ToString();
            Response.Redirect("Home.aspx");
        }
        else
        {
            
            lblMessage.Text = "Invalid email or password.";
        }

        
        conn.Close();
    }
}
