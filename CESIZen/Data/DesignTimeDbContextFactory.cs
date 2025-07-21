using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using CESIZen.Data;

public class DesignTimeDbContextFactory : IDesignTimeDbContextFactory<CesiZenDbContext>
{
    public CesiZenDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<CesiZenDbContext>();

        // Remplace la chaîne de connexion par celle de SQL Server
        optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=CESIZenDb;Trusted_Connection=True;");

        return new CesiZenDbContext(optionsBuilder.Options);
    }
}
