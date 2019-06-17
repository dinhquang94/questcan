using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DeviceManager
/// </summary>
public class DeviceManager
{
    public DeviceManager()
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
    public void Add(DeviceTBx device)
    {
        DB.DeviceTBxes.InsertOnSubmit(device);
        Save();
    }
    public DeviceTBx GetByID(int ID)
    {
        return DB.DeviceTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<DeviceTBx> GetList()
    {
        return DB.DeviceTBxes.Where(e => e.status != -1).ToList();
    }
}