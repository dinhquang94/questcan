using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_step_edit_step : System.Web.UI.Page
{
    public string Jsonconver { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            StepManager SM = new StepManager();
            int id = Convert.ToInt32(Request["id"]);
            StepTBx step = SM.GetByID(id);
            step.status = 1;
            step.effect = Request["effect"];
          //  step.step_number = int.Parse(Request["number"]);

            SM.Save();
            Response.Write(JsonConvert.SerializeObject(new { success = 1 }));
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