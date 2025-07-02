using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CesiZenModel.Entities;
public class Role
{
    public int Id { get; set; }

    [StringLength(40)]
    public string Libelle { get; set; } = null!;

}