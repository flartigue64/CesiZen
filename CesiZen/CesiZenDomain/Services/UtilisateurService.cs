
using CesiZenInfrastructure.Dto;
using CesiZenInfrastructure.Repositories;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenDomain.Services;
public class UtilisateurService
{
    private readonly UtilisateurRepository _utilisateurRepository;

    public UtilisateurService(UtilisateurRepository utilisateurRepository)
    {
        _utilisateurRepository = utilisateurRepository;
    }

    public async Task<IEnumerable<UtilisateurDto>> GetUtilisateurs()
    {
        return await _utilisateurRepository.GetUtilisateurs();
    }

    public async Task<UtilisateurDto?> GetUtilisateur(int id)
    {
        return await _utilisateurRepository.GetUtilisateur(id);
    }

    public async Task<UtilisateurDto?> GetUtilisateurByMail(string email)
    {
        return await _utilisateurRepository.GetUtilisateurByMail(email);
    }

    public async Task<UtilisateurDto?> PostUtilisateur(Utilisateur utilisateur)
    {
        int id = await _utilisateurRepository.Add(utilisateur);
        return await _utilisateurRepository.GetUtilisateur(id);
    }

    public async Task<UtilisateurDto?> PutUtilisateur(int id, Utilisateur utilisateur)
    {
        if (id != utilisateur.Id)
        {
            throw new ArgumentException();
        }

        await _utilisateurRepository.Update(utilisateur);
        return await _utilisateurRepository.GetUtilisateur(id);
    }

    public async Task<UtilisateurDto?> PatchUtilisateur(int id, PatchUtilisateurDto dto)
    {
        var success = await _utilisateurRepository.PatchUtilisateur(id, dto);
        if (!success) return null;
        return await _utilisateurRepository.GetUtilisateur(id);
    }



    public async Task<bool> DeleteUtilisateur(int id)
    {
        return await _utilisateurRepository.Delete(id);
    }
}
