﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_ads_Add_ads : System.Web.UI.Page
{
    public List<StoreTBx> liststore;
    protected void Page_Load(object sender, EventArgs e)
    {
        StoreManager SM = new StoreManager();
        liststore = SM.GetList();
    }
}