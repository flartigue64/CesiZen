using System.ComponentModel.DataAnnotations;

namespace CesiZen.Data
{
    public class UserData
    {
        public int Id { get; set; }
        [StringLength(40)]
        public string Nom { get; set; } = null!;
        [StringLength(400)]
        public string Prenom { get; set; } = null!;

        public string? Email { get; set; }

        [StringLength(80)]
        public string mot_de_passe { get; set; } = null!;

        public int RoleId { get; set; }

    }
}
