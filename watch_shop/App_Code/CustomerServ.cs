using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for CustomerServ
/// </summary>
public static class CustomerServ
{
    static CustomerServ()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private static DataSet ConnetSQL()
    {
        SqlConnection sqlConnection1 = new SqlConnection(constr);
        SqlDataAdapter sqlDataAdapter1 = new SqlDataAdapter("select * from Customers", sqlConnection1);
        DataSet dataSet = new DataSet();
        sqlDataAdapter1.Fill(dataSet, "Customers");
        sqlConnection1.Close();
        return dataSet;
    }
    public static List<Customer> GetALLCustomeres()
    {
        List<Customer> Customeres = new List<Customer>();
        DataTable table = ConnetSQL().Tables["Customers"];
        foreach (DataRow row in table.Rows)
        {
            Customer Customer = new Customer();
            Customer.Id = int.Parse(row["Id"].ToString());
            Customer.Name = row["Name"].ToString();
            Customer.UserId = row["UserId"].ToString();
            Customer.UserPwd = row["UserPwd"].ToString();
            Customer.Balance = decimal.Parse(row["Balance"].ToString());
            Customeres.Add(Customer);
        }
        return Customeres;
    }

    public static bool CheckCustomerPwd(string UserId,string pwd, out Customer customer)
    {
        List<Customer> Customeres = GetALLCustomeres();
        customer = null;
        foreach (Customer c in Customeres)
        {
            if (c.UserId.Equals(UserId) && c.UserPwd.Equals(pwd))
            {
                customer = c;
                return true;
            }
        }
        return false;
    }
    public static List<Address> GetAddressListByCustomerId(int id)
    {
        List<Address> result = new List<Address>();
        List<Address> addressList = GetAllAddress();
        foreach (var addr in addressList)
        {
            if (addr.CustomerId == id)
            {
                result.Add(addr);
            }
        }

        return result;
    }
    public static  List<Address> GetAllAddress()
    {
        Address address;
        List<Address> addressList = new List<Address>();

        address = new Address();
        address.Id = 1;
        address.Name = "张三丰";
        address.CustomerId = 2;
        address.Phone = "188989798787";
        address.Addr = "浙江省绍兴市环城西路508号理工楼304";
        address.IsDefault = true;
        addressList.Add(address);

        address = new Address();
        address.Id = 2;
        address.Name = "管理员";
        address.CustomerId = 2;
        address.Phone = "188989798787";
        address.Addr = "浙江省绍兴市环城西路508号理工楼101";
        address.IsDefault = false;
        addressList.Add(address);

        address = new Address();
        address.Id = 3;
        address.CustomerId = 2;
        address.Name = "猴孩子";
        address.Phone = "1889979456787";
        address.Addr = "浙江省绍兴市环城西路508号理工楼201";
        address.IsDefault = false;
        addressList.Add(address);
        return addressList;
    }







    private static string constr = "server=52.229.169.153,2333;database=watch_shop;uid=sa;pwd=Qq1621705106";

}