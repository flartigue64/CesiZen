using CesiZenInfrastructure.Dto;
using CesiZenInfrastructure.Extensions;
using CesiZenModel.Context;
using CesiZenModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace CesiZenInfrastructure.Repositories;
public class ArticleRepository
{
    private readonly ZenDbContext _context;

    public ArticleRepository(ZenDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<ArticleDto>> GetArticles()
    {
        return await _context.Articles
            .Select(a => a.ToDto())
            .ToListAsync();
    }

    public async Task<ArticleDto?> GetArticle(int id)
    {
        return await _context.Articles
            .Where(a => a.Id == id)
            .Select(a => a.ToDto())
            .FirstOrDefaultAsync();
    }


    public async Task<int> Add(Article article)
    {
        _context.Articles.Add(article);
        await _context.SaveChangesAsync();
        return article.Id;
    }

    public async Task Update(Article article)
    {
        _context.Entry(article).State = EntityState.Modified;
        await _context.SaveChangesAsync();
    }

    public async Task<bool> PatchArticle(int id, PatchArticleDto dto)
    {
        var article = await _context.Articles.FindAsync(id);
        if (article == null)
            return false;

        if (dto.Titre != null) article.Titre = dto.Titre;
        if (dto.Contenu != null) article.Contenu = dto.Contenu;

        await _context.SaveChangesAsync();
        return true;
    }

    public async Task<bool> Delete(int id)
    {
        var article = await _context.Articles.FindAsync(id);
        if (article == null)
        {
            return false;
        }
        _context.Articles.Remove(article);
        await _context.SaveChangesAsync();
        return true;
    }
}
