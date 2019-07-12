using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_task_add_task : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            TaskManager TM = new TaskManager();
            TaskTBx task = new TaskTBx();
            task.status = 1;
            task.title = Request["title"];
            task.description = Request.Unvalidated["desc"];
            //task.content = Request.Unvalidated["cont"];
            task.lat = Request["lat"];
            task.@long = Request["long"];
            task.start_time = Request["sday"];
            task.end_time =  Request["eday"];
            task.point = Convert.ToInt32(Request["point"]);
            task.usertype_id = Convert.ToInt32(Request["type"]);
            //task.step1 = Request["step1"];
            //task.rule1 = Request["rule1"];
            //task.step2 = Request["step2"];
            //task.rule2 = Request["rule2"];
            task.link = Request["link"];
            TM.Add(task);
            string base64 = Request["base64"];
            if (base64 != null)
            {

                byte[] imageBytes = Convert.FromBase64String(base64);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                string fileName = "task_" + task.id + ".jpg";
                image.Save(Path.Combine(Server.MapPath("~/upload/task"), fileName));
                task.picture = "/upload/task/" + fileName;
            }

            TM.Save();
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