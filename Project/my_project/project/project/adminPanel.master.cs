using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class adminPanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User usr = (User)Session["user"];
            if (usr == null)
            {
                Response.Redirect("PleaseLogin.aspx");
            }
        }
    }
}