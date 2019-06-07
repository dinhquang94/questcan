using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_usertask_usertask : System.Web.UI.Page
{
    public List<UserTaskTBx> listusertask;
    public List<TaskTBx> listtask;
    public List<UserTBx> listuser;
    protected void Page_Load(object sender, EventArgs e)
    {
        UsertaskManager UM = new UsertaskManager();
        TaskManager TM = new TaskManager();
        UserManager Urm = new UserManager();
        listusertask = UM.GetList();
        listtask = TM.GetList();
        listuser = Urm.GetList();
    }
}