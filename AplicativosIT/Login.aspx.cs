using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Collections;
using DevExpress.Web.Data;
using System.Data.SqlClient;
using System.Configuration;
using DevExpress.Web.ASPxRichEdit.Forms;

namespace AplicativosIT
{
    public partial class _Login : Page
    {
        String[] tableData = { "Modulo 1", "Nombre 1", "Accion 1"};
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Cache-Control", "no-store");
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Login"].ToString());
        string Patron = "CGweb";

        protected void Login(object sender, EventArgs e)
        {
                SqlCommand cmd = new SqlCommand("sp_login", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@Usuario", System.Data.SqlDbType.VarChar).Value = UserName.Text;
                cmd.Parameters.Add("@Clave", System.Data.SqlDbType.VarChar).Value = Password.Text;
                cmd.Parameters.Add("@Patron", System.Data.SqlDbType.VarChar).Value = Patron;
                con.Open();

                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.Read())
                {
                    Session["id_rol"] = rd[6].ToString();
                    Session["name_user"] = rd[1].ToString();
               
                var state = Session["state"] = rd[5].ToString();
                if (rd[6].ToString() == "1" && rd[5].ToString() == "True")
                    {
                        Response.Redirect("Admin.aspx");
                        Response.End();
                    }
                    else if (rd[6].ToString() == "2" && rd[5].ToString() == "True")
                    {
                        Response.Redirect("Designer.aspx");
                        Response.End();
                    }
                    else
                    {
                    string script = string.Format("alertaActive();");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", script, true);
                }
                }
                else
                {
                    string script = string.Format("alerta();");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", script, true);
                }
            cmd.Connection.Close();
            
        }

    }
}