using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_quote_quote : System.Web.UI.Page
{
    public List<QuotationsTBx> listquo;
    protected void Page_Load(object sender, EventArgs e)
    {
        QuotationsManager QM = new QuotationsManager();
        listquo = QM.GetList();
    }
}