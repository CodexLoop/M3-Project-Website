using System.ComponentModel.DataAnnotations;

namespace Townbush_Pharmacy_Website.Models
{
    public class Employee
    {
        public int EmpID { get; set; }

        [Required]
        [StringLength(50)]
        public string Username { get; set; }

        [Required]
        [StringLength(255)]
        public string PasswordHash { get; set; }

        [Required]
        [StringLength(50)]
        public string EmpFirstNames { get; set; }

        [Required]
        [StringLength(50)]
        public string EmpLastName { get; set; }

        [Required]
        [StringLength(10)]
        public string EmpContactNo { get; set; }

        [Required]
        [EmailAddress]
        [StringLength(255)]
        public string EmpEmailAddress { get; set; }

        [Required]
        [StringLength(50)]
        public string Position { get; set; }
    }
}
