using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Clinic_Mgmt.MODEL
{
    public class doctorbusinesslogiclayer
    {
        private string connectionstring = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
        
        public void Add(Doctor d)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            try
            {
                
                SqlCommand cmd = new SqlCommand("sp_insert_doctor", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@d_name", SqlDbType.NVarChar, 50).Value = d.name;
                cmd.Parameters.Add("@d_contact", SqlDbType.NVarChar, 50).Value = d.contact;
                cmd.Parameters.Add("@d_email", SqlDbType.NVarChar, 50).Value = d.email;
                cmd.Parameters.Add("@d_dateofbirth", SqlDbType.DateTime).Value = d.dob;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch(Exception)
            {
                throw;
            }
            finally
            {
                conn.Close();
            }


        

        }

        //Get Data method.......
        public List<Doctor> getdata()
        {
            List<Doctor> li = new List<Doctor>();
            SqlConnection conn = new SqlConnection(connectionstring);
            try
            {
                SqlCommand cmd = new SqlCommand("sp_getdata_mod", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read()) 
                {
                    Doctor d = new Doctor();
                    d.id = Convert.ToInt32(rdr.GetValue(0));

                    d.name = rdr.GetValue(1).ToString();
                    d.contact = rdr.GetValue(2).ToString();
                    d.email = rdr.GetValue(3).ToString();
                    d.dob = ((DateTime)rdr.GetValue(4)).Date;



                    li.Add(d);
                
                }

            
            }
            catch (Exception)
            {

                throw;
            }
            finally
            { 
                conn.Close(); 
            }


         







            return li;
        }

        //get by id
        public Doctor Find(int?id)
        {
            Doctor d = new Doctor();
            SqlConnection conn = new SqlConnection(connectionstring);
            try
            {

                SqlCommand cmd = new SqlCommand("select d_name as 'Name',d_contact as 'Contact',d_email as 'Email', d_dateofbirth as 'dob' from tbl_doctor where d_id=" + id, conn);
               // cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read()) 
                {
                    d.name = rdr.GetValue(0).ToString();
                    d.contact = rdr.GetValue(1).ToString();
                    d.email = rdr.GetValue(2).ToString();
                    d.dob = Convert.ToDateTime(rdr.GetValue(3).ToString());
                }
            }
            catch (Exception)
            {
                //throw;
            }
            finally
            {
                conn.Close();
            }

            return d;


        }

        //update
        public void Update(Doctor d)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            try
            {
                SqlCommand cmd = new SqlCommand("sp_update_doctor", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@d_id", SqlDbType.Int).Value = d.id; // Assuming the ID is part of the Doctor object
                cmd.Parameters.Add("@d_name", SqlDbType.NVarChar, 50).Value = d.name;
                cmd.Parameters.Add("@d_contact", SqlDbType.NVarChar, 50).Value = d.contact;
                cmd.Parameters.Add("@d_email", SqlDbType.NVarChar, 50).Value = d.email;
                cmd.Parameters.Add("@d_dateofbirth", SqlDbType.DateTime).Value = d.dob;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
                throw;
            }
            finally
            {
                conn.Close();
            }
        }

        //Delete
        public void Delete(int id)
        {
            SqlConnection conn = new SqlConnection(connectionstring);
            try
            {
                SqlCommand cmd = new SqlCommand("sp_delete_doctor", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@d_id", SqlDbType.Int).Value = id;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                conn.Close();
            }
        }






    }
}