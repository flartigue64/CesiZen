using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using CesiZenInfrastructure.Dto;
using System.Diagnostics;
using CesiZenModel.Entities;
using Microsoft.AspNetCore.Mvc;

namespace CesiZenApp.Services
{
    public class UtilisateurService
    {
        private readonly HttpClient _httpClient;

        public UtilisateurService()
        {
            _httpClient = new HttpClient
            {
                BaseAddress = new Uri("http://10.64.128.176:5094/") //Cesi
                //BaseAddress = new Uri("http://192.168.0.184:5094/") //Ledeuix
                //BaseAddress = new Uri("http://192.168.1.13:5094/") //Pau
            };
        }

        /// <summary>
        /// Récupère un utilisateur par son email.
        /// </summary>
        public async Task<UtilisateurDto?> GetUtilisateurByEmailAsync(string email)
        {
            try
            {
                var response = await _httpClient.GetAsync($"api/Utilisateur/mail/{email}");

                if (response.IsSuccessStatusCode)
                {
                    var utilisateur = await response.Content.ReadFromJsonAsync<UtilisateurDto>();
                    Debug.WriteLine($"Utilisateur trouvé : {utilisateur?.Nom} {utilisateur?.Prenom}");
                    return utilisateur;
                }
                else
                {
                    Debug.WriteLine($"Erreur HTTP lors de la récupération de l'utilisateur : {response.StatusCode}");
                    return null;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Exception lors de la récupération de l'utilisateur : {ex.Message}");
                return null;
            }
        }

        /// <summary>
        /// Permet de supprimer un utilisateur via son ID.
        /// </summary>
        public async Task<bool> SupprimerUtilisateurAsync(int utilisateurId)
        {
            try
            {
                var response = await _httpClient.DeleteAsync($"api/Utilisateur/{utilisateurId}");

                if (response.IsSuccessStatusCode)
                {
                    Debug.WriteLine($"Utilisateur supprimé : ID {utilisateurId}");
                    return true;
                }

                Debug.WriteLine($"Échec de la suppression utilisateur : {response.StatusCode}");
                return false;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Erreur lors de la suppression de l'utilisateur : {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Mise à jour du mot de passe.
        /// </summary>
        public async Task<bool> ModifierMotDePasseAsync(int utilisateurId, string nouveauMotDePasse)
        {
            var patchDto = new PatchUtilisateurDto { mot_de_passe = nouveauMotDePasse };

            try
            {
                var response = await _httpClient.PatchAsJsonAsync($"api/Utilisateur/{utilisateurId}", patchDto);

                if (response.IsSuccessStatusCode)
                {
                    Debug.WriteLine("Mot de passe modifié avec succès.");
                    return true;
                }

                Debug.WriteLine($"Erreur lors du patch mot de passe : {response.StatusCode}");
                return false;
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Exception patch mot de passe : {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Crée un nouvel utilisateur via une requête POST.
        /// </summary>
        public async Task<bool> RegisterUtilisateurAsync([Bind("Id,Nom,Prenom,Email,mot_de_passe")] Utilisateur user)
        {
            Debug.WriteLine($"user :{user}");
            try
            {
                var response = await _httpClient.PostAsJsonAsync("api/Utilisateur", user);
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
