using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_usertask_Add_usertask : System.Web.UI.Page
{
    public List<TaskTBx> listtask;
    public List<UserTBx> listuser;
    protected void Page_Load(object sender, EventArgs e)
    {
        TaskManager TM = new TaskManager();
        UserManager UM = new UserManager();
        listtask = TM.GetList();
        listuser = UM.GetList();
    }
}