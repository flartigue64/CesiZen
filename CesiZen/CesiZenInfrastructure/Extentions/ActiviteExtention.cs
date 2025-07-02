using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenInfrastructure.Extensions;
public static class ActiviteExtension
{
    public static ActiviteDto ToDto(this Activite activite)
    {
        return new ActiviteDto
        {
            Id = activite.Id,
            Nom = activite.Nom,
            Description = activite.Description,
            ContenuHtml = activite.ContenuHtml,
        };
    }


}
