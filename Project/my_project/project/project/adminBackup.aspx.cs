using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace project
{
    public partial class adminBackup : System.Web.UI.Page
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

        protected void btnbackup_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            string st = "BACKUP DATABASE dev TO DISK = 'D:\\"+DateTime.Now.Date.ToShortDateString()+".bak';";
            db.Insert(st);
            Response.Write(@"<script type='text/javascript'>alert('Backup completed Successfully');</script>");
        }

        protected void btnrestore_Click(object sender, EventArgs e)
        {
            string databasename=fupload.FileName;
            Database db = new Database();
            string st = "RESTORE DATABASE "+databasename+" FROM DISK = 'D:\\backup\\';";
            db.Insert(st);
            Response.Write(@"<script type='text/javascript'>alert('Restored Completely ');</script>");
        }
    }
}
