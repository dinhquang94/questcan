using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_usertype_add_usertype : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            UsertypeManager UM = new UsertypeManager();
            UserTypeTBx UT = new UserTypeTBx();
            UT.status = 1;
            UT.name = Request["name"];
      
            UM.Add(UT);
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