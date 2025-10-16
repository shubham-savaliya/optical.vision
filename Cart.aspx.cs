using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    string fnm;
    int p, row;

    void getcon()
    {
        con = new SqlConnection(constr);
        con.Open();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        getcon();
        if (Session["UserName"] == null)
        {
            Response.Redirect("login.aspx");
        }

        da = new SqlDataAdapter("Select * from Users where FullName='" + Session["UserName"].ToString() + "'", con);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            int userid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            string Q = ds.Tables[0].Rows[0][1].ToString();
            lblmsg.Text = "Welcome, " + Q;
            fillGrid();
        }
    }
    


    void fillGrid()
    {
        getcon();
        da = new SqlDataAdapter("Select * from Users where FullName ='" + Session["UserName"].ToString() + "'", con);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            int userid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
            da = new SqlDataAdapter("Select * from Cart where UserId='" + userid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            gvCart.DataSource = ds;
            gvCart.DataBind();
        }
    }


    protected void Continue_Shopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("Shop.aspx");
    }


    protected void btnchkOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckOut.aspx");
    }

    protected void btnUpd_Click(object sender, EventArgs e)
    {
        getcon();


        da = new SqlDataAdapter("Select * from Users where FullName='" + Session["UserName"].ToString() + "'", con);
        ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            int userid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            fillGrid();

            // Calculate final total
            decimal finalTotal = 0;
            foreach (GridViewRow row in gvCart.Rows)
            {
                Label lblTotal = row.FindControl("Label4") as Label;
                if (lblTotal != null)
                {
                    decimal itemTotal;
                    string totalText = lblTotal.Text.Replace("₹", "").Trim();
                    if (decimal.TryParse(totalText, out itemTotal))
                    {
                        finalTotal += itemTotal;
                    }
                }
            }

            lblFinalTotal.Text = "Final Total: ₹" + finalTotal.ToString("F2");
            lblFinalTotal.ForeColor = System.Drawing.Color.DarkGreen;
            lblFinalTotal.Font.Bold = true;
        }
    }


    protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cmd_remove")
        {
            int cartid = Convert.ToInt32(e.CommandArgument);
            getcon();
            cmd = new SqlCommand("Delete from Cart where Cart_Id='" + cartid + "'", con);
            cmd.ExecuteNonQuery();
            fillGrid();
        }
        else if (e.CommandName == "cmd_minus")
        {
            int cartid = Convert.ToInt32(e.CommandArgument);
            getcon();
            da = new SqlDataAdapter("Select * from Cart where Cart_Id='" + cartid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int quant = Convert.ToInt32(ds.Tables[0].Rows[0][5]);
                int price = Convert.ToInt32(ds.Tables[0].Rows[0][6]);

                if (quant > 1)
                {
                    quant--;
                    Int64 tot = quant * price;
                    cmd = new SqlCommand("Update Cart set Quantity='" + quant + "', Total='" + tot + "' where Cart_Id='" + cartid + "'", con);
                    cmd.ExecuteNonQuery();
                    fillGrid();
                }
            }
        }
        else if (e.CommandName == "cmd_plus")
        {
            int cartid = Convert.ToInt32(e.CommandArgument);
            getcon();
            da = new SqlDataAdapter("Select * from Cart where Cart_Id='" + cartid + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int quant = Convert.ToInt32(ds.Tables[0].Rows[0][5]);
                int price = Convert.ToInt32(ds.Tables[0].Rows[0][6]);
                quant++;
                Int64 total = quant * price;
                cmd = new SqlCommand("Update Cart set Quantity='" + quant + "', Total='" + total + "' where Cart_Id='" + cartid + "'", con);
                cmd.ExecuteNonQuery();
                fillGrid();
            }
        }

        da = new SqlDataAdapter("Select * from Users where FullName='" + Session["UserName"].ToString() + "'", con);
        ds = new DataSet();
        da.Fill(ds);

        int userid = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
        string Q = ds.Tables[0].Rows[0][1].ToString();
        lblmsg.Text = "Welcome, " + Q;

        fillGrid();

    }
}