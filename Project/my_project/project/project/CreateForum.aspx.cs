using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class Feedback : System.Web.UI.Page
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
            loadForum();
        }

        private void loadForum()
        {
            try
            {
                Database db = new Database();
                DataSet dset = new DataSet();
                string query = "select forumId as 'Forum ID',forumTitle as 'Title',CONVERT(varchar,forumDate,106)as 'Forum Date',r.firstname as 'Created By' from tbl_forum_mst f join register1 r on f.forumCreatedBy=r.mid";
                dset = db.getData(query);

                gvForum.DataSource = dset.Tables[0];
                gvForum.DataBind();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string forumId = new Generate().newFID();
                string forumTitle = txtForumText.Text;
                string forumDate = DateTime.Now.Date.Month.ToString() + "/" + DateTime.Now.Date.Day.ToString() + "/" + DateTime.Now.Date.Year.ToString();
                string createdBy = ((User)Session["user"]).UserID;

                Database db = new Database();
                string query = "INSERT INTO TBL_FORUM_MST VALUES('"+forumId+"','"+forumTitle+"','"+forumDate+"','"+createdBy+"')";
                db.Insert(query);

                txtForumText.Text = "";
                txtForumText.Focus();
                loadForum();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}