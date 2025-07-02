using CesiZenInfrastructure.Dto;
using CesiZenInfrastructure.Extensions;
using CesiZenModel.Context;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenInfrastructure.Repositories;
public class UtilisateurRepository
{
    private readonly ZenDbContext _context;

    public UtilisateurRepository(ZenDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<UtilisateurDto>> GetUtilisateurs()
    {
        return await _context.Utilisateurs
            .Select(a => a.ToDto())
            .ToListAsync();
    }

    public async Task<UtilisateurDto?> GetUtilisateur(int id)
    {
        return await _context.Utilisateurs
            .Include(u => u.Role)  // Utilisation de la lambda expression pour inclure la relation "Role"
            .Where(a => a.Id == id)
            .Select(a => a.ToDto())
            .FirstOrDefaultAsync();
    }

    public async Task<UtilisateurDto?> GetUtilisateurByMail(string email)
    {
        return await _context.Utilisateurs
            .Include(u => u.Role)  // Utilisation de la lambda expression pour inclure la relation "Role"
            .Where(a => a.Email == email)
            .Select(a => a.ToDto())
            .FirstOrDefaultAsync();
    }


    public async Task<int> Add(Utilisateur utilisateur)
    {
        _context.Utilisateurs.Add(utilisateur);
        await _context.SaveChangesAsync();
        return utilisateur.Id;
    }

    public async Task Update(Utilisateur utilisateur)
    {
        _context.Entry(utilisateur).State = EntityState.Modified;
        await _context.SaveChangesAsync();
    }

    public async Task<bool> PatchUtilisateur(int id, PatchUtilisateurDto dto)
    {
        var utilisateur = await _context.Utilisateurs.FindAsync(id);
        if (utilisateur == null)
            return false;

        if (dto.Nom != null) utilisateur.Nom = dto.Nom;
        if (dto.Prenom != null) utilisateur.Prenom = dto.Prenom;
        if (dto.Email != null) utilisateur.Email = dto.Email;
        if (dto.mot_de_passe != null) utilisateur.mot_de_passe = dto.mot_de_passe;
        if (dto.Role.HasValue) utilisateur.RoleId = dto.Role.Value;

        await _context.SaveChangesAsync();
        return true;
    }



    public async Task<bool> Delete(int id)
    {
        var utilisateur = await _context.Utilisateurs.FindAsync(id);
        if (utilisateur == null)
        {
            return false;
        }
        _context.Utilisateurs.Remove(utilisateur);
        await _context.SaveChangesAsync();
        return true;
    }
}
