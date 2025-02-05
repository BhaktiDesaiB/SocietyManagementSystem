using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;

namespace project
{
    public partial class forgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string password;
        protected void btnreceive_Click(object sender, EventArgs e)
        {
            string st = "select password1 from register1 where emailid='" + txtsendpass.Text + "'";
            Database db = new Database();
            DataSet dset = new DataSet();
            dset = db.getData(st);


            if (dset.Tables.Count > 0)
            {
                if (dset.Tables[0].Rows.Count > 0)
                {
                    password = dset.Tables[0].Rows[0].ItemArray.GetValue(0).ToString();
                }
            }
            try
            {
                
                MailMessage message = new MailMessage();
                message.From = new MailAddress("nikunjchayya@gmail.com");
                message.To.Add(new MailAddress(txtsendpass.Text));
                message.Subject = "Password Reminder !!";
                message.IsBodyHtml = true;
                message.Body = "Dont reply on this ID this is computer generated .. Your password is :"+password;
                SmtpClient smt = new SmtpClient("smtp.gmail.com", 25); //465,587,25
                smt.EnableSsl = true;
                smt.Credentials = new System.Net.NetworkCredential("nikunjchayya@gmail.com", "nc@12345");
                smt.Send(message);
                Response.Write(@"<script type='text/javascript'>alert('Your Password has been send to your respective Email-ID');</script>");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Response.Write(@"<script type='text/javascript'>alert('Password was not send to your email, kindly contact support');</script>");
            }
            
            clear();
        }
        public void clear()
        {
            txtsendpass.Text = "";
        }
    }
}