<%@ WebHandler Language="C#" Class="logout_admin" %>

using System;
using System.Web;

public class logout_admin : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest (HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        try
        {
            context.Session.Clear();
            context.Response.Write(1);
        }
        catch (Exception ex)
        {
            context.Response.Write(ex.ToString());
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}