using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_category_Add_category : System.Web.UI.Page
{
    public List<UserTypeTBx> listtype;
    protected void Page_Load(object sender, EventArgs e)
    {
        UsertypeManager UM = new UsertypeManager();
        listtype = UM.GetList();
    }
}