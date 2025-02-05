using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class contactList : System.Web.UI.Page
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

        public string fetchQuery = "select * from contactList";
        public void load()
        {
            Database db = new Database();
            DataSet dset = new DataSet();

            dset = db.getData(fetchQuery);

            gvContact.DataSource = dset.Tables[0];
           gvContact.DataBind();
        }
    }
}