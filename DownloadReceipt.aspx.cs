using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Townbush_Pharmacy_Website
{
    public partial class DownloadReceipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = (string)Session["ReceiptFileName"];
            if (!string.IsNullOrEmpty(fileName))
            {
                string receiptPath = Server.MapPath("~/Receipts/" + fileName);
                Response.ContentType = "text/plain"; // Set the appropriate content type
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.WriteFile(receiptPath);
                Response.End();

                Session["buyItems"] = null;
                Response.Redirect("Default.aspx");
            }
        }
    }
}