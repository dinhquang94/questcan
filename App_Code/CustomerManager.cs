using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomerManager
/// </summary>
public class CustomerManager
{
    public CustomerManager()
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
    public void Add(Customer_Store customer)
    {
        DB.Customer_Stores.InsertOnSubmit(customer);
        Save();
    }
    public Customer_Store GetByID(int ID)
    {
        return DB.Customer_Stores.FirstOrDefault(n => n.id == ID && n.status != -1);
    }
    public List<Customer_Store> GetList()
    {
        return DB.Customer_Stores.Where(e => e.status != -1).ToList();
    }
}