using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class EmployeesViewSale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton1_Click(object sender, EventArgs e)
        {
            // Get the selected OrderID from the DropDownList
            string selectedOrderID = DropDownList1.SelectedValue;

            // Modify the SqlDataSource's SelectCommand to filter by the selected OrderID
            SqlDSSales.SelectCommand = $"SELECT * FROM [OnlineSales] WHERE OrderID = '{selectedOrderID}'";

            // Rebind the GridView to reflect the updated data
            GVSales.DataBind();
        }

        protected void ClearSearchButton1_Click(object sender, EventArgs e)
        {
            // Clear the DropDownList selection
            DropDownList1.ClearSelection();

            // Reset the SqlDataSource's SelectCommand to show all orders
            SqlDSSales.SelectCommand = "SELECT * FROM [OnlineSales]";

            // Rebind the GridView to reflect all data
            GVSales.DataBind();
        }
    }
}