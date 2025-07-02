
using CesiZenInfrastructure.Dto;
using CesiZenInfrastructure.Repositories;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenDomain.Services;
public class ActiviteService
{
    private readonly ActiviteRepository _activiteRepository;

    public ActiviteService(ActiviteRepository activiteRepository)
    {
        _activiteRepository = activiteRepository;
    }

    public async Task<IEnumerable<ActiviteDto>> GetActivites()
    {
        return await _activiteRepository.GetActivites();
    }

    public async Task<ActiviteDto?> GetActivite(int id)
    {
        return await _activiteRepository.GetActivite(id);
    }

    public async Task<ActiviteDto?> PostActivite(Activite activite)
    {
        int id = await _activiteRepository.Add(activite);
        return await _activiteRepository.GetActivite(id);
    }

    public async Task<ActiviteDto?> PutActivite(int id, Activite activite)
    {
        if (id != activite.Id)
        {
            throw new ArgumentException();
        }

        await _activiteRepository.Update(activite);
        return await _activiteRepository.GetActivite(id);
    }
    public async Task<ActiviteDto?> PatchActivity(int id, PatchActivityDto dto)
    {
        var success = await _activiteRepository.PatchActivity(id, dto);
        if (!success) return null;
        return await _activiteRepository.GetActivite(id);
    }


    public async Task<bool> DeleteActivite(int id)
    {
        return await _activiteRepository.Delete(id);
    }
}
