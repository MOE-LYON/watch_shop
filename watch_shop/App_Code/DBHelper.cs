using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBHelper
/// </summary>
public class DBHelper
{
    static string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
    public DBHelper()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static List<Roles> GetRoles()
    {
        List<Roles> roles = new List<Roles>();
        
        SqlConnection connection = new SqlConnection(constr);

        string queryString = "SELECT * FROM Role";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Roles role = new Roles();
            role.Descr = reader["level"].ToString();
            role.Id = int.Parse(reader["id"].ToString());
            role.Descr = reader["descr"].ToString();
            roles.Add(role);
        }
        connection.Close();


        return roles;
    }
    public static List<Series> GetSeries()
    {
        List<Series> series = new List<Series>();
        SqlConnection connection = new SqlConnection(constr);

        string queryString = "SELECT * FROM Series";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        
        while (reader.Read())
        {
            Series serie = new Series();
            serie.Id = int.Parse(reader["id"].ToString());
            serie.Name = reader["name"].ToString();
            series.Add(serie);
        }
        connection.Close();


        return series;
    }

    public static List<Watch> GetWatches(string keyword,int page, out int totalpage, int pagenum = 8)
    {
        totalpage = 0;
        List<Watch> watches = new List<Watch>();
        SqlConnection connection = new SqlConnection(constr);
        string selectCmd = "select * from Watches";
        selectCmd += " where Name like '%" + keyword.Trim() + "%' or Description like '%" + keyword.Trim() + "%'";  
        SqlCommand command = new SqlCommand(selectCmd, connection);
        
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Watch watch = new Watch();
           
            watch.Id = int.Parse(reader["Id"].ToString());
            watch.Name = reader["Name"].ToString();
            watch.Brand = reader["Brand"].ToString();
            watch.Photo = reader["Photo"].ToString();
            watch.SeriesId = int.Parse(reader["SeriesId"].ToString());
            watch.Price = decimal.Parse(reader["Price"].ToString());
            
            watch.Description = reader["Description"].ToString();
            watch.Tags = reader["Tags"].ToString();
            watch.Sex = reader["Sex"].ToString();
            watches.Add(watch);
        }
        connection.Close();

        List<Watch> res = new List<Watch>();
        for(int i=(page-1)*pagenum; i < watches.Count && i < page * pagenum; ++i)
        {
            res.Add(watches[i]);
        }
        totalpage = (int)Math.Ceiling(watches.Count * 1.0 / pagenum);
        return res;
    }
    public static int createOrder(int userid, ShoppingCart cart)
    {
        //创建连接对象
        decimal total = 0;
        foreach (var item in cart.Items)
        {
            total += item.Total;
        }
        SqlConnection connection = new SqlConnection(constr);
        string cmdstr = "insert into orders(Customers_id,date,totalprice, status) values(@userid,@date,@totalprice,@status)";
        SqlCommand sqlcmd = new SqlCommand(cmdstr, connection);
        sqlcmd.Parameters.AddWithValue("@userid", userid);
        sqlcmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());
        sqlcmd.Parameters.AddWithValue("@totalprice", total);
        sqlcmd.Parameters.AddWithValue("@status", "未付款");
        SqlTransaction tran = null;
        string orderid = "";
        try
        {
            connection.Open();
            //开启一个事务，并返回给tran
            tran = connection.BeginTransaction();
            sqlcmd.Transaction = tran;//指定sqlcmd对象属于tran事务
            sqlcmd.ExecuteNonQuery();//插入记录（生成订单）

            //向订单明细表中插入记录
            cmdstr = "select top 1 orderid from orders where Customers_id=@userid order by orderid desc"; //降序排序后输出第一个orderid，即最新的。
            sqlcmd.CommandText = cmdstr;
            sqlcmd.Parameters.Clear();//清空原来的sql参数，以便重新加入
            sqlcmd.Parameters.AddWithValue("@userid", userid);
            orderid = sqlcmd.ExecuteScalar().ToString();//查自动生成的订单id值。因只查一个值，所以使用了标量查询。

            //向订单明细表中插入记录
            cmdstr = "insert into orderDetails(orderid,watch_id,num,price) values(@orderid,@watch_id,@number,@totalprice)";
            sqlcmd.CommandText = cmdstr;

            //将购买的商品的信息一一添加到订单明细表中
            foreach (CartItem item in cart.Items)
            //for (int i = 0; i < cart.CartItems.Count; i++)
            {
                sqlcmd.Parameters.Clear();//清空原来的sql参数，以便重新加入
                sqlcmd.Parameters.AddWithValue("@watch_id", item.Id);
                sqlcmd.Parameters.AddWithValue("@orderid", orderid);
                sqlcmd.Parameters.AddWithValue("@number", item.Quantity);
                sqlcmd.Parameters.AddWithValue("@totalprice", item.Total);
                sqlcmd.ExecuteNonQuery();//插入记录（生成订单详细）
            }

            tran.Commit();//提交事务
            return 0;
        }
        catch (Exception ex)//出错时
        {
            //回滚事务，数据库不作任务修改
            tran.Rollback();
            //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
            return -1;
        }
        finally
        {   //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
        }
    }

    public static Orders GetOrderById(int id)
    {
        
        SqlConnection connection = new SqlConnection(constr);

        string queryString = "SELECT * FROM orders where orderid = @id";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@id", id);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        reader.Read();
        Orders orders = new Orders();
        orders.Customers_id = int.Parse(reader["Customers_id"].ToString());
        orders.Status = reader["status"].ToString();
        orders.orderid = reader["orderid"].ToString();
        orders.date = DateTime.Parse(reader["date"].ToString());
        orders.Totalprice = decimal.Parse(reader["totalprice"].ToString());
        connection.Close();

        return orders;
    }
    
}