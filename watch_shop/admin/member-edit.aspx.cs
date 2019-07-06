using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_member_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uid = Request["UserId"];

        Customer customer = CustomerServ.GetCustomersByUId(uid);
        if (customer == null) return;
        L_email.Value = customer.UserId;
        L_username.Value = customer.Name;
    }
}