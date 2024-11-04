using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;



namespace Townbush_Pharmacy_Website
{
    public partial class SiteMaster : MasterPage
    {
        private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["G2Pmb2024ConnectionString"].ConnectionString;

        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                // Display a greeting with the user's name if they are logged in
                string userName = HttpContext.Current.User.Identity.Name; // Gets the logged-in username
                System.Diagnostics.Debug.WriteLine($"User Name: {userName}"); // Log the username

                try
                {
                    userName = SanitizeUsername(userName);
                    int index = userName.IndexOf('@');
                    GreetingLabel.Text = (userName.Substring(index));
                }
                catch (Exception ex)
                {
                    // Log the exception (ex) and handle it gracefully
                    GreetingLabel.Text = "Hello, user!";
                }

                string userRole = IsUserInDatabase(userName);

                if (userRole == "Admin")
                {
                    // User exists in the database
                    AdminLinks.Visible = true; // Show admin links (you can change this logic as needed)
                }
                else if (userRole == "Customer")
                {
                    AdminLinks.Visible = false; // Hide admin links if user is not found
                    //CustomerLinks.Visible = true;
                }
                //else
                //{
                //    //AdminLinks.Visible = false; // Hide admin links if user is not found
                //}

            }

        }

        private string IsUserInDatabase(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Check if user exists in Employee table
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Employee WHERE EmpEmailAddress = @Email", conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    int employeeCount = (int)cmd.ExecuteScalar();
                    if (employeeCount > 0)
                    {
                        return "Admin"; // User is an employee, assign Admin role
                    }
                }
            }
            
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM Customer WHERE CustEmailAddress = @Email"; // Update with your customers' table name and email column
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        return "Customer"; // User is an employee, assign Customer role
                    }
                }
                }
            
            return "Guest"; // Return a default role if not found

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        private string SanitizeUsername(string username)
        {
            // Remove illegal characters for usernames (e.g., whitespace, control chars)
            char[] invalidChars = System.IO.Path.GetInvalidFileNameChars();
            foreach (char c in invalidChars)
            {
                username = username.Replace(c.ToString(), string.Empty);
            }

            // Optionally trim whitespace
            return username.Trim();
        }

    }

}