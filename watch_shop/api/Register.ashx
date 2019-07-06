<%@ WebHandler Language="C#" Class="Register" %>

using System;
using System.Web;

public class Register : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string username = context.Request["UserName"];
        string userid = context.Request["UserId"];
        string pwd = context.Request["Password"];
        string pwd2 = context.Request["Password2"];
        if (pwd != pwd2)
        {
            context.Response.Write("两次密码不相等");
                return;
        }
        Customer customer = new Customer();
        customer.UserPwd = pwd;
        customer.UserId = userid;
        customer.Name = username;

        if (CustomerServ.AddCustomers(customer))
        {
            context.Response.Write("success");
        }
        else
        {
            context.Response.Write("error");
        }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}