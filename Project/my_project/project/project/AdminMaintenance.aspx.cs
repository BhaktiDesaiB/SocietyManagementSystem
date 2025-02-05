using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace project
{
    public partial class AdminMaintenance : System.Web.UI.Page
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


            if (!IsPostBack)
            {
                foreach (string month in monthName)
                {
                    ddlMonth.Items.Add(month);
                    ddlBillMonth.Items.Add(month);
                } 
            }
        }

        protected void btnBill_Click(object sender, EventArgs e)
        {
            try
            {
                string monthNameS = ddlMonth.SelectedItem.ToString();
                int year = int.Parse(txtYear.Text);

                string query = "select * from tbl_bill_mst where billMonth='" + monthNameS + "' and billYear=" + year;
                Database db = new Database();
                DataSet dset = new DataSet();
                dset = db.getData(query);

                gvBill.DataSource = dset.Tables[0];
                gvBill.DataBind();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        protected void btnGenerateBill_Click(object sender, EventArgs e)
        {
            try
            {
                string mid = "";
                string monthFor = ddlBillMonth.SelectedItem.ToString();
                int yearFor = int.Parse(txtBillYear.Text);


                Database db = new Database();
                DataSet dset = new DataSet();
                dset = db.getData("Select mid from register1");

                for (int i = 0; i < dset.Tables[0].Rows.Count; i++)
                {
                    mid = dset.Tables[0].Rows[i].ItemArray.GetValue(0).ToString();
                    db.Insert("exec dbo.generateBillFor '" + mid + "','" + monthFor + "'," + yearFor);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        int index = -1;
        protected void gvBill_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            index = e.NewSelectedIndex;
            string id = gvBill.Rows[index].Cells[1].Text;
            hdbill.Value = id;
            string maintenance = gvBill.Rows[index].Cells[2].Text;
            string municipaltax = gvBill.Rows[index].Cells[3].Text;
            string watercharge = gvBill.Rows[index].Cells[4].Text;
            string gymcharge = gvBill.Rows[index].Cells[5].Text;
            string parkingcharge = gvBill.Rows[index].Cells[6].Text;
            string miscellaneous = gvBill.Rows[index].Cells[7].Text;
            string total = gvBill.Rows[index].Cells[8].Text;
            string amountDue = gvBill.Rows[index].Cells[9].Text;
            string interest = gvBill.Rows[index].Cells[10].Text;
            string discount = gvBill.Rows[index].Cells[11].Text;
            string totalAmount = gvBill.Rows[index].Cells[12].Text;
            string billmonth = gvBill.Rows[index].Cells[13].Text;
            string billyear = gvBill.Rows[index].Cells[14].Text;
            string billpaid = gvBill.Rows[index].Cells[16].Text;

            txtid.Text = id;
            txtmaintenance.Text = maintenance;
            txtmunicipal.Text = municipaltax;
            TextBox3.Text = watercharge;
            TextBox4.Text = gymcharge;
            TextBox5.Text = parkingcharge;
            TextBox6.Text = miscellaneous;
            TextBox7.Text = total;
            TextBox8.Text = amountDue;
            TextBox9.Text = interest;
            TextBox10.Text = discount;
            TextBox11.Text = totalAmount;
            TextBox12.Text = billmonth;
            TextBox13.Text = billyear;
            ddlpaid.SelectedIndex = billpaid.Equals("NO")?2:1;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Database db = new Database();
            DataSet dset = new DataSet();
            string st1="select mid from register1 ";
            dset=db.getData(st1);



            string mid = dset.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();

            string billid=hdbill.Value;
            double maintenance =double.Parse( txtmaintenance.Text);
            double municipaltax =double.Parse( txtmunicipal.Text);
            double watercharge =double.Parse( TextBox3.Text);
            double gymcharge =double.Parse( TextBox4.Text);
            double parkingcharge =double.Parse( TextBox5.Text);
            double miscellaneous =double.Parse( TextBox6.Text);
            double total = double.Parse(TextBox7.Text);
            double amountDue = double.Parse(TextBox8.Text);
            double interest = double.Parse(TextBox9.Text);
            double discount = double.Parse(TextBox10.Text);
            double totalAmount = double.Parse(TextBox11.Text);
            string billmonth=TextBox12.Text;
            double billyear=double.Parse(TextBox13.Text);
            string billpaid = ddlpaid.SelectedValue;

            string st = "update tbl_bill_mst set maintenance='" + maintenance + "',municipaltax='" + municipaltax + "',watercharges='" + watercharge + "',gymcharges='" + gymcharge + "',parkingcharges='" + parkingcharge + "',miscellaneous='" + miscellaneous + "',total='" + total + "',amountDue='" + amountDue + "',interest='" + interest + "',dicount='" + discount + "',totalAmount='" + totalAmount + "',billMonth='" + billmonth + "',billYear=" + billyear + ",mid='" + mid + "',billpaid='" + billpaid + "' where billid='"+billid+"'";
                       db.Insert(st);
            
        }
    }
}