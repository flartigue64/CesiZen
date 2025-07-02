using CesiZenDomain.Services;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CesiZenApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly RoleService _roleService;

        public RoleController(RoleService roleService)
        {
            _roleService = roleService;
        }

        // GET: api/Roles
        [HttpGet]
        public async Task<IEnumerable<Role>> GetRoles() =>
            await _roleService.GetRoles();

        // GET: api/Roles/5
        [HttpGet("{id}")]
        public async Task<Role?> GetRole(int id) =>
            await _roleService.GetRole(id);

        // PUT: api/Roles/5
        [HttpPut("{id}")]
        public async Task<Role?> PutRole(int id, Role role) =>
            await _roleService.PutRole(id, role);

        // POST: api/Roles
        [HttpPost]
        public async Task<Role?> PostRole(Role role) =>
            await _roleService.PostRole(role);

        // DELETE: api/Roles/5
        [HttpDelete("{id}")]
        public async Task<bool> DeleteRole(int id) =>
            await _roleService.DeleteRole(id);
    }
}
