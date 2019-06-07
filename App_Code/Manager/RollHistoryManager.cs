using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RollHistoryManager
/// </summary>
public class RollHistoryManager
{
    public RollHistoryManager()
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
    public void Add(RollHistoryTBx user)
    {
        DB.RollHistoryTBxes.InsertOnSubmit(user);
        DB.SubmitChanges();
    }
    public RollHistoryTBx GetByID(int ID)
    {
        return DB.RollHistoryTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<RollHistoryTBx> GetList()
    {
        return DB.RollHistoryTBxes.Where(e => e.status != -1).ToList();
    }
}