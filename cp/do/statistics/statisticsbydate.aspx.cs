using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class cp_do_statistics_statisticsbydate : System.Web.UI.Page
{
    public List<StatisticsTBx> liststa;
    public List<UserTBx> listuser;
    public int totalplayer = 0;
    public int? totolclick = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            StatisticsManager SM = new StatisticsManager();
            DateTime request = Convert.ToDateTime(Request["date"]);
            liststa = SM.GetListByDate(request);
            UserManager UM = new UserManager();
            listuser = UM.GetList();
            foreach (StatisticsTBx i in liststa)
            {
                totalplayer += 1;
                totolclick += i.totle;
            }

        }
        catch (Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }
            ));
        }
    }
}