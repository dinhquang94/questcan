using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UsertypeManager
/// </summary>
public class UsertypeManager
{
    public UsertypeManager()
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
    public void Add(UserTypeTBx usertype) 
    {
        DB.UserTypeTBxes.InsertOnSubmit(usertype);
        DB.SubmitChanges();
    }
    public UserTypeTBx GetByID(int ID)
    {
        return DB.UserTypeTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<UserTypeTBx> GetList()
    {
        return DB.UserTypeTBxes.Where(e => e.status != -1).ToList();
    }

}