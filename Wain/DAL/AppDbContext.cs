using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Wain.Models;

namespace Wain.DAL
{
    public class AppDbContext: IdentityDbContext<AppUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> option):base(option)
        {
            
        }

        public DbSet<Car> Cars { get; set; }
        public DbSet<Agent> Agents { get; set; }
        public DbSet<Color> Colors { get; set; }
        public DbSet<CarImage> CarImages { get; set; }
        public DbSet<FuelType> FuelTypes { get; set; }
        public DbSet<BodyStyle> BodyStyles { get; set; }
        public DbSet<Settings> Settings { get; set; }
        public DbSet<Slide> Slides { get; set; }
        public DbSet<ServiceCustom> ServiceCustoms { get; set; }
        public DbSet<Contact> Contacts { get; set; }


    }
}
