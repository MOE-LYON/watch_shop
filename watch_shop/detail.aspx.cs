using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id;
        if (!int.TryParse(Request.Params["Id"],out id))
        {
            id = 1;
        }
        Watch watch = WatchServ.GetWatchById(id);
        if (watch == null)
        {
            return;
        }
        watch_des.InnerHtml = "描述:<br><br>" + watch.Description;
        watch_photo.ImageUrl = string.Format("~/images/{0}", watch.Photo);
        watch_price.Text = watch.Price.ToString();
        watch_title.InnerText = watch.Name;
        watch_id.Value = watch.Id.ToString();
        var price = watch.Price.ToString();
        watch_credit.Text = price.Substring(0,price.Length-3);
    }
}