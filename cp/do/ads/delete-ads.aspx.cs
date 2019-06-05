using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_ads_delete_ads : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            AdsManager AM = new AdsManager();
            AdsTBx ads = new AdsTBx();
            int id = Convert.ToInt32(Request["id"]);
            ads = AM.GetByID(id);
            ads.status = -1;
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