using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Townbush_Pharmacy_Website.Models;
using System.Data.SqlClient;
using System.Linq;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class Login : Page
    {
        private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["G2Pmb2024ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Check if the email belongs to an employee
                if (EmployeeExistsInDatabase(Email.Text))
                {
                    LogInOrRegisterEmployee(Email.Text, Password.Text);
                }
                // Check if the email belongs to a customer
                else if (CustomerExistsInDatabase(Email.Text))
                {
                    LogInOrRegisterCustomer(Email.Text, Password.Text);
                }
                else
                {
                    FailureText.Text = "Invalid login attempt.You must be added to the system by the frontend administrator.";
                    ErrorMessage.Visible = true;

                    FailureText.Text = "If you're a customer and have not yet registered, please register first.";
                    ErrorMessage.Visible = true;
                }
            }
        }

        private void LogInOrRegisterEmployee(string email, string password)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindByEmail(email);

            if (user == null)
            {
                // Employee is not registered, so register them
                RegisterEmployee(email, password);
            }
            else
            {
                // Employee is registered, log them in
                SignInEmployee(email, password);
            }
        }

        private void LogInOrRegisterCustomer(string email, string password)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindByEmail(email);

            if (user == null)
            {
                // Customer is not registered, redirect to registration page
                FailureText.Text = "Invalid login attempt. If you're a customer and have not yet registered, please register first.";
                ErrorMessage.Visible = true;
            }
            else
            {
                // Customer is registered, log them in
                SignInCustomer(email, password);
            }

        }

        private bool EmployeeExistsInDatabase(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Employee WHERE EmpEmailAddress = @Email";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private bool CustomerExistsInDatabase(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Customer WHERE CustEmailAddress = @Email"; // Update with your customers' table name and email column
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private void RegisterEmployee(string email, string password)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = new ApplicationUser() { UserName = email, Email = email };
            IdentityResult result = manager.Create(user, password);

            if (result.Succeeded)
            {
                // Assign the "Admin" role to the new employee user if it exists
                EnsureRoleExists("Admin");
                manager.AddToRole(user.Id, "Admin");
                SignInEmployee(email, password); // Log them in after registration
            }
            else
            {
                FailureText.Text = "Error during registration: " + result.Errors.FirstOrDefault();
                ErrorMessage.Visible = true;
            }
        }

        private void SignInEmployee(string email, string password)
        {
            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
            var result = signinManager.PasswordSignIn(email, password, RememberMe.Checked, shouldLockout: false);

            switch (result)
            {
                case SignInStatus.Success:
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    break;
                case SignInStatus.LockedOut:
                    Response.Redirect("/Account/Lockout");
                    break;
                case SignInStatus.RequiresVerification:
                    Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                    Request.QueryString["ReturnUrl"],
                                                    RememberMe.Checked),
                                      true);
                    break;
                case SignInStatus.Failure:
                default:
                    FailureText.Text = "Invalid login attempt";
                    ErrorMessage.Visible = true;
                    break;
            }
        }

        private void SignInCustomer(string email, string password)
        {
            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
            var result = signinManager.PasswordSignIn(email, password, RememberMe.Checked, shouldLockout: false);

            switch (result)
            {
                case SignInStatus.Success:
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    break;
                case SignInStatus.LockedOut:
                    Response.Redirect("/Account/Lockout");
                    break;
                case SignInStatus.RequiresVerification:
                    Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                                                    Request.QueryString["ReturnUrl"],
                                                    RememberMe.Checked),
                                      true);
                    break;
                case SignInStatus.Failure:
                default:
                    FailureText.Text = "Invalid login attempt";
                    ErrorMessage.Visible = true;
                    break;
            }
        }

        private void EnsureRoleExists(string roleName)
        {
            var roleManager = Context.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            if (!roleManager.RoleExists(roleName))
            {
                // Create the role if it doesn't exist
                var result = roleManager.Create(new IdentityRole(roleName));
                if (!result.Succeeded)
                {
                    FailureText.Text = "Error creating role: " + result.Errors.FirstOrDefault();
                    ErrorMessage.Visible = true;
                }
            }
        }
    }
}



