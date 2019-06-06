using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StoreManager
/// </summary>
public class StoreManager
{
    public StoreManager()
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
    public void Add(StoreTBx store)
    {
        DB.StoreTBxes.InsertOnSubmit(store);
        DB.SubmitChanges();
    }
    public StoreTBx GetByID(int ID)
    {
        return DB.StoreTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<StoreTBx> GetList()
    {
        return DB.StoreTBxes.Where(e => e.status != -1).ToList();
    }

}