using CesiZenInfrastructure.Repositories;
using CesiZenModel.Entities;

namespace CesiZenDomain.Services;
public class RoleService
{
    private readonly RoleRepository _roleRepository;

    public RoleService(RoleRepository roleRepository)
    {
        _roleRepository = roleRepository;
    }

    public async Task<IEnumerable<Role>> GetRoles()
    {
        return await _roleRepository.GetRoles();
    }

    public async Task<Role?> GetRole(int id)
    {
        return await _roleRepository.GetRole(id);
    }

    public async Task<Role?> PostRole(Role role)
    {
        int id = await _roleRepository.Add(role);
        return await _roleRepository.GetRole(id);
    }

    public async Task<Role?> PutRole(int id, Role role)
    {
        if (id != role.Id)
        {
            throw new ArgumentException();
        }

        await _roleRepository.Update(role);
        return await _roleRepository.GetRole(id);
    }



    public async Task<bool> DeleteRole(int id)
    {
        var role = await _roleRepository.GetRole(id);
        if (role == null)
        {
            return false;
        }

        await _roleRepository.Delete(role);
        return true;
    }
}
