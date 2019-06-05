using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_user_edit_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        { 

                UserManager UM = new UserManager();
                UserTBx user = new UserTBx();
                int id = Convert.ToInt32(Request["id"]);
                user = UM.GetByID(id);
                user.status = 1;
                user.token = "";
                user.typeuser_id = Convert.ToInt32(Request["typeuser"]);
                user.first_name = Request["firstname"];
                user.last_name = Request["lastname"];
                user.full_name = Request["fullname"];
                user.email = Request["email"];
                user.password = UTIL.Encrypt(Request["password"], true);
                user.phone = Request["phone"];
                user.birthday = Request["birthday"];
                user.address = Request["address"];
                user.credit = Convert.ToInt32(Request["credit"]);
                user.create_day = user.create_day;
                user.last_loginday = "";
                UM.Save();
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