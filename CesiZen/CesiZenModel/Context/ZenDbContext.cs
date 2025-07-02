using CesiZenModel.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CesiZenModel.Context
{
    public class ZenDbContext : IdentityDbContext<User>
    {
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Utilisateur> Utilisateurs { get; set; } = null!;
        public virtual DbSet<ActiviteMetadata> ActiviteMetadata { get; set; } = null!;
        public virtual DbSet<Activite> Activites { get; set; } = null!;
        public virtual DbSet<Article> Articles { get; set; } = null!;

        public ZenDbContext(DbContextOptions<ZenDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Configuration supplémentaire si nécessaire
            builder.Entity<User>(entity =>
            {
                entity.Property(e => e.FirstName).IsRequired().HasMaxLength(100);
                entity.Property(e => e.LastName).IsRequired().HasMaxLength(100);
            });
        }
    }
}
