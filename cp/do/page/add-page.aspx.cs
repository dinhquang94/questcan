using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_page_add_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            PageManager PM = new PageManager();
            PageTBx page = new PageTBx();
            page.status = 1;
            page.title = Request["title"];
            page.description = Request.Unvalidated["desc"];
            page.create_day = DateTime.Now.ToString();
            PM.Add(page);
            string base64 = Request["base64"];
            if (base64 != null)
            {

                byte[] imageBytes = Convert.FromBase64String(base64);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                string fileName = "page_" + page.id + ".jpg";
                image.Save(Path.Combine(Server.MapPath("~/upload/page"), fileName));
                page.picture = "/upload/page/" + fileName;
            }

            PM.Save();
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch (Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }
    }
}