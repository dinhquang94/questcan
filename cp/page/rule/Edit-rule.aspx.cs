using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_rule_Edit_rule : System.Web.UI.Page
{
    public RuleTBx rule;
    public List<TaskTBx> listtask;
    protected void Page_Load(object sender, EventArgs e)
    {
        RuleManager RM = new RuleManager();
        rule = RM.GetByID(Convert.ToInt32(Request.QueryString["id"]));
        TaskManager TM = new TaskManager();
        listtask = TM.GetList();
    }
}