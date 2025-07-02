using CesiZenInfrastructure.Dto;
using CesiZenInfrastructure.Extensions;
using CesiZenModel.Context;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenInfrastructure.Repositories;
public class ActiviteRepository
{
    private readonly ZenDbContext _context;

    public ActiviteRepository(ZenDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<ActiviteDto>> GetActivites()
    {
        return await _context.Activites
            .Select(a => a.ToDto())
            .ToListAsync();
    }

    public async Task<ActiviteDto?> GetActivite(int id)
    {
        return await _context.Activites
            .Where(a => a.Id == id)
            .Select(a => a.ToDto())
            .FirstOrDefaultAsync();
    }


    public async Task<int> Add(Activite activite)
    {
        _context.Activites.Add(activite);
        await _context.SaveChangesAsync();
        return activite.Id;
    }

    public async Task Update(Activite activite)
    {
        _context.Entry(activite).State = EntityState.Modified;
        await _context.SaveChangesAsync();
    }

    public async Task<bool> PatchActivity(int id, PatchActivityDto dto)
    {
        var activity = await _context.Activites.FindAsync(id);
        if (activity == null)
            return false;

        if (dto.Nom != null) activity.Nom = dto.Nom;
        if (dto.Description != null) activity.Description = dto.Description;
        if (dto.ContenuHtml != null) activity.ContenuHtml = dto.ContenuHtml;

        await _context.SaveChangesAsync();
        return true;
    }

    public async Task<bool> Delete(int id)
    {
        var activite = await _context.Activites.FindAsync(id);
        if (activite == null)
        {
            return false;
        }
        _context.Activites.Remove(activite);
        await _context.SaveChangesAsync();
        return true;
    }
}
