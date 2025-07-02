using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CesiZenInfrastructure.Dto
{
    public class PatchArticleDto
    {
        public int? Id { get; set; }
        public string? Titre { get; set; }
        public string? Contenu { get; set; }
    }
}
