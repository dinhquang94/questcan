using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_player_player : System.Web.UI.Page
{
    public List<PlayerTBx> listplayer;
    public List<UserTBx> listuser;
    UserManager UM = new UserManager();
    PlayerManager PM = new PlayerManager();
    protected void Page_Load(object sender, EventArgs e)
    {
       
         listplayer = PM.GetList();
      
        listuser = UM.GetList();


    }

    public UserTBx GetUser (int? id)
    {
        UserTBx resuilt = listuser.Find(e =>e.id == id);

        if (resuilt == null)
            resuilt = new UserTBx();

        return resuilt;

    }
}