
using CesiZenInfrastructure.Dto;
using CesiZenInfrastructure.Repositories;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenDomain.Services;
public class ArticleService
{
    private readonly ArticleRepository _articleRepository;

    public ArticleService(ArticleRepository articleRepository)
    {
        _articleRepository = articleRepository;
    }

    public async Task<IEnumerable<ArticleDto>> GetArticles()
    {
        return await _articleRepository.GetArticles();
    }

    public async Task<ArticleDto?> GetArticle(int id)
    {
        return await _articleRepository.GetArticle(id);
    }

    public async Task<ArticleDto?> PostArticle(Article article)
    {
        int id = await _articleRepository.Add(article);
        return await _articleRepository.GetArticle(id);
    }

    public async Task<ArticleDto?> PutArticle(int id, Article article)
    {
        if (id != article.Id)
        {
            throw new ArgumentException();
        }

        await _articleRepository.Update(article);
        return await _articleRepository.GetArticle(id);
    }
    public async Task<ArticleDto?> PatchArticle(int id, PatchArticleDto dto)
    {
        var success = await _articleRepository.PatchArticle(id, dto);
        if (!success) return null;
        return await _articleRepository.GetArticle(id);
    }


    public async Task<bool> DeleteArticle(int id)
    {
        return await _articleRepository.Delete(id);
    }
}
