using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_step_Edit_step : System.Web.UI.Page
{
    public StepTBx step;
    protected void Page_Load(object sender, EventArgs e)
    {
        StepManager SM = new StepManager();

        step = SM.GetByID( Convert.ToInt32(Request.QueryString["id"]));



    }
}