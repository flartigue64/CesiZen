using System.Diagnostics;
using CesiZenApp.Services;

namespace CesiZenMobileApp;

public partial class AccountPage : ContentPage
{
    private readonly UtilisateurService _utilisateurService;
    public AccountPage()
	{
		InitializeComponent();
        _utilisateurService = new UtilisateurService();

        var prenom = Preferences.Get("UserFirstName", string.Empty);
        var nom = Preferences.Get("UserName", string.Empty);
        var email = Preferences.Get("UserEmail", string.Empty);

        IdentityLabel.Text = $"{prenom} {nom}";
        EmailLabel.Text = email;
    }

    private async void OnModifyPassTapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync(nameof(ModifyPasswordPage));
    }

    private async void OnDeleteAccountTapped(object sender, EventArgs e)
    {
        var id = Preferences.Get("UserId", 0);
        bool isConfirmed = await DisplayAlert(
            "Confirmation",
            "�tes-vous s�r de vouloir supprimer votre compte ? Cette action est irr�versible.",
            "Oui",
            "Non");

        if (isConfirmed)
        {
            var response = await _utilisateurService.SupprimerUtilisateurAsync(id);

            if (response)
            {
                Preferences.Clear();
                // Naviguer vers la page de connexion ou autre
                (Application.Current.MainPage as AppShell)?.UpdateConnexionAndAccountVisibility();
                (Application.Current.MainPage as HistoricPage)?.UpdateConnexionAndAccountVisibility();
                (Application.Current.MainPage as ConnexionPage)?.UpdateConnexionAndAccountVisibility();

                await Shell.Current.GoToAsync("//MainPage");
            }
            else
            {
                MessageLabel.Text = "Erreur lors de la suppression de votre compte. Veuillez r�essayer.";
                MessageLabel.IsVisible = true;
            }
        }
        else
        {
            Debug.WriteLine("Suppression du compte annul�e.");
        }
    }

    private async void OnDeconnexionTapped(object sender, EventArgs e)
    {
        bool isConfirmed = await DisplayAlert(
            "Confirmation",
            "�tes-vous s�r de vouloir vous deconnecter",
            "Oui",
            "Non");

        if (isConfirmed)
        {
            Preferences.Clear();

            // Mettez � jour la visibilit� du lien Connexion dans le menu apr�s la d�connexion
            (Application.Current.MainPage as AppShell)?.UpdateConnexionAndAccountVisibility();
            (Application.Current.MainPage as HistoricPage)?.UpdateConnexionAndAccountVisibility();
            (Application.Current.MainPage as ConnexionPage)?.UpdateConnexionAndAccountVisibility();

            await Shell.Current.GoToAsync("//MainPage");
            Debug.WriteLine("D�connexion r�ussie.");
        }
        else
        {
            Debug.WriteLine("D�connexion annul�e.");
        }
    }




}