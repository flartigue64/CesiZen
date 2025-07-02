using CesiZenModel.Context;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenInfrastructure.Repositories;
public class RoleRepository
{
    private readonly ZenDbContext _context;
    public RoleRepository(ZenDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<Role>> GetRoles()
    {
        return await _context.Roles.ToListAsync();
    }

    public async Task<Role?> GetRole(int id)
    {
        return await _context.Roles.FindAsync(id);
    }

    public async Task<int> Add(Role role)
    {
        _context.Roles.Add(role);
        await _context.SaveChangesAsync();
        return role.Id;
    }

    public async Task Update(Role role)
    {
        _context.Entry(role).State = EntityState.Modified;
        await _context.SaveChangesAsync();
    }

    public async Task Delete(Role role)
    {
        _context.Roles.Remove(role);
        await _context.SaveChangesAsync();
    }
}
