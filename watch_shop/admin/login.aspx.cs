using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer customer = Session["user"] as Customer;
        if (customer == null) return;
        if (customer.Role >= 2)
        {
            Response.Redirect("/admin/index.aspx");
        }
    }
}