using AppointmentWorkshop.DOMAIN.Entities;
using Microsoft.EntityFrameworkCore;

namespace AppointmentWorkshop.INFRASTRUCTURE.Connection
{
    public class PostgreSQLContext : DbContext
    {
        public DbSet<City> City { get; private set; }

        public DbSet<Country> Country { get; private set; }


        public PostgreSQLContext(DbContextOptions<PostgreSQLContext> options) : base(options)
        {
            City = Set<City>();
            Country = Set<Country>();

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Country>().Property(country => country.CreationDate).ValueGeneratedOnAdd();
            modelBuilder.Entity<Country>().Property(country => country.UpdateDate).ValueGeneratedOnAddOrUpdate();
        }
    }
}

