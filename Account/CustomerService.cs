using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Townbush_Pharmacy_Website.Account.Models;

namespace Townbush_Pharmacy_Website.Account
{
    public class CustomerService
    {
        // Method to check if a customer exists in the Customer database
        public Customer CheckCustomerByEmail(string email)
        {
            using (var customerContext = new CustomerDbContext())
            {
                // Query the customer database for an existing email
                var existingCustomer = customerContext.Customer
                                        .FirstOrDefault(c => c.CustEmailAddress == email);
                return existingCustomer;
            }
        }
    }
}