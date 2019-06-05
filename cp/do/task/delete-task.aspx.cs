using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_task_delete_task : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TaskManager TM = new TaskManager();
            TaskTBx task = new TaskTBx();
            int id = Convert.ToInt32(Request["id"]);
            task = TM.GetByID(id);
            task.status = -1;
            TM.Save();
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