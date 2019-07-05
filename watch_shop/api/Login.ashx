<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.Web;
using System.Web.SessionState;
public class Login : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string user = context.Request["User"];
        string passwd = context.Request["Password"];
        string checkcode = context.Request["checkcode"];
        if (context.Session["checkcode"].ToString().ToLower() != checkcode.ToLower())
        {
                context.Response.Write("验证码错误");
                return;
        }
        Customer customer;
        if (CustomerServ.CheckCustomerPwd(user,passwd,out customer))
        {
            context.Session["user"] = customer;
            context.Response.Write("success");
        }
        else
        {
            context.Response.Write("登入失败");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}