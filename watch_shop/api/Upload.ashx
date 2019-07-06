<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;

public class Upload : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json;charset=UTF-8";
        try {
            var file =context.Request.Files[0];
            string filename = file.FileName;
            string serverpath = context.Server.MapPath("~/images/") + filename;
            file.SaveAs(serverpath);
            context.Response.Write("{\"msg\":\""+filename+"\"}");
        }catch(Exception e)
        {
               
                context.Response.Write("{\"msg\":\"error\"}");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}