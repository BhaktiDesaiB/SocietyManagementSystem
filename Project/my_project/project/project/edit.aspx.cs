using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                string[] monthName = new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
                for (int i = 1; i <= 31; i++)
                {
                    ddlday.Items.Add(i + "");
                }
                foreach (string month in monthName)
                {
                    ddlmonth.Items.Add(month);
                }
                for (int i = DateTime.Now.Year - 75; i <= DateTime.Now.Year; i++)
                {
                    ddlyear.Items.Add(i + "");
                }

                for (int i = 1; i < 11; i++)
                {
                    ddlmember.Items.Add(i + "");
                } 
            }


            User usr = (User) Session["user"];

            if (usr != null)
            {
                txt1.Text = usr.FirstName;
                string st = "select nomineename,CONVERT(varchar,dobn,103) as dobn,no_of_members  from edit_details where mid ='" + usr.UserID+"'";
                Database db = new Database();
                DataSet dset = new DataSet();
                dset = db.getData(st);
                if (dset.Tables.Count > 0 && dset.Tables[0].Rows.Count > 0)
                {
                    txt2.Text = dset.Tables[0].Rows[0]["nomineename"].ToString().Trim();
                    string[] dob = dset.Tables[0].Rows[0]["dobn"].ToString().Trim().Split('/');
                    ddlday.SelectedValue = dob[0];
                    ddlmonth.SelectedIndex = Convert.ToInt32(dob[1]);
                    ddlyear.SelectedValue =dob[2];
                    ddlmember.SelectedValue = dset.Tables[0].Rows[0]["no_of_members"].ToString().Trim();
                    btnsubmit.Visible = false;
                }
            }
        }
        public void clearAll()
        {
            txt1.Text = "";
            txt2.Text = "";
             ddlmember.SelectedIndex = -1;
            ddlday.SelectedIndex = -1;
            ddlmonth.SelectedIndex = -1;
            ddlyear.SelectedIndex = -1;
            
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            User us = (User)Session["user"];
            string mid = us != null ? us.UserID : "";
            string nomineename = txt2.Text;
            string dobn = ddlday.SelectedValue + "" + ddlmonth.SelectedValue + "" + ddlyear.SelectedValue;
            int members = int.Parse(ddlmember.SelectedValue);

                string st = "insert into edit_details values('" + mid + "','" + nomineename + "','" + dobn + "'," + members + ")";
                db.Insert(st);
                Response.Write(@"<script type='text/javascript'>alert('Inserted Successfully');</script>");
         
        }
        public void clear()
        {
            txt2.Text = "";
            ddlday.SelectedIndex = -1;
            ddlmonth.SelectedIndex = -1;
            ddlyear.SelectedIndex = -1;
            ddlmember.SelectedIndex = -1;
        }
    }
}