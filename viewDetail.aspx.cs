using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewDetail : System.Web.UI.Page
{
    SqlConnection conn;
    SqlDataAdapter da;
    string s = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    void getcon()
    {
        conn = new SqlConnection(s);
        conn.Open();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        fetchDetails();
    }
    void fetchDetails()
    {
        getcon();
        SqlCommand cmd = new SqlCommand("SELECT * from Products where id='" + Request.QueryString["id"] + "'", conn);
        da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataList1.DataSource = ds;
        DataList1.DataBind();

        conn.Close();
    }
}