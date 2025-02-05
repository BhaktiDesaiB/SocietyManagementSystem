using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace project
{
    public partial class adminbookAudi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
        public string fetchQuery = "select wing as 'Wing',firstname as 'FirstName',lastname as'Surname',purpose as 'Purpose',CONVERT(varchar,fromdate,103) as 'Date_for_booking', CONVERT(varchar,tilldate,103) as 'Date_till_booking' from register1 r inner join flatdetails f on r.mid=f.mid inner join booking b on r.mid=b.mid";
        public void load()
        {
            Database db = new Database();
            DataSet dset = new DataSet();

            dset = db.getData(fetchQuery);

            gvBook.DataSource = dset.Tables[0];
            gvBook.DataBind();
        }
    }
}