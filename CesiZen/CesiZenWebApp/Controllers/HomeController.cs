using System.Diagnostics;
using CesiZenInfrastructure.Dto;
using System.Net.Http;
using CesiZenWebApp.Models;
using Microsoft.AspNetCore.Mvc;

namespace CesiZenWebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly HttpClient _httpClient;

        public HomeController(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri("https://localhost:7270/"); // local
            //_httpClient.BaseAddress = new Uri("http://10.64.128.176:5094/"); // cesi
            //_httpClient.BaseAddress = new Uri("http://192.168.0.184:5094/"); // Ledeuix
            //_httpClient.BaseAddress = new Uri("http://192.168.1.13:5094/"); // Pau
        }

        public async Task<IActionResult> Index()
        {
            var activities = await GetAllActivities();
            ViewData["Activities"] = activities;
            var email = HttpContext.Session.GetString("UserEmail");
            var password = HttpContext.Session.GetString("UserPassword");
            var prenom = HttpContext.Session.GetString("UserPrenom");
            var id = HttpContext.Session.GetInt32("Id");
            var RoleId = HttpContext.Session.GetInt32("RoleId");

            ViewBag.Email = email;
            ViewBag.Password = password;
            ViewBag.Prenom = prenom;
            ViewBag.Id = id;
            ViewBag.RoleId = RoleId;

            return View();
        }

        private async Task<List<ActiviteDto>> GetAllActivities()
        {
            var response = await _httpClient.GetAsync("api/Activite");
            return response.IsSuccessStatusCode
                ? await response.Content.ReadFromJsonAsync<List<ActiviteDto>>() ?? new List<ActiviteDto>()
                : new List<ActiviteDto>();
        }



        public IActionResult Privacy()
        {
            return View();
        }
    }
}
