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

namespace AplicativosIT
{
    public partial class _Login : Page
    {
        String[] tableData = { "Modulo 1", "Nombre 1", "Accion 1"};
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AppendHeader("Cache-Control", "no-store");
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionLogin"].ToString());
        string Patron = "CGweb";

        protected void Login(object sender, EventArgs e)
        {
            try
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
                    Response.Redirect("Default.aspx");
                }
            } catch
            {

            }
        }



        private ArrayList CreateData()
        {
            ArrayList ds = new ArrayList();
            ds.Add("ASPxGridView and Editors");
            ds.Add("ASPxTreeList");
            ds.Add("ASPxCloudControl");
            ds.Add("ASPxHtmlEditor");
            ds.Add("ASPxPivotGrid");
            return ds;
        }

        const string UploadDirectory = "C:/uploads/";


        protected void UploadControl_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            string resultExtension = Path.GetExtension(e.UploadedFile.FileName);
            string resultFileName = Path.ChangeExtension(Path.GetRandomFileName(), resultExtension);
            string resultFileUrl = UploadDirectory + resultFileName;
            string resultFilePath = MapPath(resultFileUrl);
            e.UploadedFile.SaveAs(resultFilePath);

        }

        protected void DetailsView2_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }
    }
}