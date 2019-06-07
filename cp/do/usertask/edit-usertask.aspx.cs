using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_usertask_edit_usertask : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            UsertaskManager UM = new UsertaskManager();
            UserTaskTBx UT = UM.GetByID(Convert.ToInt32(Request["id"]));

            UT.status = 1;
            UT.task_id = Convert.ToInt32(Request["taskname"]);
            UT.user_id = Convert.ToInt32(Request["username"]);
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