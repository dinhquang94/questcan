using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_statistics_statistics : System.Web.UI.Page
{
    public List<StatisticsTBx> liststa;
    public List<UserTBx> listuser;
    public int totalplayer =0;
    public int? totolclick =0 ;
    protected void Page_Load(object sender, EventArgs e)
    {
        StatisticsManager SM = new StatisticsManager();
        liststa = SM.GetList();
        UserManager UM = new UserManager();
        listuser = UM.GetList();
        foreach(StatisticsTBx i in liststa)
        {
            totalplayer += 1;
            totolclick += i.totle;
        }

    }
}