using DevExpress.Web;
using DevExpress.XtraExport.Helpers;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AplicativosIT
{
    public partial class Registro : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void New_CardView(object sender, EventArgs e)
        {
            CardView.AddNewCard();
        }
        protected void simpleButton1_Click(object sender, EventArgs e)
        {
            gridView1.AddNewRow();
        }
        [System.Web.Services.WebMethod]
        protected void Close(object sender, EventArgs e)
        {
            CardView.CancelEdit();
        }
        protected void Update(object sender, EventArgs e)
        {
            CardView.UpdateEdit();
        }
    }
}