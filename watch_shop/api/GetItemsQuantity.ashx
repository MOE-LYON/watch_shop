<%@ WebHandler Language="C#" Class="GetItemsQuantity" %>

using System;
using System.Web;
using System.Web.SessionState;
public class GetItemsQuantity : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        ShoppingCart cart = context.Session["ShoppingCart"] as ShoppingCart;
        if (cart != null)
        {
            context.Response.Write(cart.GetAllQuantity().ToString());
        }
        else
        {
            context.Response.Write("0");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}