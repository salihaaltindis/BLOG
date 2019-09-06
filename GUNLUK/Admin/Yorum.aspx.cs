using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUNLUK.Admin
{
    public partial class Yorum : System.Web.UI.Page
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

            GridView1.DataSource = db.VW_YAZI_YORUM.ToList();
            GridView1.DataBind();

            if (IsPostBack == false)
            {
                ddlYAZI_REFNO.DataSource = db.YAZIs.ToList();
                ddlYAZI_REFNO.DataTextField = "BASLIK";
                ddlYAZI_REFNO.DataValueField = "YAZI_REFNO";
                ddlYAZI_REFNO.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            YORUM k = db.YORUMs.Find(refno);

            if (k != null)
            {
                txtYORUM_REFNO.Text = k.YORUM_REFNO.ToString();
                ddlYAZI_REFNO.SelectedValue = k.YAZI_REFNO.ToString();
                txtMAIL.Text = k.MAIL;
                ddlDURUMU.SelectedValue = k.DURUMU.ToString();
                txtTARIH.Text = k.TARIH.ToString("dd.MM.yyyy");
                txtIP.Text = k.IP;
                txtICERIK.Text = k.ICERIK;
                txtADI_SOYADI.Text = k.ADI_SOYADI;


            }
            pnlYorumKayit.Visible = true;
            pnlYorumListele.Visible = false;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;//tıklanılan sayfa
            GridView1.DataSource = db.VW_YAZI_YORUM.Where(k => k.ICERIK.Contains(txtICERIK.Text)).ToList();
            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //vazgec
            GridView1.DataSource = db.VW_YAZI_YORUM.ToList();
            GridView1.DataBind();
            pnlYorumKayit.Visible = false;
            pnlYorumListele.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //yeni
            txtYORUM_REFNO.Text = "";
            ddlYAZI_REFNO.Text = "";
            txtMAIL.Text = "";
            ddlDURUMU.SelectedValue = "True";
            txtTARIH.Text = "";
            txtIP.Text = "";
            txtICERIK.Text = "";
            txtADI_SOYADI.Text = "";

            pnlYorumKayit.Visible = true;
            pnlYorumListele.Visible = false;
        }

        protected void btnYorumAra_Click(object sender, EventArgs e)
        {
            //ara
            GridView1.DataSource = db.VW_YAZI_YORUM.Where(k => k.ICERIK.Contains(txtYorumAra.Text)).ToList();
            GridView1.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //sil
            if (txtYORUM_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtYORUM_REFNO.Text);
                YORUM k = db.YORUMs.Find(refno);

                db.YORUMs.Remove(k);

                db.SaveChanges();

                GridView1.DataSource = db.VW_YAZI_YORUM.ToList();
                GridView1.DataBind();
                pnlYorumKayit.Visible = false;
                pnlYorumListele.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //kaydet
            if (txtYORUM_REFNO.Text != "") //ekranda kayıt varsa
            {
                int refno = Convert.ToInt32(txtYORUM_REFNO.Text);
                YORUM k = db.YORUMs.Find(refno);

                k.YORUM_REFNO = Convert.ToInt32(txtYORUM_REFNO.Text);
                k.YAZI_REFNO = Convert.ToInt32(ddlYAZI_REFNO.SelectedValue);
                k.MAIL = txtMAIL.Text;
                k.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);
                k.TARIH = Convert.ToDateTime(txtTARIH.Text);
                k.IP = txtIP.Text;
                k.ICERIK = HttpUtility.HtmlDecode(txtICERIK.Text);
                k.ADI_SOYADI = txtADI_SOYADI.Text;

                db.SaveChanges();
            }
            else
            {
                YORUM k = new YORUM();
                k.YORUM_REFNO = Convert.ToInt32(txtYORUM_REFNO.Text);
                k.YAZI_REFNO = Convert.ToInt32(ddlYAZI_REFNO.SelectedValue);
                k.MAIL = txtMAIL.Text;
                k.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);
                k.TARIH = Convert.ToDateTime(txtTARIH.Text);
                k.IP = txtIP.Text;
                k.ICERIK = HttpUtility.HtmlDecode(txtICERIK.Text);
                k.ADI_SOYADI = txtADI_SOYADI.Text;
                db.YORUMs.Add(k);//yeni kayıt dbset e ekleniyor.
                db.SaveChanges();
            }
            //degisikliklerin ekrana yansıtılması için
            GridView1.DataSource = db.VW_YAZI_YORUM.ToList();
            GridView1.DataBind();
            //kaydet i kapat listeyi ac
            pnlYorumKayit.Visible = false;
            pnlYorumListele.Visible = true;
        }
    }
}