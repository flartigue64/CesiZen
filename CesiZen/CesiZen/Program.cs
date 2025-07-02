using CesiZenModel.Context;
using CesiZenDomain.Services;
using CesiZenInfrastructure.Repositories;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Configuration de Kestrel pour écouter sur toutes les interfaces réseau
/*builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(5094);  // Cela permet d'écouter sur l'adresse IP locale
});*/

var connectionString =
    builder.Configuration.GetConnectionString("DefaultConnection")
        ?? throw new InvalidOperationException("Connection string"
        + "'DefaultConnection' not found.");

// Configuration des services et des dépendances...
builder.Services.AddDbContext<ZenDbContext>(options =>
    options.UseSqlServer(connectionString));

builder.Services.AddAuthentication(IdentityConstants.ApplicationScheme)
    .AddIdentityCookies();
builder.Services.AddAuthorizationBuilder();

builder.Services.AddIdentityCore<User>()
    .AddEntityFrameworkStores<ZenDbContext>()
    .AddApiEndpoints();

builder.Services.AddScoped<UtilisateurRepository>();
builder.Services.AddScoped<UtilisateurService>();
builder.Services.AddScoped<RoleRepository>();
builder.Services.AddScoped<RoleService>();
builder.Services.AddScoped<ActiviteMetadataRepository>();
builder.Services.AddScoped<ActiviteMetadataService>();
builder.Services.AddScoped<ActiviteRepository>();
builder.Services.AddScoped<ActiviteService>();
builder.Services.AddScoped<ArticleRepository>();
builder.Services.AddScoped<ArticleService>();

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.MapIdentityApi<User>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();

app.MapControllers();

app.Run();