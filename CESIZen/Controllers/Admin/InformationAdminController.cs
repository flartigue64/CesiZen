using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.EntityFrameworkCore;
using CESIZen.Controllers.Admin;
using CesiZen.Data;
using CESIZen.Models;
using Microsoft.VisualStudio.TestTools.UnitTesting;

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
        public async Task Create_Post_ValidModel_RedirectsToIndex()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());

            var controller = new InformationAdminController(context);

            // Mock TempData
            var httpContext = new DefaultHttpContext();
            var tempData = new TempDataDictionary(httpContext, Mock.Of<ITempDataProvider>());
            controller.TempData = tempData;

            var newArticle = new Article
            {
                Titre = "Test Titre",
                Contenu = "Test Contenu"
            };

            // Act
            var result = await controller.Create(newArticle) as RedirectToActionResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.AreEqual("Index", result.ActionName);
            Assert.AreEqual(1, context.Articles.Count());
        }
    }
}
