using CESIZen.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CESIZen.Controllers.Admin;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Moq;

namespace CESIZen.Tests.Controllers.Admin
{
    [TestClass]
    public class ArticleAdminControllerTests
    {
        private DbContextOptions<CesiZenDbContext> _options;

        [TestInitialize]
        public void Setup()
        {
            _options = new DbContextOptionsBuilder<CesiZenDbContext>()
                .UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
                .Options;
        }

        [TestMethod]
        public async Task Index_ReturnsViewWithArticles()
        {
            using var context = new CesiZenDbContext(_options);
            context.Articles.Add(new Article { Titre = "Titre Test", Contenu = "Contenu Test" });
            await context.SaveChangesAsync();

            var controller = new ArticleAdminController(context);
            var result = await controller.Index();

            var viewResult = result as ViewResult;
            Assert.IsNotNull(viewResult);
            Assert.IsInstanceOfType(viewResult.Model, typeof(List<Article>));
        }

        [TestMethod]
        public async Task Create_Post_ValidArticle_RedirectsToIndex()
        {
            using var context = new CesiZenDbContext(_options);
            var controller = new ArticleAdminController(context);
            controller.TempData = new TempDataDictionary(new DefaultHttpContext(), Mock.Of<ITempDataProvider>());

            var article = new Article
            {
                Titre = "Nouveau Titre",
                Contenu = "Contenu Important"
            };

            var result = await controller.Create(article);

            var redirect = result as RedirectToActionResult;
            Assert.IsNotNull(redirect);
            Assert.AreEqual("Index", redirect.ActionName);
            Assert.AreEqual(1, context.Articles.Count());
        }

        [TestMethod]
        public async Task Edit_Get_ValidId_ReturnsViewWithArticle()
        {
            using var context = new CesiZenDbContext(_options);
            context.Articles.Add(new Article { Id = 1, Titre = "Edit", Contenu = "Edit" });
            await context.SaveChangesAsync();

            var controller = new ArticleAdminController(context);
            var result = await controller.Edit(1);

            var viewResult = result as ViewResult;
            Assert.IsNotNull(viewResult);
            Assert.IsInstanceOfType(viewResult.Model, typeof(Article));
        }

        [TestMethod]
        public async Task Edit_Post_UpdatesArticleAndRedirects()
        {
            using (var context = new CesiZenDbContext(_options))
            {
                context.Articles.Add(new Article { Id = 1, Titre = "Ancien", Contenu = "Ancien" });
                context.SaveChanges();
            }

            using (var context = new CesiZenDbContext(_options))
            {
                var controller = new ArticleAdminController(context);
                controller.TempData = new TempDataDictionary(new DefaultHttpContext(), Mock.Of<ITempDataProvider>());

                var updated = new Article { Id = 1, Titre = "Nouveau", Contenu = "Nouveau" };
                var result = await controller.Edit(1, updated);

                var redirect = result as RedirectToActionResult;
                Assert.IsNotNull(redirect);
                Assert.AreEqual("Index", redirect.ActionName);
            }

            using (var context = new CesiZenDbContext(_options))
            {
                var article = context.Articles.First(a => a.Id == 1);
                Assert.AreEqual("Nouveau", article.Titre);
            }
        }

        [TestMethod]
        public async Task DeleteConfirmed_RemovesArticleAndRedirects()
        {
            using (var context = new CesiZenDbContext(_options))
            {
                context.Articles.Add(new Article { Id = 1, Titre = "Supprimer", Contenu = "Test" });
                context.SaveChanges();
            }

            using (var context = new CesiZenDbContext(_options))
            {
                var controller = new ArticleAdminController(context);
                controller.TempData = new TempDataDictionary(new DefaultHttpContext(), Mock.Of<ITempDataProvider>());

                var result = await controller.DeleteConfirmed(1);

                var redirect = result as RedirectToActionResult;
                Assert.IsNotNull(redirect);
                Assert.AreEqual("Index", redirect.ActionName);
            }

            using (var context = new CesiZenDbContext(_options))
            {
                var article = context.Articles.FirstOrDefault(a => a.Id == 1);
                Assert.IsNull(article);
            }
        }
    }
}
