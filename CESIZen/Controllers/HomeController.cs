using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using CESIZen.Models;
using CesiZen.Data;
using Microsoft.EntityFrameworkCore;

namespace CesiZen.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;
    private readonly CesiZenDbContext _context;

    public HomeController(ILogger<HomeController> logger, CesiZenDbContext context)
    {
        _logger = logger;
        _context = context;
    }

    public async Task<IActionResult> Index()
    {
        var activites = await _context.Activites.ToListAsync();
        return View(activites);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}