using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.Extensions.Logging;
using CesiZen.Controllers;
using Microsoft.AspNetCore.Mvc;
using CESIZen.Models;
using Moq;
using System.Diagnostics;
using Microsoft.AspNetCore.Http;
using CesiZen.Data;
using Microsoft.EntityFrameworkCore;

namespace CESIZen.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTests
    {
        [TestMethod]
        public void Index_ReturnsViewResult()
        {
            // Arrange
            var mockLogger = new Mock<ILogger<HomeController>>();
            var mockContext = new Mock<CesiZenDbContext>();

            // Mock de la DbSet<Activite>
            var activitesData = new List<Activite>
            {
                new Activite { Id = 1, Nom = "Yoga", Description = "Séance de yoga" },
                new Activite { Id = 2, Nom = "Méditation", Description = "Séance de méditation" }
            }.AsQueryable();

            var mockSet = new Mock<DbSet<Activite>>();
            mockSet.As<IQueryable<Activite>>().Setup(m => m.Provider).Returns(activitesData.Provider);
            mockSet.As<IQueryable<Activite>>().Setup(m => m.Expression).Returns(activitesData.Expression);
            mockSet.As<IQueryable<Activite>>().Setup(m => m.ElementType).Returns(activitesData.ElementType);
            mockSet.As<IQueryable<Activite>>().Setup(m => m.GetEnumerator()).Returns(activitesData.GetEnumerator());

            mockContext.Setup(c => c.Activites).Returns(mockSet.Object);

            var controller = new HomeController(mockLogger.Object, mockContext.Object);

            // Act
            var result = controller.Index().Result;

            // Assert
            Assert.IsInstanceOfType(result, typeof(ViewResult));
            var viewResult = result as ViewResult;
            Assert.IsNotNull(viewResult.Model);
            Assert.IsInstanceOfType(viewResult.Model, typeof(List<Activite>));
        }


        [TestMethod]
        public void Privacy_ReturnsViewResult()
        {
            // Arrange
            var mockLogger = new Mock<ILogger<HomeController>>();
            var mockContext = new Mock<CesiZenDbContext>(); // Même s’il ne sert pas ici
            var controller = new HomeController(mockLogger.Object, mockContext.Object);

            // Act
            var result = controller.Privacy();

            // Assert
            Assert.IsInstanceOfType(result, typeof(ViewResult));
        }


        [TestMethod]
        public void Error_ReturnsViewWithErrorViewModel()
        {
            // Arrange
            var mockLogger = new Mock<ILogger<HomeController>>();
            var mockContext = new Mock<CesiZenDbContext>();
            var controller = new HomeController(mockLogger.Object, mockContext.Object);

            var httpContext = new DefaultHttpContext();
            httpContext.TraceIdentifier = "TestTraceId";
            controller.ControllerContext = new ControllerContext
            {
                HttpContext = httpContext
            };

            // Act
            var result = controller.Error() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result.Model, typeof(ErrorViewModel));

            var model = result.Model as ErrorViewModel;
            Assert.AreEqual("TestTraceId", model.RequestId);
        }


    }
}
