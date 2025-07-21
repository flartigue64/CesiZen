using CesiZen.Data;
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
        private CesiZenDbContext _context;
        private InformationAdminController _controller;

        [TestInitialize]
        public void Setup()
        {
            var options = new DbContextOptionsBuilder<CesiZenDbContext>()
                .UseInMemoryDatabase(databaseName: "Test_ArticleDb")
                .Options;
            _context = new CesiZenDbContext(options);

            _controller = new InformationAdminController(_context);
        }

        [TestMethod]
        public async Task Index_Returns_ViewResult_With_Articles()
        {
            _context.Articles.Add(new Article
            {
                Titre = "Titre article test",
                Contenu = "Contenu de test pour article."
            });
            await _context.SaveChangesAsync();

            var result = await _controller.Index();

            Assert.IsInstanceOfType(result, typeof(ViewResult));
            var viewResult = result as ViewResult;
            Assert.IsNotNull(viewResult);
            Assert.IsInstanceOfType(viewResult.Model, typeof(List<Article>));
        }

        [TestMethod]
        public async Task Details_ValidId_ReturnsViewWithModel()
        {
            var article = new Article
            {
                Id = 1,
                Titre = "Titre exemple",
                Contenu = "Contenu exemple"
            };
            _context.Articles.Add(article);
            await _context.SaveChangesAsync();

            var result = await _controller.Details(1);

            Assert.IsInstanceOfType(result, typeof(ViewResult));
            var viewResult = result as ViewResult;
            Assert.IsNotNull(viewResult);
            Assert.IsInstanceOfType(viewResult.Model, typeof(Article));
            var model = viewResult.Model as Article;
            Assert.AreEqual("Titre exemple", model.Titre);
        }

        [TestMethod]
        public void Create_Get_ReturnsView()
        {
            var result = _controller.Create();
            Assert.IsInstanceOfType(result, typeof(ViewResult));
        }

        [TestMethod]
        public async Task Create_Post_ValidModel_RedirectsToIndex()
        {
            _controller.TempData = new TempDataDictionary(new DefaultHttpContext(), Mock.Of<ITempDataProvider>());

            var article = new Article
            {
                Titre = "Nouvel article",
                Contenu = "Contenu important"
            };

            var result = await _controller.Create(article);

            Assert.IsInstanceOfType(result, typeof(RedirectToActionResult));
            var redirect = result as RedirectToActionResult;
            Assert.AreEqual("Index", redirect.ActionName);
            Assert.AreEqual(1, _context.Articles.Count());
        }

        // Tu peux ajouter d'autres tests comme Edit, Delete etc. selon tes besoins
    }
}