//using System;
//using System.Web;
//using System.Web.UI;
//using Microsoft.AspNet.Identity;
//using Microsoft.AspNet.Identity.Owin;
//using Owin;
//using Townbush_Pharmacy_Website.Models;
//using System.Data.SqlClient;
//using System.Linq;

//namespace Townbush_Pharmacy_Website.Account
//{
//    public partial class Login : Page
//    {
//        private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["G2Pmb2024ConnectionString"].ConnectionString;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            RegisterHyperLink.NavigateUrl = "Register";
//            // Enable this once you have account confirmation enabled for password reset functionality
//            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
//            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
//            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
//            if (!String.IsNullOrEmpty(returnUrl))
//            {
//                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
//            }
//        }

//        protected void LogIn(object sender, EventArgs e)
//        {

//            if (IsValid)
//            {
//                // Check if the email belongs to an employee
//                if (EmployeeExistsInDatabase(Email.Text))
//                {
//                    // Check if the employee is already registered in ASP.NET Identity
//                    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
//                    var user = manager.FindByEmail(Email.Text);

//                    if (user == null)
//                    {
//                        // Employee is not registered, so register them
//                        RegisterEmployee(Email.Text, Password.Text);
//                    }

//                    // Now, log them in
//                    SignInEmployee(Email.Text, Password.Text);
//                }
//                // Check if the email belongs to a customer
//                else if (CustomerExistsInDatabase(Email.Text))
//                {
//                    // Check if the customer is already registered in ASP.NET Identity
//                    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
//                    var user = manager.FindByEmail(Email.Text);

//                    if (user == null)
//                    {
//                        // Customer is not registered, redirect to registration page
//                        //Response.Redirect("~/Account/Register?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]));
//                        FailureText.Text = "Invalid login attempt. If you're a customer and have not yet registered, please register first.";
//                        ErrorMessage.Visible = true;
//                        return; // Ensure no further processing occurs
//                    }

//                    // Now, log them in
//                    SignInCustomer(Email.Text, Password.Text);
//                }
//                else
//                {
//                    FailureText.Text = "You must be added to the system by the frontend administrator.";
//                    ErrorMessage.Visible = true;
//                }
//            }
//            //    if (IsValid)
//            //    {
//            //        // Validate the user password
//            //        var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
//            //        var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

//            //        // This doen't count login failures towards account lockout
//            //        // To enable password failures to trigger lockout, change to shouldLockout: true
//            //        var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

//            //        switch (result)
//            //        {
//            //            case SignInStatus.Success:
//            //                AssignRoleToUser(Email.Text);  // Assign the role based on database check
//            //                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
//            //                break;
//            //            //case SignInStatus.Success:
//            //              //  IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
//            //                //break;
//            //            case SignInStatus.LockedOut:
//            //                Response.Redirect("/Account/Lockout");
//            //                break;
//            //            case SignInStatus.RequiresVerification:
//            //                Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}", 
//            //                                                Request.QueryString["ReturnUrl"],
//            //                                                RememberMe.Checked),
//            //                                  true);
//            //                break;
//            //            case SignInStatus.Failure:
//            //            default:
//            //                FailureText.Text = "Invalid login attempt";
//            //                ErrorMessage.Visible = true;
//            //                break;
//            //        }
//            //    }
//        }

//        private bool EmployeeExistsInDatabase(string email)
//        {
//            using (SqlConnection conn = new SqlConnection(connectionString))
//            {
//                conn.Open();
//                string query = "SELECT COUNT(*) FROM Employee WHERE EmpEmailAddress = @Email";
//                using (SqlCommand cmd = new SqlCommand(query, conn))
//                {
//                    cmd.Parameters.AddWithValue("@Email", email);
//                    int count = (int)cmd.ExecuteScalar();
//                    return count > 0;
//                }
//            }
//        }

