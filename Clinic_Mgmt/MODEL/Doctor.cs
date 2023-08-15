using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clinic_Mgmt.MODEL
{
    public class Doctor
    {
        public int id { get; set; }

        public string name { get; set; }
        public string contact { get; set; }

        public string email { get; set; }

        public DateTime dob { get; set; }
    }
}