using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CesiZenModel.Entities;
public class ActiviteData
{
    public int Id { get; set; }
    [StringLength(40)]
    public string Nom { get; set; } = null!;
    [StringLength(400)]
    public string Description { get; set; } = null!;

    public string ContenuHtml { get; set; } = null!;
    
    public int NumberActivity { get; set;}
}
