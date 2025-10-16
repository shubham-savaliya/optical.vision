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
    SqlConnection con;
    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    PagedDataSource pg;
    DataList dataList1;

    void getcon()
    {
        con = new SqlConnection(constr);
        con.Open();
    }
    private void LoadProducts()
    {

        getcon();

        string query = "select * from Products";
        da = new SqlDataAdapter(query, con);
        da.Fill(ds);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

    }






        
    void edit()
    {
        getcon();

    }

    void delete()
    {
        getcon();
        int id = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
        SqlCommand cmd = new SqlCommand("DELETE FROM Products where id = '"+id+"'", con);
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
    void fillList()
    {
        getcon();

    }
}