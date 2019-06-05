using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_ads_ads : System.Web.UI.Page
{
    public List<AdsTBx> listads;
    protected void Page_Load(object sender, EventArgs e)
    {
        AdsManager AM = new AdsManager();
        listads = AM.GetList();
    }
}