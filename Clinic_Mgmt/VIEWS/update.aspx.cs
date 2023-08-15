using Clinic_Mgmt.MODEL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinic_Mgmt.VIEWS
{
    public partial class update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    TXTID.Text = Request.QueryString["id"];
                    

                    // Trigger the Button1_Click event
                    Button1_Click(null, EventArgs.Empty);

                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            doctorbusinesslogiclayer db = new doctorbusinesslogiclayer();
            Doctor d = db.Find(Convert.ToInt32(TXTID.Text));
            if (d == null)
            {
                Response.Write("<script> alert('Record Not Found') </script>");
            }
            else
            {
                txtname.Text = d.name;
                txtcontact.Text = d.contact;
                txtemail.Text = d.email;
                TXTDOB.Text = d.dob.ToString();

            }
        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Doctor d = new Doctor();
            d.name = txtname.Text;
            d.email = txtemail.Text;
            d.contact = txtcontact.Text;


            if (DateTime.TryParse(TXTDOB.Text, out DateTime dob))
            {
                d.dob = dob.Date;
            }
            else
            {
             
                Response.Write("<script> alert('Invalid Date of Birth format'); </script>");
                return;
            }

            int doctorID = Convert.ToInt32(TXTID.Text);
            d.id = doctorID; 

            doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();

            try
            {
                obj.Update(d); 
                Response.Write("<script> alert('Data updated successfully!'); </script>");
                Response.Redirect("getdoctors.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Error updating data: " + ex.Message + "'); </script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int doctorID = Convert.ToInt32(TXTID.Text);

            doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();

            try
            {
                obj.Delete(doctorID);
                Response.Write("<script> alert('Doctor deleted successfully!'); </script>");
                Response.Redirect("getdoctors.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Error deleting doctor: " + ex.Message + "'); </script>");
            }
        }


    }
}