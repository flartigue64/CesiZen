// ArticleAdminControllerTests.cs
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
        public void Details_ValidId_ReturnsViewWithModel()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());
            
            var article = new Article 
            { 
                Id = 1, 
                Titre = "Test Article",
                Contenu = "Contenu test",
                DateCreation = DateTime.Now
            };
            
            context.Articles.Add(article);
            context.SaveChanges();

            var controller = new ArticleAdminController(context);

            // Act
            var result = controller.Details(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsNotNull(result.Model);
            Assert.IsInstanceOfType(result.Model, typeof(Article));
        }

        [TestMethod]
        public void Create_Post_ValidModel_RedirectsToIndex()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());
            
            var controller = new ArticleAdminController(context);
            var newArticle = new Article 
            { 
                Titre = "Nouvel Article",
                Contenu = "Contenu du nouvel article",
                DateCreation = DateTime.Now
            };

            // Act
            var result = controller.Create(newArticle);

            // Assert
            Assert.IsInstanceOfType(result, typeof(RedirectToActionResult));
            
            var redirectResult = result as RedirectToActionResult;
            Assert.AreEqual("Index", redirectResult.ActionName);
            
            // Vérifier que l'article a été ajouté
            Assert.AreEqual(1, context.Articles.Count());
        }
    }
}