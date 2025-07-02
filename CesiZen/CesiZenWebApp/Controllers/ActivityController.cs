using System.Text.Json;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Mvc;

namespace CesiZenWebApp.Controllers
{
    public class ActiviteController : Controller
    {
        private readonly HttpClient _httpClient;

        public ActiviteController(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri("https://localhost:7270/"); // local
            //_httpClient.BaseAddress = new Uri("http://10.64.128.176:5094/"); // cesi
            //_httpClient.BaseAddress = new Uri("http://192.168.0.184:5094/"); // Ledeuix
            //_httpClient.BaseAddress = new Uri("http://192.168.1.13:5094/"); // Pau
        }

        public async Task<IActionResult> ViewPage()
        {

            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.ActivityId = HttpContext.Session.GetInt32("ActivityId");

            Console.WriteLine($"ActivityId :{HttpContext.Session.GetInt32("ActivityId")}");


            return View();
        }

        public async Task<IActionResult> Activity()
        {
            var activities = await GetAllActivities();
            ViewData["Activities"] = activities;
            ViewData["NumberActivity"] = activities.Count;

            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");

            Console.WriteLine($"RoleId : {HttpContext.Session.GetInt32("RoleId")}");

            return View();
        }

        public IActionResult CreateActivity()
        {
            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewActivity([Bind("Nom,Description")] Activite activite)
        {
            Console.WriteLine($"Activity : {activite}");
            Console.WriteLine($"ModelState.IsValid : {ModelState.IsValid}");
            Console.WriteLine($"nom : {activite.Nom}, Description : {activite.Description}, ContenuHtml : {activite.ContenuHtml}");
            if (!ModelState.IsValid)
            {
                foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
                {
                    Console.WriteLine(error.ErrorMessage);
                }
            }
            if (ModelState.IsValid)
            {
                activite.ContenuHtml = $"<h1>{activite.Nom}</h1><p>{activite.Description}</p>";

                Console.WriteLine($"Activité envoyée : {activite.Nom}");

                var response = await _httpClient.PostAsJsonAsync("api/Activite", activite);

                if (response.IsSuccessStatusCode)
                {
                    var created = await response.Content.ReadFromJsonAsync<ActiviteDto>();

                    if (created != null)
                    {
                        HttpContext.Session.SetInt32("ActivityId", created.Id);
                        HttpContext.Session.SetString("ActivityName", created.Nom);
                        HttpContext.Session.SetString("ActivityDescription", created.Description);
                        HttpContext.Session.SetString("ContenuHtml", created.ContenuHtml);
                        TempData["Message"] = "Création réussie !";

                        return RedirectToAction("DynamicActivity", new { id = created.Id });
                    }
                }
                else
                {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    TempData["Message"] = $"Erreur lors de la création : {response.ReasonPhrase} - {errorContent}";
                    return RedirectToAction("CreateActivity");
                }
            }

            return RedirectToAction("CreateActivity");
        }

        public async Task<IActionResult> DynamicActivity(int id)
        {
            var activity = await GetActivity(id);
            if (activity == null)
                return NotFound("Activité non trouvée.");

            HttpContext.Session.SetInt32("ActivityId", activity.Id);
            HttpContext.Session.SetString("ActivityName", activity.Nom);

            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.ActivityId = activity.Id;
            ViewBag.Title = activity.Nom;
            ViewBag.Content = activity.ContenuHtml ?? "";

            return View("~/Views/Activite/ViewPage.cshtml");
        }

        public async Task<IActionResult> DynamicActivity2(int id)
        {
            var activity = await GetActivity(id);
            if (activity == null)
                return NotFound("Activité non trouvée.");

            HttpContext.Session.SetInt32("ActivityId", activity.Id);
            HttpContext.Session.SetString("ActivityName", activity.Nom);

            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.Title = activity.Nom;
            ViewBag.Content = activity.ContenuHtml ?? "";

            return View("~/Views/Activite/Editable.cshtml");
        }

        [HttpPost]
        public async Task<IActionResult> SaveActivityContent(string Title, string Content)
        {
            var activityId = HttpContext.Session.GetInt32("ActivityId");
            if (activityId == null)
                return RedirectToAction("Activity");

            var updatedActivity = new
            {
                Id = activityId,
                Nom = Title,
                ContenuHtml = Content
            };

            var response = await _httpClient.PatchAsJsonAsync($"api/Activite/{activityId}", updatedActivity);

            if (response.IsSuccessStatusCode)
            {
                TempData["Message"] = "Activité mise à jour avec succès !";
                return RedirectToAction("DynamicActivity", new { id = activityId });
            }

            TempData["Message"] = "Erreur lors de la mise à jour.";
            return RedirectToAction("DynamicActivity", new { id = activityId });
        }

        public async Task<IActionResult> historic()
        {
            var id = HttpContext.Session.GetInt32("Id");
            var roleId = HttpContext.Session.GetInt32("RoleId");

            if (id == null)
                return RedirectToAction("Login", "Account");

            var activitiesMeta = await GetAllActivitiesMetaUser(id.Value);
            ViewData["ActivitiesMeta"] = activitiesMeta;
            ViewBag.Id = id;
            ViewBag.RoleId = roleId;

            return View();
        }

        public async Task<IActionResult> LoadActivity(int id, string redirectTo)
        {
            var activity = await GetActivity(id);
            if (activity != null)
                return RedirectToAction("DynamicActivity", new { id = id });

            return RedirectToAction("Activity");
        }

        [HttpPost]
        public async Task<IActionResult> CreateActivityMetadata(ActiviteMetadata activityMeta)
        {
            activityMeta.ActiviteId = HttpContext.Session.GetInt32("ActivityId") ?? 0;
            activityMeta.UtilisateurId = HttpContext.Session.GetInt32("Id") ?? 0;
            activityMeta.DatePubli = DateTime.UtcNow;
            activityMeta.Nom = $"{DateTime.UtcNow:yyyy-MM-dd} - {HttpContext.Session.GetString("ActivityName")}";

            var response = await _httpClient.PostAsJsonAsync("api/ActiviteMetadata", activityMeta);

            if (response.IsSuccessStatusCode)
            {
                TempData["Message"] = "Envoi réussi !";
                return RedirectToAction("Activity");
            }
            else
            {
                var errorContent = await response.Content.ReadAsStringAsync();
                TempData["Message"] = $"Erreur : {response.ReasonPhrase} - {errorContent}";
                return RedirectToAction("Activity");
            }
        }

        // Helpers privés
        private async Task<ActiviteDto?> GetActivity(int idActivity)
        {
            Console.WriteLine($"IdActivity : {idActivity}");
            var response = await _httpClient.GetAsync($"api/Activite/{idActivity}");

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();

                if (!string.IsNullOrWhiteSpace(content))
                {
                    try
                    {
                        return JsonSerializer.Deserialize<ActiviteDto>(content, new JsonSerializerOptions
                        {
                            PropertyNameCaseInsensitive = true
                        });
                    }
                    catch (JsonException ex)
                    {
                        Console.WriteLine($"Erreur de désérialisation JSON : {ex.Message}");
                    }
                }
                else
                {
                    Console.WriteLine("Réponse vide de l'API lors de la récupération de l'activité.");
                }
            }
            else
            {
                Console.WriteLine($"API retourne : {response.StatusCode}");
                var err = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"Contenu erreur : {err}");
            }

            return null;
        }


        private async Task<List<ActiviteDto>> GetAllActivities()
        {
            var response = await _httpClient.GetAsync("api/Activite");
            return response.IsSuccessStatusCode
                ? await response.Content.ReadFromJsonAsync<List<ActiviteDto>>() ?? new List<ActiviteDto>()
                : new List<ActiviteDto>();
        }

        private async Task<List<ActiviteMetadataDto>> GetAllActivitiesMetaUser(int idUser)
        {
            var response = await _httpClient.GetAsync($"api/ActiviteMetadata/User/{idUser}");
            return response.IsSuccessStatusCode
                ? await response.Content.ReadFromJsonAsync<List<ActiviteMetadataDto>>() ?? new List<ActiviteMetadataDto>()
                : new List<ActiviteMetadataDto>();
        }
    }
}
