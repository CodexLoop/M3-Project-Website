using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Townbush_Pharmacy_Website.Models;

namespace Townbush_Pharmacy_Website
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["FinalTotal"] != null)
                {
                    decimal finalTotal = (decimal)Session["FinalTotal"];
                    lblTotalToPay.Text = "Total to Pay: R" + finalTotal.ToString("F2");
                }
                else
                {
                    lblTotalToPay.Text = "Total to Pay: R0.00";
                }
            }

            // Only redirect if the checkout was not initiated
            if (Session["PaymentInitiated"] == null || !(bool)Session["PaymentInitiated"])
            {
                Response.Redirect("Products.aspx");
            }
        }

        protected void MakePayBtn_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string orderID = GenerateSimpleOrderId();
            string userID = User.Identity.GetUserId();
            DateTime orderDate = DateTime.Now;
            string address = Session["Address"].ToString();
            string city = Session["City"].ToString();
            string province = Session["Province"].ToString();
            string postalCode = Session["PostalCode"].ToString();
            string shippingMethod = Session["ShippingMethod"].ToString();
            string name = Session["Name"].ToString();
            string surname = Session["Surname"].ToString();
            string email = Session["EmailAddress"].ToString();
            string phoneNo = Session["PhoneNo"].ToString();

            DataTable cart = (DataTable)Session["buyItems"];
            foreach (DataRow row in cart.Rows)
            {
                string prodID = row["ProdID"].ToString();
                string prodName = row["ProdName"].ToString();
                int quantity = Convert.ToInt32(row["Quantity"]);
                decimal price = Convert.ToDecimal(row["ProdPrice"]);

                string query = @"INSERT INTO Orders (OrderID, UserID, DateTime, ProdID, ProdName, Quantity, ProdPrice, Address, City, Province, PostalCode)
                         VALUES (@OrderID, @UserID, @DateTime, @ProdID, @ProdName, @Quantity, @ProdPrice, @Address, @City, @Province, @PostalCode)";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@OrderID", orderID);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@DateTime", orderDate);
                    cmd.Parameters.AddWithValue("@ProdID", prodID);
                    cmd.Parameters.AddWithValue("@ProdName", prodName);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@ProdPrice", price);
                    cmd.Parameters.AddWithValue("@Address", address ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@City", city ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Province", province ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@PostalCode", postalCode ?? (object)DBNull.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    SqlCommand updateStock = new SqlCommand("UPDATE Product SET QtyInStock = QtyInStock - @Quantity WHERE ProdID = @ProdID", conn);
                    updateStock.Parameters.AddWithValue("@Quantity", quantity);
                    updateStock.Parameters.AddWithValue("@ProdID", prodID);
                    updateStock.ExecuteNonQuery();
                }
            }

            decimal finalTotal = (decimal)Session["FinalTotal"];
            decimal totalAmt = finalTotal;

            StringBuilder receiptContent = new StringBuilder();
            decimal totalAmount = 0;

            receiptContent.AppendLine(name + " " + surname);
            receiptContent.AppendLine(email);
            receiptContent.AppendLine(phoneNo);
            receiptContent.AppendLine("-----------------------------------------");
            receiptContent.AppendLine("Receipt for Order ID: " + orderID);
            receiptContent.AppendLine("Date: " + orderDate.ToString("yyyy-MM-dd HH:mm"));
            receiptContent.AppendLine("-----------------------------------------");

            if (shippingMethod == "Delivery")
            {
                receiptContent.AppendLine("Shipping Address:");
                receiptContent.AppendLine($"Address: {address}");
                receiptContent.AppendLine($"City: {city}");
                receiptContent.AppendLine($"Province: {province}");
                receiptContent.AppendLine($"Postal Code: {postalCode}");
            }
            else
            {
                receiptContent.AppendLine("Shipping Method: Pick-up");
            }

            foreach (DataRow row in cart.Rows)
            {
                string prodID = row["ProdID"].ToString();
                string prodName = row["ProdName"].ToString();
                int quantity = Convert.ToInt32(row["Quantity"]);
                decimal price = Convert.ToDecimal(row["ProdPrice"]);
                decimal lineTotal = quantity * price;

                receiptContent.AppendLine($"{prodName} (ID: {prodID}) - Quantity: {quantity}, Price: R{price:F2}, Line Total: R{lineTotal:F2}");
                totalAmount += lineTotal;
            }

            decimal shippingPrice = (decimal)Session["ShippingPrice"];
            totalAmount += shippingPrice;

            receiptContent.AppendLine($"Shipping Price: R{shippingPrice:F2}");
            receiptContent.AppendLine($"Total Amount: R{totalAmount:F2}");

            string receiptPath = Server.MapPath("~/Receipts/");
            string fileName = $"Receipt_{orderID}.txt";
            string fullPath = System.IO.Path.Combine(receiptPath, fileName);
            System.IO.File.WriteAllText(fullPath, receiptContent.ToString());

            string receiptLink = "~/Receipts/" + fileName;

            string salesQuery = @"INSERT INTO OnlineSales (UserID, DateTime, TotalAmt, Receipt)
                          VALUES (@UserID, @DateTime, @TotalAmt, @Receipt)";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(salesQuery, conn);
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@DateTime", orderDate);
                cmd.Parameters.AddWithValue("@TotalAmt", totalAmt);
                cmd.Parameters.AddWithValue("@Receipt", receiptLink);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            
            Response.Redirect("DownloadReceipt.aspx");
        }

        private string GenerateSimpleOrderId()
        {
            // For example, we can use the current date and a random number to create a simple Order ID
            Random random = new Random();
            int number = random.Next(100, 999); // Random number between 100 and 999
            string simpleOrderId = "A" + number.ToString(); // Create an Order ID like "A123"
            return simpleOrderId;
        }


    }
}