using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_ads_edit_ads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            AdsManager AM = new AdsManager();
            AdsTBx ads = new AdsTBx();
            int id = Convert.ToInt32(Request["id"]);
            ads = AM.GetByID(id);
            ads.status = 1;
            ads.user_id = 1;
            ads.title = Request["title"];
            ads.description = Request.Unvalidated["desc"];
            ads.content = Request.Unvalidated["cont"];
            ads.store_id = Convert.ToInt32(Request["id"]);
            ads.address = Request["address"];
            string base64 = Request["base64"];
            try
            {
                byte[] imageBytes = Convert.FromBase64String(base64);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                string fileName = "ads_" + ads.id + ".jpg";
                image.Save(Path.Combine(Server.MapPath("~/upload/ads"), fileName));
                ads.picture = "/upload/ads/" + fileName;
            }
            catch
            {

            }
            AM.Save();
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch(Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }

    }
}