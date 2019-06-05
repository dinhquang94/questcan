using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_MasterPage : System.Web.UI.MasterPage
{
    public string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        name = System.IO.Path.GetFullPath(Request.Url.AbsolutePath).Replace(".aspx", "").ToLower();
        //if (Session["islogin"] == null || Session["islogin"].ToString() != "1")
        //    Response.Redirect("/cp-login");
    }
}
