using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Townbush_Pharmacy_Website
{
    public partial class PlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ShipLbl.Text = "Shipping Price: R";

                if (User.Identity.IsAuthenticated)
                {
                    var userEmail = User.Identity.GetUserName();
                    EmailTxtBx.Text = userEmail; // Set email in the TextBox
                }

                if (Session["TotalAmount"] != null)
                {
                    TotalAmountLabel.Text = "Total Amount: R" + Session["TotalAmount"].ToString();
                }
            }

            // Only redirect if the checkout was not initiated
            if (Session["CheckoutInitiated"] == null || !(bool)Session["CheckoutInitiated"])
            {
                Response.Redirect("Products.aspx");
            }
        }

        protected void ddlProv_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Ensure the selected value is a valid decimal
            if (decimal.TryParse(ddlProv.SelectedValue, out decimal shippingPrice))
            {
                ShipLbl.Text = "Shipping Price: R" + shippingPrice.ToString("F2");
                Session["ShippingPrice"] = shippingPrice; // Store in Session if needed
            }
            else
            {
                ShipLbl.Text = "Please select a valid province to view the shipping price.";
            }
        }

        protected void ddlShippingMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlShippingMethod.SelectedValue == "0") // Pickup
            {
                Session["ShippingMethod"] = "Pick-up";
                decimal shippingPrice = 0;
                Session["ShippingPrice"] = shippingPrice;
                ShipLbl.Text = "Shipping Price: R" +shippingPrice.ToString("F2");

                // Hide address-related fields
                //Addlbl.Visible = false;
                AddTxtBx.Visible = false;
                //Citylbl.Visible = false;
                CityTxtBx.Visible = false;
                //PClbl.Visible = false;
                PCTxtBx.Visible = false;
                //ProvLbl.Visible = false;
                ddlProv.Visible = false;
                
                Session["Address"] = null;
                Session["City"] = null;
                Session["PostalCode"] = null;
                Session["Province"] = null;

            }
            else if (ddlShippingMethod.SelectedValue == "1") // Delivery
            {
                Session["ShippingMethod"] = "Delivery";
                // Show address-related fields
                //Addlbl.Visible = true;
                AddTxtBx.Visible = true;
                //Citylbl.Visible = true;
                CityTxtBx.Visible = true;
                //PClbl.Visible = true;
                PCTxtBx.Visible = true;
                //ProvLbl.Visible = true;
                ddlProv.Visible = true;

                Session["Address"] = AddTxtBx.Text;
                Session["City"] = CityTxtBx.Text;
                Session["PostalCode"] = PCTxtBx.Text;
                Session["Province"] = ddlProv.SelectedValue;

                // Set initial shipping price if province is selected
                if (decimal.TryParse(ddlProv.SelectedValue, out decimal shippingPrice) && shippingPrice > 0)
                {
                    ShipLbl.Text = "Shipping Price: R" + shippingPrice.ToString("F2");
                }
                else
                {
                    ShipLbl.Text = "Please select a valid province to view the shipping price.";
                }
            }
        }

        protected void PayBtn_Click(object sender, EventArgs e)
        {
            Session["Address"] = AddTxtBx.Text;
            Session["City"] = CityTxtBx.Text;
            Session["PostalCode"] = PCTxtBx.Text;
            Session["Province"] = ddlProv.SelectedValue;

            Session["Name"] = NametxtBx.Text;
            Session["Surname"] = SurnameTxtBx.Text;
            Session["EmailAddress"] = EmailTxtBx.Text;
            Session["PhoneNo"] = PhoneTxtBx.Text;

            decimal totalAmount = 0;
            decimal shippingPrice = 0;

            // Retrieve the total amount from session if available
            if (Session["TotalAmount"] != null)
            {
                totalAmount = Convert.ToDecimal(Session["TotalAmount"]);
            }

            // Retrieve the shipping price from session if available
            if (Session["ShippingPrice"] != null)
            {
                shippingPrice = Convert.ToDecimal(Session["ShippingPrice"]);
            }

            // Calculate the final total
            decimal finalTotal = totalAmount + shippingPrice;

            // Store the final total in session to access it on the Payment page
            Session["FinalTotal"] = finalTotal;

            // Redirect to the Payment page
            Session["PaymentInitiated"] = true;
            Response.Redirect("Payment.aspx");
        }
    }
}