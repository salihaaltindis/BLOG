using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUNLUK
{
    public partial class YaziDetay : System.Web.UI.Page
    {
        BLOGEntities db = new BLOGEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request["yazi_refno"] != null)
            {
                int refno = Convert.ToInt32(Request["yazi_refno"]);
                YAZI y = db.YAZIs.Find(refno);

                if (y!=null)
                {
                    Label1.Text = y.BASLIK;
                    Label2.Text = y.ICERIK;
                }
                else
                {
                    Label1.Text = "";
                    Label2.Text = "";
                }
            }
            else
            {
                Label1.Text = "";
                Label2.Text = "";
            }
        }
    }
}