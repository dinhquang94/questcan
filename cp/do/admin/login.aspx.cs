using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class cp_do_admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string userName = Request["username"];
            string password = Request["password"];
            if (userName == "Admin")
            {
                if (password == "2468Test@@")
                {
                    Session["islogin"] = 1;
                    Response.Write(JsonConvert.SerializeObject(new
                    {
                        success = 1
                    }));
                }
                else
                {

                    Response.Write(JsonConvert.SerializeObject(new
                    {
                        success = 0,
                        message = "Password incorrect."
                    }));
                }
            }
            else
            {
                Response.Write(JsonConvert.SerializeObject(new
                {
                    success = 0,
                    message = "User name incorrect."
                }));
            }


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