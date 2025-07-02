using CesiZenDomain.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CesiNewsApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActiviteMetadataController : ControllerBase
    {
        private readonly ActiviteMetadataService _activiteMetadataService;

        public ActiviteMetadataController(ActiviteMetadataService activiteMetadataService)
        {
            _activiteMetadataService = activiteMetadataService;
        }

        // GET: api/ActiviteMetadatas
        [HttpGet]
        public async Task<IEnumerable<ActiviteMetadataDto>> GetActivitesMetadata() =>
            await _activiteMetadataService.GetActivitesMetadata();

        // GET: api/ActiviteMetadatas/5
        [HttpGet("{id}")]
        public async Task<ActiviteMetadataDto?> GetActiviteMetadata(int id) =>
            await _activiteMetadataService.GetActiviteMetadata(id);

        // GET: api/ActiviteMetadatas/User/2
        [HttpGet("user/{id}")]
        public async Task<List<ActiviteMetadataDto>> GetActiviteMetadataUser(int id) =>
            await _activiteMetadataService.GetActiviteMetadataUser(id);

        // PUT: api/ActiviteMetadatas/5
        [HttpPut("{id}")]
        public async Task<ActiviteMetadataDto?> PutActiviteMetadata(int id, ActiviteMetadata activiteMetadata) =>
            await _activiteMetadataService.PutActiviteMetadata(id, activiteMetadata);

        // POST: api/ActiviteMetadatas
        [HttpPost]
        public async Task<ActiviteMetadataDto?> PostActiviteMetadata(ActiviteMetadata activiteMetadata) =>
            await _activiteMetadataService.PostActiviteMetadata(activiteMetadata);

        // DELETE: api/ActiviteMetadatas/5
        [HttpDelete("{id}")]
        public async Task<bool> DeleteArticleMetadata(int id) =>
            await _activiteMetadataService.DeleteActiviteMetadata(id);

    }
}
