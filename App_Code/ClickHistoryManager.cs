using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ClickHistoryManager
/// </summary>
public class ClickHistoryManager
{
    public ClickHistoryManager()
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
    public void Add(ClickHistory click)
    {
        DB.ClickHistories.InsertOnSubmit(click);
        DB.SubmitChanges();
    }
    public ClickHistory GetByID(int id)
    {
        return DB.ClickHistories.FirstOrDefault(n => n.id == id);
    }
    public List<ClickHistory> GetList()
    {
        return DB.ClickHistories.ToList();
    }

}