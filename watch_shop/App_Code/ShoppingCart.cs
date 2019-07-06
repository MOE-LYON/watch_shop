using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart
{
    public ShoppingCart()
    {
        //
        // TODO: Add constructor logic here
        //
        cart = new Dictionary<int, CartItem>();
        var t = cart.Values;
    }
    private Dictionary<int, CartItem> cart;
    public ICollection<CartItem> Items
    {
        get
        {
            return this.cart.Values;
        }
    }

    public bool DeleteItem(int id)
    {
        return cart.Remove(id);
    }
    public bool AddItem(CartItem item)
    {
        if (cart.ContainsKey(item.Id))
        {
            cart[item.Id].Quantity += item.Quantity;
        }
        else
        {
            cart.Add(item.Id, item);
        }
        return true;
    }
    public int GetAllQuantity()
    {
        int cnt = 0;
        foreach (var item in cart.Values)
        {
            cnt += item.Quantity;
        }
        return cnt;
    }
    public void ChangeItemQuantity(int id, int quantity)
    {
        if (cart.ContainsKey(id))
        {
            cart[id].Quantity = quantity;
        }
    }
}