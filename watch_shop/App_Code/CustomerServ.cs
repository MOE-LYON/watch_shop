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
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
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
            Customer.Role = int.Parse(row["Role"].ToString());
            Customeres.Add(Customer);
        }
        return Customeres;
    }

    public static bool AddCustomers(Customer customer)
    {
        try
        {
            string constr = System.Configuration.ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            SqlConnection connection = new SqlConnection(constr);
            String insertcmd = "insert into Customers(UserId,Name,UserPwd,Balance) values(@userid,@Name,@UserPwd,@Balance)";
            SqlCommand mycmd = new SqlCommand(insertcmd, connection);

            mycmd.Parameters.AddWithValue("@userid", customer.UserId.Trim());
            mycmd.Parameters.AddWithValue("@Name", customer.Name.Trim());
            mycmd.Parameters.AddWithValue("@UserPwd", customer.UserPwd.Trim());
            mycmd.Parameters.AddWithValue("@Balance", 0);

            mycmd.Connection.Open();
            int iResult = 0;
            try
            {
                iResult = mycmd.ExecuteNonQuery();
            }
            catch (Exception ee)
            {

                return false;
            }
            finally
            {
                mycmd.Connection.Close();
            }
            if (iResult == 1)
            {
                return true;
            }
            else
            {
                return true;
            }
            
        }
        catch (Exception) { return false; }
        
           

    }
    public static List<Customer> GetCustomersByPage(out int total ,int page=1,int num = 8)
    {
        List<Customer> all = GetALLCustomeres();
        total = (int)(Math.Ceiling(1.0 * all.Count / num));
        List<Customer> res = new List<Customer>();
        for (int i = (page-1)*num; i < all.Count &&i< page*num ; i++)
        {
            res.Add(all[i]);
        }
        return res;
        
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
        address.Name = "王凌涛";
        address.CustomerId = 1;
        address.Phone = "188989798787";
        address.Addr = "浙江省绍兴市环城西路508号理工楼304";
        address.IsDefault = true;
        addressList.Add(address);

        address = new Address();
        address.Id = 2;
        address.Name = "王凌涛";
        address.CustomerId = 1;
        address.Phone = "188989798787";
        address.Addr = "浙江省绍兴市环城西路508号理工楼101";
        address.IsDefault = false;
        addressList.Add(address);

        address = new Address();
        address.Id = 3;
        address.CustomerId = 1;
        address.Name = "王凌涛";
        address.Phone = "1889979456787";
        address.Addr = "浙江省绍兴市环城西路508号理工楼201";
        address.IsDefault = false;
        addressList.Add(address);
        return addressList;
    }
    public static Customer GetCustomersByUId(string UserId)
    {
        Customer customer = null ;
        List<Customer> Customeres = GetALLCustomeres();
        foreach (Customer c in Customeres)
        {
            if (c.UserId.Equals(UserId))
            {
                customer = c;
                break;
            }
        }
        return customer;
    }

}