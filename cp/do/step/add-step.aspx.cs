using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_step_add_step : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            StepManager SM = new StepManager();
            StepTBx step = new StepTBx();


            step.status = 1;
            step.effect = Request["effect"];

            StepTBx temp = SM.GetbyStepnumber(int.Parse(Request["number"]));
            if(temp!=null)            
            {
                Response.Write(JsonConvert.SerializeObject(new
                {
                    success = 0,
                    error = "Step was has Effect"
                }));
                return;
            }
            step.step_number = int.Parse(Request["number"]);
            SM.Add(step);
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