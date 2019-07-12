using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RuleManager
/// </summary>
public class RuleManager
{
    public RuleManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Save()
    {
        DB.SubmitChanges();
    }
    public void Add(RuleTBx rule)
    {
        DB.RuleTBxes.InsertOnSubmit(rule);
        DB.SubmitChanges();
    }
    public RuleTBx GetByID(int ID)
    {
        return DB.RuleTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<RuleTBx> GetList()
    {
        return DB.RuleTBxes.Where(e => e.status != -1).ToList();
    }
    public List<RuleTBx> GetListByTaskID(int id)
    {
        return DB.RuleTBxes.Where(e => e.status != -1&& e.task_id==id).ToList();
    }

}