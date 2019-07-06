<%@ WebHandler Language="C#" Class="AddToCart" %>

using System;
using System.Web;
using System.Web.SessionState;
public class AddToCart : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        string id = context.Request["Id"];
        string quantity = context.Request["Quantity"];
        ShoppingCart cart = context.Session["ShoppingCart"] as ShoppingCart;
        if (cart == null)
        {
            cart = new ShoppingCart();
            context.Session["ShoppingCart"] = cart;
        }
        try
        {
            CartItem item = new CartItem();
            var Id = int.Parse(id);
            Watch watch = WatchServ.GetWatchById(Id);
            item.Id = watch.Id;
            item.Name = watch.Name;
            item.Photo = watch.Photo;
            item.Price = watch.Price;
            item.Quantity = int.Parse(quantity);
            cart.AddItem(item);
            context.Response.Write("success");
        }
        catch (Exception)
        {
                context.Response.Write("fail");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}