using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace project
{
    public partial class Home : System.Web.UI.MasterPage
    {
        public string theme;
        protected void Page_Load(object sender, EventArgs e)
        {
            hdLogin.Value = "false";
            User usr = (User)Session["user"];

            setting.Visible = false;
            admin.Visible = false;
            theme = "master";
            if (usr != null)
            {
                theme = usr.Theme;
                hdLogin.Value = "true";
                setting.Visible = true;
                admin.Visible = false;
                
                reports.Visible = false;

                if (usr.UserType.Equals("admin"))
                {
                   
                    reports.Visible = true;
                    admin.Visible = true;
                }
            }
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {

            hdLogin.Value = (false).ToString();
            Database db1 = new Database();
            DataSet dset1 = new DataSet();

            hdLogin.Value = "false";
            setting.Visible = false;

            dset1 = db1.getData("select * from register1 where emailid='" + txtid.Text + "' and password1='" + txtloginpass.Text + "' ");

            if (dset1.Tables.Count > 0)
            {
                if (dset1.Tables[0].Rows.Count > 0)
                {
                    string UserID = dset1.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();
                    string FirstName = dset1.Tables[0].Rows[0].ItemArray.GetValue(1).ToString();
                    string LastName = dset1.Tables[0].Rows[0].ItemArray.GetValue(2).ToString();
                    string EmailId = dset1.Tables[0].Rows[0].ItemArray.GetValue(3).ToString();
                    string Password = dset1.Tables[0].Rows[0].ItemArray.GetValue(4).ToString();
                    string Dob = dset1.Tables[0].Rows[0].ItemArray.GetValue(5).ToString();
                    string Gender = dset1.Tables[0].Rows[0].ItemArray.GetValue(6).ToString();
                    long MobileNo = long.Parse(dset1.Tables[0].Rows[0].ItemArray.GetValue(7).ToString());
                    long Landline = long.Parse(dset1.Tables[0].Rows[0].ItemArray.GetValue(8).ToString());
                    string UserType = dset1.Tables[0].Rows[0].ItemArray.GetValue(9).ToString();
                    string theme = dset1.Tables[0].Rows[0].ItemArray.GetValue(10).ToString();

                    User userObj = new User(UserID, FirstName, LastName, EmailId, Password, Dob, Gender, MobileNo, Landline, UserType,theme);

                    Session["user"] = userObj;
                    setting.Visible = true;
                    hdLogin.Value = "true";
                    this.theme = theme;
                   
                    reports.Visible = false;

                    if (userObj.UserType.Equals("admin"))
                    {

                        setting.Visible = true;
                       
                        reports.Visible = true;
                        admin.Visible = true;
                    }
                }

            }

        }
        public string fetchQuery = "select * from contactList";
        public void load()
        {
            Database db = new Database();
            DataSet dset = new DataSet();

            dset = db.getData(fetchQuery);

        }


    }
}