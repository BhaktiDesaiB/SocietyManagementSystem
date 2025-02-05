using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class adminFeedbacks : System.Web.UI.Page
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
            load();
        }
        string st = "select name as 'Name',email as 'E-mail',feedback1 as 'Feedback' from feedback";
        public void load()
        {
            Database db = new Database();
            DataSet dset = new DataSet();
            dset=db.getData(st);
            gvfeedback.DataSource = dset.Tables[0];
            gvfeedback.DataBind();
        }
    }
}