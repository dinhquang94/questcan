using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_user_delete_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
        PlayerManager PL = new PlayerManager();
        UserManager UM = new UserManager();
        int id = Convert.ToInt32(Request["id"]);
         PlayerTBx player = PL.GetByUserID(id);
         player.status = -1;
         PL.Save();
        UserTBx user = UM.GetByID(id);
        user.status = -1;
        UM.Save();
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