using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using CesiZen.Data;

public class DesignTimeDbContextFactory : IDesignTimeDbContextFactory<CesiZenDbContext>
{
    public CesiZenDbContext CreateDbContext(string[] args)
    {
        var connectionString = "Server=127.0.0.1;Port=3306;Database=CESIZenDb;User=root;Password=MonMotDePasse123!;";

        var optionsBuilder = new DbContextOptionsBuilder<CesiZenDbContext>();
        
        // Use a specific MySQL version instead of ServerVersion.AutoDetect to avoid connection issues
        optionsBuilder.UseMySql(connectionString, new MySqlServerVersion(new Version(8, 0, 21)));

        return new CesiZenDbContext(optionsBuilder.Options);
    }
}