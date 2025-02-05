using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class flat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User usr = (User)Session["user"];
                string st = "select * from flatdetails where mid ='" + usr.UserID + "'";
                Database db = new Database();
                DataSet dset = new DataSet();
                dset = db.getData(st);
                if (dset.Tables[0].Rows.Count > 0 && dset.Tables[0].Rows.Count > 0)
                {
                    var dt = dset.Tables[0].Rows[0];
                    ddl1.SelectedValue = dt["wing"].ToString().Trim();
                    ddl2.SelectedValue = dt["wheel2"].ToString().Trim();
                    ddl3.SelectedValue = dt["wheel4"].ToString().Trim();
                    txt1.Text = dt["flatno"].ToString().Trim();
                    txt2.Text = dt["sharecerti"].ToString().Trim();
                    ddlrent.SelectedValue = dt["rent"].ToString().Trim();
                    btnsubmit.Visible = false;
                }
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            User us = (User)Session["user"];
            string mid = us != null?us.UserID:"";
            string wing = ddl1.SelectedValue.ToString();
            long flatno = long.Parse(txt1.Text);
            string sharecerti = txt2.Text;
            int wheel2=int.Parse(ddl2.SelectedValue);
            int wheel4 = int.Parse(ddl3.SelectedValue);
            string rent = ddlrent.SelectedValue;
            string st = "insert into flatdetails values('"+mid+"','"+wing+"',"+flatno+",'"+sharecerti+"',"+wheel2+","+wheel4+",'"+rent+"')";
            db.Insert(st);
            Response.Write(@"<script type='text/javascript'>alert('Updated Successfully');</script>");
            clear();
        }
        public void clear()
        {
            ddl1.SelectedIndex = -1;
            ddl2.SelectedIndex = -1;
            ddl3.SelectedIndex = -1;
            ddlrent.SelectedIndex = -1;
            txt1.Text = "";
            txt2.Text="";
        }
    }
}