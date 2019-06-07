using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_usertask_Edit_usertask : System.Web.UI.Page
{
    public UserTaskTBx usertask;
    public List<TaskTBx> listtask;
    public List<UserTBx> listuser;
    protected void Page_Load(object sender, EventArgs e)
    {
        UsertaskManager UM = new UsertaskManager();
        usertask = UM.GetByID(Convert.ToInt32(Request.QueryString["id"]));
        TaskManager TM = new TaskManager();
        UserManager UrM = new UserManager();
        listtask = TM.GetList();
        listuser = UrM.GetList();
    }
}