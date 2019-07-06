<%@ WebHandler Language="C#" Class="DeleteWatch" %>

using System;
using System.Web;
using System.Data.SqlClient;
public class DeleteWatch : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        int id;
        int.TryParse(context.Request["id"], out id);
        if (id != 0)
        {

            try
            {
                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
                SqlConnection connection = new SqlConnection(constr);
                string cmd = "delete from Watches where id=@id";
                SqlCommand mycmd = new SqlCommand(cmd, connection);
                mycmd.Parameters.AddWithValue("@id", id);
                mycmd.Connection.Open();
                int iResult = 0;
                iResult = mycmd.ExecuteNonQuery();
                if (iResult == 1)
                {
                    context.Response.Write("success");
                    return;
                }
            }
            catch (Exception e)
            {

            }
        }
        context.Response.Write("error");
        return;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}