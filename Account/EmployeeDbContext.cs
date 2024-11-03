using System.Data.Entity;

namespace Townbush_Pharmacy_Website.Models
{
    public class EmployeeDbContext : DbContext
    {
        public EmployeeDbContext() : base("G2Pmb2024ConnectionString") // Ensure this matches your connection string
        {
        }

        public DbSet<Employee> Employees { get; set; }
    }
}
