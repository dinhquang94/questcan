using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserManager
/// </summary>
public class UserManager
{
    public UserManager()
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
    public void Add(UserTBx user)
    {
        DB.UserTBxes.InsertOnSubmit(user);
        DB.SubmitChanges();
    }
    public UserTBx GetByID(int ID)
    {
        return DB.UserTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<UserTBx> GetList()
    {
        return DB.UserTBxes.Where(e => e.status != -1).ToList();
    }
    public UserTBx GetByEmail(string email)
    {
        try
        {
            return DB.UserTBxes.Where(e => e.email == email && e.status != -1).First();
        }
        catch (Exception)
        {
            return new UserTBx();
        }
    }



}