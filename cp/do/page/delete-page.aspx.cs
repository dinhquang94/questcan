using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_page_delete_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            PageManager PM = new PageManager();
            PageTBx page = new PageTBx();
            int id = Convert.ToInt32(Request["id"]);
            page = PM.GetByID(id);
            page.status = -1;
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