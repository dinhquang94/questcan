using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_usertask_delete_usertask : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            UsertaskManager UM = new UsertaskManager();
            UserTaskTBx user = new UserTaskTBx();
            int id = Convert.ToInt32(Convert.ToInt32(Request["id"]));
            user = UM.GetByID(id);
            user.status = -1;
            UM.Save();
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