using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StepManager
/// </summary>
public class StepManager
{
    public StepManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }  
    DataClasses2DataContext DB = new DataClasses2DataContext();

    public void Save()
    {
        DB.SubmitChanges();
    }
    public void Add(StepTBx user)
    {
        DB.StepTBxes.InsertOnSubmit(user);
        DB.SubmitChanges();
    }
    public StepTBx GetByID(int ID)
    {
        return DB.StepTBxes.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<StepTBx> GetList()
    {
        return DB.StepTBxes.Where(e => e.status != -1).ToList();
    }

    public StepTBx GetbyStepnumber(int stepnumber)
    {
        try
        {

            return DB.StepTBxes.FirstOrDefault(n => n.step_number == stepnumber && n.status != -1);
        }
        catch(Exception ex)
        {
            return new StepTBx ();
        }
        }

}