﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class task : System.Web.UI.Page
{
    public List<TaskTBx> listtask;
    protected void Page_Load(object sender, EventArgs e)
    {
        TaskManager TM = new TaskManager();
        listtask = TM.GetList();
    }
}