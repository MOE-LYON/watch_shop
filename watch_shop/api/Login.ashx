<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.Web;
using System.Web.SessionState;
public class Login : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string user = context.Request["User"];
        string passwd = context.Request["Password"];

        Customer customer;
        if (CustomerServ.CheckCustomerPwd(user,passwd,out customer))
        {
            context.Session["user"] = customer;
            context.Response.Write("success");
        }
        else
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