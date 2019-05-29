<%@ WebHandler Language="C#" Class="ChangeItemQuantity" %>

using System;
using System.Web;
using System.Web.SessionState;
public class ChangeItemQuantity : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        ShoppingCart cart = context.Session["ShoppingCart"] as ShoppingCart;
        string id = context.Request["Id"];
        string quantity = context.Request["Quantity"];
        try
        {
            cart.ChangeItemQuantity(int.Parse(id), int.Parse(quantity));
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