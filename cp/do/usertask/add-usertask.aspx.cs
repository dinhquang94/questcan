using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_usertask_add_usertask : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            UsertaskManager UM = new UsertaskManager();
            UserTaskTBx UT = new UserTaskTBx();

            UT.status = 1;
            UT.task_id = Convert.ToInt32(Request["taskname"]);
            UT.user_id = Convert.ToInt32(Request["username"]);
            UM.Add(UT);
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