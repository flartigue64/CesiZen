using CesiZen.Data;
using CESIZen.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CESIZen.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    [Route("Admin/[controller]/[action]")]
    public class ActiviteAdminController : Controller
    {
        private readonly CesiZenDbContext _context;

        public ActiviteAdminController(CesiZenDbContext context)
        {
            _context = context;
        }

        // GET: Activite
        public async Task<IActionResult> Index()
        {
            var activite = await _context.Activites
                .ToListAsync();

            return View("~/Views/Admin/Activite/Index.cshtml", activite);
        }

        // GET: Activite/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var activity = await _context.Activites
                .FirstOrDefaultAsync(m => m.Id == id);
            if (activity == null)
            {
                return NotFound();
            }

            return View("~/Views/Admin/Activite/Details.cshtml", activity);
        }

        // GET: Activite/Create
        public IActionResult Create()
        {
            return View("~/Views/Admin/Activite/Create.cshtml");
        }

        // POST: Activite/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nom,Description,ContenuHtml")] Activite activite)
        {
            if (ModelState.IsValid)
            {
                _context.Add(activite);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View("~/Views/Admin/Activite/Create.cshtml", activite);
        }

        // GET: Activite/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var activite = await _context.Activites.FindAsync(id);
            if (activite == null)
            {
                return NotFound();
            }
            return View("~/Views/Admin/Activite/Edit.cshtml", activite);
        }

        // POST: Activite/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nom,Description,ContenuHtml")] Activite activite)
        {
            if (id != activite.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(activite);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ActiviteExists(activite.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View("~/Views/Admin/Activite/Edit.cshtml", activite);
        }

        // GET: Activite/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var activite = await _context.Activites
                .FirstOrDefaultAsync(m => m.Id == id);
            if (activite == null)
            {
                return NotFound();
            }

            return View("~/Views/Admin/Activite/Delete.cshtml", activite);
        }

        // POST: Activite/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var activite = await _context.Activites.FindAsync(id);
            if (activite != null)
            {
                _context.Activites.Remove(activite);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ActiviteExists(int id)
        {
            return _context.Activites.Any(e => e.Id == id);
        }
    }
}
