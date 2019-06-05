using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_task_Edit_task : System.Web.UI.Page
{
    public TaskTBx task;
    protected void Page_Load(object sender, EventArgs e)
    {
        TaskManager TM = new TaskManager();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        task = TM.GetByID(id);
    }
}