using Microsoft.AspNetCore.Mvc;

namespace CesiZenWebApp.Controllers
{
    public class SharedController : Controller
    {
        public IActionResult _Layout()
        {
            var id = HttpContext.Session.GetInt32("Id");
            var RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.Id = id;
            ViewBag.RoleId = RoleId;
            return View();
        }

    }
}
