using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_category_Edit_category : System.Web.UI.Page
{
    public CategoryTBx cate;
    protected void Page_Load(object sender, EventArgs e)
    {
        CategoryManager CM = new CategoryManager();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        cate = CM.GetByID(id);

    }
}