using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_game_Edit_game : System.Web.UI.Page
{
    public GameTBx game;
    protected void Page_Load(object sender, EventArgs e)
    {
        GameManager GM = new GameManager();
        game = GM.GetByID(Convert.ToInt32(Request.QueryString["id"]));
    }
}