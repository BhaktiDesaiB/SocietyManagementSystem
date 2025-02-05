using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class Reportgen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User usr = (User)Session["user"];
            if (usr == null)
            {
                Response.Redirect("PleaseLoginadmin.aspx");
            }
            else
            {
                if (usr != null)
                {
                    if (usr.UserType.Equals("Member"))
                    {
                        Response.Redirect("PleaseLogin.aspx");
                    }
                    else
                    {

                    }
                }
            }
        }
    }
}