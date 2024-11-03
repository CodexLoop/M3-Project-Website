using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Townbush_Pharmacy_Website.Account
{
    public partial class Stock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchButton1_Click(object sender, EventArgs e)
        {
            string SourceName = SqlDSSearch.ID;
            GridView1.DataSourceID = SourceName;
            GridView1.DataBind();
        }

        protected void ClearSearchButton1_Click(object sender, EventArgs e)
        {
            SearchTextBox1.Text = string.Empty;
            GridView1.DataSourceID = SqlDataSource1.ID;
            GridView1.DataBind();
        }
    }
}