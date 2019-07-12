using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class detailtask : System.Web.UI.Page
{
    public TaskTBx task;
    public List<RuleTBx> listrule;
    protected void Page_Load(object sender, EventArgs e)
    {
        TaskManager TM = new TaskManager();
        task = TM.GetByID(Convert.ToInt32(Request.QueryString["id"]));
        RuleManager RM = new RuleManager();
        listrule = RM.GetListByTaskID(Convert.ToInt32(Request.QueryString["id"]));
    }
}