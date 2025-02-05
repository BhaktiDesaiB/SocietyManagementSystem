using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class addContacts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User usr=(User)Session["user"];
            if (usr==null)
            {
                Response.Redirect("PleaseLoginadmin.aspx");
            }
            else
            {
                if (usr!=null)
                {
                    if (usr.UserType.Equals("Member"))
                    {
                        Response.Redirect("PleaseLoginadmin.aspx");
                    }
                    else
                    {
                           
                    }
                }
            }
                load();
             
        }

        public string fetchQuery = "select contactId as 'ID',name as 'Name',designation as 'Designation', contactno as 'Contact Number' from contactList";
        public void load()
        {
            Database db = new Database();
            DataSet dset = new DataSet();

            dset = db.getData(fetchQuery);

            gvContact.DataSource = dset.Tables[0];
            gvContact.DataBind();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            string name = txtname.Text.Trim();
            string designaton = ddldesignation.SelectedValue;
            long contact = long.Parse(txtcontact.Text);
            string st="insert into contactList(name,designation,contactno) values('"+name+"','"+designaton+"','"+contact+"')";
            db.Insert(st);
            clearAll();
            load();

        }

        public void clearAll()
        {
            txtname.Text = "";
            txtcontact.Text = "";
            ddldesignation.SelectedIndex = -1;
        
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        int index = -1;
        protected void gvContact_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            index = e.NewSelectedIndex;
            string id = gvContact.Rows[index].Cells[1].Text;
            hdContactId.Value = id;
            string name=gvContact.Rows[index].Cells[2].Text;
            string designation=gvContact.Rows[index].Cells[3].Text;
            string contact = gvContact.Rows[index].Cells[4].Text;
            txtname.Text = name;
            txtcontact.Text = contact;
            int tempIndex = ddldesignation.Items.IndexOf(new ListItem(designation));
            ddldesignation.SelectedIndex = tempIndex;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            string id = hdContactId.Value;
            string name = txtname.Text;
            string designaton = ddldesignation.SelectedValue;
            long contact = long.Parse(txtcontact.Text);
            string st = "update contactList set name = '" + name + "',designation ='" + designaton + "',contactno=" + contact + " where contactid = "+id;
            db.Insert(st);
            clearAll();
            load();

        }

    }
}