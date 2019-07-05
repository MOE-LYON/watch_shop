using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_produce_edut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        series_list.DataSource = Series.series;
        series_list.DataBind();
        int id;
        int.TryParse(Request["id"], out id);
        if (id == 0) return;

        Watch watch = WatchServ.GetWatchById(id);
        watch_brand.Value = watch.Brand;
        watch_descr.Value = watch.Description;
        watch_id.Value = watch.Id.ToString();
        watch_price.Value = watch.Price.ToString();
        watch_tags.Value = watch.Tags;
        watch_name.Value = watch.Name;
        watch_photo.Value = watch.Photo;
        watch_seriesid.Value = watch.SeriesId.ToString();
        demo1.Src = string.Format("~/images/{0}", watch.Photo);
    }
}