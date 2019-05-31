using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Address
/// </summary>
public class Address
{
    public Address()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Id { get; set; }
    public int CustomerId { get; set; }
    public string Name { get; set; }
    public string Phone { get; set; }
    public string Addr { get; set; }
    public bool IsDefault { get; set; }
}