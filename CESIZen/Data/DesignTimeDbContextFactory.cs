using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using CesiZen.Data;

public class DesignTimeDbContextFactory : IDesignTimeDbContextFactory<CesiZenDbContext>
{
    public CesiZenDbContext CreateDbContext(string[] args)
    {
        var connectionString = "Server=127.0.0.1;Port=3306;Database=CESIZenDb;User=root;Password=MonMotDePasse123!;";

        var optionsBuilder = new DbContextOptionsBuilder<CesiZenDbContext>();
        optionsBuilder.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));

        return new CesiZenDbContext(optionsBuilder.Options);
    }
}
