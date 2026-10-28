using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace p9
{
    public partial class Comapanies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["PlacementDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                using (SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT PlacementId, StudentId, CompanyName, JobRole, PackageLPA FROM Placements", con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptCompanies.DataSource = dt;
                    rptCompanies.DataBind();

                    dlCompanies.DataSource = dt;
                    dlCompanies.DataBind();
                }
            }
        }
    }
}