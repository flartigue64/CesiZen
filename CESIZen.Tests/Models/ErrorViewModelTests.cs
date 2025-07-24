using Xunit;
using CESIZenBackOfficeMVC.Models;

namespace CESIZen.Tests.Models
{
    public class ErrorViewModelTests
    {
        [Fact]
        public void ShowRequestId_ShouldReturnTrue_WhenRequestIdIsNotNullOrEmpty()
        {
            var model = new ErrorViewModel { RequestId = "12345" };
            Assert.True(model.ShowRequestId);
        }

        [Theory]
        [InlineData(null)]
        [InlineData("")]
        public void ShowRequestId_ShouldReturnFalse_WhenRequestIdIsNullOrEmpty(string? requestId)
        {
            var model = new ErrorViewModel { RequestId = requestId };
            Assert.False(model.ShowRequestId);
        }
    }
}
