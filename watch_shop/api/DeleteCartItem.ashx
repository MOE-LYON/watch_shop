<%@ WebHandler Language="C#" Class="DeleteCartItem" %>

using System;
using System.Web;
using System.Web.SessionState;
public class DeleteCartItem : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        string id = context.Request["Id"];
        ShoppingCart cart = context.Session["ShoppingCart"] as ShoppingCart;
        try
        {
            if (cart.DeleteItem(int.Parse(id)))
            {
                context.Response.Write("success");
            }
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