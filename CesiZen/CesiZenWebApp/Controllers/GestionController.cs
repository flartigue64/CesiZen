using Microsoft.AspNetCore.Mvc;

namespace CesiZenWebApp.Controllers
{
    public class GestionController : Controller
    {

        public IActionResult AppGestion()
        {
            var id = HttpContext.Session.GetInt32("Id");
            var RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.Id = id;
            ViewBag.RoleId = RoleId;
            return View();
        }


    }

}
