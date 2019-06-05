using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_category_edit_category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            CategoryManager CM = new CategoryManager();
            CategoryTBx cate = new CategoryTBx();
            int id = Convert.ToInt32(Request["id"]);
            cate = CM.GetByID(id);
            cate.name = Request["categoryname"];
            cate.typecategory = Request["type"];
            cate.status = 1;
            CM.Save();
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch(Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }

    }
}