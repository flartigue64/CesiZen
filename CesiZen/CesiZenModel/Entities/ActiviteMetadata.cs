using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CesiZenModel.Entities;
public class ActiviteMetadata
{
    public int Id { get; set; }
    public string Nom { get; set; } = null!;
    public DateTime? DatePubli { get; set; }
    public int UtilisateurId { get; set; }
    public virtual Utilisateur? Utilisateur { get; set; }
    public int ActiviteId { get; set; }
    public virtual Activite? Activite { get; set; }
}
