using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Database_Helpers;

public partial class singleproduct : System.Web.UI.Page
{
    public List<items> product_list = new List<items>();

    static List<items> cart_list = new List<items>();

    public string prod_id;

    helper db = new helper();

    protected void Page_Load(object sender, EventArgs e)
    {
        prod_id = Request.Params["pro_id"];
        load_prod();


        if (Request.QueryString.AllKeys.Contains("pro_id") && Request.QueryString.AllKeys.Contains("action"))
        {
            string pro_id = Request.QueryString["pro_id"];
            string action = Request.QueryString["action"];
            if (action.Equals("add"))
            {
                add_to_cart(pro_id);
            }
        }
        //l1.Text = cart_list.Count.ToString();
    }

    void add_to_cart(string product_id)
    {
        var product = product_list.Where(x => x.pid == product_id);


        foreach (var data in product)
        {
            cart_list.Add(data);
        }

        Session["cart"] = cart_list;


    }


    void load_prod()
    {
        db.Connection.Open();
        string q = "select * from items_tb where pid='" + prod_id + "'";
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