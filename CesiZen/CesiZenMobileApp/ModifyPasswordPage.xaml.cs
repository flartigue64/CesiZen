using CesiZenApp.Services;
using CesiZenInfrastructure.Dto;
using CesiZenModel.Entities;

namespace CesiZenMobileApp;

public partial class ModifyPasswordPage : ContentPage
{
    private readonly UtilisateurService _utilisateurService;
    public ModifyPasswordPage()
	{
		InitializeComponent();
        _utilisateurService = new UtilisateurService();
        var id = Preferences.Get("UserId", 0);
        var Password = Preferences.Get("UserPassword", string.Empty);
    }

	private async void ModifyPasswordConfirm(object sender, EventArgs e)
	{
		var ActualPass = ActualPassEntry.Text;
		var NewPass = NewPassEntry.Text;

        var id = Preferences.Get("UserId", 0);
        var Password = Preferences.Get("UserPassword", string.Empty);

        if (string.IsNullOrEmpty(ActualPass) || string.IsNullOrEmpty(NewPass))
        {
            MessageLabel.Text = "Tous les champs sont obligatoires.";
            MessageLabel.IsVisible = true;
            return;
        }

		if (ActualPass != Preferences.Get("UserPassword", string.Empty))
        {
            MessageLabel.Text = "Le mot de passe actuel est incorrect";
            MessageLabel.IsVisible = true;
            return;
        }

        var response = await _utilisateurService.ModifierMotDePasseAsync(id, NewPass);

        if (response)
        {
            // Naviguer vers la page de connexion ou autre
            await DisplayAlert("Succès", "Modification réussie!", "OK");
            await Navigation.PushAsync(new AccountPage());
        }
        else
        {
            MessageLabel.Text = "Erreur lors de la modification du mot de passe. Veuillez réessayer.";
            MessageLabel.IsVisible = true;
        }
    }
}