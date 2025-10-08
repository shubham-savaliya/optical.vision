using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_dashboard : System.Web.UI.Page
{
    string fnm;
    private void LoadProducts()
    {
        
        string conStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con = new SqlConnection(conStr);
 
            SqlDataAdapter da = new SqlDataAdapter("SELECT Id, Name, Description, Price, Image FROM Products", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["name"]== null)
        {
            Response.Redirect("admin_login.aspx");
        }
        LoadProducts();
    }
    void imgUpload()
    {
        if (flpImg.HasFile)
        {
            fnm = "productimg/" + flpImg.FileName;
            flpImg.SaveAs(Server.MapPath(fnm));
        }
    }
    void clear()
    {
        txtName.Text = "";
        txtdesc.Text = "";
        txtPrice.Text = "";
    }
    
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (txtName.Text=="" || txtdesc.Text == "" || txtPrice.Text == "")
        {
            lblMessage.Text = "Please fill all the details";

        }
        else
        {
            string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            SqlConnection conn = new SqlConnection(s);

            conn.Open();
            imgUpload();

            SqlCommand cmd = new SqlCommand("INSERT INTO Products values('" + txtName.Text + "', '" + txtdesc.Text + "', '" + txtPrice.Text + "', '" + fnm + "')", conn);
            cmd.ExecuteNonQuery();
            clear();
            lblMessage.Text = "Product Added Successfully";
            LoadProducts();
            
        }
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}