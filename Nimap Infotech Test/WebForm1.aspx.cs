using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Nimap_Infotech_Test
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text))
            {
                RequiredFieldValidator1.Focus();
                RequiredFieldValidator1.Visible = true;
            }
            else
            {
                SqlConnection con = new SqlConnection(cs);
                string query = "insert into Category values(@id,@name)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", TextBox1.Text);
                cmd.Parameters.AddWithValue("@name", TextBox2.Text);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    ClientScript.RegisterStartupScript(typeof(Page), "script", "alert('Inserted Successfully');", true);

                    getdata();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                }
                con.Close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
        
            if (string.IsNullOrEmpty(TextBox3.Text) || string.IsNullOrEmpty(TextBox4.Text))
            {
                RequiredFieldValidator2.Visible = true;
                RequiredFieldValidator2.Focus();
            }
            else 
            
            {
                SqlConnection con = new SqlConnection(cs);
                string qurey = "insert into product values(@id,@name)";
                SqlCommand cmd = new SqlCommand(qurey, con);
                cmd.Parameters.AddWithValue("@id", TextBox3.Text);
                cmd.Parameters.AddWithValue("@name", TextBox4.Text);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    ClientScript.RegisterStartupScript(typeof(Page), "script", "alert('Inserted Successfully');", true);
                    ClientScript.RegisterStartupScript(typeof(Page), "script", "window.reload();", true);

                    TextBox3.Text = "";
                    TextBox4.Text = "";
                }
                con.Close();
            }
        }

        public void getdata()
        {

            /* SqlConnection con = new SqlConnection(cs);
             string qurey = "SELECT product.productId AS product_id,product.productName AS product_name,category.categoryId as category_id,category.categoryName AS category_name FROM product JOIN category ON product.productId=category.categoryId;";
             SqlCommand cmd = new SqlCommand(qurey, con);
             con.Open();
             SqlDataReader r = cmd.ExecuteReader();
             GridView1.DataSource = r;
             //GridView1.DataBind();
             con.Close();
            */



        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            TextBox3.Text = gr.Cells[1].Text;
            TextBox4.Text = gr.Cells[2].Text;
            TextBox1.Text = gr.Cells[3].Text;
            TextBox2.Text = gr.Cells[4].Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text))
            {
                RequiredFieldValidator1.Visible = true;
                RequiredFieldValidator1.Focus();
            }
            else
            {


                SqlConnection con = new SqlConnection(cs);
                con.Open();
                string query = "update category set categoryId = @id, categoryname = @name where Categoryid = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", TextBox1.Text);
                cmd.Parameters.AddWithValue("@name", TextBox2.Text);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(typeof(Page), "script", "alert('Category Update Successfully');", true);
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                con.Close();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox3.Text) || string.IsNullOrEmpty(TextBox4.Text))
            {
                RequiredFieldValidator2.Visible = true;
                RequiredFieldValidator2.Focus();
            }
            else
            {


                SqlConnection con = new SqlConnection(cs);
                con.Open();
                string query = "update product set productId = @id, productname = @name where productid = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", TextBox3.Text);
                cmd.Parameters.AddWithValue("@name", TextBox4.Text);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(typeof(Page), "script", "alert('Product Update Successfully');", true);
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                con.Close();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string query = "delete from category where categoryId =@id delete from product where productid = @pid";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", TextBox1.Text);
            cmd.Parameters.AddWithValue("@name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@pid", TextBox3.Text);
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(typeof(Page), "script", "alert('Delete Update Successfully');", true);
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            con.Close();
        }
    }
}