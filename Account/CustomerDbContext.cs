using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Townbush_Pharmacy_Website.Account.Models;

namespace Townbush_Pharmacy_Website.Account
{
    public class CustomerDbContext : DbContext
    {
        // Specify the connection string name in the base constructor
        public CustomerDbContext() : base("G2Pmb2024ConnectionString") { }

        // DbSet for the Customer table
        public DbSet<Customer> Customer { get; set; }

        // Optional: Disable automatic database initialization if you want to use the existing database as-is
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            Database.SetInitializer<CustomerDbContext>(null);
            base.OnModelCreating(modelBuilder);
        }
    }
}