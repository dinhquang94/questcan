using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_store_Edit_store : System.Web.UI.Page
{
    public StoreTBx store;
    protected void Page_Load(object sender, EventArgs e)
    {
        StoreManager SM = new StoreManager();
        store = SM.GetByID(Convert.ToInt32(Request.QueryString["id"]));
    }
}