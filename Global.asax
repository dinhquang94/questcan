<%@ Application Language="C#" %>

<script runat="server">
    void URL(System.Web.Routing.RouteCollection rout)
    {

        rout.MapPageRoute("", "home", "~/Default.aspx");
        rout.MapPageRoute("", "login", "~/cp/page/Login.aspx");        
         rout.MapPageRoute("", "user", "~/cp/page/user/user.aspx");
        //player        
        rout.MapPageRoute("", "player", "~/cp/page/player/player.aspx");
        //step
        rout.MapPageRoute("", "step", "~/cp/page/step/step.aspx");
        rout.MapPageRoute("", "step-add", "~/cp/page/step/Add-step.aspx");
        rout.MapPageRoute("", "step-edit", "~/cp/page/step/Edit-step.aspx");

       
    }
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
           URL(System.Web.Routing.RouteTable.Routes);

    }

     protected void Application_BeginRequest(Object sender, EventArgs e)
    {
       if (HttpContext.Current.Request.IsSecureConnection.Equals(false) && HttpContext.Current.Request.IsLocal.Equals(false))
       {
        Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"]
    +   HttpContext.Current.Request.RawUrl);
       }
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
