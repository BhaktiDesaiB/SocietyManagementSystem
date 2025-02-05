using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace project
{
    public partial class noticeBoard : System.Web.UI.Page
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
        string st = "select noticeId as 'ID',noticeMsg as 'Notice',Convert(varchar,noticeDate,103) as 'Date' from notice";
        public void load()
        {
            Database db=new Database();
            DataSet dset = new DataSet();
            dset = db.getData(st);
            gvnotice.DataSource = dset.Tables[0];
            gvnotice.DataBind();
        }
    }
}