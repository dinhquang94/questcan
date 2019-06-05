using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_user_user : System.Web.UI.Page
{
    public List<UserTBx> listuser;
    protected void Page_Load(object sender, EventArgs e)
    {
        UserManager UM = new UserManager();
        listuser = UM.GetList();
    }
}