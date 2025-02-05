using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class ChangeTheme : System.Web.UI.Page
    {
        public string theme = "master";
        protected void Page_Load(object sender, EventArgs e)
        {            
            User usr = (User)Session["user"];
            if (usr == null)
            {
                Response.Redirect("PleaseLogin.aspx");

            }
            else
            {                
                if (Request["th"] != null)
                {
                    theme = Request["th"];
                    usr.Theme = theme;
                }
                else
                {
                    theme = usr.Theme;
                }
                Database db = new Database();
                db.Insert("Update register1 set theme='"+theme+"' where mid = '"+usr.UserID+"'");
            }


        }
    }
}