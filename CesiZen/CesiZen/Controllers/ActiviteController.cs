using CesiZenDomain.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CesiNewsApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActiviteController : ControllerBase
    {
        private readonly ActiviteService _activiteService;

        public ActiviteController(ActiviteService activiteService)
        {
            _activiteService = activiteService;
        }

        // GET: api/Activite
        [HttpGet]
        public async Task<IEnumerable<ActiviteDto>> GetActivites() =>
            await _activiteService.GetActivites();

        // GET: api/Activite/5
        [HttpGet("{id}")]
        public async Task<ActiviteDto?> GetActivite(int id) =>
            await _activiteService.GetActivite(id);

        // PUT: api/Activite/5
        [HttpPut("{id}")]
        public async Task<ActiviteDto?> PutActivite(int id, Activite activite) =>
            await _activiteService.PutActivite(id, activite);

        [HttpPatch("{id}")]
        public async Task<ActionResult<ActiviteDto?>> PatchActivity(int id, [FromBody] PatchActivityDto dto)
        {
            var activity = await _activiteService.PatchActivity(id, dto);
            if (activity == null)
                return NotFound();

            return Ok(activity);
        }

        // POST: api/Activite
        [HttpPost]
        public async Task<ActiviteDto?> PostActivite(Activite activite) =>
            await _activiteService.PostActivite(activite);

        // DELETE: api/Activite/5
        [HttpDelete("{id}")]
        public async Task<bool> DeleteActivite(int id) =>
            await _activiteService.DeleteActivite(id);

    }
}
