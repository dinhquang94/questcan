using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StaffManager
/// </summary>
public class StaffManager
{
    public StaffManager()
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
    public void Add(Staff_Store staff)
    {
        DB.Staff_Stores.InsertOnSubmit(staff);
        Save();
    }
    public Staff_Store GetByID(int ID)
    {
        return DB.Staff_Stores.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<Staff_Store> GetList()
    {
        return DB.Staff_Stores.Where(e => e.status != -1).ToList();
    }
}