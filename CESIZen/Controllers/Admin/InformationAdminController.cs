using CesiZen.Data;
using CESIZen.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CESIZen.Controllers.Admin
{
    [Authorize(Roles = "Admin")]
    [Route("Admin/[controller]/[action]")]
    public class InformationAdminController : Controller
    {
        private readonly CesiZenDbContext _context;

        public InformationAdminController(CesiZenDbContext context)
        {
            _context = context;
        }

        // GET: Admin/Articles
        public async Task<IActionResult> Index()
        {
            var articles = await _context.Articles
             .ToListAsync();

            return View("~/Views/Admin/Information/Index.cshtml", articles);
        }

        // GET: Admin/Articles/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articles = await _context.Articles
                .FirstOrDefaultAsync(m => m.Id == id);

            if (articles == null)
            {
                return NotFound();
            }

            return View("~/Views/Admin/Information/Details.cshtml", articles);
        }

        // GET: Admin/Articles/Create
        public IActionResult Create()
        {
            return View("~/Views/Admin/Information/Create.cshtml");
        }

        // POST: Admin/Articles/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Titre,Contenu")] Article article)
        {
            if (ModelState.IsValid)
            {
                _context.Add(article);
                await _context.SaveChangesAsync();
                TempData["Success"] = "L'article a été créée avec succès.";
                return RedirectToAction(nameof(Index));
            }
            return View("~/Views/Admin/Information/Create.cshtml", article);
        }

        // GET: Admin/Articles/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var article = await _context.Articles.FindAsync(id);
            if (article == null)
            {
                return NotFound();
            }

            return View("~/Views/Admin/Information/Edit.cshtml", article);
        }

        // POST: Admin/Articles/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Titre,Contenu")] Article article)
        {
            if (id != article.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(article);
                    await _context.SaveChangesAsync();
                    TempData["Success"] = "L'information a été modifiée avec succès.";
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!InformationExists(article.Id))
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
            return View("~/Views/Admin/Information/Edit.cshtml", article);
        }

        private bool InformationExists(int id)
        {
            return _context.Articles.Any(e => e.Id == id);
        }

        // GET: Admin/Articles/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var article = await _context.Articles
                .FirstOrDefaultAsync(m => m.Id == id);
            if (article == null)
            {
                return NotFound();
            }

            return View("~/Views/Admin/Information/Delete.cshtml", article);
        }

        // POST: Admin/Articles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var article = await _context.Articles.FindAsync(id);
            if (article != null)
            {
                _context.Articles.Remove(article);
                await _context.SaveChangesAsync();
                TempData["Success"] = "L'article a été supprimée avec succès.";
            }
            return RedirectToAction(nameof(Index));
        }


    }
}
