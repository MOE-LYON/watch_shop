using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlaceOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer customer = Session["user"] as Customer;
        if (customer == null)
        {
            Response.Redirect("/Login.aspx");
            return;
        }
        List<Address> addrs = CustomerServ.GetAddressListByCustomerId(customer.Id);
        address_list.DataSource = addrs;
        address_list.DataBind();
        customer_balance.Text = customer.Balance.ToString();
        ShoppingCart cart = Session["ShoppingCart"] as ShoppingCart;
        if (cart == null)
        {
            return;
        }
        item_list.DataSource = cart.Items;
        item_list.DataBind();
        decimal sum = 0;
        foreach (var item in cart.Items)
        {
            sum += item.Total;
        }
        subtal.Text = sum.ToString();
        total1.Text = total2.Text = (sum + 10).ToString();

    }
}