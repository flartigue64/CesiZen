using CesiZenInfrastructure.Dto;
using CesiZenInfrastructure.Extensions;
using CesiZenModel.Context;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenInfrastructure.Repositories;
public class ActiviteMetadataRepository
{
    private readonly ZenDbContext _context;

    public ActiviteMetadataRepository(ZenDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<ActiviteMetadataDto>> GetActivitesMetadata()
    {
        return await _context.ActiviteMetadata
            .Select(a => a.ToDto())
            .ToListAsync();
    }

    public async Task<ActiviteMetadataDto?> GetActiviteMetadata(int id)
    {
        return await _context.ActiviteMetadata
            .Include(u => u.Utilisateur)  // Utilisation de la lambda expression pour inclure la relation "Role"
            .Include(ac => ac.Activite)  // Utilisation de la lambda expression pour inclure la relation "Role"
            .Where(a => a.Id == id)
            .Select(a => a.ToDto())
            .FirstOrDefaultAsync();
    }

    public async Task<List<ActiviteMetadataDto>> GetActiviteMetadataUser(int id)
    {
        return await _context.ActiviteMetadata
            .Include(u => u.Utilisateur)  // Inclusion de la relation Utilisateur
            .Include(ac => ac.Activite)  // Inclusion de la relation Activité
            .Where(a => a.UtilisateurId == id)
            .Select(a => a.ToDto())
            .ToListAsync();  // Récupère une liste de résultats
    }



    public async Task<int> Add(ActiviteMetadata activiteMetadata)
    {
        _context.ActiviteMetadata.Add(activiteMetadata);
        await _context.SaveChangesAsync();
        return activiteMetadata.Id;
    }

    public async Task Update(ActiviteMetadata activiteMetadata)
    {
        _context.Entry(activiteMetadata).State = EntityState.Modified;
        await _context.SaveChangesAsync();
    }

    public async Task<bool> Delete(int id)
    {
        var activiteMetadata = await _context.ActiviteMetadata.FindAsync(id);
        if (activiteMetadata == null)
        {
            return false;
        }
        _context.ActiviteMetadata.Remove(activiteMetadata);
        await _context.SaveChangesAsync();
        return true;
    }
}
