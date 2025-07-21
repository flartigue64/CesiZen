using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace CesiZen.Data
{
    public class DesignTimeDbContextFactory : IDesignTimeDbContextFactory<CesiZenDbContext>
    {
        public CesiZenDbContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<CesiZenDbContext>();
            optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=CESIZenDb;Trusted_Connection=True;");

            return new CesiZenDbContext(optionsBuilder.Options);
        }
    }
}
