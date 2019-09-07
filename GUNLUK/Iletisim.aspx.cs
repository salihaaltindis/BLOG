using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;

namespace GUNLUK
{
    public partial class Iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("salihaaltnds94@gmail.com", "Saliha Altındiş"); //kimden
            message.To.Add(txtMail.Text); //kime
            message.Body = txtMesaj.Text;
            message.Subject = txtKonu.Text;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com",587);
            smtp.Credentials = new NetworkCredential("salihaaltnds94@gmail.com","****");
            smtp.EnableSsl = true;//guvenli baglantı için gerekli
            try
            {
                smtp.Send(message);
                lblSonuc.Text = "Mail gönderildi";
                txtAdıSoyadı.Text = "";
                txtKonu.Text = "";
                txtMail.Text = "";
                txtMesaj.Text = "";
            }
            catch(Exception hata)
            {
                lblSonuc.Text = "Mail gönderilemedi." + hata.Message;
            }
        }
    }
}