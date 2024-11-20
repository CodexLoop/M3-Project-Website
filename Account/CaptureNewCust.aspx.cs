using System;
using System.Globalization;
using System.Data.SqlClient;
using System.Web;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class CaptureNewCust : System.Web.UI.Page
    {
        // Connection string to your database
        //private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["G2Pmb2024ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            MessageError.Visible = false;


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string custID = TextBox1CustID.Text.Trim();
                string custFirstName = TextBox2CustFN.Text.Trim();
                string custLastName = TextBox3CustLN.Text.Trim();
                string dobString = TextBox4DOB.Text.Trim();
                string contactNo = TextBoxCustNumber.Text.Trim();
                string address = TextBoxAdress.Text.Trim();
                string email = TextBox5CustEmailAdd.Text.Trim();
                bool hasMedicalAid = CheckBox1.Checked;
                string medAidName = TextBox6MedicalAN.Text.Trim();
                string mainMemberID = TextBox7MMNumber.Text.Trim();
                string policyNo = TextBox8PolicyNO.Text.Trim();
                string planType = TextBox9PlanType.Text.Trim();

                DateTime dob;
                if (!DateTime.TryParseExact(dobString, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out dob))
                {
                    Response.Write("<script>alert('Invalid date format. Please use yyyy-MM-dd.');</script>");
                    return;
                }

                //// Check if customer already exists
                //if (CustomerExists(custID, contactNo))
                //{
                //    ClearTextBoxes();
                //    Response.Write("<script>alert('Customer with the same ID, Email, or Contact Number already exists in the database.');</script>");
                //    Response.Redirect("../Products.aspx");
                //    return;
                //}

                // Insert new customer\
                //SqlDSCustomer.InsertParameters["CustEmailAddress"].DefaultValue = HttpContext.Current.User.Identity.Name;
                SqlDSCustomer.Insert();

                Response.Write("<script>alert('Added to Customer Database');</script>");
                Response.Redirect("../Products.aspx");
                ClearTextBoxes();
            }
            //catch (Exception ex)
            //{
            //    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            //}
            catch (SqlException sqlEx)
            {
                Response.Write("<script>alert('Database error: " + sqlEx.Message + "');</script>");
                System.Diagnostics.Debug.WriteLine(sqlEx.ToString());
                MessageError.Text = "Please ensure you ID is no more than 13 digits or your phone number is no more than 10 digits";
                MessageError.CssClass = "text-danger";
                MessageError.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                MessageError.Text = ex.ToString();
                MessageError.CssClass = "text-danger";
                MessageError.Visible = true;
            }
        }

        //private bool CustomerExists(string custID, string contactNo)
        //{
        //    bool exists = false;
        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        conn.Open();
        //        string query = "SELECT COUNT(*) FROM Customer WHERE CustID = @CustID OR ContactNo = @ContactNo";
        //        using (SqlCommand cmd = new SqlCommand(query, conn))
        //        {
        //            cmd.Parameters.AddWithValue("@CustID", custID);
        //            //cmd.Parameters.AddWithValue("@CustEmailAddress", email);
        //            cmd.Parameters.AddWithValue("@ContactNo", contactNo);

        //            int count = (int)cmd.ExecuteScalar();
        //            exists = count > 0;
        //        }
        //    }
        //    return exists;
        //}

        private void ClearTextBoxes()
        {
            // Clear all textboxes after successful insertion
            TextBox1CustID.Text = string.Empty;
            TextBox2CustFN.Text = string.Empty;
            TextBox3CustLN.Text = string.Empty;
            TextBox4DOB.Text = string.Empty;
            TextBoxCustNumber.Text = string.Empty;
            TextBoxAdress.Text = string.Empty;
            TextBox5CustEmailAdd.Text = string.Empty;
            CheckBox1.Checked = false;
            TextBox6MedicalAN.Text = string.Empty;
            TextBox7MMNumber.Text = string.Empty;
            TextBox8PolicyNO.Text = string.Empty;
            TextBox9PlanType.Text = string.Empty;
            MessageError.Visible = false;
        }

    }
}
