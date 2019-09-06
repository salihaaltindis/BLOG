using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUNLUK.Admin
{
    public partial class Kullanici : System.Web.UI.Page
    {
        BLOGEntities db = new BLOGEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            //her form için bunu yapacaz yada master page yazcaz
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

            GridView1.DataSource = db.KULLANICIs.ToList();
            //tek farkı window formdan databind demek lazım
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            KULLANICI k = db.KULLANICIs.Find(refno);

            if (k != null)
            {
                txtKULLANICI_ADI.Text = k.KULLANICI_ADI;
                txtKULLANICI_REFNO.Text = k.KULLANICI_REFNO.ToString();
                txtPAROLA.Text = k.PAROLA;
                ddlDURUMU.SelectedValue = k.DURUMU.ToString();
            }
            //kayıt panelini ac liste panelini kapat
            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {//kaydet
            if (txtKULLANICI_REFNO.Text != "") //ekranda kayıt varsa
            {
                int refno = Convert.ToInt32(txtKULLANICI_REFNO.Text);
                KULLANICI k = db.KULLANICIs.Find(refno);
                k.KULLANICI_ADI = txtKULLANICI_ADI.Text;
                k.PAROLA = txtPAROLA.Text;
                k.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);
                db.SaveChanges();
            }
            else
            {
                KULLANICI k = new KULLANICI();
                k.KULLANICI_ADI = txtKULLANICI_ADI.Text;
                k.PAROLA = txtPAROLA.Text;
                k.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);
                db.KULLANICIs.Add(k);//yeni kayıt dbset e ekleniyor.
                db.SaveChanges();
            }
            //degisikliklerin ekrana yansıtılması için
            GridView1.DataSource = db.KULLANICIs.ToList();
            GridView1.DataBind();
            //kaydet i kapat listeyi ac
            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //vazgec
            GridView1.DataSource = db.KULLANICIs.ToList();
            GridView1.DataBind();
            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //yeni
            txtKULLANICI_ADI.Text = "";
            txtKULLANICI_REFNO.Text = "";
            txtPAROLA.Text = "";
            ddlDURUMU.SelectedValue = "True";

            //kayıt panelini ac liste panelini kapat
            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ara
            GridView1.DataSource = db.KULLANICIs.Where(k => k.KULLANICI_ADI.Contains(txtAra.Text)).ToList();
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;//tıklanılan sayfa
            GridView1.DataSource = db.KULLANICIs.Where(k => k.KULLANICI_ADI.Contains(txtAra.Text)).ToList();
            GridView1.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //sil
            if (txtKULLANICI_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtKULLANICI_REFNO.Text);
                KULLANICI k = db.KULLANICIs.Find(refno);

                db.KULLANICIs.Remove(k);

                db.SaveChanges();

                GridView1.DataSource = db.KULLANICIs.ToList();
                GridView1.DataBind();
                pnlKayit.Visible = false;
                pnlListe.Visible = true;
            }

        }
    }
}