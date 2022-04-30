using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Database_Helpers;

public partial class admin_panel_editproduct : System.Web.UI.Page
{
    //public static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    helper db = new helper();
    string sort;
    DataTable dtbl = new DataTable();
    SqlDataReader dr;
    SqlDataReader dr1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            PopulateGridView();
            // search();
            gridview1.DataSource = dtbl;
            gridview1.DataBind();
            lblErrorMessage.Text = "";
            lblSuccessMessage.Text = "";


        }
        this.MaintainScrollPositionOnPostBack = true;
    }


    void PopulateGridView()
    {

        using (db.Connection)
        {
            db.Connection.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM items_tb", db.Connection);
            sqlDa.Fill(dtbl);

        }

        if (dtbl.Rows.Count > 0)
        {
            gridview1.DataSource = dtbl;
            gridview1.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            gridview1.DataSource = dtbl;
            gridview1.DataBind();
            gridview1.Rows[0].Cells.Clear();
            gridview1.Rows[0].Cells.Add(new TableCell());
            gridview1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            gridview1.Rows[0].Cells[0].Text = "No Data Found ..!";
            gridview1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
        }

    }

    void search()
    {
        using (db.Connection)
        {
            string pname = searchprd.Text;
            db.Connection.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM items_tb WHERE pname LIKE '%" + pname + "%'", db.Connection);
            sqlDa.Fill(dtbl);


        }

        if (dtbl.Rows.Count > 0)
        {
            gridview1.DataSource = dtbl;
            gridview1.DataBind();
        }
        else
        {
            searchprd.Text = "";
            gridview1.Visible = false;
            lblErrorMessage.Text = "No Such Item Found";
            //gridview1.EmptyDataText = "No Such Menu Avaliable";
        }

    }


    protected void gridview1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        gridview1.EditIndex = e.NewEditIndex;
        search();
        //PopulateGridView();
    }

    protected void gridview1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridview1.EditIndex = -1;
        searchnew();
        //PopulateGridView();
    }

    protected void gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            using (db.Connection)
            {
                db.Connection.Open();
                string query = "UPDATE items_tb SET pname=@pname,category=@category,price=@price,img=@img WHERE pid = @pid";
                SqlCommand sqlCmd = new SqlCommand(query, db.Connection);
                sqlCmd.Parameters.AddWithValue("@pname", (gridview1.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@category", (gridview1.Rows[e.RowIndex].FindControl("txtcatagory") as DropDownList).SelectedItem.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@price", (gridview1.Rows[e.RowIndex].FindControl("txtprice") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@img", "images/" + (gridview1.Rows[e.RowIndex].FindControl("txtimage") as FileUpload).FileName.ToString().Trim());
                sqlCmd.Parameters.AddWithValue("@pid", Convert.ToInt32(gridview1.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                db.Connection.Close();
                gridview1.EditIndex = -1;
                search();
                // PopulateGridView();
                lblSuccessMessage.Text = "Selected Record Updated";
                lblErrorMessage.Text = "";

            }
        }
        catch (Exception ex)
        {
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = ex.Message;
        }
    }

    protected void gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            using (db.Connection)
            {
                db.Connection.Open();
                string query = "DELETE FROM items_tb WHERE pid = @pid";
                SqlCommand sqlCmd = new SqlCommand(query, db.Connection);
                sqlCmd.Parameters.AddWithValue("@pid", Convert.ToInt32(gridview1.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                db.Connection.Close();
                PopulateGridView();
                lblSuccessMessage.Text = "Selected Record Deleted";
                lblErrorMessage.Text = "";

            }
        }
        catch (Exception ex)
        {
            lblSuccessMessage.Text = "";
            lblErrorMessage.Text = ex.Message;
        }
    }

    void searchnew()
    {
        using (db.Connection)
        {
            string name = searchprd.Text;
            db.Connection.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM items_tb WHERE pname LIKE '%" + name + "%'", db.Connection);
            sqlDa.Fill(dtbl);


        }

        if (dtbl.Rows.Count > 0)
        {
            gridview1.DataSource = dtbl;
            gridview1.DataBind();
        }
        else
        {
            searchprd.Text = "";
            gridview1.Visible = false;
            lblErrorMessage.Text = "No Such Item Found";
            //gridview1.EmptyDataText = "No Such Menu Avaliable";
        }

    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        searchnew();
    }

    protected void display_all_Click(object sender, EventArgs e)
    {
        searchprd.Text = "";
        lblErrorMessage.Text = "";
        gridview1.Visible = true;
        gridview1.DataSource = search_all;
        gridview1.DataBind();
    }
}