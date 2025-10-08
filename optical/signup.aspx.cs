using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Win32.SafeHandles;

public partial class _Default :  System.Web.UI.Page
{
    string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;

    protected void Page_Load(object sender, EventArgs e)
    {
        getcon();
        
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        if(btnSignUp.Text=="Sign Up")
        {
            getcon();
            cmd = new SqlCommand("INSERT INTO Users values('" + txtFullName.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtDOB.Text + "','"+txtAddress.Text+"','"+ddlLensType.SelectedValue+"','"+ddlFrameStyle.SelectedValue+"','"+txtPassword.Text+"','"+txtConfirmPassword.Text+"')", con);
            cmd.ExecuteNonQuery();
            Response.Redirect("login.aspx");
            

        }
    }
    void getcon()
    {
        con = new SqlConnection(s);
        con.Open();
    }
}