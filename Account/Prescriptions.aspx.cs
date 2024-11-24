using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class Prescriptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadBtn_Click(object sender, EventArgs e)
        {
            if (PrescriptionUpload.HasFile)
            {
                // Ensure the uploaded file is a PDF
                if (Path.GetExtension(PrescriptionUpload.FileName).Equals(".pdf", StringComparison.OrdinalIgnoreCase))
                {
                    try
                    {
                        // Get logged-in user's details (replace with actual user retrieval logic)
                        string userName = HttpContext.Current.User.Identity.Name; // Example: "JohnDoe"
                        string[] nameParts = userName.Split(' '); // Split to get FirstName and LastName (if stored as such)
                        string firstName = nameParts.Length > 0 ? nameParts[0] : "FirstName";

                        // Generate the file name using user's name and current date
                        string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
                        string newFileName = $"{firstName}_{currentDate}.pdf";

                        // Define the folder to save the file
                        string prescriptionsFolder = Server.MapPath("~/Prescriptions");

                        // Ensure the folder exists
                        if (!Directory.Exists(prescriptionsFolder))
                        {
                            Directory.CreateDirectory(prescriptionsFolder);
                        }

                        // Combine folder path and new file name
                        string filePath = Path.Combine(prescriptionsFolder, newFileName);

                        // Save the file
                        PrescriptionUpload.SaveAs(filePath);

                        // Display success message
                        SuccessMessage.Text = "Your Prescription has been received. One of our pharmacists will be in contact with you to discuss the next steps.";
                        SuccessMessage.Visible = true;

                        // Optionally hide the upload panel after success
                        UploadPanel.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        // Handle errors
                        SuccessMessage.Text = "An error occurred while uploading your prescription. Please try again.";
                        SuccessMessage.CssClass = "text-danger";
                        SuccessMessage.Visible = true;
                    }
                }
                else
                {
                    // File is not a PDF
                    SuccessMessage.Text = "Only PDF files are allowed. Please upload a valid prescription.";
                    SuccessMessage.CssClass = "text-danger";
                    SuccessMessage.Visible = true;
                }
            }
            else
            {
                // No file was selected
                SuccessMessage.Text = "Please select a file to upload.";
                SuccessMessage.CssClass = "text-danger";
                SuccessMessage.Visible = true;
            }
        }
    }
}