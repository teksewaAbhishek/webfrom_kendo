using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinic_Mgmt.VIEWS
{
    public partial class editing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int doctorId = Convert.ToInt32(Request.QueryString["id"]);
                    // Fetch doctor record using doctorId and populate input fields
                   // PopulateInputFields(doctorId);
                }
            }
        }

       /* private void PopulateInputFields(int doctorId)
        {
            // Fetch doctor record using doctorId and populate input fields
            doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();
            Doctor doctor = obj.GetDoctorById(doctorId); // Implement this method

            if (doctor != null)
            {
                txtName.Text = doctor.name;
                txtContact.Text = doctor.contact;
                txtEmail.Text = doctor.email;
                // Populate other input fields
            }
        }*/


    }
}