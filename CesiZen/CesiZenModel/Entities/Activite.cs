using System.ComponentModel.DataAnnotations;

namespace CesiZenModel.Entities;
public class Activite
{
    public int Id { get; set; }
    [StringLength(40)]
    public string Nom { get; set; } = null!;
    [StringLength(400)]
    public string Description { get; set; } = null!;
    public string? ContenuHtml { get; set; }
}
