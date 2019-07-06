using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer customer = Session["user"] as Customer;
        if (customer == null)
        {
            Response.Redirect("/login.aspx");
        }
        string selectCmd = "SELECT * FROM [orders] ";
        selectCmd += "where Customers_id = "+ customer.Id;
        SqlDataSource1.SelectCommand = selectCmd;
        ViewState["selectCmd"] = selectCmd;
    }
    protected void Button_Pay(object sender, CommandEventArgs e)
    {
        string orderid = e.CommandArgument.ToString();//要付款的订单号        
                                                      //付款操作的代码写在这里，
                                                      //在此以下代码仅是进行测试
        Customer customer = Session["user"] as Customer;
        if (Payment(orderid))//付款成功
        {
            Page.RegisterStartupScript("kk", "<script>alert('ok');</script>");
        }
        else
        {
            Page.RegisterStartupScript("kk", "<script>alert('not ok');</script>");
        }
        ListView1.DataBind();//重新绑定listview1
    }
    //模拟付款的函数,参数为：会员名，订单号
    //在此假设直接付款成功，修改订单状态为“已付款”
    private bool Payment(string orderid)
    {
        bool successflag = false;
        /***********************/
        /*  付款的代码写在此   */
        /**********************/
        //付款成功后修改订单状态
        successflag = updateOrderState(orderid, "已付款");
        return successflag;
    }
    //修改订单状态的函数,参数为：订单号，订单状态
    //订单状态有：未付款、已付款、待收货、待评价、交易完成 五种状态
    string cnnstr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
    private bool updateOrderState(string orderid, string orderstate)
    {
        //创建连接对象
        bool successflag = false;
        SqlConnection connection = new SqlConnection(cnnstr);
        string cmdstr = "update orders set status=@status where orderid=@orderid";
        SqlCommand sqlcmd = new SqlCommand(cmdstr, connection);
        sqlcmd.Parameters.AddWithValue("@orderid", orderid);
        sqlcmd.Parameters.AddWithValue("@status", orderstate);
        try
        {
            connection.Open();
            sqlcmd.ExecuteNonQuery();
            successflag = true;
        }
        catch (Exception ex)//出错时
        {
            successflag = false;
            //Response.Write(ex.Message);
        }
        finally
        {   //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            { connection.Close(); }
        }
        return successflag;
    }
    //确认收货按钮
    protected void Button_Receive(object sender, CommandEventArgs e)
    {
        string orderid = e.CommandArgument.ToString();//订单号
        //string uname = Session["uname"].ToString();//用户名
        //付款操作的代码写在这里，
        //在此以下代码仅是进行测试
        if (updateOrderState(orderid, "待评价"))//修改订单状态为 待评价
        {
            Page.RegisterStartupScript("kk", "<script>alert('收货ok');</script>");
        }
        else
        {
            Page.RegisterStartupScript("kk", "<script>alert('收货 not ok');</script>");
        }
        ListView1.DataBind();//重新绑定listview1
    }
    //评价按钮
    protected void Button_Comment(object sender, CommandEventArgs e)
    {
        string orderid = e.CommandArgument.ToString();//订单号
        //string uname = Session["uname"].ToString();//用户名
        //一般要转向另一页面进行评价，在此仅模拟评价完成后修改订单状态的过程，
        //在此以下代码仅是进行测试
        if (updateOrderState(orderid, "交易完成"))//修改订单状态为 交易完成
        {
            Page.RegisterStartupScript("kk", "<script>alert('交易完成ok');</script>");
        }
        else
        {
            Page.RegisterStartupScript("kk", "<script>alert('交易完成 not ok');</script>");
        }
        ListView1.DataBind();//重新绑定listview1
    }

}