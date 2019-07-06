using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Role
/// </summary>
public class Roles
{
    public Roles()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    static List<Roles> roles;
    static Roles()
    {
        roles = DBHelper.GetRoles();
    }
    public static string GetDes(int id)
    {
        return roles.Find(r => r.Id == id).Descr;
    }

    public int Id { get; set; }
    public int Level { get; set; }
    public string Descr { get; set; }
}