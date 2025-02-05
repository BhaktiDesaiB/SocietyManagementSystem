using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class bookingSystem : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                string[] monthName = new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
                for (int i = 1; i <= 31; i++)
                {
                    ddlday.Items.Add(i + "");
                    ddlday1.Items.Add(i + "");

                }
                foreach (string month in monthName)
                {
                    ddlmonth.Items.Add(month);
                    ddlmonth1.Items.Add(month);
                }

                for (int i = DateTime.Now.Year + 1; i >= DateTime.Now.Year; i--)
                {

                    ddlyear.Items.Add(i + "");
                    ddlyear1.Items.Add(i + "");
                } 
            }
            load();
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
                Database db = new Database();
            User usr = (User)Session["user"];
            string mid = usr != null ? usr.UserID : "";
            string purpose = txtpurpose.Text;
            string datef = ddlday.SelectedValue + " " + ddlmonth.SelectedValue + " " + ddlyear.SelectedValue;
            //string slot = slot1.Text.ToString() + "  " + slot2.Text.ToString() + "  " + slot3.Text.ToString();
            string datet = ddlday1.SelectedValue + " " + ddlmonth1.SelectedValue + " " + ddlyear1.SelectedValue;

            //string st = "insert into booking values('" + mid + "','" + purpose + "','" + datef + "','" + datet + "','" + slot + "') ";
            string st = "insert into booking(mid,purpose,fromdate,tilldate) values('" + mid + "','" + purpose + "','" + datef + "','" + datet + "') ";
            db.Insert(st);
            clear();
            load();
        }
        public void clear()
        {
            txtpurpose.Text = "";
            ddlday.SelectedIndex = -1;
            ddlday1.SelectedIndex = -1;
            ddlmonth.SelectedIndex = -1;
            ddlmonth1.SelectedIndex = -1;
            ddlyear.SelectedIndex = -1;
            ddlyear1.SelectedIndex = -1;
            //slot1.Checked = false;
            //slot2.Checked = false;
            //slot3.Checked = false;

        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        public void load()
        {
            string st = "select wing as 'Wing',flatno as 'FlatNo',firstname as 'First Name',lastname as 'Surname',CONVERT(varchar,fromdate,103) as 'From',CONVERT(varchar,tilldate,103) as 'Till'  from register1 inner join booking on register1.mid=booking.mid inner join flatdetails on register1.mid=flatdetails.mid";
            Database db = new Database();
            DataSet dset = new DataSet();
            dset = db.getData(st);
            gvbooking.DataSource = dset.Tables[0];
            gvbooking.DataBind();
        }

        protected void rbtn_CheckChanged(object sender, EventArgs e)
        {
            if (rbt1.Checked)
            {
                ddlday1.SelectedValue = ddlday.SelectedValue;
                ddlmonth1.SelectedValue = ddlmonth.SelectedValue;
                ddlyear1.SelectedValue = ddlyear.SelectedValue;
                ddlday1.Enabled = ddlmonth1.Enabled = ddlyear1.Enabled = false;
            }
            else
            {
                ddlday1.Enabled = ddlmonth1.Enabled = ddlyear1.Enabled = true;
            }
        }

    }
}