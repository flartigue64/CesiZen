using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenInfrastructure.Extensions;
public static class ActiviteMetadataExtension
{
    public static ActiviteMetadataDto ToDto(this ActiviteMetadata activiteMetadata)
    {
        return new ActiviteMetadataDto
        {
            Id = activiteMetadata.Id,
            Nom = activiteMetadata.Nom,
            DatePubli = activiteMetadata.DatePubli,
            Utilisateur = activiteMetadata.Utilisateur?.Id,
            Activite = activiteMetadata.Activite?.Id,
        };
    }


}
