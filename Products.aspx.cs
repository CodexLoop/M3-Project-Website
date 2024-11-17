using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Townbush_Pharmacy_Website.Models;
using System.Text;
using Townbush_Pharmacy_Website.Properties;
using static System.Collections.Specialized.BitVector32;

namespace Townbush_Pharmacy_Website
{
    public partial class Products : System.Web.UI.Page
    {

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Format ProdName to be in title case
                e.Row.Cells[0].Text = ToTitleCase(e.Row.Cells[0].Text);

                // Format ProdDescription to be in title case
                e.Row.Cells[1].Text = ToTitleCase(e.Row.Cells[1].Text);

                // Format Form to be in title case
                e.Row.Cells[2].Text = ToTitleCase(e.Row.Cells[2].Text);
            }
        }

        // Utility method to convert a string to title case
        public string ToTitleCase(string str)
        {
            return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower());
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "BtnClick")
            {
                if (!User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Cart.aspx");
                    Session["Cart"] = "True";
                }
                else
                {
                    Session["Cart"] = "True";

                    // Find the row index of the command source
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridView1.Rows[rowIndex];
                    Response.Redirect("Cart.aspx?id=" + rowIndex);
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // C# function to generate products cards for online-shop
                GenerateProductHTML();


                // JavaScript function to trigger a button click event in the nth row of the GridView
                string script = $@"
                function triggerButtonClick(rowNumber) {{
                    const index = rowNumber;

                    const gridView = document.getElementById('{GridView1.ClientID}');
                    const test = document.getElementById('shop-title');
                    
                    if (gridView) {{
                        const row = gridView.rows[index];
                        
                        if (row) {{
                            
                            const btnName = ""Button1_""+index
                            const selector = `input[id$=""${{btnName}}""]`;
                            const button = document.querySelector(selector);
                            console.log(button)
                            
                            if (button) {{
                                button.click();
                                console.log(""Button clicked"");
                            }} else {{
                                console.log(""Button not found in row "" + rowNumber);
                            }}
                        }} else {{
                            console.log(""Row "" + rowNumber + "" not found."");
                        }}
                    }} else {{
                        console.log(""GridView not found."");
                    }}
                }}

                // Adding event listeners to all 'Add to Cart' buttons in the shop section
                window.onload = function() {{
                    const shop = document.getElementById('shop');
                    const products = shop.querySelectorAll('.button-light');

                    products.forEach(product => {{
                        product.addEventListener('click', () => {{
                            let row = product.getAttribute('data-prod-id');
                            triggerButtonClick(row);
                        }});
                    }});
                }};
                ";

                // Register the script to ensure it is included when the page loads
                ClientScript.RegisterStartupScript(this.GetType(), "ButtonClickScript", script, true);
            }
        }



        private void GenerateProductHTML()
        {
            // Create a list of products (in a real application, this data could come from a database)
            GridView products = GridView1;

            // StringBuilder to efficiently build the HTML content
            StringBuilder htmlContent = new StringBuilder();

            // Loop through the product list and generate HTML for each product
            int i = 0;



            htmlContent.Append("<section class='featured section' id='shop'>");
            htmlContent.Append("<h2 id='shop-title' class='section-title'>All Products</h2>");
            htmlContent.Append("<div class='featured__container bd-grid'>");

            foreach (GridViewRow row in GridView1.Rows)
            {
                htmlContent.Append("<article class='sneaker'>");

                string imagePath = Server.MapPath("~/Resources/" + row.Cells[0].Text + ".png");
                if (System.IO.File.Exists(imagePath))
                {
                    // Image exists, show it
                    htmlContent.Append("<img src='Resources/" + row.Cells[0].Text + ".png' alt='Image missing!' class='sneaker__img'>");
                }
                else
                {
                    // Use a default image
                    htmlContent.Append("<img src='Resources/0.png' alt='Image missing!' class='sneaker__img'>");
                }

                htmlContent.Append("<span class='sneaker__name'>" + row.Cells[1].Text + "</span>");
                htmlContent.Append("<span class='sneaker__price'>R" + row.Cells[3].Text + "</span>");
                htmlContent.Append("<div data-prod-id='" + i + "' class='button-light'>Add to Cart <i class='bx bx-right-arrow-alt button-icon'></i></div>");
                htmlContent.Append("</article>");
                
                i++;
            }

            htmlContent.Append("</section>");

            // Assign the generated HTML to the Literal control
            LiteralProductList.Text = htmlContent.ToString();
        }

    }
}