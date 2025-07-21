using Microsoft.EntityFrameworkCore;
using CESIZen.Controllers.Admin;
using CesiZen.Data;
using CESIZen.Models;
using Microsoft.AspNetCore.Mvc;

namespace CESIZen.Tests.Controllers.Admin
{
    [TestClass]
    public class ArticleAdminControllerTests
    {
        private CesiZenDbContext GetInMemoryDbContext(string databaseName)
        {
            var options = new DbContextOptionsBuilder<CesiZenDbContext>()
                .UseInMemoryDatabase(databaseName: databaseName)
                .Options;

            return new CesiZenDbContext(options);
        }

        [TestMethod]
        public async Task Details_ValidId_ReturnsViewWithModel()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());

            var article = new Article 
            { 
                Id = 1, 
                Titre = "Test Article",
                Contenu = "Contenu test",
            };

            context.Articles.Add(article);
            await context.SaveChangesAsync();

            var controller = new InformationAdminController(context);

            // Act
            var result = await controller.Details(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsNotNull(result.Model);
            Assert.IsInstanceOfType(result.Model, typeof(Article));
        }

        [TestMethod]
        public async Task Create_Post_ValidModel_RedirectsToIndex()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());

            var controller = new InformationAdminController(context);
            var newArticle = new Article 
            { 
                Titre = "Nouvel Article",
                Contenu = "Contenu du nouvel article",
            };

            // Act
            var result = await controller.Create(newArticle) as RedirectToActionResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.ActionName);

            // Vérifier que l'article a été ajouté
            Assert.AreEqual(1, context.Articles.Count());
        }
    }
}
