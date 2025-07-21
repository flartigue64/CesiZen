// HomeControllerTests.cs
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Moq;
using CesiZen.Controllers;
using CesiZen.Data;
using CESIZen.Models;
using Microsoft.AspNetCore.Mvc;

namespace CESIZen.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTests
    {
        private CesiZenDbContext GetInMemoryDbContext(string databaseName)
        {
            var options = new DbContextOptionsBuilder<CesiZenDbContext>()
                .UseInMemoryDatabase(databaseName: databaseName)
                .Options;

            return new CesiZenDbContext(options);
        }

        [TestMethod]
        public async Task Index_ReturnsViewResult()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());
            
            // Ajoutez des données de test si nécessaire
            var testActivite = new Activite 
            { 
                Id = 1, 
                Nom = "Test Activité",
                Description = "Description de l'activité",
                ContenuHtml = "<p>Contenu HTML de l'activité</p>"
            };
            context.Activites.Add(testActivite);
            await context.SaveChanges();

            var mockLogger = new Mock<ILogger<HomeController>>();
            var controller = new HomeController(mockLogger.Object, context);

            // Act
            var result = await controller.Index();

            // Assert
            Assert.IsInstanceOfType(result, typeof(ViewResult));
        }

        [TestMethod]
        public void Privacy_ReturnsViewResult()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());
            var mockLogger = new Mock<ILogger<HomeController>>();
            var controller = new HomeController(mockLogger.Object, context);

            // Act
            var result = controller.Privacy();

            // Assert
            Assert.IsInstanceOfType(result, typeof(ViewResult));
        }

        [TestMethod]
        public void Error_ReturnsViewWithErrorViewModel()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());
            var mockLogger = new Mock<ILogger<HomeController>>();
            var controller = new HomeController(mockLogger.Object, context);

            // Injecter un faux HttpContext avec TraceIdentifier
            var httpContext = new DefaultHttpContext();
            httpContext.TraceIdentifier = "test-trace-id";
            controller.ControllerContext = new ControllerContext()
            {
                HttpContext = httpContext
            };

            // Act
            var result = controller.Error() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result.Model, typeof(ErrorViewModel));
            Assert.AreEqual("test-trace-id", ((ErrorViewModel)result.Model).RequestId);
        }
    }
}