// InformationControllerTests.cs
using Microsoft.EntityFrameworkCore;
using CESIZen.Controllers;
using CESIZen.Data;
using CESIZen.Models;
using Microsoft.AspNetCore.Mvc;

namespace CESIZen.Tests.Controllers
{
    [TestClass]
    public class InformationControllerTests
    {
        private CesiZenDbContext GetInMemoryDbContext(string databaseName)
        {
            var options = new DbContextOptionsBuilder<CesiZenDbContext>()
                .UseInMemoryDatabase(databaseName: databaseName)
                .Options;

            return new CesiZenDbContext(options);
        }

        [TestMethod]
        public void Index_ReturnsOnlyPublishedOrderedInformations()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());
            
            // Ajoutez des données de test
            var informations = new List<Information>
            {
                new Information 
                { 
                    Id = 1, 
                    Titre = "Info 1", 
                    EstPublie = true, 
                    DatePublication = DateTime.Now.AddDays(-2) 
                },
                new Information 
                { 
                    Id = 2, 
                    Titre = "Info 2", 
                    EstPublie = false, 
                    DatePublication = DateTime.Now.AddDays(-1) 
                },
                new Information 
                { 
                    Id = 3, 
                    Titre = "Info 3", 
                    EstPublie = true, 
                    DatePublication = DateTime.Now 
                }
            };

            context.Informations.AddRange(informations);
            context.SaveChanges();

            var controller = new InformationController(context);

            // Act
            var result = controller.Index() as ViewResult;
            var model = result?.Model as IEnumerable<Information>;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsNotNull(model);
            
            var publishedInfos = model.ToList();
            Assert.AreEqual(2, publishedInfos.Count);
            Assert.IsTrue(publishedInfos.All(i => i.EstPublie));
            
            // Vérifier l'ordre (plus récent en premier)
            Assert.AreEqual("Info 3", publishedInfos.First().Titre);
        }

        [TestMethod]
        public void Details_ValidId_ReturnsInformation()
        {
            // Arrange
            using var context = GetInMemoryDbContext(Guid.NewGuid().ToString());
            
            var information = new Information 
            { 
                Id = 1, 
                Titre = "Test Info", 
                EstPublie = true,
                DatePublication = DateTime.Now
            };
            
            context.Informations.Add(information);
            context.SaveChanges();

            var controller = new InformationController(context);

            // Act
            var result = controller.Details(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            Assert.IsNotNull(result.Model);
            Assert.IsInstanceOfType(result.Model, typeof(Information));
            
            var model = result.Model as Information;
            Assert.AreEqual("Test Info", model.Titre);
        }
    }
}