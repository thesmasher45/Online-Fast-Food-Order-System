using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database_Helpers;

public partial class user_panel_mycart : System.Web.UI.Page
{
    
    helper db = new helper();
    List<items> prods;
    //To bind gridview
    string session_id, amount;
    string qt;

    int p, q, nettotal;
    int grandtotal = 0;


    protected void Page_Load(object sender, EventArgs e)
    {

        prods = Session["cart"] as List<items>;
        if (!IsPostBack)
        {
            GridView1.DataSource = prods;
            GridView1.DataBind();
        }
    }

    bool inserttocart()
    {
        Guid g = Guid.NewGuid();
        session_id = g.ToString();


        for (int i = 0; i < (GridView1.Rows.Count) & i < (prods.Count); i++)
        {


            string img = ((Image)GridView1.Rows[i].Cells[0].FindControl("imff")).ImageUrl;
            string nm = GridView1.Rows[i].Cells[1].Text;
            string cat = GridView1.Rows[i].Cells[2].Text;
            string price = GridView1.Rows[i].Cells[3].Text;
            qt = ((TextBox)GridView1.Rows[i].Cells[4].FindControl("TextBoxQty")).Text;

            p = Convert.ToInt32(price);
            q = Convert.ToInt32(qt);

            nettotal = p * q;
            grandtotal = grandtotal + nettotal;




            db.values.Add("product_id", prods[i].pid);
            db.values.Add("session_id", session_id);
            db.values.Add("pname", nm.ToString());
            db.values.Add("img", img.ToString());
            db.values.Add("category", cat.ToString());
            db.values.Add("price", price);
            db.values.Add("quantity", qt.ToString());
            db.values.Add("netPrice", nettotal.ToString());
            db.values.Add("cartTotal", grandtotal.ToString());

            if (db.insert("cart_tb", db.values))
            {
                db.values.Clear();
            }
            else
            {
                label1.Text = "failed";
            }
            

        }


        return true;
        //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\vaish31\Desktop\food website\App_Data\Database.mdf;Integrated Security=True");
        //String query = "insert into carts([product_id],[session_id],[quantity],[netPrice],[cartTotal]) values(@product_id,@session_id,@quantity,@netPrice,@cartTotal)";
        //SqlCommand cmd = new SqlCommand(query, con);
        //con.Open();
        //cmd.Parameters.AddWithValue("@product_id", prods[a].Id);
        //cmd.Parameters.AddWithValue("@session_id", session_id);
        //cmd.Parameters.AddWithValue("@quantity", qt.ToString());
        //cmd.Parameters.AddWithValue("@netPrice", nettotal.ToString());
        //cmd.Parameters.AddWithValue("@cartTotal", grandtotal.ToString());

        //cmd.ExecuteNonQuery();
        //con.Close();


    }

    protected void delete_Click(object sender, EventArgs e)
    {
        int n = Convert.ToInt32(GridView1.SelectedRow);
        prods.RemoveAt(n);
        GridView1.DataSource = prods;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (inserttocart())
        {
            Response.Redirect("checkout.aspx?session_id=" + session_id);
        }
        else
        {
            label1.Text = "failed";
        }
        
        
    }
}