using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Townbush_Pharmacy_Website.Account.Models;
using Townbush_Pharmacy_Website.Models;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class Register : Page

    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            // Check if the email exists in the Customer database
            using (var customerContext = new CustomerDbContext())
            {
                var existingCustomer = customerContext.Customer.FirstOrDefault(c => c.CustEmailAddress == Email.Text);

                // Check if the customer already exists in the database
                if (existingCustomer != null)
                {
                    // Step 1: Check if the customer has already registered in ASP.NET Identity
                    var existingUser = manager.FindByEmail(Email.Text);
                    if (existingUser != null)
                    {
                        // Customer exists and has already registered, sign them in and redirect to the default page
                        // Customer exists but has not registered yet
                        ConfirmMessage.Text = $"We found a match. Is this you? Customer ID: {existingCustomer.CustID}, Name: {existingCustomer.CustFirstNames} {existingCustomer.CustLastName}";
                        ConfirmationPanel.Visible = true; // Show confirmation panel
                        Session["CustomerID"] = existingCustomer.CustID; // Store customer ID in session for further processing
                        //signInManager.SignIn(existingUser, isPersistent: false, rememberBrowser: false);
                        //Response.Redirect("../Products.aspx");
                        return;
                    }
                    else
                    {
                        // Customer exists but has not registered yet
                        ConfirmMessage.Text = $"We found a match. Is this you? Customer ID: {existingCustomer.CustID}, Name: {existingCustomer.CustFirstNames} {existingCustomer.CustLastName}";
                        ConfirmationPanel.Visible = true; // Show confirmation panel
                        Session["CustomerID"] = existingCustomer.CustID; // Store customer ID in session for further processing
                        return; // Return to let the user confirm
                    }
                }
            }

            // Step 2: If no customer found, check if the email exists in ASP.NET Identity
            var newUser = manager.FindByEmail(Email.Text);
            if (newUser != null)
            {
                ErrorMessage.Text = "This email is already registered. Please log in or use a different email.";
                return;
            }

            // Step 3: If email does not exist in either database, proceed with new registration
            RegisterNewUser();
        }

        protected void RegisterNewUser()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            // Create new ASP.NET Identity user
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                // After successful registration, check if the customer details exist
                using (var customerContext = new CustomerDbContext())
                {
                    var existingCustomer = customerContext.Customer.FirstOrDefault(c => c.CustEmailAddress == user.Email);
                    if (existingCustomer == null)
                    {
                        // Redirect to CaptureCustomerPage if customer details do not exist
                        signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                        Response.Redirect("CaptureNewCust.aspx");
                    }
                    else
                    {
                        // If customer details exist, sign in the user
                        signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                        Response.Redirect("../Products.aspx"); // Redirect to the default page after registration
                    }
                }
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        protected void ConfirmYesButton_Click(object sender, EventArgs e)
        {
            // Proceed with registration after confirmation
            RegisterNewUser();
            ConfirmationPanel.Visible = false; // Hide the confirmation panel after proceeding
        }

        protected void ConfirmNoButton_Click(object sender, EventArgs e)
        {
            // If the user does not recognize the details, hide the confirmation panel
            ConfirmationPanel.Visible = false;
            Session.Remove("CustomerID"); // Clear session variable
            ErrorMessage.Text = "Please proceed to register as a new user.";
        }

        /*protected void CreateUser_Click(object sender, EventArgs e)
        {

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            // Check if the email exists in the Customer database
            using (var customerContext = new CustomerDbContext()) // CustomerDbContext should connect to the customer database
            {
                var existingCustomer = customerContext.Customer.FirstOrDefault(c => c.CustEmailAddress == Email.Text);
                if (existingCustomer != null)
                {
                    // Show confirmation message with Customer ID and Names
                    ConfirmMessage.Text = $"We found a match. Is this you? Customer ID: {existingCustomer.CustID}, Name: {existingCustomer.CustFirstNames} {existingCustomer.CustLastName}";
                    ConfirmationPanel.Visible = true;  // Assume you have a confirmation panel in the UI
                    Session["CustomerID"] = existingCustomer.CustID; // Store customer ID in session for verification
                    //return;
                    
                    //RegisterNewUser();
                    return;
                }
                else 
                {
                    RegisterNewUser();
                    Response.Redirect("CaptureNewCust.aspx");
                }
            }

            // Step 2: Check if the email exists in ASP.NET Identity
            var existingUser = manager.FindByEmail(Email.Text);
            if (existingUser != null)
            {
                ErrorMessage.Text = "This email is already registered. Please log in or use a different email.";
                return;
            }

            // Step 3: If email does not exist in either database, proceed with new registration
            RegisterNewUser();

        }


        protected void RegisterNewUser()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            // Create new ASP.NET Identity user
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);

            //var existingCustomer = Session["CustomerToRegister"] as Customer;

            if (result.Succeeded)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    Response.Redirect("Default.aspx");
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        protected void ConfirmYesButton_Click(object sender, EventArgs e)
        {
            RegisterNewUser();
        }

        

        protected void ConfirmNoButton_Click(object sender, EventArgs e)
        {
            // If the user does not recognize the details, hide the confirmation panel
            ConfirmationPanel.Visible = false;
            Session.Remove("CustomerToRegister"); // Clear session variable
            ErrorMessage.Text = "Please proceed to register as a new user.";
        }
    }*/
    }
}