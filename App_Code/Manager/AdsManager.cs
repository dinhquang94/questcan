using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdsManager
/// </summary>
public class AdsManager
{
    public AdsManager()
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
    public void Add(AdsTBx ads)
    {
        DB.AdsTBxes.InsertOnSubmit(ads);
        DB.SubmitChanges();
    }
    public AdsTBx GetByID(int ID)
    {
        return DB.AdsTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<AdsTBx> GetList()
    {
        return DB.AdsTBxes.Where(e => e.status != -1).ToList();
    }

}