
using CesiZenInfrastructure.Dto;
using CesiZenInfrastructure.Repositories;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenDomain.Services;
public class ActiviteMetadataService
{
    private readonly ActiviteMetadataRepository _activiteMetadataRepository;

    public ActiviteMetadataService(ActiviteMetadataRepository activiteMetadataRepository)
    {
        _activiteMetadataRepository = activiteMetadataRepository;
    }

    public async Task<IEnumerable<ActiviteMetadataDto>> GetActivitesMetadata()
    {
        return await _activiteMetadataRepository.GetActivitesMetadata();
    }

    public async Task<ActiviteMetadataDto?> GetActiviteMetadata(int id)
    {
        return await _activiteMetadataRepository.GetActiviteMetadata(id);
    }

    public async Task<List<ActiviteMetadataDto>> GetActiviteMetadataUser(int id)
    {
        return await _activiteMetadataRepository.GetActiviteMetadataUser(id);
    }


    public async Task<ActiviteMetadataDto?> PostActiviteMetadata(ActiviteMetadata activiteMetadata)
    {
        int id = await _activiteMetadataRepository.Add(activiteMetadata);
        return await _activiteMetadataRepository.GetActiviteMetadata(id);
    }

    public async Task<ActiviteMetadataDto?> PutActiviteMetadata(int id, ActiviteMetadata activiteMetadata)
    {
        if (id != activiteMetadata.Id)
        {
            throw new ArgumentException();
        }

        await _activiteMetadataRepository.Update(activiteMetadata);
        return await _activiteMetadataRepository.GetActiviteMetadata(id);
    }

    public async Task<bool> DeleteActiviteMetadata(int id)
    {
        return await _activiteMetadataRepository.Delete(id);
    }
}
