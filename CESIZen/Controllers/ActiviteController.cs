using CesiZen.Data;
using CESIZen.Migrations;
using CESIZen.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CESIZen.Controllers
{
    [Route("[controller]/[action]")]
    public class ActiviteController : Controller
    {
        private readonly CesiZenDbContext _context;

        public ActiviteController(CesiZenDbContext context)
        {
            _context = context;
        }

        // GET: ActiviteController
        public async Task<ActionResult> Activity()
        {
            var activite = await _context.Activites
                .ToListAsync();
            return View("~/Views/Activite/Activity.cshtml", activite);
        }

        // GET: Activite/Details/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Details(int id)
        {
            var activite = await _context.Activites.FirstOrDefaultAsync(a => a.Id == id);

            if (activite == null)
            {
                return NotFound();
            }

            return View("~/Views/Activite/Details.cshtml", activite);
        }

    }
}
