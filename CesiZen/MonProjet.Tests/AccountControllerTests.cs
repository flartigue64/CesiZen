using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using Moq.Protected;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using CesiZenWebApp.Controllers;
using CesiZenInfrastructure.Dto;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using System.Text.Json;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using CesiZenModel.Entities;

namespace CesiZen.Tests
{
    [TestClass]
    public class AccountControllerTests_Complet
    {
        private static AccountController SetupController(HttpResponseMessage response, out Mock<HttpMessageHandler> handlerMock)
        {
            handlerMock = new Mock<HttpMessageHandler>();
            handlerMock.Protected()
                .Setup<Task<HttpResponseMessage>>("SendAsync",
                    ItExpr.IsAny<HttpRequestMessage>(),
                    ItExpr.IsAny<CancellationToken>())
                .ReturnsAsync(response);

            var httpClient = new HttpClient(handlerMock.Object)
            {
                BaseAddress = new Uri("https://localhost:7270/")
            };

            var controller = new AccountController(httpClient);
            var context = new DefaultHttpContext();
            context.Session = new MockHttpSession();
            controller.ControllerContext = new ControllerContext
            {
                HttpContext = context
            };
            controller.TempData = new TempDataDictionary(context, Mock.Of<ITempDataProvider>());

            return controller;
        }

        [TestMethod]
        public async Task UserGestion_Success_ReturnsSortedUsers()
        {
            var users = new List<UtilisateurDto>
            {
                new UtilisateurDto { Nom = "Zed" },
                new UtilisateurDto { Nom = "Anna" }
            };
            var content = new StringContent(JsonSerializer.Serialize(users), Encoding.UTF8, "application/json");
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.OK) { Content = content }, out _);

            var result = await controller.UserGestion(searchEmail: "");
            var viewResult = result as ViewResult;
            var model = viewResult.Model as List<UtilisateurDto>;

            Assert.AreEqual(2, model.Count);
            Assert.AreEqual("Anna", model[0].Nom);
        }


        [TestMethod]
        public async Task UserGestion_ApiFails_ReturnsEmptyList()
        {
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.BadRequest), out _);
            var result = await controller.UserGestion(searchEmail: "");
            var viewResult = result as ViewResult;
            var model = viewResult.Model as List<UtilisateurDto>;

            Assert.AreEqual(0, model.Count);
            Assert.IsNotNull(controller.TempData["Message"]);
        }

        [TestMethod]
        public async Task Create_Post_ModelStateInvalid_ReturnsView()
        {
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.OK), out _);
            controller.ModelState.AddModelError("Error", "FakeError");
            var user = new Utilisateur();

            var result = await controller.Create(user);

            Assert.IsInstanceOfType(result, typeof(ViewResult));
        }

        [TestMethod]
        public async Task Create_Post_ApiFails_RedirectsToRegister()
        {
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.BadRequest)
            {
                ReasonPhrase = "Bad Request",
                Content = new StringContent("erreur")
            }, out _);

            var user = new Utilisateur { Nom = "Test", Prenom = "User", Email = "test@test.com", mot_de_passe = "123" };
            var result = await controller.Create(user);

            Assert.IsInstanceOfType(result, typeof(RedirectToActionResult));
            Assert.AreEqual("Register", ((RedirectToActionResult)result).ActionName);
        }

        [TestMethod]
        public async Task ConfirmDelete_Success_ClearsSession()
        {
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.OK), out _);
            controller.HttpContext.Session.SetInt32("Id", 1);

            var result = await controller.ConfirmDelete();
            var redirect = result as RedirectToActionResult;

            Assert.AreEqual("Connexion", redirect.ActionName);
            Assert.IsTrue(string.IsNullOrEmpty(controller.HttpContext.Session.GetString("UserEmail")));
        }

        [TestMethod]
        public async Task DeleteUser_Success_ShowsSuccessMessage()
        {
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.OK), out _);
            var result = await controller.DeleteUser(5);

            Assert.AreEqual("UserGestion", ((RedirectToActionResult)result).ActionName);
            Assert.AreEqual("Utilisateur supprimé avec succès.", controller.TempData["Message"]);
        }

        [TestMethod]
        public async Task DeleteUser_Error_ShowsErrorMessage()
        {
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.BadRequest)
            {
                ReasonPhrase = "BadRequest"
            }, out _);

            var result = await controller.DeleteUser(99);
            Assert.AreEqual("UserGestion", ((RedirectToActionResult)result).ActionName);
            Assert.IsTrue(controller.TempData["Message"].ToString().Contains("Erreur"));
        }

        [TestMethod]
        public async Task UpdateRole_Success()
        {
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.OK), out _);
            var result = await controller.UpdateRole(42, 2);

            Assert.AreEqual("UserGestion", ((RedirectToActionResult)result).ActionName);
            Assert.AreEqual("Rôle modifié avec succès.", controller.TempData["Message"]);
        }

        [TestMethod]
        public async Task UpdateRole_Failure()
        {
            var controller = SetupController(new HttpResponseMessage(HttpStatusCode.BadRequest)
            {
                ReasonPhrase = "BadReq"
            }, out _);

            var result = await controller.UpdateRole(42, 3);

            Assert.AreEqual("UserGestion", ((RedirectToActionResult)result).ActionName);
            Assert.IsTrue(controller.TempData["Message"].ToString().Contains("Erreur"));
        }
    }
}
