using CesiZenDomain.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CesiNewsApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UtilisateurController : ControllerBase
    {
        private readonly UtilisateurService _utilisateurService;

        public UtilisateurController(UtilisateurService utilisateurService)
        {
            _utilisateurService = utilisateurService;
        }

        // GET: api/Utilisateurs
        [HttpGet]
        public async Task<IEnumerable<UtilisateurDto>> GetUtilisateurs() =>
            await _utilisateurService.GetUtilisateurs();

        // GET: api/Utilisateurs/5
        [HttpGet("{id}")]
        public async Task<UtilisateurDto?> GetUtilisateur(int id) =>
            await _utilisateurService.GetUtilisateur(id);

        // GET: api/Utilisateurs/Email/exemple@email.com
        [HttpGet("mail/{email}")]
        public async Task<UtilisateurDto?> GetUtilisateurByMail(string email) =>
            await _utilisateurService.GetUtilisateurByMail(email);


        // PUT: api/Utilisateurs/5
        [HttpPut("{id}")]
        public async Task<UtilisateurDto?> PutUtilisateur(int id, Utilisateur utilisateur) =>
            await _utilisateurService.PutUtilisateur(id, utilisateur);

        [HttpPatch("{id}")]
        public async Task<ActionResult<UtilisateurDto?>> PatchUtilisateur(int id, [FromBody] PatchUtilisateurDto dto)
        {
            var utilisateur = await _utilisateurService.PatchUtilisateur(id, dto);
            if (utilisateur == null)
                return NotFound();

            return Ok(utilisateur);
        }



        // POST: api/Utilisateurs
        [HttpPost]
        public async Task<UtilisateurDto?> PostUtilisateur(Utilisateur utilisateur) =>
            await _utilisateurService.PostUtilisateur(utilisateur);

        // DELETE: api/Utilisateurs/5
        [HttpDelete("{id}")]
        public async Task<bool> DeleteUtilisateur(int id) =>
            await _utilisateurService.DeleteUtilisateur(id);

    }
}
