using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shop : System.Web.UI.Page
{
    PagedDataSource pg;
    SqlDataAdapter da;
    SqlConnection conn;
    DataSet ds;
    SqlCommand cmd;
    int row, i, p;
    protected void Page_Load(object sender, EventArgs e)
    {
        displayProduct();
    }
    void getcon()
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        conn = new SqlConnection(s);
        conn.Open();
    }
    void displayProduct()
    {
        getcon();
        da = new SqlDataAdapter("SELECT * from Products", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);

        row = ds.Tables[0].Rows.Count;
        pg = new PagedDataSource();

        pg.AllowPaging = true;
        pg.PageSize = 1;
        pg.CurrentPageIndex = Convert.ToInt32(ViewState["Id"]);
        pg.DataSource = ds.Tables[0].DefaultView;
        lnk_prev.Enabled = !pg.IsFirstPage;
        lnk_nxt.Enabled = !pg.IsLastPage;
        dataList1.DataSource = pg;
        dataList1.DataBind();


    }

    protected void btn_nxt_Click(object sender, EventArgs e)
    {
        int currentPage = Convert.ToInt32(ViewState["Id"]);
        currentPage++;
        ViewState["Id"] = currentPage;
        displayProduct();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int currentpage = Convert.ToInt32(ViewState["Id"]);
        currentpage--;
        ViewState["Id"] = currentpage;
        displayProduct();
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        int currentpage = Convert.ToInt32(ViewState["Id"]);
        currentpage++;
        ViewState["Id"] = currentpage;
        displayProduct();
    }

    protected void dataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void dataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "cmd_view")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("viewDetail.aspx?id=" + id);
        }
        else if (e.CommandName == "cmd_adc")
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("login.aspx");
            }
            int id = Convert.ToInt32(e.CommandArgument);
            string query = "SELECT Id from Users where FullName = '" + Session["UserName"] + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            object result = cmd.ExecuteScalar();
            int userId = Convert.ToInt32(result);


            //    da = new SqlDataAdapter("SELECT * from Users where FullName ='" + Session["UserName"] + ",'", conn);
            //ds = new DataSet();
            //da.Fill(ds);
            //int userId = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
            int prodid = Convert.ToInt16(e.CommandArgument);
            da = new SqlDataAdapter("SELECT * FROM Products where Id='" + prodid + "'", conn);
            ds = new DataSet();
            da.Fill(ds);
            string prodnm = ds.Tables[0].Rows[0][1].ToString();
            string prodprc = ds.Tables[0].Rows[0][3].ToString();
            string prodimg = ds.Tables[0].Rows[0][4].ToString();
            int quantity = 1;
            int total = Convert.ToInt32(prodprc) * quantity;
            cmd = new SqlCommand("INSERT INTO Cart Values('" + userId + "', '" + prodid + "','" + prodnm + "', '" + prodimg + "', '" + quantity + "', '" + prodprc + "', '" + total + "')", conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("Cart.aspx?id=" + id);
        }
        else
        {

        }

    }


}