using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database_Helpers;

public partial class register : System.Web.UI.Page
{
    helper db = new helper();

    protected void Page_Load(object sender, EventArgs e)
    {

    }




    bool reg()
    {
        db.values.Add("first", fname.Text);
        db.values.Add("last", lname.Text);
        db.values.Add("mobile", mob.Text);

        db.values.Add("address", addr.Text);
        db.values.Add("email", email.Text);
        db.values.Add("password", pass.Text);




        if (db.insert("registration_tb", db.values))
        {
            return true;

        }
        else
        {
            return false;
        }
    }








    protected void signupbtn_Click(object sender, EventArgs e)
    {






        if (reg())
        {
            msg_lbl.Text = "Registration Successful";
            fname.Text = "";
            lname.Text = "";
            mob.Text = "";
            addr.Text = "";
            pass.Text = "";
            email.Text = "";


        }
        else
        {
            msg_lbl.Text = "Failed to register";
        }

        /*SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=G:\ics projects\online optical\App_Data\Database.mdf;Integrated Security=True");
        String q = "insert into registration([first],[last],[mobile],[gender],[address],[email],[password]) values(@first,@last,@mobile,@gender,@address,@email,@password)";
        SqlCommand cmd = new SqlCommand(q, con);
        con.Open();
        cmd.Parameters.AddWithValue("@first", fname_tb.Text);
        cmd.Parameters.AddWithValue("@last", lname_tb.Text);
        cmd.Parameters.AddWithValue("@mobile", mobile_tb.Text);
        cmd.Parameters.AddWithValue("@gender", RadioButtonList1.Text);
        cmd.Parameters.AddWithValue("@address", Address_tb.Text);
        cmd.Parameters.AddWithValue("@email", email_tb.Text);
        cmd.Parameters.AddWithValue("@password", password_tb.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        msg_lbl.Text = "inserted";
        */
    }
}