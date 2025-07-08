using CesiZen.Data;
using CESIZen.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CESIZen.Controllers
{
    [Route("[controller]/[action]")]
    public class InformationController : Controller
    {
        private readonly CesiZenDbContext _context;

        public InformationController(CesiZenDbContext context)
        {
            _context = context;
        }

        // GET: /Articles
        public async Task<IActionResult> Index()
        {
            var articles = await _context.Articles
                .ToListAsync();

            return View("~/Views/Information/Index.cshtml", articles);
        }

        // GET: /Articles/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var articles = await _context.Articles
                .FirstOrDefaultAsync(i => i.Id == id);

            if (articles == null) return NotFound();

            return View("~/Views/Information/Details.cshtml", articles);
        }
    }
}
