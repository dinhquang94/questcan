using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_step_step : System.Web.UI.Page
{
    public List<StepTBx> liststep;
    protected void Page_Load(object sender, EventArgs e)
    {
        StepManager SM = new StepManager();
        liststep = SM.GetList();
    }
}