using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

using AplicativosIT.Models;

namespace AplicativosIT.Logic
{
    public class Logic_user
    {
        public Users getUsers(string name_user, string password)
        {

            Users object_ = new Users();

            //cambiar cadena de conexion
            //data source = server, initial catalog= base de datos 
            using (SqlConnection conection = new SqlConnection("Data Source=DESKTOP-15H848K\\SQLEXPRESS ; Initial Catalog=Proyecto 2; Integrated Security=true"))
            {

                string query = "select name, lastname, name_user, password, rol from users where name_user = @pname_user and password = @ppassword";

                SqlCommand cmd = new SqlCommand(query, conection);
                cmd.Parameters.AddWithValue("@pname_user", name_user);
                cmd.Parameters.AddWithValue("@ppassword", password);
                cmd.CommandType = CommandType.Text;


                conection.Open();


                using (SqlDataReader dr = cmd.ExecuteReader())
                {

                    while (dr.Read())
                    {

                        object_ = new Users()
                        {
                            name = dr["name"].ToString(),
                            lastname = dr["lastname"].ToString(),
                            name_user = dr["name_user"].ToString(),
                            password = dr["password"].ToString(),
                            rol = (Rol)dr["rol"],

                        };
                    }

                }
            }
            return object_;
        }
    }
}