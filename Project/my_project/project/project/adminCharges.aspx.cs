using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class adminCharges : System.Web.UI.Page
    {
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

            Database db = new Database();
            DataSet dset = new DataSet();
            dset = db.getData("select * from charges");
            if (dset.Tables[0].Rows.Count > 0)
            {
                btnsubmit.Visible = false;
                btnupdate.Visible = true;
            }

            load();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            double maintenance = double.Parse(txtmaintenancecharge.Text);
            double municipalTax = double.Parse(txtmunicipalcharge.Text);
            double waterCharge = double.Parse(txtwatercharge.Text);
            double gymCharge = double.Parse(txtgymcharge.Text);
            double parkingCharge = double.Parse(txtparkingcharge.Text);
            double penalty = double.Parse(txtpenalty.Text);
            double interest = double.Parse(txtinterest.Text);
            string st = "insert into charges values(" + maintenance + "," + municipalTax + "," + waterCharge + "," + gymCharge + "," + parkingCharge + "," + penalty + ",'" + interest + "')";
            Database db = new Database();
            db.Insert(st);
            Response.Write(@"<script type='text/javascript'>alert('Values Applied Successfully');</script>");
            load();
            clear();
        }

        public void load()
        {
            string st = "select chargeid as 'Charge ID',maintenance as 'Maintenance',municipaltax as'MunicipalTax',watercharges as'WaterCharges',gymcharges as'GymCharges',parkingcharges as'ParkingCharges',penalty as'Penalty',interestrate as 'Interest' from charges";
            Database db = new Database();
            DataSet dset = new DataSet();
            dset = db.getData(st);
            gvcharges.DataSource = dset.Tables[0];
            gvcharges.DataBind();
        }

        public void clear()
        {
            txtmaintenancecharge.Text = "";
            txtmunicipalcharge.Text = "";
            txtwatercharge.Text = "";
            txtgymcharge.Text = "";
            txtparkingcharge.Text = "";
            txtpenalty.Text = "";
            txtinterest.Text = "";
        }

        int index = -1;
        protected void gvcharges_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            index = e.NewSelectedIndex;
            string id = gvcharges.Rows[index].Cells[1].Text;
            hdcharge.Value = id;
            string maintenance = gvcharges.Rows[index].Cells[2].Text;
            string municipaltax = gvcharges.Rows[index].Cells[3].Text;
            string watercharge = gvcharges.Rows[index].Cells[4].Text;
            string gymcharge = gvcharges.Rows[index].Cells[5].Text;
            string parkingcharge = gvcharges.Rows[index].Cells[6].Text;
            string penalty = gvcharges.Rows[index].Cells[7].Text;
            string interest = gvcharges.Rows[index].Cells[8].Text;


            txtmaintenancecharge.Text = maintenance;
            txtmunicipalcharge.Text = municipaltax;
            txtwatercharge.Text = watercharge;
            txtgymcharge.Text = gymcharge;
            txtparkingcharge.Text = parkingcharge;    
            txtpenalty.Text = penalty;
            txtinterest.Text = interest;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            string id = hdcharge.Value;

            double maintenance = double.Parse(txtmaintenancecharge.Text);
            double municipalTax = double.Parse(txtmunicipalcharge.Text);
            double waterCharge = double.Parse(txtwatercharge.Text);
            double gymCharge = double.Parse(txtgymcharge.Text);
            double parkingCharge = double.Parse(txtparkingcharge.Text);
            double penalty = double.Parse(txtpenalty.Text);
            double interest = double.Parse(txtinterest.Text);
            string st = "update charges set maintenance = " + maintenance + ",municipaltax=" + municipalTax + ",watercharges=" + waterCharge + ",gymcharges=" + gymCharge + ",parkingcharges=" + parkingCharge + ",penalty=" + penalty + ",interestrate=" + interest + " where chargeid = " + id;
            db.Insert(st);
            clear();
            load();
        }






    }
}