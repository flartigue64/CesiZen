using CesiZen.Data;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Mvc;

namespace CesiZenWebApp.Controllers
{
    public class AccountController : Controller
    {
        private readonly HttpClient _httpClient;

        public AccountController(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri("https://localhost:7270/"); // local
            //_httpClient.BaseAddress = new Uri("http://10.64.128.176:5094/"); // cesi
            //_httpClient.BaseAddress = new Uri("http://192.168.0.184:5094/"); // Ledeuix
            //_httpClient.BaseAddress = new Uri("http://192.168.1.13:5094/"); // Pau

        }

        public IActionResult Connexion()
        {
            return View();
        }

        [HttpGet]
        [Route("register")]
        public IActionResult Register()
        {
            return View();
        }

        public async Task<IActionResult> UserGestion(string searchEmail)
        {
            var id = HttpContext.Session.GetInt32("Id");
            var roleId = HttpContext.Session.GetInt32("RoleId");

            ViewBag.Id = id;
            ViewBag.RoleId = roleId;

            var response = await _httpClient.GetAsync("api/Utilisateur");
            if (response.IsSuccessStatusCode)
            {
                var users = await response.Content.ReadFromJsonAsync<List<UtilisateurDto>>();

                if (!string.IsNullOrWhiteSpace(searchEmail))
                {
                    users = users
                        .Where(u => u.Email != null && u.Email.Contains(searchEmail, StringComparison.OrdinalIgnoreCase))
                        .ToList();
                }

                var sortedUsers = users.OrderBy(u => u.Nom).ToList();
                return View(sortedUsers);
            }
            else
            {
                TempData["Message"] = $"Erreur lors de la récupération des utilisateurs : {response.ReasonPhrase}";
                return View(new List<UtilisateurDto>());
            }
        }



        public IActionResult ModifyPassword()
        {
            var id = HttpContext.Session.GetInt32("Id");
            var RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.Id = id;
            ViewBag.RoleId = RoleId;
            return View();
        }

        public IActionResult DeleteAccount()
        {
            var id = HttpContext.Session.GetInt32("Id");
            var RoleId = HttpContext.Session.GetInt32("RoleId");
            ViewBag.Id = id;
            ViewBag.RoleId = RoleId;
            return View();
        }

        public IActionResult AccountVue()
        {
            var email = HttpContext.Session.GetString("UserEmail");
            var password = HttpContext.Session.GetString("UserPassword");
            var Nom = HttpContext.Session.GetString("UserName");
            var Prenom = HttpContext.Session.GetString("UserFirstName");
            var RoleId = HttpContext.Session.GetInt32("RoleId");
            var id = HttpContext.Session.GetInt32("Id");

            ViewBag.Email = email;
            ViewBag.Password = password;
            ViewBag.Nom = Nom;
            ViewBag.Prenom = Prenom;
            ViewBag.Id = id;
            ViewBag.RoleId = RoleId;

            return View();
        }

