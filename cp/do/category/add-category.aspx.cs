using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_category_add_category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            CategoryManager CM = new CategoryManager();
            CategoryTBx cate = new CategoryTBx();
            cate.status = 1;
            cate.name = Request["categoryname"];
            cate.typecategory = Request["type"];
            CM.Add(cate);
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