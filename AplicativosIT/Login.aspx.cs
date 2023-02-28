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

namespace AplicativosIT
{
    public partial class _Login : Page
    {
        String[] tableData = { "Modulo 1", "Nombre 1", "Accion 1"};
        protected void Page_Load(object sender, EventArgs e)
        {
            Console.WriteLine(CreateData());
            Console.WriteLine("Pe causa");


            //ASPxFormLayout1_E5.Text = ASPxGridView1.VisibleRowCount.ToString();
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