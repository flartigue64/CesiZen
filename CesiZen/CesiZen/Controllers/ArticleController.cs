using CesiZenDomain.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CesiNewsApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticleController : ControllerBase
    {
        private readonly ArticleService _articleService;

        public ArticleController(ArticleService articleService)
        {
            _articleService = articleService;
        }

        // GET: api/Article
        [HttpGet]
        public async Task<IEnumerable<ArticleDto>> GetArticles() =>
            await _articleService.GetArticles();

        // GET: api/Article/5
        [HttpGet("{id}")]
        public async Task<ArticleDto?> GetArticle(int id) =>
            await _articleService.GetArticle(id);

        // PUT: api/Article/5
        [HttpPut("{id}")]
        public async Task<ArticleDto?> PutArticle(int id, Article article) =>
            await _articleService.PutArticle(id, article);

        [HttpPatch("{id}")]
        public async Task<ActionResult<ArticleDto?>> PatchArticle(int id, [FromBody] PatchArticleDto dto)
        {
            var article = await _articleService.PatchArticle(id, dto);
            if (article == null)
                return NotFound();

            return Ok(article);
        }

        // POST: api/Article
        [HttpPost]
        public async Task<ArticleDto?> PostArticle([FromBody] Article article) =>
            await _articleService.PostArticle(article);


        // DELETE: api/Article/5
        [HttpDelete("{id}")]
        public async Task<bool> DeleteArticle(int id) =>
            await _articleService.DeleteArticle(id);

    }
}
