<%@ WebHandler Language="C#" Class="updatewatch" %>

using System;
using System.Web;
using System.Data.SqlClient;
public class updatewatch : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        int id;
        int.TryParse(context.Request["id"], out id);
        string name = context.Request["name"];
        string brand = context.Request["brand"];
        string price = context.Request["price"];
        string series_id = context.Request["series_id"];
        string tags = context.Request["tags"];
        string descr = context.Request["descr"];
        string photo = context.Request["photo"];

        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
        SqlConnection connection = new SqlConnection(constr);
        if (id == 0)
        {
            string insertcmd = "insert into Watches(Name,Brand,SeriesId,Photo,Price,Description,Tags) values(@name,@brand,@series_id,@photo,@price,@descr,@tags)";

            SqlCommand mycmd = new SqlCommand(insertcmd, connection);
            //可在此判断参数是否正确，密码是否相同
            mycmd.Parameters.AddWithValue("@name", name.Trim());
            mycmd.Parameters.AddWithValue("@brand", brand.Trim());
            mycmd.Parameters.AddWithValue("@series_id", series_id.Trim());
            mycmd.Parameters.AddWithValue("@photo",photo.Trim() );
            
            mycmd.Parameters.AddWithValue("@price", price.Trim());
            mycmd.Parameters.AddWithValue("@descr", descr.Trim());
            mycmd.Parameters.AddWithValue("@tags", tags.Trim());

            mycmd.Connection.Open();
            int iResult = 0;
            try
            {
                iResult = mycmd.ExecuteNonQuery();
            }
            catch (Exception ee)
            {
                context.Response.Write("error");
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
            else
            {

            }

        }
        else
        {
            string updatecmd = "update Watches set Name=@name,Brand=@brand,Photo=@photo,SeriesId=@series_id,Price=@price,Description=@descr,Tags=@tags where id=@id";

            SqlCommand mycmd = new SqlCommand(updatecmd, connection);
            mycmd.Parameters.AddWithValue("@id", id);
            mycmd.Parameters.AddWithValue("@name", name.Trim());
            mycmd.Parameters.AddWithValue("@brand", brand.Trim());
            mycmd.Parameters.AddWithValue("@series_id", series_id.Trim());
            
            mycmd.Parameters.AddWithValue("@price", price.Trim());
            mycmd.Parameters.AddWithValue("@photo",photo.Trim() );
            mycmd.Parameters.AddWithValue("@descr", descr.Trim());
            mycmd.Parameters.AddWithValue("@tags", tags.Trim());

            mycmd.Connection.Open();
            int iResult = 0;
            try
            {
                iResult = mycmd.ExecuteNonQuery();
            }
            catch (Exception ee)
            {
                context.Response.Write("error");
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
            else
            {

            }
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