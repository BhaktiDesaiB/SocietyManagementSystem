using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class ComitteeMembers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User usr = (User)Session["user"];
            if (usr == null)
            {
                Response.Redirect("PleaseLogin.aspx");
            }
            else
            {
            }
            Load();
        }
        public void Load()
        {
            string st = "select wing as 'Wing',flatno as 'Flat No',firstname as 'First Name' , lastname as 'Last Name' ,UserType as 'Designation' from register1 r inner join flatdetails f on f.mid=r.mid where UserType!='member'";
            Database db = new Database();
            DataSet dset = new DataSet();
            dset = db.getData(st);
            gvCommitteMember.DataSource = dset.Tables[0];
            gvCommitteMember.DataBind();




        }
    }
}