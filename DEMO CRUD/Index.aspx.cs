using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DEMO_CRUD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_Table();

            }
        }
        [WebMethod]
        public static void AddStudent(string id, string fullname, string email, string phone, string faculty)
        {
            String conString = "Data Source=DESKTOP-14TK5R3\\KYLINNGUYEN;Initial Catalog=Demo_CRUD;Integrated Security=True";
            SqlConnection connection = new SqlConnection(conString); 
            connection.Open();
            String insert_query = "INSERT INTO Students(id, fullname, email, phone, faculty) VALUES(@id, @fullname, @email, @phone, @faculty);";
            SqlCommand cmd = new SqlCommand(insert_query, connection);

            cmd.Parameters.AddWithValue("id", Int32.Parse(id));
            cmd.Parameters.AddWithValue("fullname", fullname);
            cmd.Parameters.AddWithValue("email", email);
            cmd.Parameters.AddWithValue("phone", phone);
            cmd.Parameters.AddWithValue("faculty", faculty);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        [WebMethod]
        public static void UpdateStudent(string id, string fullname, string email, string phone, string faculty)
        {
            String conString = "Data Source=DESKTOP-14TK5R3\\KYLINNGUYEN;Initial Catalog=Demo_CRUD;Integrated Security=True";
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            String insert_query = "UPDATE Students SET fullname=@fullname, email=@email, phone=@phone, faculty=@faculty WHERE id=@id";
            SqlCommand cmd = new SqlCommand(insert_query, connection);

            cmd.Parameters.AddWithValue("id", Int32.Parse(id));
            cmd.Parameters.AddWithValue("fullname", fullname);
            cmd.Parameters.AddWithValue("email", email);
            cmd.Parameters.AddWithValue("phone", phone);
            cmd.Parameters.AddWithValue("faculty", faculty);
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        
        public void load_Table()
        {
            String conString = "Data Source=DESKTOP-14TK5R3\\KYLINNGUYEN;Initial Catalog=Demo_CRUD;Integrated Security=True";
            SqlConnection connection = new SqlConnection(conString);

            connection.Open();
            String get_query = "Select * from Students;";
            SqlCommand cmd = new SqlCommand(get_query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            connection.Close();
        }

        [WebMethod]
        public static void DeleteStudent(string id)
        {
            String conString = "Data Source=DESKTOP-14TK5R3\\KYLINNGUYEN;Initial Catalog=Demo_CRUD;Integrated Security=True";
            SqlConnection connection = new SqlConnection(conString);
            connection.Open();
            String delete_query = "Delete Students WHERE id=@id";
            SqlCommand cmd = new SqlCommand(delete_query, connection);

            cmd.Parameters.AddWithValue("id", Int32.Parse(id));
            cmd.ExecuteNonQuery();
            connection.Close();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}