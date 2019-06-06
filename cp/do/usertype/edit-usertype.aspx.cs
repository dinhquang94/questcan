using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_usertype_edit_usertype : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            UsertypeManager UM = new UsertypeManager();
            UserTypeTBx user = new UserTypeTBx();
            int id = Convert.ToInt32(Request["id"]);
            user = UM.GetByID(id);
            user.status = 1;
            user.name = Request["name"];
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