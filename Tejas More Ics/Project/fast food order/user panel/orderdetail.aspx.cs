using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Database_Helpers;

public partial class user_panel_orderdetail : System.Web.UI.Page
{
    helper db = new helper();

    protected void Page_Load(object sender, EventArgs e)
    {
        load();
    }
    void load()
    {
        string sessionid = Request.QueryString["order_id"].ToString();
        string q = "select MAX(cartTotal) from cart_tb where session_id='" + sessionid + "'";
        SqlCommand cmd = new SqlCommand(q, db.Connection);
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
    }
}