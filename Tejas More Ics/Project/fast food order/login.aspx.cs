using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database_Helpers;

public partial class login : System.Web.UI.Page
{
    helper db = new helper();
    public string user;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginbtn_Click(object sender, EventArgs e)
    {
        if (username.Text == "admin" && password.Text == "admin")
        {
            Response.Redirect("~/admin panel/addproduct.aspx");
        }
        else
        {
            user = username.Text.Trim();
            string q = "select COUNT(email) from registration_tb where email='" + username.Text + "' AND password='" + password.Text + "'";

            int res = db.get_scalar(q);
            if (res > 0)
            {
                Session["username"] = user;
                Response.Redirect("~/user panel/home.aspx");


            }
            else
            {
                // Label1.Text = "Enter Correct Details";
                //message box

                string message = "Login failed ";

                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                sb.Append("<script type = 'text/javascript'>");

                sb.Append("window.onload=function(){");

                sb.Append("alert('");

                sb.Append(message);

                sb.Append("')};");

                sb.Append("</script>");

                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                ////message box
            }
        }
    }
}