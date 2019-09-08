using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUNLUK.Admin
{
    public partial class Sayfa : System.Web.UI.Page
    {
        BLOGEntities db = new BLOGEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["GIRIS_YETKI"] == null)
            {
                Response.Redirect("Giris.aspx");
            }
            else
            {
                if (Convert.ToBoolean(Session["GIRIS_YETKI"]) == false)
                {
                    Response.Redirect("Giris.aspx");
                }
            }

            GridView1.DataSource = db.SAYFAs.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            SAYFA s = db.SAYFAs.Find(refno);

            if (s != null)
            {
                txtSAYFA_REFNO.Text = s.SAYFA_REFNO.ToString();
                txtICERIK.Text = s.ICERIK;
                txtBASLIK.Text = s.BASLIK;
            }
            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;//tıklanılan sayfa
            GridView1.DataSource = db.SAYFAs.Where(k => k.ICERIK.Contains(txtSayfaAra.Text)).ToList();
            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //vazgec
            GridView1.DataSource = db.SAYFAs.ToList();
            GridView1.DataBind();
            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //yeni
            txtSAYFA_REFNO.Text = "";
            txtBASLIK.Text = "";
            txtICERIK.Text = "";


            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ara
            GridView1.DataSource = db.SAYFAs.Where(k => k.ICERIK.Contains(txtSayfaAra.Text)).ToList();
            GridView1.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //sil
            if (txtSAYFA_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtSAYFA_REFNO.Text);
                SAYFA s = db.SAYFAs.Find(refno);

                db.SAYFAs.Remove(s);

                db.SaveChanges();

                GridView1.DataSource = db.SAYFAs.ToList();
                GridView1.DataBind();
                pnlKayit.Visible = false;
                pnlListe.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //kaydet
            if (txtSAYFA_REFNO.Text != "") //ekranda kayıt varsa
            {
                int refno = Convert.ToInt32(txtSAYFA_REFNO.Text);
                SAYFA s = db.SAYFAs.Find(refno);

                s.SAYFA_REFNO = Convert.ToInt32(txtSAYFA_REFNO.Text);
                s.BASLIK = txtBASLIK.Text;
                s.ICERIK = HttpUtility.HtmlDecode(txtICERIK.Text);
                db.SaveChanges();
            }
            else
            {
                SAYFA s = new SAYFA();
                s.BASLIK = txtBASLIK.Text;
                s.ICERIK = HttpUtility.HtmlDecode(txtICERIK.Text);
                db.SaveChanges();
                db.SAYFAs.Add(s);//yeni kayıt dbset e ekleniyor.
                db.SaveChanges();
            }
            //degisikliklerin ekrana yansıtılması için
            GridView1.DataSource = db.SAYFAs.ToList();
            GridView1.DataBind();
            //kaydet i kapat listeyi ac
            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }
    }
}