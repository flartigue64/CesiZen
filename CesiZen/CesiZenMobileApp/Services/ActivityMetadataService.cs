using System.Net.Http;
using System.Net.Http.Json;
using System.Collections.Generic;
using System.Threading.Tasks;
using CesiZenInfrastructure.Dto;
using System.Diagnostics;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Identity;

namespace CesiZenApp.Services
{
    public class ActivityMetadataService
    {
        private readonly HttpClient _httpClient;

        public ActivityMetadataService()
        {
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://10.64.128.176:5094/") //Cesi
                //BaseAddress = new Uri("http://192.168.0.184:5094/") //Ledeuix
                //BaseAddress = new Uri("http://192.168.1.13:5094/") //Pau
            };
        }

        public async Task<List<ActiviteMetadataDto>?> GetActivitesMetadataAsync()
        {
            Debug.WriteLine($"Appel de : {_httpClient.BaseAddress}api/ActiviteMetadata");
            try
            {
                var activitesMeta = await _httpClient.GetFromJsonAsync<List<ActiviteMetadataDto>>("api/ActiviteMetadata");
                Debug.WriteLine($"Activités récupérées : {activitesMeta?.Count ?? 0}");
                return activitesMeta;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Erreur lors de la récupération des activités : {ex}");
                return null;
            }
        }

        public async Task<List<ActiviteMetadataDto>?> GetActivitesMetadataAsyncById(int idUser)
        {
            Debug.WriteLine($"id user : {idUser}");
            try
            {
                var activitesMeta = await _httpClient.GetFromJsonAsync<List<ActiviteMetadataDto>>($"api/ActiviteMetadata/user/{idUser}");
                Debug.WriteLine($"Activités récupérées : {activitesMeta?.Count ?? 0}");
                return activitesMeta;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Erreur lors de la récupération des activités : {ex}");
                return null;
            }
        }

        public async Task<bool> PostActivityMetadataAsync(ActiviteMetadata activityMeta)
        {
            Debug.WriteLine($"activityMeta :{activityMeta}");
            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/ActiviteMetadata", activityMeta);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Erreur lors de l'envoi de la requête : {ex.Message}");
                return false;
            }
        }

    }

}