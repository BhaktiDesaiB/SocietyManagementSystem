using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class makecommiteemember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
        }
        public string st = "select wing as 'Wing',flatno as 'FlatNo',firstname as 'FirstName',lastname as 'Surname',mobile as 'Mobile_NO',usertype as 'UserType' from register1 inner join flatdetails on register1.mid=flatdetails.mid";
        public void load()
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

            Database db = new Database();
            DataSet dset = new DataSet();
            dset = db.getData(st);
            gvCommMember.DataSource = dset.Tables[0];
            gvCommMember.DataBind();

        }
        int index = -1;
        protected void gvCommMember_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            index = e.NewSelectedIndex;
            string id = gvCommMember.Rows[index].Cells[2].Text;
            hdcommember.Value = id;
            string member = gvCommMember.Rows[index].Cells[6].Text;
            ddlmember.SelectedValue = member;
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            String st1 = "select mid from flatdetails where flatno="+hdcommember.Value;
            DataSet dset = new DataSet();
            dset = db.getData(st1);
      
            string mid = dset.Tables[0].Rows[0]["mid"].ToString();
            string name = ddlmember.SelectedValue;
            string st = "update register1 set usertype = '" + name + "' where mid='" + mid+"'";
            db.Insert(st);
            clear();
            load();
        }

        private void clear()
        {
            ddlmember.SelectedIndex = -1;
        }
    }
}