using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_photo_photo : System.Web.UI.Page
{
    public List<PhotoTBx> listphoto;
    protected void Page_Load(object sender, EventArgs e)
    {
        PhotoManager PM = new PhotoManager();
        listphoto = PM.GetList();
    }
}