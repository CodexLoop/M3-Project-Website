using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class Supplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set initial visibility of the AddStockPanel to hidden
                AddSuppPanel.Visible = false;
            }
        }

        protected void SearchButton1_Click(object sender, EventArgs e)
        {
            //string SourceName = SqlDSSearch.ID;
            GridView1.DataSourceID = SqlDSSearch.ID;
            GridView1.DataBind();
        }

        protected void ClearSearchButton1_Click(object sender, EventArgs e)
        {
            SearchTextBox1.Text = string.Empty;
            GridView1.DataSourceID = SqlDataSource1.ID;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Insert new stock into the database
                SqlDSAddSupplier.Insert();

                Response.Write("<script>alert('Supplier added successfully!');</script>");

                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error adding Supplier: {ex.Message}');</script>");
            }

            ClearTextBoxes();
        }

        protected void CheckBox1Stock_CheckedChanged(object sender, EventArgs e)
        {
            // Toggle AddStockPanel visibility based on checkbox status
            AddSuppPanel.Visible = CheckBox1Stock.Checked;
        }

        // Method to clear the text boxes
        private void ClearTextBoxes()
        {
            TextBox1SuppName.Text = string.Empty;
            TextBoxSuppContNum.Text = string.Empty;
            TextBoxEmail.Text = string.Empty;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton deleteButton = (LinkButton)e.Row.Cells[0].Controls[0];
                if (deleteButton != null && deleteButton.CommandName == "Delete")
                {
                    deleteButton.OnClientClick = "return confirm('Are you sure you want to delete this supplier?');";
                }
            }
        }

    }
}