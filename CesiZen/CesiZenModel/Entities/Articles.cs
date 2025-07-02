using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CesiZenModel.Entities
{
    public class Article
    {
        public int Id { get; set; }
        [StringLength(40)]
        public string Titre { get; set; } = null!;
        public string Contenu { get; set; } = null!;
    }
}
