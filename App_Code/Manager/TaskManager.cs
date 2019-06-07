using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaskManager
/// </summary>
public class TaskManager
{
    public TaskManager()
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
    public void Add(TaskTBx task)
    {
        DB.TaskTBxes.InsertOnSubmit(task);
        DB.SubmitChanges();
    }
    public TaskTBx GetByID(int ID)
    {
        return DB.TaskTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<TaskTBx> GetList()
    {
        return DB.TaskTBxes.Where(e => e.status != -1).ToList();
    }


}