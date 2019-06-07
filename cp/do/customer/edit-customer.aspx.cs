using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_customer_edit_customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            CustomerManager CM = new CustomerManager();
            Customer_Store customer = CM.GetByID(Convert.ToInt32(Request["id"]));

            customer.status = 1;
            customer.user_id = Convert.ToInt32(Request["userid"]);
            customer.store_id = Convert.ToInt32(Request["storeid"]);

            CM.Save();
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch (Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }
    }
}