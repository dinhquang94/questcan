using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_rule_add_rule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            RuleManager RM = new RuleManager();
            RuleTBx rule = new RuleTBx();
            rule.status = 1;
            rule.name = Request["name"];
            rule.description = Request.Unvalidated["check"];
            rule.content = Request.Unvalidated["contrule"];
            rule.point = Request["point"];
            rule.task_id = Convert.ToInt32(Request["task"]);
            rule.step = Request["step"];
            RM.Add(rule);

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