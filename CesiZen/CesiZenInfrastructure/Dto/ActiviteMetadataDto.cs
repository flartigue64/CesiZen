using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace CesiZenInfrastructure.Dto;
public class ActiviteMetadataDto
{
    public int Id { get; set; }
    public string Nom { get; set; } = null!;
    public DateTime? DatePubli { get; set; }
    public int? Utilisateur { get; set; }
    public int? Activite { get; set; }
}
