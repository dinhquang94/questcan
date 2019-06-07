using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_staff_add_staff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         try
        {
            Staff_Store staff = new Staff_Store();
            StaffManager SM = new StaffManager();
            staff.status = 1;
            staff.user_id = Convert.ToInt32(Request["userid"]);
            staff.store_id=Convert.ToInt32(Request["storeid"]);
            SM.Add(staff);
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch(Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }
    }
}