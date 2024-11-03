using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Townbush_Pharmacy_Website.Models; // Adjust to match your actual namespace

public class ApplicationRoleManager : RoleManager<IdentityRole>
{
    public ApplicationRoleManager(IRoleStore<IdentityRole, string> roleStore)
        : base(roleStore)
    {
    }

    public static ApplicationRoleManager Create(IdentityFactoryOptions<ApplicationRoleManager> options, IOwinContext context)
    {
        var roleStore = new RoleStore<IdentityRole>(context.Get<EmployeeDbContext>()); // Replace YourDbContext with your actual DbContext class
        return new ApplicationRoleManager(roleStore);
    }
}
