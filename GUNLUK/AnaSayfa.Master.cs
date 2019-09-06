using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUNLUK
{
    public partial class AnaSayfa : System.Web.UI.MasterPage
    {
        BLOGEntities db = new BLOGEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataList1.DataSource = db.KATEGORIs.ToList();
            DataList1.DataBind();

            DataList2.DataSource = db.YAZIs.OrderByDescending(y=>y.TIKLANMA_SAYISI).Take(5).ToList();
            DataList2.DataBind();
        }
    }
}