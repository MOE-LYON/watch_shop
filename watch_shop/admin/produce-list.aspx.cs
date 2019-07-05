using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_produce_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int page;
       
        string keyword = Request["keyword"];
        if (string.IsNullOrEmpty(keyword)) keyword = "";
        if (!int.TryParse(Request["page"],out page))
        {
            page = 1;
        }
        int totalpage;
        Item_list.DataSource = DBHelper.GetWatches(keyword, page, out totalpage);
        Item_list.DataBind();
        int[] ar = new int[totalpage];
        for(int i=0; i<ar.Length; ++i)
        {
            ar[i] = i+1;
        }
        page_list.DataSource = ar;
        page_list.DataBind();
    }
}