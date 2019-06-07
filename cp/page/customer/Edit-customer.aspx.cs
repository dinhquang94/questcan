using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_customer_Edit_customer : System.Web.UI.Page
{
    public Customer_Store customer;
    public List<StoreTBx> liststore;
    public List<UserTBx> listuser;
    protected void Page_Load(object sender, EventArgs e)
    {
        StoreManager StM = new StoreManager();
        liststore = StM.GetList();
        UserManager UM = new UserManager();
        listuser = UM.GetList();
        CustomerManager CM = new CustomerManager();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        customer = CM.GetByID(id);

    }
}