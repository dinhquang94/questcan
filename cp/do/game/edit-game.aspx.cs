using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_game_edit_game : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            GameManager GM = new GameManager();
            GameTBx game = new GameTBx();
            game = GM.GetByID(Convert.ToInt32(Request["id"]));
            game.status = 1;
            game.name = Request["name"];
            game.link = Request["link"];
            game.description = Request.Unvalidated["desc"];
            game.content = Request.Unvalidated["cont"];
            string base64 = Request["base64"];
            try
            {
                byte[] imageBytes = Convert.FromBase64String(base64);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                string fileName = "game_" + game.id + ".jpg";
                image.Save(Path.Combine(Server.MapPath("~/upload/game"), fileName));
                game.banner = "/upload/game/" + fileName;
            }
            catch
            {

            }
            GM.Save();
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch (Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }
    }
}