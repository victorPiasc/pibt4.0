using System;
using Pibt.Common;

namespace Pibt
{
   public partial class OpenEnrollmentRegister: SortaBasePage {
      protected void Page_Load(object sender, EventArgs e)
      {
      }

      protected void Register_Click(object sender, EventArgs e)
      {
         Register.Enabled = false;
         string firstName = fname.Text;
         string lastname = lname.Text;
         string cCompany = company.Text;
         string Cemail = email.Text;
         string Cphone = phone.Text;
         string Cdnl = dnl.SelectedItem.Text;
         int indexdnl = dnl.SelectedIndex;
         string guest1 = null;
         string guest2 = null;
         string guest3 = null; ;
         int count =1;
         string subject;
         string body;
         string body2;

         if (!string.IsNullOrEmpty(fname1.Text) && !string.IsNullOrEmpty(lname1.Text))
         {
            guest1 = fname1.Text + " " + lname1.Text;
            count++;
         }
         if (!string.IsNullOrEmpty(fname2.Text) && !string.IsNullOrEmpty(lname2.Text))
         {
            guest2 = fname2.Text + " " + lname2.Text;
            count++;
         }
         if (!string.IsNullOrEmpty(fname3.Text) && !string.IsNullOrEmpty(lname3.Text))
         {
            guest3 = fname3.Text + " " + lname3.Text;
            count++;
         }

         subject = string.Format(Utilities.Us() + "’s Annual Benefits Introduction Meeting registration for {0} at {1}",count, Cdnl);
         
         body = "Hello " + firstName + " " + lastname + ", <br/><br/>" +
             "Thank you for registering online for " + Utilities.Us() + "’s Annual Benefits Introduction Meeting.<br/><br/> You registered for:<br/>" +
             Cdnl + "<br/>";        
         if (count > 1)
         {
            body += "<br/>You have invited " + (count - 1).ToString() + " guest(s):<br/>";
            if (!string.IsNullOrEmpty(guest1) )
            {
               body += guest1 + "<br/>";
            }
            if (!string.IsNullOrEmpty(guest2))
            {
               body += guest2 + "<br/>";
            }
            if (!string.IsNullOrEmpty(guest3) )
            {
               body += guest3 + "<br/>";
            }
         }
         body += "<br/>We look forward to seeing you.<br/><br/> Best Regards,<br/><br/> " + Utilities.Us();

         Utilities.SendMail(ApplicationConfiguration.SystemMailSender, Cemail, subject, body);

         body2 = "Name: " + firstName + " " + lastname+"<br/>";
         body2 += "Company Name: "+cCompany+"<br/>";
         body2 += "Email Address: "+ Cemail+"<br/>";
         body2 += "Phone Number: " + Cphone+"<br/>";
         body2 += "Date and Location: "+Cdnl+"<br/>";
         if (!string.IsNullOrEmpty(guest1))
         {
            body2 +="Guest 1: "+ guest1 + "<br/>";
         }
         if (!string.IsNullOrEmpty(guest2))
         {
            body2 +="Guest 2: "+ guest2 + "<br/>";
         }
         if (!string.IsNullOrEmpty(guest3))
         {
            body2 += "Guest 3: "+guest3 + "<br/>";
         }

         Utilities.SendMail(ApplicationConfiguration.SystemMailSender, "rsvp-pibt@piasc.org", subject, body2);

         message.Text = Utilities.FormatAlertInfo("Registration Successful");
         message.Visible = true;
      }
   }
}