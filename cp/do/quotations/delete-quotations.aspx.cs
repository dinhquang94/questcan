using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_quotations_delete_quotations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            QuotationsManager QM = new QuotationsManager();
            QuotationsTBx quo = new QuotationsTBx();
            int id = Convert.ToInt32(Request["id"]);
            quo = QM.GetByID(id);
            quo.status = -1;
            QM.Save();
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch (Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }
    }
}