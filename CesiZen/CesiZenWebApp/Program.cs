using Microsoft.EntityFrameworkCore;
using CesiZenModel.Context;
using CesiZenWebApp.Controllers;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllersWithViews();

// Ajouter HttpClient avec base address
builder.Services.AddHttpClient<ActiviteController>(client =>
{
    client.BaseAddress = new Uri("https://localhost:7270/"); // adapte selon ton projet/API
});

// Configurer base de données
builder.Services.AddDbContext<ZenDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Activer les sessions
builder.Services.AddSession();

var app = builder.Build();

app.UseSession();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
