using System.Text.Json;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Mvc;

namespace CesiZenWebApp.Controllers
{
    public class ArticleController : Controller
    {
        private readonly HttpClient _httpClient;

        public ArticleController(HttpClient httpClient)
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
            ViewBag.ArticleId = HttpContext.Session.GetInt32("ArticleId");

            Console.WriteLine($"ArticleId :{HttpContext.Session.GetInt32("ArticleId")}");


            return View();
        }

        public async Task<IActionResult> Article()
        {
            var articles = await GetAllArticles();
            ViewData["Articles"] = articles;
            ViewData["NumberArticle"] = articles.Count;

            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");

            Console.WriteLine($"RoleId : {HttpContext.Session.GetInt32("RoleId")}");

            return View();
        }

        public IActionResult CreateArticle()
        {
            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewArticle([Bind("Titre,Contenu")] Article article)
        {
            Console.WriteLine($"Article : {article}");
            Console.WriteLine($"ModelState.IsValid : {ModelState.IsValid}");
            Console.WriteLine($"nom : {article.Titre}, Description : {article.Contenu}");
            if (!ModelState.IsValid)
            {
                foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
                {
                    Console.WriteLine(error.ErrorMessage);
                }
            }
            if (ModelState.IsValid)
            {
                Console.WriteLine($"Article envoyée : {article.Titre}");

                var response = await _httpClient.PostAsJsonAsync("api/Article", article);

                if (response.IsSuccessStatusCode)
                {
                    var created = await response.Content.ReadFromJsonAsync<ArticleDto>();

                    if (created != null)
                    {
                        HttpContext.Session.SetInt32("ArticleId", created.Id);
                        HttpContext.Session.SetString("ArticleTitre", created.Titre);
                        HttpContext.Session.SetString("ArticleContenu", created.Contenu);
                        TempData["Message"] = "Création réussie !";

                        return RedirectToAction("DynamicArticle", new { id = created.Id });
                    }
                }
                else
                {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    TempData["Message"] = $"Erreur lors de la création : {response.ReasonPhrase} - {errorContent}";
                    return RedirectToAction("CreateArticle");
                }
            }

            return RedirectToAction("CreateArticle");
        }

        public async Task<IActionResult> DynamicArticle(int id)
        {
            var article = await GetArticle(id);
            if (article == null)
                return NotFound("Article non trouvée.");

            HttpContext.Session.SetInt32("ArticleId", article.Id);
            HttpContext.Session.SetString("ArticleTitle", article.Titre);

            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.ArticleID = article.Id;
            ViewBag.Title = article.Titre;
            ViewBag.Content = article.Contenu;

            return View("~/Views/Article/ViewPage.cshtml");
        }

        public async Task<IActionResult> DynamicArticle2(int id)
        {
            var article = await GetArticle(id);
            if (article == null)
                return NotFound("article non trouvée.");

            HttpContext.Session.SetInt32("ArticleId", article.Id);
            HttpContext.Session.SetString("ArticleTitre", article.Titre);

            ViewBag.Id = HttpContext.Session.GetInt32("Id");
            ViewBag.RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.Title = article.Titre;
            ViewBag.Contenu = article.Contenu ?? "";

            return View("~/Views/Article/Editable.cshtml");
        }

        [HttpPost]
        public async Task<IActionResult> SaveArticleContent(string Title, string Content)
        {
            var articleId = HttpContext.Session.GetInt32("ArticleId");
            if (articleId == null)
                return RedirectToAction("Article");

            var updatedArticle = new
            {
                Id = articleId,
                Titre = Title,
                Contenu = Content
            };

            var response = await _httpClient.PatchAsJsonAsync($"api/Article/{articleId}", updatedArticle);

            if (response.IsSuccessStatusCode)
            {
                TempData["Message"] = "Article mise à jour avec succès !";
                return RedirectToAction("DynamicArticle", new { id = articleId });
            }

            TempData["Message"] = "Erreur lors de la mise à jour.";
            return RedirectToAction("DynamicArticle", new { id = articleId });
        }

        public async Task<IActionResult> LoadArticle(int id, string redirectTo)
        {
            var article = await GetArticle(id);
            if (article != null)
                return RedirectToAction("DynamicArticle", new { id = id });

            return RedirectToAction("Article");
        }

        // Helpers privés
        private async Task<ArticleDto?> GetArticle(int idArticle)
        {
            Console.WriteLine($"IdArticle : {idArticle}");
            var response = await _httpClient.GetAsync($"api/Article/{idArticle}");

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();

                if (!string.IsNullOrWhiteSpace(content))
                {
                    try
                    {
                        return JsonSerializer.Deserialize<ArticleDto>(content, new JsonSerializerOptions
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
                    Console.WriteLine("Réponse vide de l'API lors de la récupération de l'article.");
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


        private async Task<List<ArticleDto>> GetAllArticles()
        {
            var response = await _httpClient.GetAsync("api/Article");
            return response.IsSuccessStatusCode
                ? await response.Content.ReadFromJsonAsync<List<ArticleDto>>() ?? new List<ArticleDto>()
                : new List<ArticleDto>();
        }
    }
}
