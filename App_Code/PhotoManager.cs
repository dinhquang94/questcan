using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PhotoManager
/// </summary>
public class PhotoManager
{
    public PhotoManager()
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
    public void Add(PhotoTBx photo)
    {
        DB.PhotoTBxes.InsertOnSubmit(photo);
        DB.SubmitChanges();
    }
    public PhotoTBx GetByID(int ID)
    {
        return DB.PhotoTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<PhotoTBx> GetList()
    {
        return DB.PhotoTBxes.Where(e => e.status).ToList();
    }
}