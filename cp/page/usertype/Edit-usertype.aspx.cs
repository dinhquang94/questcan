using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_usertype_Edit_usertype : System.Web.UI.Page
{
     public UserTypeTBx user;
    protected void Page_Load(object sender, EventArgs e)
    {
        UsertypeManager UM = new UsertypeManager();
        
        user = UM.GetByID(Convert.ToInt32(Request.QueryString["id"]));
    }
}