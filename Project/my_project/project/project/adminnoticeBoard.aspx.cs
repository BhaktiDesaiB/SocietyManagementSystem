using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class adminnoticeBoard : System.Web.UI.Page
    {
        string[] monthName = new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
       
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

            if (!Page.IsPostBack)
            {
                ddlDay.Items.Clear();
                ddlMonth.Items.Clear();
                ddlYear.Items.Clear();

                for (int i = 1; i <= 31; i++)
                {
                    ddlDay.Items.Add(i + "");
                }
                foreach (string month in monthName)
                {
                    ddlMonth.Items.Add(month);
                }
                for (int i = DateTime.Now.Year; i <= DateTime.Now.Year; i++)
                {
                    ddlYear.Items.Add(i + "");
                }
            }
            load();
        }
        public void load()
        {
            Database db = new Database();
            DataSet dset = new DataSet();
            dset = db.getData("select noticeId as 'ID',noticeMsg as 'Notice',convert(varchar,noticeDate,106) as 'Date' from notice");
            gvnotice.DataSource = dset.Tables[0];
            gvnotice.DataBind();
        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            string noticemsg = txtNotice.Text;
            string don = ddlDay.SelectedItem + " " + ddlMonth.SelectedItem + " " + ddlYear.SelectedItem;
            string st = "insert into notice values('" + noticemsg + "','" + don + "')";
            db.Insert(st);
            clear();
            load();
        }
        public void clear()

        {
            txtNotice.Text = "";
            ddlDay.SelectedIndex = -1;
            ddlMonth.SelectedIndex = -1;
            ddlYear.SelectedIndex = -1;
        }
        int index=-1;
        protected void gvnotice_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
         
            index = e.NewSelectedIndex;
            string id = gvnotice.Rows[index].Cells[1].Text;
            hdNoticeId.Value = id;
            string noticeMsg = gvnotice.Rows[index].Cells[2].Text;
            string date = gvnotice.Rows[index].Cells[3].Text;
            txtNotice.Text = noticeMsg;

            string[] dob = date.Split(' ');
            int indexMonth = -1;
            for (int i = 0; i < monthName.Length; i++)
            {
                if (dob[1].Equals(monthName[i].Substring(0,3)))
                {
                    indexMonth = i;
                    break;
                }
            }

            ddlDay.SelectedIndex = int.Parse(dob[0]) - 1;
            ddlMonth.SelectedIndex = indexMonth;
            ddlYear.SelectedIndex = ddlYear.Items.IndexOf(new ListItem(dob[2]));
       
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            string id = hdNoticeId.Value;
            string notice = txtNotice.Text;
            string don = ddlDay.SelectedItem + " " + ddlMonth.SelectedItem + " " + ddlYear.SelectedItem;
            string st = "update notice set  noticeMsg= '" + notice + "',noticeDate= '"+ don +"' where noticeId = " + id;
            db.Insert(st);
            clear();
            load();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            string id = hdNoticeId.Value;
            string st = "delete from  notice where noticeId = " + id;
            db.Insert(st);
            clear();
            load();
        }
    }
}