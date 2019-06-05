using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_category_category : System.Web.UI.Page
{
    public List<CategoryTBx> listcate;
    protected void Page_Load(object sender, EventArgs e)
    {
        CategoryManager CM = new CategoryManager();
        listcate = CM.GetList();
    }
}