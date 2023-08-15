﻿using Clinic_Mgmt.MODEL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Clinic_Mgmt.VIEWS
{
    public partial class getdoctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRadGrid();
            }
        }

        protected void BindRadGrid()
        {
            doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();
            //RadGrid2.DataSource = obj.getdata();
            RadGrid2.DataBind();
        }


        protected void RadGrid2_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int doctorId = Convert.ToInt32((e.Item as GridEditableItem).GetDataKeyValue("d_id"));
                Response.Redirect("update.aspx?id=" + doctorId);
            }
            else if (e.CommandName == "Delete")
            {
                int doctorId = Convert.ToInt32((e.Item as GridDataItem).GetDataKeyValue("d_id"));

                doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();
                obj.Delete(doctorId);

                RadGrid2.Rebind();
            }
           
        }

        protected void RadGrid2_ItemEdit(object sender, GridCommandEventArgs e)
        {
            int doctorId = Convert.ToInt32((e.Item as GridEditableItem).GetDataKeyValue("id"));
            Response.Redirect("update.aspx?id=" + doctorId);
        }

        protected void RadGrid2_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditableItem editedItem = e.Item as GridEditableItem;
            int doctorId = Convert.ToInt32(editedItem.GetDataKeyValue("id"));

            TextBox txtName = editedItem.FindControl("txtEditName") as TextBox;
            TextBox txtContact = editedItem.FindControl("txtEditContact") as TextBox;
            TextBox txtEmail = editedItem.FindControl("txtEditEmail") as TextBox;

            Doctor updatedDoctor = new Doctor
            {
                id = doctorId,
                name = txtName.Text,
                contact = txtContact.Text,
                email = txtEmail.Text
            };

            doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();
            obj.Update(updatedDoctor);

            RadGrid2.Rebind();
        }

        protected void RadGrid2_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            int doctorId = Convert.ToInt32((e.Item as GridDataItem).GetDataKeyValue("id"));

            doctorbusinesslogiclayer obj = new doctorbusinesslogiclayer();
            obj.Delete(doctorId);

            RadGrid2.Rebind();
        }





    }
}