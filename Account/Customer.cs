using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations; // Import this namespace for [Key] attribute
using System.ComponentModel.DataAnnotations.Schema;

namespace Townbush_Pharmacy_Website.Account.Models
{
    [Table("Customer")] // Map to the exact table name in the database
    public class Customer
    {
        [Key]
        public string CustID { get; set; }             // Primary key
        public string CustFirstNames { get; set; }
        public string CustLastName { get; set; }
        public DateTime DOB { get; set; }
        public string ContactNo { get; set; }
        public string Address { get; set; }
        public string CustEmailAddress { get; set; }
        public bool? hasMedicalAid { get; set; }
        public string MedAidName { get; set; }
        public string MainMemberID { get; set; }
        public string PolicyNo { get; set; }
        public string PlanType { get; set; }
    }
}