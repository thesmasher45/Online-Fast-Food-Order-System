using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database_Helpers;
using System.Data.SqlClient;
using System.Data;
using Database_Helpers;

public partial class admin_panel_orderdetails : System.Web.UI.Page
{
    public string q, qq, name, email;
    string sessionid;
    helper db = new helper();
    protected void Page_Load(object sender, EventArgs e)
    {

        sessionid = Request.QueryString["order_id"].ToString();
        //prods = Session["cart"] as List<products>;
        //detail_gw.DataSource = prods;
        //detail_gw.DataBind();
        q = "select MAX(cartTotal) from cart_tb where session_id='" + sessionid + "'";
        SqlCommand cmd = new SqlCommand(q,db.Connection);
        db.Connection.Open();
        SqlDataReader dr = cmd.ExecuteReader();


        if (dr.Read())
        {
            lb.Text = "Cart Total :" + " " + dr[0].ToString();

        }
        else
        {
            Response.Write("no data found");
        }
        db.Connection.Close();


        SqlCommand cmd1 = new SqlCommand();
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dtbl = new DataTable();
        cmd.CommandText = "select * from order_tb where session_id='" + sessionid + "'";
        cmd.Connection = db.Connection;
        sda.SelectCommand = cmd;
        sda.Fill(ds);
        {
            name = ds.Tables[0].Rows[0]["c_name"].ToString();
            email = ds.Tables[0].Rows[0]["c_email"].ToString();
        }
        db.Connection.Close();

    }

    
    protected void btn1_Click(object sender, EventArgs e)
    {

    }
}