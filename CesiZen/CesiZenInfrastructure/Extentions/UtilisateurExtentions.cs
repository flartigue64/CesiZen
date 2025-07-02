using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenInfrastructure.Extensions;
public static class UtilisateurExtension
{
    public static UtilisateurDto ToDto(this Utilisateur utilisateur)
    {
        return new UtilisateurDto
        {
            Id = utilisateur.Id,
            Nom = utilisateur.Nom,
            Prenom = utilisateur.Prenom,
            Email = utilisateur.Email,
            mot_de_passe = utilisateur.mot_de_passe,
            Role = utilisateur.RoleId,
        };
    }


}
