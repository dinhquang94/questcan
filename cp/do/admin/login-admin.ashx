<%@ WebHandler Language="C#" Class="login_admin" %>

using System;
using System.Web;

public class login_admin : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        try
        {
            string email = context.Request["email"].Trim();
            string password = context.Request["password"].Trim();

            // check admin
            if (Admin.CheckLogin(email, password))
            {
                // create session admin
                Admin admin = new Admin(email, password);
                context.Session["admin"] = admin;

                context.Response.Write(10);
                return;
            }
          
              
             context.Response.Write("Admin not exist");
            
        }
        catch (Exception ex)
        {
            context.Response.Write(ex.ToString());
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}