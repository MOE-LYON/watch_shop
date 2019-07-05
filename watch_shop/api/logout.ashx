<%@ WebHandler Language="C#" Class="logout" %>

using System;
using System.Web;
using System.Web.SessionState;
public class logout : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Session.Remove("user");
        context.Response.Write("登出成功");
        context.Response.Redirect("/index.aspx");

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}