//        private bool CustomerExistsInDatabase(string email)
//        {
//            using (SqlConnection conn = new SqlConnection(connectionString))
//            {
//                conn.Open();
//                string query = "SELECT COUNT(*) FROM Customers WHERE CustomerEmailAddress = @Email"; // Update with your customers' table name and email column
//                using (SqlCommand cmd = new SqlCommand(query, conn))
//                {
//                    cmd.Parameters.AddWithValue("@Email", email);
//                    int count = (int)cmd.ExecuteScalar();
//                    return count > 0;
//                }
//            }
//        }

//        private void RegisterEmployee(string email, string password)
//        {
//            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
//            var user = new ApplicationUser() { UserName = email, Email = email };
//            IdentityResult result = manager.Create(user, password);

//            if (result.Succeeded)
//            {
//                // Assign the "Admin" role to the new employee user
//                manager.AddToRole(user.Id, "Admin");
//            }
//            else
//            {
//                FailureText.Text = "Error during registration: " + result.Errors.FirstOrDefault();
//                ErrorMessage.Visible = true;
//            }
//        }

//        private void SignInEmployee(string email, string password)
//        {
//            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
//            var result = signinManager.PasswordSignIn(email, password, RememberMe.Checked, shouldLockout: false);

//            switch (result)
//            {
//                case SignInStatus.Success:
//                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
//                    break;
//                case SignInStatus.LockedOut:
//                    Response.Redirect("/Account/Lockout");
//                    break;
//                case SignInStatus.RequiresVerification:
//                    Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
//                                                    Request.QueryString["ReturnUrl"],
//                                                    RememberMe.Checked),
//                                      true);
//                    break;
//                case SignInStatus.Failure:
//                default:
//                    FailureText.Text = "Invalid login attempt";
//                    ErrorMessage.Visible = true;
//                    break;
//            }
//        }

//        private void SignInCustomer(string email, string password)
//        {
//            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
//            var result = signinManager.PasswordSignIn(email, password, RememberMe.Checked, shouldLockout: false);

//            switch (result)
//            {
//                case SignInStatus.Success:
//                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
//                    break;
//                case SignInStatus.LockedOut:
//                    Response.Redirect("/Account/Lockout");
//                    break;
//                case SignInStatus.RequiresVerification:
//                    Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
//                                                    Request.QueryString["ReturnUrl"],
//                                                    RememberMe.Checked),
//                                      true);
//                    break;
//                case SignInStatus.Failure:
//                default:
//                    FailureText.Text = "Invalid login attempt";
//                    ErrorMessage.Visible = true;
//                    break;
//            }
//        }

//        //private void AssignRoleToUser(string email)
//        //{
//        //    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
//        //    var user = manager.FindByEmail(email);

//        //    if (user != null)
//        //    {
//        //        // Check if user exists in Employee or Customer table
//        //        string role = GetUserRoleFromDatabase(email);

//        //        if (!string.IsNullOrEmpty(role))
//        //        {
//        //            // Add user to the role if not already assigned
//        //            if (!manager.IsInRole(user.Id, role))
//        //            {
//        //                manager.AddToRole(user.Id, role);
//        //            }
//        //        }
//        //    }
//        //}

//        //private string GetUserRoleFromDatabase(string email)
//        //{
//        //    using (SqlConnection conn = new SqlConnection(connectionString))
//        //    {
//        //        conn.Open();

//        //        // Check if user exists in Employee table
//        //        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Employee WHERE EmpEmailAddress = @Email", conn))
//        //        {
//        //            cmd.Parameters.AddWithValue("@Email", email);
//        //            int employeeCount = (int)cmd.ExecuteScalar();
//        //            if (employeeCount > 0)
//        //            {
//        //                return "Admin"; // User is an employee, assign Admin role
//        //            }
//        //        }

//        //        // Check if user exists in Customer table
//        //        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE CustEmailAddress = @Email", conn))
//        //        {
//        //            cmd.Parameters.AddWithValue("@Email", email);
//        //            int customerCount = (int)cmd.ExecuteScalar();
//        //            if (customerCount > 0)
//        //            {
//        //                return "Customer"; // User is a customer, assign Customer role
//        //            }
//        //        }
//        //    }
//        //    return null; // User not found in either table
//        //}

//    }
//}