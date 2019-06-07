using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_step_delete_step : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            StepManager SM = new StepManager();
            int id = Convert.ToInt32(Request["id"]);
            StepTBx step = SM.GetByID(id);
            step.status = -1;
            SM.Save();
            Response.Write(JsonConvert.SerializeObject(new { success = 1 }));


        }
        catch (Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new { success = -1,
            error = ex
            }));
        }
    }
}