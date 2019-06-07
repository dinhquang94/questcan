using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PlayerManager
/// </summary>
public class PlayerManager
{
    public PlayerManager()
    {
    }
    DataClasses2DataContext DB = new DataClasses2DataContext();

    public void Save()
    {
        DB.SubmitChanges();


}
    public void Add(PlayerTBx user)
    {
        DB.PlayerTBxes.InsertOnSubmit(user);
        DB.SubmitChanges();
    }
    public PlayerTBx GetByID(int ID)
    {
        return DB.PlayerTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public PlayerTBx GetByUserID(int ID)
    {
        return DB.PlayerTBxes.FirstOrDefault(n => n.user_id == ID && n.status != -1);
    }
    public List<PlayerTBx> GetList()
    {
        return DB.PlayerTBxes.Where(e => e.status != -1).ToList();
    }
}