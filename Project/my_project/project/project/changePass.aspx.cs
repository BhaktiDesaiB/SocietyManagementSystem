using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class changePass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangePassword1_ChangingPassword(object sender, LoginCancelEventArgs e)
        {
            Database db = new Database();
            e.Cancel = true;
            User usr = (User)Session["user"];
            if (usr != null)
            {

                if (ChangePassword1.ConfirmNewPassword.Equals(ChangePassword1.NewPassword))
                {
                    string load = "update register1 set password1='" + ChangePassword1.NewPassword + "' where mid='" + usr.UserID + "'";
                    Response.Write(@"<script type='text/javascript'>alert('Password Changed Successfully');</script>");
                    db.Insert(load);
                }

            }
        }


    }
}