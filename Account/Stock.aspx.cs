using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class Stock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set initial visibility of the AddStockPanel to hidden
                AddStockPanel.Visible = false;
            }
        }

        protected void SearchButton1_Click(object sender, EventArgs e)
        {
            string SourceName = SqlDSSearch.ID;
            GridView1.DataSourceID = SourceName;
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
                SqlDSAddProducts.Insert();
                Response.Write("<script>alert('Product added successfully!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error adding product: {ex.Message}');</script>");
            }

            ClearTextBoxes();
        }

        protected void CheckBox1Stock_CheckedChanged(object sender, EventArgs e)
        {
            // Toggle AddStockPanel visibility based on checkbox status
            AddStockPanel.Visible = CheckBox1Stock.Checked;
        }

        // Method to clear the text boxes
        private void ClearTextBoxes()
        {
            TextBox1SuppID.Text = string.Empty;
            TextBox2ProdName.Text = string.Empty;
            TextBox3ProdDesc.Text = string.Empty;
            TextBox4Dosage.Text = string.Empty;
            TextBox5Qty.Text = string.Empty;
            TextBoxForm.Text = string.Empty;
            TextBoxPrice.Text = string.Empty;
            CheckBoxPrescriptMed.Checked = false; // Uncheck the prescription checkbox
            TextBox1ReorderPoint.Text = string.Empty;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('You will now view the Supplier Page!');</script>");
            Response.Redirect("/Account/Supplier");
        }
    }
}