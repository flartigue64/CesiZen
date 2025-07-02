using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace CesiZenInfrastructure.Dto;
public class UtilisateurDto
{
    public int Id { get; set; }
    public string Nom { get; set; } = null!;
    public string Prenom { get; set; } = null!;
    public string? Email { get; set; }
    public string mot_de_passe { get; set; } = null!;
    public int Role { get; set; }
}
