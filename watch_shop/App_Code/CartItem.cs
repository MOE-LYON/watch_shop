using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
    public CartItem()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Id { get; set; }
    public string Name { get; set; }
    public int Quantity { get; set; }
    public string Photo { get; set; }
    public decimal Price { get; set; }
    public decimal Total { get { return this.Price * this.Quantity; } }
}