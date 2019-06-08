using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_game_game : System.Web.UI.Page
{
    public List<GameTBx> listgame;
    protected void Page_Load(object sender, EventArgs e)
    {
        GameManager GM = new GameManager();
        listgame = GM.GetList();
    }
}