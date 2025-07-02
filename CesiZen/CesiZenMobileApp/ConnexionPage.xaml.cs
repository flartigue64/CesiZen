using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using System;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;

namespace CesiZenMobileApp;

public partial class ConnexionPage : ContentPage
{
    private readonly UtilisateurService _utilisateurService;

    public ConnexionPage()
    {
        InitializeComponent();
        _utilisateurService = new UtilisateurService();
    }

    private async void OnConnexionClicked(object sender, EventArgs e)
    {
        var email = EmailEntry.Text?.Trim();
        var password = PasswordEntry.Text;

        if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
        {
            MessageLabel.Text = "Veuillez remplir tous les champs.";
            return;
        }

        var utilisateur = await _utilisateurService.GetUtilisateurByEmailAsync(email);

        if (utilisateur != null && utilisateur.mot_de_passe == password)
        {
            Preferences.Set("UserEmail", utilisateur.Email ?? "");
            Preferences.Set("UserPassword", utilisateur.mot_de_passe ?? "");
            Preferences.Set("UserName", utilisateur.Nom ?? "");
            Preferences.Set("UserFirstName", utilisateur.Prenom ?? "");
            Preferences.Set("UserId", utilisateur.Id);
            Preferences.Set("UserRoleId", utilisateur.Role);

            MessageLabel.TextColor = Colors.Green;
            MessageLabel.Text = $"Bienvenue {utilisateur.Prenom} {utilisateur.Nom}";

            // Mettez à jour la visibilité du lien Connexion dans le menu
            (Application.Current.MainPage as AppShell)?.UpdateConnexionAndAccountVisibility();
            (Application.Current.MainPage as HistoricPage)?.UpdateConnexionAndAccountVisibility();

            // Assurez-vous que la page principale est bien dans un NavigationPage
            await Shell.Current.GoToAsync("//MainPage");
        }
        else
        {
            MessageLabel.TextColor = Colors.Red;
            MessageLabel.Text = "Email ou mot de passe incorrect.";
        }
    }


    private async void OnRegisterTapped(object sender, EventArgs e)
    {
        // Redirection vers la page RegisterPage
        await Shell.Current.GoToAsync("RegisterPage");
    }

    public void UpdateConnexionAndAccountVisibility()
    {
        var email = Preferences.Get("UserEmail", string.Empty);
        var password = Preferences.Get("UserPassword", string.Empty);
    }


}
