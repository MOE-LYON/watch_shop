using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    public Customer()
    {
        //
        // TODO: Add constructor logic here
        //
    }
        public int Id { get; set; }
        public string Name { get; set; }
        public string UserId { get; set; }
    // 按理说用哈希什么的来保存
        public string UserPwd { get; set; }
        public decimal Balance { get; set; }
    
}