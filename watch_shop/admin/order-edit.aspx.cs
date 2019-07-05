using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_order_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id;
        int.TryParse(Request["id"],out id);
        if (id == 0) return;

        Orders orders = DBHelper.GetOrderById(id);
        date.Value = orders.date.ToLongDateString();
        username.Value = orders.Customers_id.ToString();
        price.Value = orders.Totalprice.ToString();
    }
}