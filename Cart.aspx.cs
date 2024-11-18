using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using Townbush_Pharmacy_Website.Models;

namespace Townbush_Pharmacy_Website
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is authenticated
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                // Show the login message and link
                LoginMessage.Visible = true;
                LoginMessage.Text = "Please log in to access your cart.";
                LoginLinkButton.Visible = true;

                // Hide the cart elements
                //Button2.Visible = false;
                GridView1.Visible = false;
                Button1.Visible = false;
                TotalAmountLabel.Visible = false;
                return;
            }


                // Check if the user is an admin
            else if (IsUserAdmin(HttpContext.Current.User.Identity.Name))
            {
                // Inform the admin that they don't need to view the cart
                LoginMessage.Visible = true;
                LoginMessage.Text = "As an Employee/Admin, you do not need to view the cart.";
                //Button2.Visible = false; // Hide the button to navigate to products
                GridView1.Visible = false; // Hide the cart display elements
                Button1.Visible = false; // Hide checkout button
                TotalAmountLabel.Visible = false; // Hide total label

                // Stop further processing
                return;
            }

                // User is authenticated; hide the login message and link
                LoginMessage.Visible = false;
                LoginLinkButton.Visible = false;

                if (!IsPostBack)
                {
                    if (Session["buyItems"] == null)
                    {
                        Button1.Enabled = false;
                    }
                    else
                    {
                        Button1.Enabled = true;
                    }

                    // Adding Product to Cart
                    Session["Cart"] = "False";
                    DataTable dt = new DataTable();
                    dt.Columns.Add("prodID");
                    dt.Columns.Add("prodName");
                    dt.Columns.Add("prodPrice");
                    dt.Columns.Add("quantity");
                    dt.Columns.Add("subTotal");

                    if (Request.QueryString["id"] != null)
                    {
                        int quantity = 1; // Default quantity
                        string prodID = Request.QueryString["id"];
                        SqlConnection conn = new SqlConnection("Server=146.230.177.46;Database=G2Pmb2024;User Id=G2Pmb2024;Password=j0210j;");
                        SqlDataAdapter da = new SqlDataAdapter("Select * from Product WHERE ProdID=" + prodID, conn);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        // Check if the product is already in the cart
                        if (Session["buyItems"] != null)
                        {
                            dt = (DataTable)Session["buyItems"];
                            DataRow existingRow = dt.Rows.Cast<DataRow>().FirstOrDefault(dr => dr["prodID"].ToString() == prodID);

                            if (existingRow != null) // Product already exists in the cart
                            {
                                int existingQuantity = Convert.ToInt32(existingRow["quantity"]);
                                existingQuantity++; // Increase quantity
                                existingRow["quantity"] = existingQuantity;

                                decimal price = Convert.ToDecimal(existingRow["prodPrice"]);
                                existingRow["subTotal"] = price * existingQuantity; // Update subtotal
                            }
                            else // Product not in the cart, add it
                            {
                                DataRow dr = dt.NewRow();
                                dr["prodID"] = ds.Tables[0].Rows[0]["ProdID"].ToString();
                                dr["prodName"] = ds.Tables[0].Rows[0]["ProdName"].ToString();
                                dr["prodPrice"] = ds.Tables[0].Rows[0]["ProdPrice"].ToString();
                                dr["quantity"] = quantity; // Set the selected quantity
                                decimal price = (decimal)ds.Tables[0].Rows[0]["ProdPrice"];
                                dr["subTotal"] = price * quantity;

                                dt.Rows.Add(dr);
                            }
                        }
                        else // First time adding to cart
                        {
                            DataRow dr = dt.NewRow();
                            dr["prodID"] = ds.Tables[0].Rows[0]["ProdID"].ToString();
                            dr["prodName"] = ds.Tables[0].Rows[0]["ProdName"].ToString();
                            dr["prodPrice"] = ds.Tables[0].Rows[0]["ProdPrice"].ToString();
                            dr["quantity"] = quantity; // Set the selected quantity
                            decimal price = (decimal)ds.Tables[0].Rows[0]["ProdPrice"];
                            dr["subTotal"] = price * quantity;

                            dt.Rows.Add(dr);
                        }

                        // Update session and bind data
                        Session["buyItems"] = dt;
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Button1.Enabled = true;

                        if (GridView1.FooterRow != null)
                        {
                            GridView1.FooterRow.Cells[3].Text = "Total Amount";
                            // Optionally update the grand total
                            // GridView1.FooterRow.Cells[4].Text = grandTotal().ToString();
                        }

                        Response.Redirect("Cart.aspx");
                    }
                    else
                    {
                        // Load existing items in the cart
                        if (Session["buyItems"] != null)
                        {
                            dt = (DataTable)Session["buyItems"];
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            UpdateTotalAmount(dt);
                        }
                    }

                    // Update order date in the session
                    string OrderDate = DateTime.Now.ToShortDateString();
                    Session["OrderDate"] = OrderDate;
                }
        }

        // Helper method to check if the user is an admin
        private bool IsUserAdmin(string username)
        {
            // Implement your logic to check if the user is an admin
            // For example, you could query the database or check against a list of admin users
            // Here’s a simple example assuming you have a role in your database
            //"SELECT COUNT(*) FROM Employee WHERE EmpEmailAddress = @Email"
            //using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Employee WHERE EmpEmailAddress = @Username", conn))

            using (SqlConnection conn = new SqlConnection("Server=146.230.177.46;Database=G2Pmb2024;User Id=G2Pmb2024;Password=j0210j;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Employee WHERE EmpEmailAddress  = @username", conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    return (int)cmd.ExecuteScalar() > 0;
                }
            }
        }

        protected void Qty_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            string prodID = row.Cells[0].Text;

            // Get the new quantity selected in the DropDownList
            int newQuantity = int.Parse(ddl.SelectedValue);

            // Retrieve the current session data
            DataTable dt = (DataTable)Session["buyItems"];

            // Retrieve stock information from the database
            int stockQuantity = GetStockQuantity(prodID);

            // Check if the selected quantity exceeds available stock
            if (newQuantity > stockQuantity)
            {
                // Show alert to the user
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Insufficient stock! Only {stockQuantity} available.');", true);
                // Rebind the previous quantity to the dropdown
                ddl.SelectedValue = dt.AsEnumerable().FirstOrDefault(dr => dr["prodID"].ToString() == prodID)?["quantity"].ToString();
                return;
            }

            // Locate the product row in the session data and update quantity and subtotal
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["prodID"].ToString() == prodID)
                {
                    // Update the quantity
                    dr["quantity"] = newQuantity;

                    // Calculate the new subtotal
                    decimal price = Convert.ToDecimal(dr["prodPrice"]);
                    dr["subTotal"] = price * newQuantity;
                    break;
                }
            }

            // Rebind the updated DataTable to the GridView
            GridView1.DataSource = dt;
            GridView1.DataBind();
            UpdateTotalAmount(dt);

            // Update the session to store the modified cart data
            Session["buyItems"] = dt;
        }

        private int GetStockQuantity(string prodID)
        {
            int stockQuantity = 0;
            using (SqlConnection conn = new SqlConnection("Server=146.230.177.46;Database=G2Pmb2024;User Id=G2Pmb2024;Password=j0210j;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT qtyInStock FROM Product WHERE ProdID = @ProdID", conn))
                {
                    cmd.Parameters.AddWithValue("@ProdID", prodID);
                    stockQuantity = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            return stockQuantity;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Locate the DropDownList in the GridViewRow
                DropDownList ddl = (DropDownList)e.Row.FindControl("Qty");
                if (ddl != null)
                {
                    // Get the quantity from the DataTable and set it as the selected value
                    string quantity = DataBinder.Eval(e.Row.DataItem, "quantity").ToString();
                    ddl.SelectedValue = quantity; // This will display the correct quantity in the dropdown
                }
            }

        }

        private void UpdateTotalAmount(DataTable dt)
        {
            decimal totalAmount = 0;
            foreach (DataRow row in dt.Rows)
            {
                totalAmount += Convert.ToDecimal(row["subTotal"]);
            }
            TotalAmountLabel.Text = "Total Amount: R" + totalAmount.ToString("F2");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                // Get the row index of the item to remove
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Retrieve the current cart from the session
                DataTable dt = (DataTable)Session["buyItems"];

                // Remove the item at the specified row index
                dt.Rows.RemoveAt(rowIndex);

                // Update the session and rebind the GridView
                Session["buyItems"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();
                UpdateTotalAmount(dt);

                // Disable the checkout button if the cart is empty
                Button1.Enabled = dt.Rows.Count > 0;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string totalAmount = TotalAmountLabel.Text.Replace("Total Amount: R", "").Trim();
            Session["TotalAmount"] = totalAmount;

            Session["CheckoutInitiated"] = true;
            Response.Redirect("PlaceOrder.aspx");
        }

        protected void LoginLinkButton_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            catch (Exception ex)
            {
                // Log the error or display a friendly message
                LoginMessage.Text = "An error occurred while redirecting: " + ex.Message;
                LoginMessage.Visible = true;
            }
        }
    }
}
