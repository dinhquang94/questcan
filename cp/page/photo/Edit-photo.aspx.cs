using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_photo_Edit_photo : System.Web.UI.Page
{
    public PhotoTBx photo;
    protected void Page_Load(object sender, EventArgs e)
    {
        PhotoManager PM = new PhotoManager();
        photo = PM.GetByID(Convert.ToInt32(Request["id"]));
    }
}