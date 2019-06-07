using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_staff_Edit_staff : System.Web.UI.Page
{
    public Staff_Store staff;
    public List<StoreTBx> liststore;
    public List<UserTBx> listuser;
    protected void Page_Load(object sender, EventArgs e)
    {
        StoreManager StM = new StoreManager();
        liststore = StM.GetList();
        UserManager UM = new UserManager();
        listuser = UM.GetList();
        StaffManager SM = new StaffManager();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        staff = SM.GetByID(id);

    }
}