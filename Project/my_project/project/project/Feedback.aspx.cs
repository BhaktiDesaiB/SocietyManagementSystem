using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class Feedback1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmitfeedback_Click(object sender, EventArgs e)
        {
            Database db=new Database();
            string name = txtfeedbackname.Text;
            string email = txtfeedbackemail.Text;
            string feedback = txtfeedback.Text;
            string st = "insert into feedback values('"+name+"','"+email+"','"+feedback+"')";
            db.Insert(st);
            Response.Write(@"<script type='text/javascript'>alert('Thanks for your valuable feedback');</script>");
            clearall();

        }
        public void clearall()
        {
            txtfeedbackname.Text = "";
            txtfeedbackemail.Text = "";
            txtfeedback.Text = "";
        }

        protected void btncancelfeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}