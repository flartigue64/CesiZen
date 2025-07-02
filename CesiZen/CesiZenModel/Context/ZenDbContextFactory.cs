using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using CesiZenModel.Context;

public class ZenDbContextFactory : IDesignTimeDbContextFactory<ZenDbContext>
{
    public ZenDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<ZenDbContext>();
        optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=CesiZen;Trusted_Connection=True;");

        return new ZenDbContext(optionsBuilder.Options);
    }
}
