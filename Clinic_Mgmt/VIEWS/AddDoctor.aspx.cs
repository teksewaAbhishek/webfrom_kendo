using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clinic_Mgmt.MODEL;

namespace Clinic_Mgmt.VIEWS
{
    public partial class AddDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /*
                protected void Button1_Click(object sender, EventArgs e)
                {

                    Doctor d = new Doctor();
                    d.name = txtname.Text;
                    d.email = txtemail.Text;
                    d.contact = txtcontact.Text;
                    d.dob = Convert.ToDateTime(dob.SelectedDate.ToShortDateString());
                    doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();
                    try
                    {
                        obj.Add(d);
                        Response.Redirect("getdoctors.aspx");
                    }
                    catch
                    {
                        Response.Write("<script> alert('data could not be insert in database..'); </script>");

                        //throw;
                    }



                    // Response.Write(dob.SelectedDate.ToShortDateString());
                }*/

        protected void Button1_Click(object sender, EventArgs e)
        {
            Doctor d = new Doctor();
            d.name = txtname.Text;
            d.email = txtemail.Text;
            d.contact = txtcontact.Text;

            if (dob.SelectedDate.HasValue)
            {
                d.dob = dob.SelectedDate.Value;
            }

            doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();

            try
            {
                obj.Add(d);
                Response.Redirect("getdoctors.aspx");
            }
            catch
            {
                Response.Write("<script> alert('Data could not be inserted into the database.'); </script>");
                // Handle the exception or display an error message as needed
            }
        }

    }
}