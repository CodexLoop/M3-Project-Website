using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class Orders_Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton1_Click(object sender, EventArgs e)
        {
            //string SourceName = DropDownList1.ID;
            //GridView1.DataSourceID = SourceName;
            //GridView1.DataBind();

            // Get the selected OrderID from the DropDownList
            string selectedOrderID = DropDownList1.SelectedValue;

            // Modify the SqlDataSource's SelectCommand to filter by the selected OrderID
            SqlDSOrders.SelectCommand = $"SELECT * FROM [Orders] WHERE OrderID = '{selectedOrderID}'";

            // Rebind the GridView to reflect the updated data
            GridView1.DataBind();
        }

        protected void ClearSearchButton1_Click(object sender, EventArgs e)
        {
            //SearchTextBox1.Text = string.Empty;
            //DropDownList1.ClearSelection();
            //GridView1.DataSourceID = SqlDSOrders.ID;
            //GridView1.DataBind();
            // Clear the DropDownList selection
            DropDownList1.ClearSelection();

            // Reset the SqlDataSource's SelectCommand to show all orders
            SqlDSOrders.SelectCommand = "SELECT * FROM [Orders]";

            // Rebind the GridView to reflect all data
            GridView1.DataBind();
        }
    }
}