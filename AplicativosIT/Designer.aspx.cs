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
            if (Session["name_user"] != null)
            {
                String nombreUsuario = Session["name_user"].ToString();
                nombreUsuarioLog.Text = "Bienvenido " + nombreUsuario;
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void New_CardView(object sender, EventArgs e)
        {
            CardView.AddNewCard();
            CardView.SettingsBehavior.AllowFocusedCard = false;
        }
        protected void simpleButton1_Click(object sender, EventArgs e)
        {
            GridCard1.AddNewRow();
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
        protected void Salir(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
            Session.Remove("id_rol");
            Session.Remove("name_user");
        }
    }
}