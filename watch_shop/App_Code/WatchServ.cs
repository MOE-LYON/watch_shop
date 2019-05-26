using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for WatchServ
/// </summary>
public static class WatchServ
{
    static WatchServ()
    {
        //
        // TODO: Add constructor logic here
        //
        
    }
    private static DataSet ConnetSQL()
    {
        SqlConnection sqlConnection1 = new SqlConnection(constr);
        SqlDataAdapter sqlDataAdapter1 = new SqlDataAdapter("select * from watches", sqlConnection1);
        DataSet dataSet = new DataSet();
        sqlDataAdapter1.Fill(dataSet, "watches");
        sqlConnection1.Close();
        return dataSet;
    }

    public static List<Watch> GetWatchByCId(int cid)
    {
        List<Watch> allwatches = GetALLWatches();
        List<Watch> watches = new List<Watch>();
        int len = allwatches.Count;
        try
        {
           foreach(var watch in allwatches)
            {
                if(watch.SeriesId== cid)
                {
                    watches.Add(watch);
                }
            }
        }
        catch (Exception) { }
        return watches;
    }

    public static List<Watch> GetALLWatches()
    {
        List<Watch> watches = new List<Watch>();
        DataTable table = ConnetSQL().Tables["watches"];
        foreach (DataRow row in table.Rows)
        {
            Watch watch = new Watch();
            watch.Id = int.Parse(row["Id"].ToString());
            watch.Name = row["Name"].ToString();
            watch.Brand = row["Brand"].ToString();
            watch.Photo = row["Photo"].ToString();
            watch.SeriesId = int.Parse(row["SeriesId"].ToString());
            watch.Price = decimal.Parse(row["Price"].ToString());
            watch.Waterproof = int.Parse(row["Waterproof"].ToString());
            watch.Description = row["Description"].ToString();
            watch.Tags = row["Tags"].ToString();
            watch.Sex = row["Sex"].ToString();
            watch.Movement_model = row["Movement_model"].ToString();
            watch.Movement_Type = row["Movement_type"].ToString();
            watches.Add(watch);
        }
        return watches;
    }
    public static List<Watch> GetWatchByPageNum(int page=1,int pagenum=8)
    {
        List<Watch> allwatches = GetALLWatches();
        List<Watch> watches = new List<Watch>();
        int len = allwatches.Count;
        try
        {
            for (int i = (page - 1) * pagenum; i < page * pagenum && i < len; ++i)
            {
                watches.Add(allwatches[i]);
            }
        }
        catch (Exception) { }
        return watches;
        
    }
    public static Watch GetWatchById(int id)
    {
        return GetALLWatches().FirstOrDefault(p => p.Id==id);
    }
    //  没有 ORM 就得自己写 有点难受 
    public static bool AddWatch(Watch watch)
    {
        return false;
    }

    public static bool RemoveWatch(int id)
    {
        return false;
    }

    public static bool UpdateWatch(Watch watch)
    {
        return false;
    }

























    // 出于安全 放最后
    private static string constr = "server=52.229.169.153,2333;database=watch_shop;uid=sa;pwd=Qq1621705106";

}
