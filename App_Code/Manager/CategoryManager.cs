using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CategoryManager
/// </summary>
public class CategoryManager
{
    public CategoryManager()
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
    public void Add(CategoryTBx cate)
    {
        DB.CategoryTBxes.InsertOnSubmit(cate);
        DB.SubmitChanges();
    }
    public CategoryTBx GetByID(int ID)
    {
        return DB.CategoryTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<CategoryTBx> GetList()
    {
        return DB.CategoryTBxes.Where(e => e.status != -1).ToList();
    }


}