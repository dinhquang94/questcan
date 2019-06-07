using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UsertaskManager
/// </summary>
public class UsertaskManager
{
    public UsertaskManager()
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
    public void Add(UserTaskTBx user)
    {
        DB.UserTaskTBxes.InsertOnSubmit(user);
        DB.SubmitChanges();
    }
    public UserTaskTBx GetByID(int ID)
    {
        return DB.UserTaskTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<UserTaskTBx> GetList()
    {
        return DB.UserTaskTBxes.Where(e => e.status != -1).ToList();
    }

}