using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Database_Helpers;

public partial class menu : System.Web.UI.Page
{
    public List<items> product_list = new List<items>();

    static List<items> cart_list = new List<items>();

    helper db = new helper();

    public string idd;

    protected void Page_Load(object sender, EventArgs e)
    {
        idd = Request.Params["bid"];
        prd();
    }

    void prd()
    {
        if (Page.IsPostBack == false)
        {

           
                db.Connection.Open();
                string q = "select * from items_tb where category='"+idd+"'";
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