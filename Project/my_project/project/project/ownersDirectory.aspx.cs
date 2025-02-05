using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class ownersDirectory : System.Web.UI.Page
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
            load();
        }
        string st = "select  wing as 'Wing',flatno as 'FlatNo',firstname as 'First Name',lastname as 'Last Name', mobile as 'Mobile No' ,landline as 'Landline No' from register1 inner join flatdetails on register1.mid=flatdetails.mid ";
        public void load()
        {
            Database db = new Database();
            DataSet dset = new DataSet();
            dset = db.getData(st);
            gvord.DataSource = dset;
            gvord.DataBind();
        }
    }
}