using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_page_Edit_page : System.Web.UI.Page
{
    public PageTBx page;
    protected void Page_Load(object sender, EventArgs e)
    {
        PageManager PM = new PageManager();
        page = PM.GetByID(Convert.ToInt32(Request.QueryString["id"]));

    }
}