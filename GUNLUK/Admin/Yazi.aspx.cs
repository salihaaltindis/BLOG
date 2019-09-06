using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUNLUK.Admin
{
    public partial class Yazi : System.Web.UI.Page
    {
        BLOGEntities db = new BLOGEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = db.VW_YAZI.ToList();
            GridView1.DataBind();

            if (IsPostBack == false)
            {
                ddlKATEGORI_REFNO.DataSource = db.KATEGORIs.ToList();
                ddlKATEGORI_REFNO.DataTextField = "KATEGORI_ADI";
                ddlKATEGORI_REFNO.DataValueField = "KATEGORI_REFNO";
                ddlKATEGORI_REFNO.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value);
            YAZI y = db.YAZIs.Find(refno);
            if (y != null)
            {
                txtYAZI_REFNO.Text = y.YAZI_REFNO.ToString();
                txtTIKLANMA_SAYISI.Text = y.TIKLANMA_SAYISI.ToString();
                txtTARIH.Text = y.TARIH.ToString("dd.MM.yyyy");
                txtOZET.Text = y.OZET;
                txtICERIK.Text = y.ICERIK;
                txtBASLIK.Text = y.BASLIK;
                ddlDURUMU.SelectedValue = y.DURUMU.ToString();
                ddlKATEGORI_REFNO.SelectedValue = y.KATEGORI_REFNO.ToString();
                //fileUploadRESIM eklenecek
            }
            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;//tıklanılan sayfa
            GridView1.DataSource = db.VW_YAZI.Where(k => k.BASLIK.Contains(txtYaziAra.Text)).ToList();
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //kaydet
            if (txtYAZI_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtYAZI_REFNO.Text);
                YAZI y = db.YAZIs.Find(refno);
                y.BASLIK = txtBASLIK.Text;
                y.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);
                y.ICERIK = HttpUtility.HtmlDecode(txtICERIK.Text);
                y.OZET = txtOZET.Text;
                y.KATEGORI_REFNO = Convert.ToInt32(ddlKATEGORI_REFNO.SelectedValue);
                y.TARIH = Convert.ToDateTime(txtTARIH.Text);
                y.TIKLANMA_SAYISI = Convert.ToInt32(txtTIKLANMA_SAYISI.Text);

                db.SaveChanges();
            }
            else
            {
                YAZI y = new YAZI();
                y.BASLIK = txtBASLIK.Text;
                y.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);
                y.ICERIK = HttpUtility.HtmlDecode(txtICERIK.Text);
                y.OZET = txtOZET.Text;
                y.KATEGORI_REFNO = Convert.ToInt32(ddlKATEGORI_REFNO.SelectedValue);
                y.TARIH = Convert.ToDateTime(txtTARIH.Text);
                y.TIKLANMA_SAYISI = Convert.ToInt32(txtTIKLANMA_SAYISI.Text);

                db.YAZIs.Add(y);
                db.SaveChanges();
            }
            GridView1.DataSource = db.VW_YAZI.ToList();
            GridView1.DataBind();
            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //vazgeç
            GridView1.DataSource = db.VW_YAZI.ToList();
            GridView1.DataBind();
            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Sil
            if (txtYAZI_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtYAZI_REFNO.Text);
                YAZI y = db.YAZIs.Find(refno);
                db.YAZIs.Remove(y);
                db.SaveChanges();

                GridView1.DataSource = db.VW_YAZI.ToList();
                GridView1.DataBind();
                pnlKayit.Visible = false;
                pnlListe.Visible = true;
            }
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ara
            GridView1.DataSource = db.VW_YAZI.Where(y => y.BASLIK.Contains(txtYaziAra.Text)).ToList();
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //yeni
            txtYAZI_REFNO.Text = "";
            txtTIKLANMA_SAYISI.Text = "";
            txtTARIH.Text = "";
            txtOZET.Text = "";
            txtICERIK.Text = "";
            txtBASLIK.Text = "";
            
           
            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }
    }
}