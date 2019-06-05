using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PageManager
/// </summary>
public class PageManager
{
    public PageManager()
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
    public void Add(PageTBx page)
    {
        DB.PageTBxes.InsertOnSubmit(page);
        DB.SubmitChanges();
    }
    public PageTBx GetByID(int ID)
    {
        return DB.PageTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<PageTBx> GetList()
    {
        return DB.PageTBxes.Where(e => e.status != -1).ToList();
    }


}