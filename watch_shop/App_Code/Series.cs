using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Series
/// </summary>
public class Series
{
    public Series()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Id { get; set; }
    public string Name { get; set; }
    public static List<Series> series;
    static Series()
    {
        series = DBHelper.GetSeries();
    }
    public static string GetName(int id)
    {
        return series.Find(r => r.Id == id).Name;
    }

}