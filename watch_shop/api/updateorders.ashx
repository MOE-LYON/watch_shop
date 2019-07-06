<%@ WebHandler Language="C#" Class="updateorders" %>

using System;
using System.Web;
using System.Data.SqlClient;
public class updateorders : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string id = context.Request["id"];
        string price = context.Request["price"];
        string status = context.Request["status"];
        int iResult = 0;
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection connection = new SqlConnection(constr);
        string insertcmd = "update orders set status=@status,totalprice=@totalprice where orderid = @orderid";

        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        try
        {
            mycmd.Parameters.AddWithValue("@status", status.Trim());
            mycmd.Parameters.AddWithValue("@totalprice", price.Trim());
            mycmd.Parameters.AddWithValue("@orderid", id.Trim());
            mycmd.Connection.Open();
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
                context.Response.Write(e.Message);
                return;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult == 1)
        {
            context.Response.Write("success");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}