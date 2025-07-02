using CesiZenInfrastructure.Dto;
using System.Net.Http.Json;

public class ArticleService
{
    private readonly HttpClient _httpClient;

    public ArticleService()
    {
        _httpClient = new HttpClient
        {
            BaseAddress = new Uri("http://10.64.128.176:5094/") //Cesi
            //BaseAddress = new Uri("http://192.168.0.184:5094/") //Ledeuix
            //BaseAddress = new Uri("http://192.168.1.13:5094/") //Pau
        };
    }

    public async Task<List<ArticleDto>> GetAllArticlesAsync()
    {
        try
        {
            var response = await _httpClient.GetAsync("api/Article");
            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadFromJsonAsync<List<ArticleDto>>() ?? new();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Erreur : {ex.Message}");
        }

        return new List<ArticleDto>();
    }

    public async Task<ArticleDto?> GetArticleAsync(int id)
    {
        try
        {
            var response = await _httpClient.GetAsync($"api/Article/{id}");
            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadFromJsonAsync<ArticleDto>();
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Erreur : {ex.Message}");
        }

        return null;
    }
}
