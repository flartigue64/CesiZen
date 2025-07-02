using System.Net.Http;
using System.Net.Http.Json;
using System.Collections.Generic;
using System.Threading.Tasks;
using CesiZenInfrastructure.Dto;
using System.Diagnostics;

namespace CesiZenApp.Services
{
    public class ActiviteService
    {
        private readonly HttpClient _httpClient;

        public ActiviteService()
        {
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://10.64.128.176:5094/") //Cesi
                //BaseAddress = new Uri("http://192.168.0.184:5094/") //Ledeuix
                //BaseAddress = new Uri("http://192.168.1.13:5094/") //Pau
            };
        }

        public async Task<List<ActiviteDto>?> GetActivitesAsync()
        {
            Debug.WriteLine($"Appel de : {_httpClient.BaseAddress}api/Activite");
            try
            {
                var activites = await _httpClient.GetFromJsonAsync<List<ActiviteDto>>("api/Activite");
                Debug.WriteLine($"Activités récupérées : {activites?.Count ?? 0}");
                return activites;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Erreur lors de la récupération des activités : {ex}");
                return null;
            }
        }

    }

}