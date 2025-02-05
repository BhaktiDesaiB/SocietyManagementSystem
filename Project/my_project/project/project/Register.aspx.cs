using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace project
{
    public partial class Register : System.Web.UI.Page
    {
        string[] monthName = new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 1; i <= 31; i++)
            {
                ddlday.Items.Add(i + "");
            }
            foreach (string month in monthName)
            {
                ddlmonth.Items.Add(month);
            }
            for (int i = DateTime.Now.Year - 50; i <= DateTime.Now.Year; i++)
            {
                ddlyear.Items.Add(i + "");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Generate gen = new Generate();
            string mid = gen.newMID();
            string fname = txtfname.Text;
            string lname = txtlname.Text;
            string emailid = txtemail.Text;
            string password = txtpass.Text;
            string dob = ddlday.SelectedItem + " " + ddlmonth.SelectedItem + " " + ddlyear.SelectedItem;
            string gender = rbtnMale.Checked ? "Male" : "Female";
            long mobile = long.Parse(txtmobile.Text);
            long landline = long.Parse(txtlandline.Text);
            string usertype = ddlusertype.SelectedValue;
            string theme="master";

            string st = "insert into register1 values('" + mid + "','" + fname + "','" + lname + "','" + emailid + "','" + password + "','" + dob + "','" + gender + "'," + mobile + "," + landline + ",'" + usertype + "','"+theme+"')";

            Database db = new Database();
            db.Insert(st);
            Response.Write(@"<script type='text/javascript'>alert('Logged-In Successfully');</script>");
            clearAll();
            Response.Redirect("Home.aspx");
        }
        public void clearAll()
        {

            txtfname.Text = "";
            txtlname.Text = "";
            txtemail.Text = "";
            txtpass.Text = "";
            ddlday.SelectedIndex = -1;
            ddlmonth.SelectedIndex = -1;
            ddlyear.SelectedIndex = -1;
            rbtnMale.Checked = true;
            ddlusertype.SelectedIndex = -1;
            txtmobile.Text = "";
            txtlandline.Text = "";

        }
    }
}