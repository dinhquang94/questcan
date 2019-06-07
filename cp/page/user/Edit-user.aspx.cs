using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_user_Edit_user : System.Web.UI.Page
{
   public UserTBx user;
    public List<UserTypeTBx> listype;
    protected void Page_Load(object sender, EventArgs e)
    {
        UserManager UM = new UserManager();
        int id =Convert.ToInt32(Request.QueryString["id"]);
        user = UM.GetByID(id);
        UsertypeManager UTM = new UsertypeManager();
        listype = UTM.GetList();
    }
}