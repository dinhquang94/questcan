using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class cp_do_user_add_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            UserManager UM = new UserManager();
            UserTBx UT = new UserTBx();
            
            UT.status = 1;
            UT.token = "";
            UT.typeuser_id = Convert.ToInt32(Request["typeuser"]);
            UT.first_name = Request["firstname"];
            UT.last_name = Request["lastname"];
            UT.full_name = Request["fullname"];
            UT.email = Request["email"];
            UT.password = UTIL.Encrypt(Request["password"], true);
            UT.phone = Request["phone"];
            UT.birthday = Request["birthday"];
            UT.address = Request["address"];
            UT.credit = Convert.ToInt32(Request["credit"]);
            UT.create_day = DateTime.Now.ToString();
            UT.last_loginday = "";
            UM.Add(UT);
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