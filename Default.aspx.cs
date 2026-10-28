using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace p9
{
    public partial class Default : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PlacementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
                LoadSummary();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            using (SqlDataAdapter da = new SqlDataAdapter(
                "SELECT StudentId, EnrollmentNo, StudentName, Department, PassingYear, IsPlaced FROM Students", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvPlacements.DataSource = dt;
                gvPlacements.DataBind();
            }
        }

        private void LoadSummary()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                int total, placed;
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Students", con))
                    total = Convert.ToInt32(cmd.ExecuteScalar());

                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Students WHERE IsPlaced = 1", con))
                    placed = Convert.ToInt32(cmd.ExecuteScalar());

                decimal highest = 0;
                using (SqlCommand cmd = new SqlCommand("SELECT MAX(PackageLPA) FROM Placements", con))
                {
                    object r = cmd.ExecuteScalar();
                    if (r != null && r != DBNull.Value) highest = Convert.ToDecimal(r);
                }

                int unplaced = total - placed;
                double pct = total == 0 ? 0 : (placed * 100.0) / total;

                lblTotal.Text = total.ToString();
                lblPlaced.Text = placed.ToString();
                lblUnplaced.Text = unplaced.ToString();
                lblPercentage.Text = pct.ToString("0.00") + " %";
                lblHighestPackage.Text = highest.ToString("0.00");
            }
        }
    }
}