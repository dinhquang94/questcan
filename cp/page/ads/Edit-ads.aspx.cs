using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_ads_Edit_ads : System.Web.UI.Page
{
    public AdsTBx ads;
    public List<StoreTBx> liststore;
    protected void Page_Load(object sender, EventArgs e)
    {
        AdsManager AM = new AdsManager();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        ads = AM.GetByID(id);
        StoreManager SM = new StoreManager();
        liststore = SM.GetList();
    }
}