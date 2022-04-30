using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database_Helpers;
using System.Data.SqlClient;

public partial class home : System.Web.UI.Page
{
    public List<items> product_list = new List<items>();

    static List<items> cart_list = new List<items>();

    helper db = new helper();

    public string idd;

    protected void Page_Load(object sender, EventArgs e)
    {
        prd();
    }

    void prd()
    {
        if (Page.IsPostBack == false)
        {


            db.Connection.Open();
            string q = "select TOP  3 * from items_tb";
            SqlCommand cmd = new SqlCommand(q, db.Connection);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    product_list.Add(new items(reader["pid"].ToString(), reader["category"].ToString(), reader["pname"].ToString(), reader["price"].ToString(), reader["img"].ToString()));
                }
            }
            db.Connection.Close();


        }

    }
}