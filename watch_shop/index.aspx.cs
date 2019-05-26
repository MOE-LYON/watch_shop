using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int cid;
        if (int.TryParse(Request.Params["cid"], out cid))
        {
            List<Watch> watchess = WatchServ.GetWatchByCId(cid);
            item_list.DataSource = watchess;
            item_list.DataBind();
            return;
        }
        int page;
        if (!int.TryParse(Request.Params["page"], out page))
        {
            page = 1;

        }

        List<Watch> watches = WatchServ.GetWatchByPageNum(page);
        item_list.DataSource = watches;
        item_list.DataBind();
    }
}