using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenMobileApp;

public partial class RegisterPage : ContentPage
{
    private readonly UtilisateurService _utilisateurService;
    public RegisterPage()
	{
		InitializeComponent();
        _utilisateurService = new UtilisateurService();
    }

    private async void OnRegisterClicked(object sender, EventArgs e)
    {
        var nom = NomEntry.Text;
        var prenom = PrenomEntry.Text;
        var email = EmailEntry.Text;
        var motDePasse = MotDePasseEntry.Text;

        if (string.IsNullOrEmpty(nom) || string.IsNullOrEmpty(prenom) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(motDePasse))
        {
            MessageLabel.Text = "Tous les champs sont obligatoires.";
            MessageLabel.IsVisible = true;
            return;
        }

        var utilisateur = new Utilisateur
        {
            Nom = nom,
            Prenom = prenom,
            Email = email,
            mot_de_passe = motDePasse,
            RoleId = 1 // Par défaut, rôle de l'utilisateur
        };

        var response = await _utilisateurService.RegisterUtilisateurAsync(utilisateur);

        if (response)
        {
            // Naviguer vers la page de connexion ou autre
            await DisplayAlert("Succès", "Inscription réussie!", "OK");
            await Navigation.PushAsync(new ConnexionPage());
        }
        else
        {
            MessageLabel.Text = "Erreur lors de l'inscription. Veuillez réessayer.";
            MessageLabel.IsVisible = true;
        }
    }

    private void OnLoginClicked(object sender, EventArgs e)
    {
        // Naviguer vers la page de connexion
        Navigation.PushAsync(new ConnexionPage());
    }
}