        // GET: Articles/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nom,Prenom,Email,mot_de_passe")] Utilisateur user)
        {
            Console.WriteLine("Create");

            // Définir le rôle par défaut à 2
            user.RoleId = 1;

            if (ModelState.IsValid)
            {
                Console.WriteLine($"Utilisateur envoyé : Nom = {user.Nom}, Prenom = {user.Prenom}, Email = {user.Email}, RoleId = {user.RoleId}");

                var response = await _httpClient.PostAsJsonAsync("api/Utilisateur", user);

                if (response.IsSuccessStatusCode)
                {
                    TempData["Message"] = "Inscription réussie !";
                    return RedirectToAction("Connexion");
                }
                else
                {
                    var errorContent = await response.Content.ReadAsStringAsync();
                    TempData["Message"] = $"Erreur lors de l'inscription : {response.ReasonPhrase} - {errorContent}";
                    return RedirectToAction("Register");
                }
            }

            Console.WriteLine("Error on post");
            return View("Register", user);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Connexion(string email, string password)
        {
            var response = await _httpClient.GetAsync($"api/Utilisateur/mail/{email}");

            if (response.IsSuccessStatusCode)
            {
                // Si le code est 204 No Content, la propriété Content.Headers.ContentLength est 0
                if (response.StatusCode == System.Net.HttpStatusCode.NoContent)
                {
                    TempData["Message"] = "Aucun utilisateur trouvé avec cet email.";
                    return RedirectToAction("Connexion");
                }

                var utilisateurDto = await response.Content.ReadFromJsonAsync<UtilisateurDto>();

                if (utilisateurDto != null && utilisateurDto.mot_de_passe == password)
                {
                    // Enregistrer dans la session
                    HttpContext.Session.SetString("UserEmail", utilisateurDto.Email ?? "");
                    HttpContext.Session.SetString("UserPassword", utilisateurDto.mot_de_passe);
                    HttpContext.Session.SetString("UserName", utilisateurDto.Nom);
                    HttpContext.Session.SetString("UserFirstName", utilisateurDto.Prenom);
                    HttpContext.Session.SetInt32("Id", utilisateurDto.Id);
                    HttpContext.Session.SetInt32("RoleId", utilisateurDto.Role);

                    Console.WriteLine($"Connexion réussie : Email = {utilisateurDto.Email}, RoleId = {utilisateurDto.Role}");

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    TempData["Message"] = "Erreur : email ou mot de passe incorrect.";
                    return RedirectToAction("Connexion");
                }
            }
            else
            {
                TempData["Message"] = $"Erreur de connexion avec l'API : {response.ReasonPhrase}";
                return RedirectToAction("Connexion");
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ChangePassword(string ancienMotDePasse, string nouveauMotDePasse)
        {
            var email = HttpContext.Session.GetString("UserEmail");
            var id = HttpContext.Session.GetInt32("Id");
            var motDePasseActuel = HttpContext.Session.GetString("UserPassword");

            if (string.IsNullOrEmpty(email) || id == null)
            {
                TempData["Message"] = "Utilisateur non authentifié.";
                return RedirectToAction("Connexion");
            }

            if (motDePasseActuel != ancienMotDePasse)
            {
                TempData["Message"] = "Ancien mot de passe incorrect.";
                return RedirectToAction("ModifyPassword");
            }

            var patchDto = new PatchUtilisateurDto
            {
                mot_de_passe = nouveauMotDePasse
            };

            var response = await _httpClient.PatchAsJsonAsync($"api/Utilisateur/{id}", patchDto);

            if (response.IsSuccessStatusCode)
            {
                // Mise à jour de la session
                HttpContext.Session.SetString("UserPassword", nouveauMotDePasse);

                TempData["Message"] = "Mot de passe modifié avec succès.";
                return RedirectToAction("AccountVue");
            }
            else
            {
                TempData["Message"] = $"Erreur lors de la modification du mot de passe : {response.ReasonPhrase}";
                return RedirectToAction("ModifyPassword");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ConfirmDelete()
        {
            var id = HttpContext.Session.GetInt32("Id");

            if (id == null)
            {
                TempData["Message"] = "Utilisateur non authentifié.";
                return RedirectToAction("Connexion");
            }

            var response = await _httpClient.DeleteAsync($"api/Utilisateur/{id}");

            if (response.IsSuccessStatusCode)
            {
                HttpContext.Session.Clear(); // Déconnecter l'utilisateur
                TempData["Message"] = "Votre compte a été supprimé avec succès.";
                return RedirectToAction("Connexion");
            }
            else
            {
                TempData["Message"] = $"Erreur lors de la suppression du compte : {response.ReasonPhrase}";
                return RedirectToAction("DeleteAccount");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteUser(int Id)
        {
            var response = await _httpClient.DeleteAsync($"api/Utilisateur/{Id}");

            if (response.IsSuccessStatusCode)
            {
                TempData["Message"] = "Utilisateur supprimé avec succès.";
            }
            else
            {
                TempData["Message"] = $"Erreur lors de la suppression de l'utilisateur : {response.ReasonPhrase}";
            }

            return RedirectToAction("UserGestion");
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Logout()
        {
            // Effacer les informations de session pour déconnecter l'utilisateur
            HttpContext.Session.Clear();

            // Afficher un message de confirmation de déconnexion
            TempData["Message"] = "Vous êtes maintenant déconnecté.";

            // Rediriger vers la page de connexion
            return RedirectToAction("Connexion");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> UpdateRole(int Id, int Role)
        {
            var patchDto = new PatchUtilisateurDto
            {
                Role = Role
            };

            var response = await _httpClient.PatchAsJsonAsync($"api/Utilisateur/{Id}", patchDto);

            if (response.IsSuccessStatusCode)
            {
                TempData["Message"] = "Rôle modifié avec succès.";
            }
            else
            {
                TempData["Message"] = $"Erreur lors de la mise à jour du rôle : {response.ReasonPhrase}";
            }

            return RedirectToAction("UserGestion");
        }


    }
}
