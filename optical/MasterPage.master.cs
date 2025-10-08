using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


 public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] != null)
            {
                lnkLogin.Visible = false;
                lnkSignup.Visible = false;
                lblWelcome.Text = "Hi, " + Session["UserName"].ToString();
                lblWelcome.Visible = true;
                btnLogout.Visible = true;
            }
            if (Session["name"] != null)
            {
                lnkLogin.Visible = false;
                lnkSignup.Visible = false;
                lnkAdmin.Visible = false;
                lblWelcome.Text = "Hi, " + Session["name"].ToString();
                lblWelcome.Visible = true;
                btnLogout.Visible = true;
            }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
}       

