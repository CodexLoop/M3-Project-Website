using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using Townbush_Pharmacy_Website.Account.Models;
using Townbush_Pharmacy_Website.Models;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        protected string SuccessMessage
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        public bool HasPhoneNumber { get; private set; }

        public bool TwoFactorEnabled { get; private set; }

        public bool TwoFactorBrowserRemembered { get; private set; }

        public int LoginsCount { get; set; }

        protected void Page_Load()
        {
            Message.Visible = false;
            //order_Link.Visible = true;
            //Prescribtion_Link.Visible = true;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //var userId = User.Identity.GetUserId(); // Get the logged-in user's ID
            var email = User.Identity.GetUserName(); // Get the logged-in user's email address

            // Get user details from the database
            //ApplicationUser currentUser = manager.FindById(userId);
            // Use the email address to retrieve customer details from the second database (Customer DB)
            var customer = GetCustomerByEmail(email);
           // if (currentUser != null)
            //{
                //CustomerDetailsPanel.Visible = true;

                // Retrieve customer details from your customer database (assuming you have a DbContext)
                //using (var context = new CustomerDbContext()) // Use your DbContext class
                {
                    // Find the customer record that matches the userId (application user)
                    //var customer = context.Customer.FirstOrDefault(c => c.CustID == userId); // Assuming CustID maps to User.Identity.GetUserId()

                    if (customer != null)
                    {
                        CustomerDetailsPanel.Visible = true;
    
                        LabelID.Text = customer.CustID; // Customer ID from Customer table
                        CustomerNameLabel.Text = customer.CustFirstNames; // First Name
                        lastCustomerName.Text = customer.CustLastName; // Last Name
                        Addresslabel.Text = customer.Address; // Address
                        ContactNumberLabel.Text = customer.ContactNo; // Contact Number
                        EmailAddressLabel.Text = customer.CustEmailAddress; // Customer Email
                    }
                    else
                    {
                    // Handle case where customer information is not found
                    // For example, show a message or log the issue
                    Message.Visible = true;

                    Message.Text = "Access denied";
                        order_Link.Visible = false;
                        Prescribtion_Link.Visible = false;
                    }
                }
            //}

            HasPhoneNumber = String.IsNullOrEmpty(manager.GetPhoneNumber(User.Identity.GetUserId()));

            // Enable this after setting up two-factor authentientication
            //PhoneNumber.Text = manager.GetPhoneNumber(User.Identity.GetUserId()) ?? String.Empty;

            TwoFactorEnabled = manager.GetTwoFactorEnabled(User.Identity.GetUserId());

            LoginsCount = manager.GetLogins(User.Identity.GetUserId()).Count;

            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

            if (!IsPostBack)
            {
                // Determine the sections to render
                if (HasPassword(manager))
                {
                    //ChangePassword.Visible = true;
                }
                else
                {
                    //CreatePassword.Visible = true;
                    //ChangePassword.Visible = false;
                }

                // Render success message
                var message = Request.QueryString["m"];
                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The account was removed."
                        : message == "AddPhoneNumberSuccess" ? "Phone number has been added"
                        : message == "RemovePhoneNumberSuccess" ? "Phone number was removed"
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }
            }
        }

        // Method to retrieve customer from the second database using email
        private Customer GetCustomerByEmail(string email)
        {
            // Connection string for the second server
            string connectionString = ConfigurationManager.ConnectionStrings["G2Pmb2024ConnectionString"].ToString();

            // Create a SQL connection to the second server
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to get the customer by Email Address
                string query = "SELECT * FROM Customer WHERE CustEmailAddress = @Email";

                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Map the result to a Customer object
                            var customer = new Customer
                            {
                                CustID = reader["CustID"].ToString(),
                                CustFirstNames = reader["CustFirstNames"].ToString(),
                                CustLastName = reader["CustLastName"].ToString(),
                                Address = reader["Address"].ToString(),
                                CustEmailAddress = reader["CustEmailAddress"].ToString(),
                                ContactNo = reader["ContactNo"].ToString()
                            };
                            return customer;
                        }
                    }
                }
            }

            return null; // Return null if no customer is found
        }


        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        // Remove phonenumber from user
        protected void RemovePhone_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var result = manager.SetPhoneNumber(User.Identity.GetUserId(), null);
            if (!result.Succeeded)
            {
                return;
            }
            var user = manager.FindById(User.Identity.GetUserId());
            if (user != null)
            {
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("/Account/Manage?m=RemovePhoneNumberSuccess");
            }
        }

        // DisableTwoFactorAuthentication
        protected void TwoFactorDisable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), false);

            Response.Redirect("/Account/Manage");
        }

        //EnableTwoFactorAuthentication 
        protected void TwoFactorEnable_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            manager.SetTwoFactorEnabled(User.Identity.GetUserId(), true);

            Response.Redirect("/Account/Manage");
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            // Toggle AddStockPanel visibility based on checkbox status
            UpdateEmployeeDetails.Visible = CheckBox1.Checked;

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var email = User.Identity.GetUserName(); // Get the logged-in user's email address

            var customer = GetCustomerByEmail(email);

            if (customer != null)
            {
                // Bind existing customer details to the textboxes for updating
                NameTextBox.Text = customer.CustFirstNames;
                lastNameTextBox.Text = customer.CustLastName;
                AddressTextbox.Text = customer.Address;
                ContactTextBox.Text = customer.ContactNo;
                EmailTextbox.Text = customer.CustEmailAddress;
            }

        }

        protected void UpdateCustomerButton_Click(object sender, EventArgs e)
        {
            var email = User.Identity.GetUserName(); // Get the logged-in user's email address
            var customer = GetCustomerByEmail(email);

            if (customer != null)
            {
                // Update customer details with the new values from the form fields
                customer.CustFirstNames = NameTextBox.Text;
                customer.CustLastName = lastNameTextBox.Text;
                customer.Address = AddressTextbox.Text;
                customer.ContactNo = ContactTextBox.Text;
                customer.CustEmailAddress = EmailTextbox.Text;

                // Save the updated details back to the database
                UpdateCustomerDetailsInDb(customer);

                // Optionally show success message
                SuccessMessage = "Your details have been updated.";
                successMessage.Visible = true;

                // Reload the page to reflect changes
                Response.Redirect("/Account/Manage");
            }
            else
            {
                // Handle case where customer is not found
                SuccessMessage = "Failed to update details.";
                successMessage.Visible = true;
            }
        }

        // Method to update customer details in the database
        private void UpdateCustomerDetailsInDb(Customer customer)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G2Pmb2024ConnectionString"].ToString();

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "UPDATE Customer SET CustFirstNames = @FirstName, CustLastName = @LastName, " +
                               "Address = @Address, ContactNo = @ContactNo, CustEmailAddress = @Email WHERE CustID = @CustID";

                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FirstName", customer.CustFirstNames);
                    command.Parameters.AddWithValue("@LastName", customer.CustLastName);
                    command.Parameters.AddWithValue("@Address", customer.Address);
                    command.Parameters.AddWithValue("@ContactNo", customer.ContactNo);
                    command.Parameters.AddWithValue("@Email", customer.CustEmailAddress);
                    command.Parameters.AddWithValue("@CustID", customer.CustID);

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}