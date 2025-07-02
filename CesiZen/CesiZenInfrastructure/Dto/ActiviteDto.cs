using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CesiZenInfrastructure.Dto;
public class ActiviteDto
{
    public int Id { get; set; }
    public string Nom { get; set; } = null!;
    public string Description { get; set; } = null!;

    public string? ContenuHtml { get; set; }

}
