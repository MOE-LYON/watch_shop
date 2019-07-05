<%@ WebHandler Language="C#" Class="BalanceChange" %>

using System;
using System.Web;
using System.Web.SessionState;
public class BalanceChange : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        try
        {
            decimal recharge = Convert.ToDecimal(context.Request.Form["recharge"]);
            decimal totalPrice = Convert.ToDecimal(context.Request.Form["totalPrice"]);
            string type = context.Request.Form["type"];

            Customer customer = context.Session["user"] as Customer;

            switch (type)
            {
                case "recharge":
                    if (customer != null)
                    {
                        customer.Balance += recharge;
                        context.Response.Write(customer.Balance);
                        context.Response.Write("success");
                    }
                    else
                        context.Response.Redirect("/LogIn.aspx");
                    break;
                case "placeAnOrder":
                    if (customer != null)
                    {
                        ShoppingCart cart = context.Session["ShoppingCart"] as ShoppingCart;
                        if (DBHelper.createOrder(customer.Id, cart) == 0)
                        {
                            context.Session["ShoppingCart"] = null;
                            context.Response.Write("success");
                        }
                        //if (customer.Balance >= totalPrice)
                        //{
                        //    customer.Balance -= totalPrice;
                        //    ShoppingCart cart = (ShoppingCart)context.Session["ShoppingCart"];
                        //    cart.EmptyItem();  //清空购物车
                        //    context.Response.Write(customer.Balance);
                        //}
                        //else
                        //    context.Response.Write("PlaceAnOrderError");
                        
                    }
                    else
                        context.Response.Redirect("/LogIn.aspx");
                    break;
                default:
                    context.Response.Write("SwitchError");
                    break;
            }

        }
        catch (Exception ee)
        {
            context.Response.Write("Error");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}