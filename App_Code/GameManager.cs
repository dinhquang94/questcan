using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GameManager
/// </summary>
public class GameManager
{
    public GameManager()
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
    public void Add(GameTBx game)
    {
        DB.GameTBxes.InsertOnSubmit(game);
        DB.SubmitChanges();
    }
    public GameTBx GetByID(int ID)
    {
        return DB.GameTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<GameTBx> GetList()
    {
        return DB.GameTBxes.Where(e => e.status != -1).ToList();
    }

}