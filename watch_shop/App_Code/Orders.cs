using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Orders
/// </summary>
public class Orders
{
    public Orders()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string orderid { get; set; }
    public int Customers_id { get; set; }
    public DateTime date { get; set; }
    public string Status { get; set; }
    public int Addr_id { get; set; }
    public decimal Totalprice { get; set; }
}