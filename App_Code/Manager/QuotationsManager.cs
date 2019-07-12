using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for QuotationsManager
/// </summary>
public class QuotationsManager
{
    public QuotationsManager()
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
    public void Add(QuotationsTBx quo)
    {
        DB.QuotationsTBxes.InsertOnSubmit(quo);
        DB.SubmitChanges();
    }
    public QuotationsTBx GetByID(int ID)
    {
        return DB.QuotationsTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<QuotationsTBx> GetList()
    {
        return DB.QuotationsTBxes.Where(e => e.status != -1).ToList();
    }


}