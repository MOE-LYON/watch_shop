using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShoppingCart cart = Session["ShoppingCart"] as ShoppingCart;
        if (cart != null)
        {
            Cart_Item.DataSource = cart.Items;
            Cart_Item.DataBind();
        }
    }
}