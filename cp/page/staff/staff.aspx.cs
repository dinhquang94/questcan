using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_staff_staff : System.Web.UI.Page
{
    public List<Staff_Store> liststaff;
    protected void Page_Load(object sender, EventArgs e)
    {
        StaffManager CM = new StaffManager();
        liststaff = CM.GetList();
    }
}