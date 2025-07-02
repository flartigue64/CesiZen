using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenInfrastructure.Extensions;

public static class ArticleExtension
{
    public static ArticleDto ToDto(this Article article)
    {
        return new ArticleDto
        {
            Id = article.Id,
            Titre = article.Titre,
            Contenu = article.Contenu,
        };
    }


}

