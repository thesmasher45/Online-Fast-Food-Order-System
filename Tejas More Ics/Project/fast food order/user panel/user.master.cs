using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Database_Helpers;

public partial class user_panel_user : System.Web.UI.MasterPage
{
    public string qq;
    public string fname;
    public string lname;
    public string imagepath;
    helper db = new helper();

    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cart"] != null)
        {
            List<items> cart_list = Session["cart"] as List<items>;

            count_lbl.Text = cart_list.Count.ToString();
        }

        if (Session["username"] == null)
        {
            Response.Redirect("~/home.aspx");
        }

        else
        {
            showdata();
        }
    }


    void showdata()
    {
        string q = "select * from registration_tb where email='" + Session["username"] + "'";
        SqlCommand cmd = new SqlCommand(q, db.Connection);
        db.Connection.Open();
        sda.SelectCommand = cmd;
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count == 1)
        {

            fname = ds.Tables[0].Rows[0]["first"].ToString();
            lname = ds.Tables[0].Rows[0]["last"].ToString();
            qq = ds.Tables[0].Rows[0]["email"].ToString();
            

            ulabel.Text = "Welcome " + fname + " " + lname;
            db.Connection.Close();
        }


    }
}
