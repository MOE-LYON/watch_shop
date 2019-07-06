using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_member_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int page;
        if (!int.TryParse(Request["page"],out page))
        {
            page = 1;
        }
        int total;
        user_list.DataSource = CustomerServ.GetCustomersByPage(out total, page);
        user_list.DataBind();
    }
}