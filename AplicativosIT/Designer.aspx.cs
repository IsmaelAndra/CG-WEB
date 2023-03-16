using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AplicativosIT
{
    public partial class Login : Page
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
        protected void Close(object sender, EventArgs e)
        {
            Response.Redirect("Designer.aspx");
        }
        protected void Update(object sender, EventArgs e)
        {
            CardView.UpdateEdit();
            Response.Redirect("Designer.aspx");
        }
    }
}