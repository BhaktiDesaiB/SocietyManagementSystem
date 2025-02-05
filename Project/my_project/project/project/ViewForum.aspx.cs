using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class compalinBox : System.Web.UI.Page
    {
        string forumID = "fid0001";
        protected void Page_Load(object sender, EventArgs e)
        {
            forumID = Request["forumID"];
            string query = "select * from vwForum where [forum id]='" + forumID + "' ";
            Database db = new Database();
            DataSet ds = new DataSet();
            ds =db.getData(query);

            if (ds.Tables[0].Rows.Count>0)
            {
                forumTitle.InnerHtml = ds.Tables[0].Rows[0].ItemArray.GetValue(1).ToString();
                forumOn.InnerHtml = ds.Tables[0].Rows[0].ItemArray.GetValue(2).ToString();
                forumBy.InnerHtml = ds.Tables[0].Rows[0].ItemArray.GetValue(3).ToString();
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                User usr = (User)Session["user"];

                if (usr != null)
                {
                    string threadid = new Generate().newTHR();
                    string post = txtPost.Text;
                    post = post.Replace("\r\n","<br />");
                    string userid = usr.UserID;


                    string postDate = DateTime.Now.Date.Month.ToString() + "/" + DateTime.Now.Date.Day.ToString() + "/" + DateTime.Now.Date.Year.ToString();


                    string query = "insert into tbl_forum_thread_mst values('" + threadid + "','" + post + "','" + userid + "','" + forumID + "','" + postDate + "')";
                    Database db = new Database();
                    db.Insert(query);
                    txtPost.Text = "";
                }
            }
            catch (Exception ex)
            {
                throw new Exception("View Form Error", ex);
            }
        }
    }
}