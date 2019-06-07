using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_staff_edit_staff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
           
            StaffManager SM = new StaffManager();
            Staff_Store staff = SM.GetByID(Convert.ToInt32(Request["id"]));

            staff.status = 1;
            staff.user_id = Convert.ToInt32(Request["userid"]);
            staff.store_id = Convert.ToInt32(Request["storeid"]);
            
            SM.Save();
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