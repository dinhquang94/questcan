using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StatisticsManager
/// </summary>
public class StatisticsManager
{
    public StatisticsManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    DataClasses2DataContext DB = new DataClasses2DataContext();
    public void Save()
    {
        DB.SubmitChanges();
    }
    public void Add(StatisticsTBx sta)
    {
        DB.StatisticsTBxes.InsertOnSubmit(sta);
        DB.SubmitChanges();
    }
    public StatisticsTBx GetByID(int ID)
    {
        return DB.StatisticsTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public StatisticsTBx GetByUserID(int ID)
    {
        return DB.StatisticsTBxes.FirstOrDefault(n => n.user_id == ID && n.status != -1);
    }
    public List<StatisticsTBx> GetList()
    {
        return DB.StatisticsTBxes.Where(e => e.status != -1).ToList();
    }
    public List<StatisticsTBx> GetListByDate(DateTime date)
    {
        return DB.StatisticsTBxes.Where(n => n.date == date && n.status != -1).ToList();
    }

}