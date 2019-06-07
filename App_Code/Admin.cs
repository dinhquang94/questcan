using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Admin
/// </summary>
public class Admin
{
    public string username;
    public string password;

    public Admin(string username, string password)
    {
        this.username = username;
        this.password = password;
    }

    public static bool CheckLogin(string username, string password)
    {
        bool isCorrect = false;
        if (username == "Admin" && password == "2468Test@@") // admin 1
        {
            isCorrect = true;
        }
        else if (username == "Math4All" && password == "Math4All@@123") // admin 2
        {
            isCorrect = true;
        }

        return isCorrect;
    }
}