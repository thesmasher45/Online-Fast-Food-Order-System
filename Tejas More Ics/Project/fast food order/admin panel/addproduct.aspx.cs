using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database_Helpers;

public partial class admin_panel_addproduct : System.Web.UI.Page
{
    helper db = new helper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    bool add_product()
    {
        db.values.Add("pname", pname.Text);
        db.values.Add("price", pprice.Text);
        db.values.Add("category", drpcatelst.SelectedItem.Text);
        db.values.Add("img", "images/" + fileupload1.FileName.ToString());
        if (db.insert("items_tb", db.values))
        {
            return true;

        }
        else
        {
            return false;
        }
    }

    protected void add_btn_Click(object sender, EventArgs e)
    {

        if (add_product())
        {

            msg.Text = "Product Added Successfully";
            pname.Text = "";
            pprice.Text = "";
            


        }
        else
        {
            msg.Text = "Failed to add Product";
        }

    }
}