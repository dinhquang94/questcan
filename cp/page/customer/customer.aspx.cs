using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_customer_customer : System.Web.UI.Page
{
    public List<Customer_Store> listcustomer;
    protected void Page_Load(object sender, EventArgs e)
    {
        CustomerManager CM = new CustomerManager();
        listcustomer = CM.GetList();
    }
}