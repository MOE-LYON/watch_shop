using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Base : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShoppingCart cart = Session["ShoppingCart"] as ShoppingCart;
        if (cart != null)
        {
            cartnum.InnerText = cart.GetAllQuantity().ToString();
        }
        else
        {
            cartnum.InnerText = "0";
        }
        
    }
}
