using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_store_edit_store : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            StoreManager SM = new StoreManager();
            StoreTBx store = SM.GetByID(Convert.ToInt32(Request["id"]));
            store.status = 1;
            store.name = Request["name"];
            store.phone = Request["phone"];
            store.lat = Request["lat"];
            store.@long = Request["long"];
            store.email = Request["email"];
            store.close_time = Request["close"];
            store.open_time = Request["open"];
            store.address = Request["address"];
            SM.Save();
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